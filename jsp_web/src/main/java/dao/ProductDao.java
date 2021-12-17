package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import dto.Product;

public class ProductDao extends DB {

	public ProductDao() {
		super();

	}

	public static ProductDao productDao = new ProductDao();

	public static ProductDao getProductDao() {
		return productDao;
	}

	// 1. 제품 등록 메소드
	public boolean productWrite(Product product) {
		String sql = "insert into product(p_name, p_price, p_category, p_manufacturer, p_status, p_size, p_instock, p_image, p_contents) values(?,?,?,?,?,?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, product.getP_name());
			psmt.setInt(2, product.getP_price());
			psmt.setString(3, product.getP_category());
			psmt.setString(4, product.getP_manufacturer());
			psmt.setInt(5, product.getP_status());
			psmt.setString(6, product.getP_size());
			psmt.setInt(7, product.getP_instock());
			psmt.setString(8, product.getP_image());
			psmt.setString(9, product.getP_contents());
			psmt.executeUpdate();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	// 2. 모든 제품 출력 메소드

	public ArrayList<Product> get_product_list(int startrow, int listsize, String key, String keyword) {

		ArrayList<Product> products = new ArrayList<>();
		String sql = null;

		if (key != null && keyword != null) {
			sql = "select * from product where " + key + " = '" + keyword + "' p_no desc limit ? , ?";
		} else {
			sql = "select * from product order by p_no desc limit ? , ?";
		}
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startrow);
			psmt.setInt(2, listsize);
			res = psmt.executeQuery();

			while (res.next()) {

				Product product = new Product(res.getInt(1), res.getString(2), res.getInt(3), res.getString(4),
						res.getString(5), res.getInt(6), res.getString(7), res.getInt(8), res.getString(9),
						res.getString(10), res.getString(11)

				);
				products.add(product);

			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 2.2 (p_no) 특정 제품을 리턴하는 메소드
	public Product get_single_product(int p_no) {

		String sql = "select * from product where p_no = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, p_no);
			res = psmt.executeQuery();
			if (res.next()) {
				Product product = new Product(res.getInt(1), res.getString(2), res.getInt(3), res.getString(4),
						res.getString(5), res.getInt(6), res.getString(7), res.getInt(8), res.getString(9),
						res.getString(10), res.getString(11));
				return product;
			}
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return null;

	}

	public ArrayList<Product> get_product_list(String key, String keyword) {

		ArrayList<Product> products = new ArrayList<>();
		String sql = null;

		if (key != null && keyword != null) {
			sql = "select * from product where " + key + " = '" + keyword + "' order by p_no desc";
		} else {
			sql = "select * from product order by p_no desc";
		}
		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();

			while (res.next()) {

				Product product = new Product(res.getInt(1), res.getString(2), res.getInt(3), res.getString(4),
						res.getString(5), res.getInt(6), res.getString(7), res.getInt(8), res.getString(9),
						res.getString(10), res.getString(11)

				);
				products.add(product);

			}
			return products;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 3. 제품 조건 출력 메소드
	public int product_count(String key, String keyword) {

		String sql = null;
		if (key != null && keyword != null) {
			sql = "select * from product where " + key + " = '" + keyword + "' ";
		} else {
			sql = "select count(*) from product";
		}
		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			if (res.next()) {
				return res.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 4. 제품 수정 메소드

	public boolean product_status_update(int p_no) {

		try {
			String sql = "select p_status from product where p_no = " + p_no;
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			if (res.next()) {
				int p_status = res.getInt(1) + 1;
				if (p_status == 4) {
					p_status = 1;
				}
				sql = "update product set p_status = " + p_status + " where p_no = " + p_no;
				psmt = conn.prepareStatement(sql);
				psmt.executeUpdate();
				return true;
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return false;
	}

	// 제품의 타입, 새로운 데이터, 제품 번호를 받아서 업데이트 시킨다.
	public boolean product_update(String type, String newdata, int p_no) {

		String sql = "update product set ? = ? where p_no=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			psmt.setString(2, newdata);
			psmt.setInt(3, p_no);
			psmt.executeUpdate();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return false;
	}

	// 5. 제품 삭제 메소드
	public boolean product_delete(int p_no) {
		String sql = "delete from product where p_no = " + p_no;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("오류" + e);
			e.printStackTrace();
		}
		return false;
	}

	// 6. 제품 번호로 제품 객체 하나를 꺼내는 메소드
	public Product getProduct(int p_no) {

		String sql = "select * from product where p_no = " + p_no;
		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			if (res.next()) {
				Product product = new Product(res.getInt(1), res.getString(2), res.getInt(3), res.getString(4),
						res.getString(5), res.getInt(6), res.getString(7), res.getInt(8), res.getString(9),
						res.getString(10), res.getString(11));
				return product;
			}
		} catch (Exception e) {
			System.out.println("오류" + e);
			e.printStackTrace();
		}

		return null;

	}

	// 7. 제품 좋아요 메소드
	public int plikeUpdate(int p_no, int m_num) {

		// 1. 좋아요 버튼 -> 좋아요 [제품번호, 회원번호]
		// 2. 제품 번호, 회원번호가 일치한 좋아요 없으면 좋아요 생성
		// 2. 제품 번호, 회원번호가 일치한 좋아요 있으면 좋아요 삭제

		String sql = null;

		sql = "select * from plike where p_no = " + p_no + " and m_num = " + m_num;
		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			if (res.next()) {

				sql = "delete from plike where p_no = " + p_no + " and m_num = " + m_num;
				psmt = conn.prepareStatement(sql);
				psmt.executeUpdate();
				return 1; // 좋아요 제거

			} else {
				sql = "insert into plike(p_no, m_num) values(" + p_no + "," + m_num + ")";
				psmt = conn.prepareStatement(sql);
				psmt.executeUpdate();
				return 2; // 좋아요 추가
			}
		} catch (Exception e) {
			System.out.println("오류" + e);
			e.printStackTrace();
		}
		return 0; // db 오류 시 '0' 리턴
	}

	// 8. 제품 좋아요 확인 메소드

	public boolean isplikeCheck(int p_no, int m_num) {

		String sql = " select * from plike where p_no = " + p_no + " and m_num = " + m_num;
		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			if (res.next()) {
				return true;
			}

		} catch (Exception e) {
			System.out.println("오류" + e);
			e.printStackTrace();
		}
		return false;
	}

}
