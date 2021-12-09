package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Reply;

public class ReplyDao {

	// 1. 빌드 -> 라이브러리 추가
	// 2. 프로젝트 내 WEB-INF -> lib -> 라이브러리 추가

	private Connection conn;
	private ResultSet res;
	private PreparedStatement psmt;

	// 1. 생성자
	public ReplyDao() {

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

	public static ReplyDao replyDao = new ReplyDao();

	public static ReplyDao getreplyDao() {
		return replyDao;
	}

	// 1. 댓글 등록 메소드
	public boolean write_reply(Reply reply) {

		String sql = "insert into reply(r_content, m_num, b_no) values(?, ?, ?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, reply.getR_content());
			psmt.setInt(2, reply.getM_num());
			psmt.setInt(3, reply.getB_no());
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 1. 댓글 객체 가져오기
	public ArrayList<Reply> get_reply_instance() {
		ArrayList<Reply> replys = new ArrayList<>();
		String sql = "select * from reply";
		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			while (res.next()) {

				Reply reply = new Reply(

						res.getInt(1), 
						res.getString(2), 
						res.getString(3), 
						res.getInt(4),
						res.getInt(5)
						
						);

				replys.add(reply);
			}
			return replys;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 2. 특정 게시판의 댓글만 가져와야한다.
	public ArrayList<Reply> get_reply_instance(int b_no, int startrow, int listsize) {
		ArrayList<Reply> replys = new ArrayList<>();
		String sql = "select * from reply where b_no=? order by r_date asc limit ? , ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, b_no);
			psmt.setInt(2, startrow);
			psmt.setInt(3, listsize);
			res = psmt.executeQuery();
			while (res.next()) {

				Reply reply = new Reply(

						res.getInt(1), 
						res.getString(2), 
						res.getString(3), 
						res.getInt(4),
						res.getInt(5) 
						
						);

				replys.add(reply);
			}
			return replys;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 1. b_no 받아서 r_no 뱉는 메소드
	public int get_r_no(int b_no) {

		String sql = "select r_no from reply where b_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, b_no);
			res = psmt.executeQuery();
			if (res.next()) {
				return res.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 1. 댓글 삭제하는 메소드

	public boolean delete_reply(int r_no) {

		String sql = "delete from reply where r_no="+r_no;

		try {
			psmt = conn.prepareStatement(sql);
			psmt.executeUpdate();
			return true;
		} catch (Exception e) { e.printStackTrace(); }
		return false;
	}
	
	// 1. 댓글 갯수 세는 메소드
	// 1.1 특정 게시판 번호안에 있는 댓글만 센다.
	public int reply_count(int b_no) {
		String sql ="select count(*) from reply where b_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, b_no);
			res = psmt.executeQuery();
			if(res.next()) { return res.getInt(1); }
		} catch (Exception e) {e.printStackTrace();}
		return 0;
	}

}
