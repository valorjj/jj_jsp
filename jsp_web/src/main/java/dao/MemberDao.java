package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Member;

public class MemberDao {

	// 1. 빌드 -> 라이브러리 추가
	// 2. 프로젝트 내 WEB-INF -> lib -> 라이브러리 추가

	private Connection conn;
	private ResultSet res;
	private PreparedStatement psmt;

	// 1. 생성자
	public MemberDao() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp?serverTimezone-UTC", "root",
						"1234");
				System.out.println("DB 연결 성공");
			} catch (SQLException e) {
				System.out.println("DB 연결 실패 " + e);
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			System.out.println("DB 연결 실패 ");
			e.printStackTrace();
		}
	}

	public static MemberDao memberDao = new MemberDao();

	public static MemberDao getmemberDao() {
		return memberDao;
	}

	public boolean member_signup(Member member) {

		String sql = "insert into member(m_id, m_password, m_name, m_birthdate, m_gender, m_phone, m_address) values(?,?,?,?,?,?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getM_id());
			psmt.setString(2, member.getM_password());
			psmt.setString(3, member.getM_name());
			psmt.setString(4, member.getM_birthdate());
			psmt.setString(5, member.getM_gender());
			psmt.setString(6, member.getM_phone());
			psmt.setString(7, member.getM_address());
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean member_login(String id, String password) {

		String sql = "select m_password from member where m_id = ? and m_password=?";

		try {
			psmt = conn.prepareCall(sql);
			psmt.setString(1, id);
			psmt.setString(2, password);
			res = psmt.executeQuery();
			if (res.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean idcheck(String userid) {
		String sql = "select * from member where m_id=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userid);
			res = psmt.executeQuery();
			if (res.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public String findid(String name, String email) {

		String sql = "select m_id from member where m_name=? and m_password=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, email);
			res = psmt.executeQuery();
			if (res.next()) {
				return res.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}

	public String findpassword(String id, String email) {

		String sql = "select m_id from member where m_name=? and m_password=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, email);
			res = psmt.executeQuery();
			if (res.next()) {
				return res.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";

	}

	// 1. 회원 비밀번호를 제외한 객체화 시키는 메소드
	public Member get_member_instance(String id) {

		Member member;

		String sql = "select * from member where m_id=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			res = psmt.executeQuery();
			if (res.next()) {

				member = new Member(res.getInt(1), res.getString(2), null, res.getString(4), res.getString(5),
						res.getString(6), res.getString(7), res.getString(8), res.getInt(9), res.getString(10)

				);
				return member;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 1. 회원 탈퇴 메소드
	public boolean member_drop(String id, String password) {
		String sql1 = "select * from member where m_id=? and m_password=?";
		String sql2 = "delete from member where m_id=? and m_password=?";
		try {
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, id);
			psmt.setString(2, password);
			res = psmt.executeQuery();
			if (res.next()) {
				PreparedStatement psmt2 = conn.prepareStatement(sql2);
				psmt2.setString(1, id);
				psmt2.setString(2, password);
				psmt2.executeUpdate();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 1. 회원 정보 수정하는 메소드
	// 1.1 wildcard '?' 을 활용해서 중복되는 메소드 사용을 줄여본다.

	public boolean member_update(String type, String newdata, String id) {

		// String sql = "update member set ?=? where m_id=?";

		String sql = "update member set " + type + "=? where m_id=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, type);
			psmt.setString(2, id);
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean member_update_name(String name, String id) {
		String sql = "update member set m_name = ? where m_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, id);
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	public boolean member_update_password(String password, String id) {
		String sql = "update member set m_password = ? where m_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, password);
			psmt.setString(2, id);
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean member_update_phonenumber(String phone, String id) {
		String sql = "update member set m_phone = ? where m_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, phone);
			psmt.setString(2, id);
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean member_update_birthdate(String birthdate, String id) {

		String sql = "update member set m_birthdate = ? where m_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, birthdate);
			psmt.setString(2, id);
			psmt.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean member_update_address(String address, String id) {

		String sql = "update member set m_address = ? where m_id = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, address);
			psmt.setString(2, id);
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 1. 회원 번호를 찾는 메소드

	public int member_find_m_num(String id) {
		String sql = "select m_num from member where m_id=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			res = psmt.executeQuery();
			if (res.next()) {
				return res.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 1. 회원 아이디 검색
	public String member_find_id(int m_num) {
		String sql = "select m_id from member where m_num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, m_num);
			res = psmt.executeQuery();
			if (res.next()) {
				return res.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

}
