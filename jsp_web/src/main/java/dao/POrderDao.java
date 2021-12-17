package dao;

import java.util.ArrayList;

import dto.Cart;
import dto.POrder;

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
			e.printStackTrace();
		}

		return false;
	}

}
