package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.json.simple.JSONObject;

import dto.Cart;
import dto.POrder;
import dto.POrderDetail;

public class POrderDao extends DB {

	public POrderDao() {
		super();
	}

	public static POrderDao pOrderDao = new POrderDao();

	public static POrderDao getPOrderDao() {
		return pOrderDao;
	}

	// 1. 주문 내역을 db에 반영시키는 메소드
	// 1.1 dao 에서 세션값을 바로 호출할 수는 없기 때문에 컨트롤러에서 인수로 받아왔다.
	public boolean addPOrder(POrder porder, ArrayList<Cart> carts) {

		String sql = "insert into porder(m_num, order_name, order_phone, order_address, order_pay, order_payment, delivery_pay, order_content) values(?,?,?,?,?,?,?,?)";

		try {

			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, porder.getM_num());
			psmt.setString(2, porder.getOrder_name());
			psmt.setString(3, porder.getOrder_phone());
			psmt.setString(4, porder.getOrder_address());
			psmt.setInt(5, porder.getOrder_pay());
			psmt.setString(6, porder.getOrder_payment());
			psmt.setInt(7, porder.getDelivery_pay());
			psmt.setString(8, porder.getOrder_content());

			psmt.executeUpdate();

			sql = "select * from porder where m_num = " + porder.getM_num() + " order by order_no desc";
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			if (res.next()) {
				// 주문 상세 등록
				int order_no = res.getInt(1); // 주문 번호

				for (Cart cart : carts) { // 카트 내 주문 수 만큼 반복문돌면서 주문 상세 table 에 데이터 전달
					sql = "insert into porderdetail(order_no, p_no, p_count, delivery_state) values(?, ?, ?, ?)";

					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, order_no);
					psmt.setInt(2, cart.getP_no());
					psmt.setInt(3, cart.getP_count());
					psmt.setInt(4, 1); // 임의의 숫자를 넣었다. 그냥 1. 택배사 연동에는 사업자 번호가 필요해서 일단 아무 숫자나 넣음
					psmt.executeUpdate();
				}

			}

			return true;

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}

		return false;
	}

	// 주문 목록 빼오기

	public ArrayList<POrder> getPOrderList(int m_num) {

		ArrayList<POrder> porders = new ArrayList<>();

		String sql = "select * from porder where m_num = " + m_num + " order by order_no desc";

		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();

			while (res.next()) {

				POrder porder = new POrder(

						res.getInt(1), res.getInt(2), res.getString(3), res.getString(4), res.getString(5),
						res.getString(6), res.getInt(7), res.getString(8), res.getInt(9), res.getInt(10),
						res.getString(11)

				);
				porders.add(porder);

			}
			return porders;

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}

		return null;

	}

	public ArrayList<POrderDetail> getPOrderDetailList(int order_no) {
		ArrayList<POrderDetail> porderdetails = new ArrayList<>();
		String sql = "select * from porderdetail where order_no = " + order_no;
		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			while (res.next()) {
				POrderDetail poderdetail = new POrderDetail(
						res.getInt(1), res.getInt(2), res.getInt(3), res.getInt(4), res.getInt(5)
				);
				porderdetails.add(poderdetail);
			}
			return porderdetails;
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return null;
	}

	// 날짜 별 주문 수

	public JSONObject getOrderByDate() {

		JSONObject jsonObject = new JSONObject();

		String sql = "select substring_index(order_date, ' ', 1), count(*) from jsp.porder GROUP BY substring_index(order_date, ' ', 1)";

		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			while (res.next()) { // 검색된 레코드 갯수만큼 json 에 추가
				jsonObject.put(res.getString(1), res.getString(2));
			}
			return jsonObject;

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}

		return null;
	}

	// 제품별 판매량
	public JSONObject getPCount() {
		JSONObject jsonObject = new JSONObject();
		// 총 몇개가 팔렸는지 세야하기 때문에, p_no 에 해당하는 제품 기준으로 sum(p_count) 를 해준다
		// p_count : 주문 수량을 의미하는 필드
		// sum(p_count) : 주문 수량 필드의 합계
		// count(p_count) : 주문 수량 필드의 레코드 개수
		// avg(p_count) : 주문 수량 필드의 평균
		String sql = "select p_no, sum(p_count) from porderdetail group by p_no";
		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			while (res.next()) {
				// 제품의 이름을 가져와야 하니, 한번 더 select 문을 사용해서 product 테이블에 있는 데이터를 가져온다.
				// 인터페이스가 바뀌었기 때문에 인터페이스를 따로 사용해야한다.
				sql = "select p_name from product where p_no = " + res.getInt(1);
				PreparedStatement psmt2 = conn.prepareStatement(sql);
				ResultSet res2 = psmt2.executeQuery();
				if (res2.next()) {
					jsonObject.put(res2.getString(1), res.getInt(2));
				}
			}
			return jsonObject;
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return null;

	}

	public JSONObject getEachCount(int p_no) {

		JSONObject jsonObject = new JSONObject();
		// 날짜, 갯수
		String sql = "select * from porderdetail where p_no = " + p_no;

		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery(); // porderdetail 테이블에서 p_no 기준으로 조회한 결과 값
			while (res.next()) {
				sql = "select substring_index(order_date, ' ', 1) from porder where order_no = " + res.getInt(2);
				PreparedStatement psmt2 = conn.prepareStatement(sql);
				ResultSet res2 = psmt2.executeQuery();
				if (res2.next()) {
					jsonObject.put(res2.getString(1), res.getInt(4));
				}
			}
			return jsonObject;
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return null;
	}

}
