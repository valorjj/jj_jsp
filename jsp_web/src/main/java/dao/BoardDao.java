package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.Board;

public class BoardDao {

	// 1. 빌드 -> 라이브러리 추가
	// 2. 프로젝트 내 WEB-INF -> lib -> 라이브러리 추가

	private Connection conn;
	private ResultSet res;
	private PreparedStatement psmt;

	public static BoardDao boardDao = new BoardDao();

	public static BoardDao getboardDao() {
		return boardDao;
	}

	// 1. 생성자
	public BoardDao() {
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

	public boolean board_write(Board board) {
		String sql = "insert into board(b_title, b_content, m_num, b_file) values(?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, board.getB_title());
			psmt.setString(2, board.getB_content());
			psmt.setInt(3, board.getM_num());
			psmt.setString(4, board.getB_file());
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean board_write_file2(Board board) {
		String sql = "insert into board(b_title, b_content, m_num, b_file, b_file2) values(?,?,?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, board.getB_title());
			psmt.setString(2, board.getB_content());
			psmt.setInt(3, board.getM_num());
			psmt.setString(4, board.getB_file());
			psmt.setString(5, board.getB_file2());
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// @param : startrow, listsize, key, keyword
	// 검색한 결과를 리턴할 메소드 + 검색 없을 때 메소드를 통합했다.

	public ArrayList<Board> board_list(int startrow, int listsize, String key, String keyword) {

		ArrayList<Board> boards = new ArrayList<>();

		String sql = null; // 제어문에 따라서 sql 을 여러개로 사용하겠다.

		if (key == null && keyword == null) { // 검색이 없을 경우
			sql = "select * from board order by b_no desc limit ? , ?";
		} else { // 검색이 있을 경우
			if (key.equals("b_title")) { // 제목 검색 (포함된 값을 모두를 select 해야함)
				// limit 시작번호 : 제한갯수
				sql = "select * from board where " + key + " like '%" + keyword + "%' order by b_no desc limit ? , ?";
			} else if (key.equals("b_writer")) { // 작성자 검색 (작성자 --> 회원번호로 바꿔야한다.)
				int m_num = MemberDao.getmemberDao().member_find_m_num(keyword);
				sql = "select * from board where m_num = " + m_num + " order by b_no desc limit ? , ?";

			} else if (key.equals("b_no")) { // 번호 검색 (일치한 필드만 select 해야함)
				sql = "select * from board where b_no = " + keyword + " order by b_no desc limit ? , ?";
			}
		}
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startrow);
			psmt.setInt(2, listsize);
			res = psmt.executeQuery();
			while (res.next()) {
				Board board = new Board(res.getInt(1), res.getString(2), res.getString(3), res.getInt(4),
						res.getString(5), res.getString(6), res.getInt(7), res.getInt(8), res.getString(9));
				boards.add(board);
			}
			return boards;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Board get_board(int b_no) {
		String sql = " select * from board where b_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, b_no);
			res = psmt.executeQuery();
			if (res.next()) {
				Board board = new Board(res.getInt(1), res.getString(2), res.getString(3), res.getInt(4),
						res.getString(5), res.getString(6), res.getInt(7), res.getInt(8), res.getString(9));
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 1. 조회수 증가 메소드

	public boolean board_view_count_update(int b_no) {

		String sql = "update board set b_view = b_view + 1 where b_no = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, b_no);
			psmt.executeUpdate();
			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 1. 게시판 삭제 메소드

	public boolean board_delete(int b_no) {

		String sql = "delete from board where b_no=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, b_no);
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	public boolean board_update(Board board) {

		String sql = "update board set b_title=?, b_content=?, b_file=?, b_file2=? where b_no=?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, board.getB_title());
			psmt.setString(2, board.getB_content());
			psmt.setString(3, board.getB_file());
			psmt.setString(4, board.getB_file2());
			psmt.setInt(5, board.getB_no());
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	// 1. 게시물의 총 갯수를 반환하는 메소드

	public int board_count(String key, String keyword) {

		String sql = null;

		if ( key != null && keyword != null) { // 검색이 있을 때 조건 레코드 갯수 세기
			if (key.equals("b_title")) { // 제목 검색 (포함된 값을 모두를 select 해야함)
				// limit 시작번호 : 제한갯수
				sql = "select * from board where " + key + " like '%" + keyword + "%'";
			} else if (key.equals("b_writer")) { // 작성자 검색 (작성자 --> 회원번호로 바꿔야한다.)
				int m_num = MemberDao.getmemberDao().member_find_m_num(keyword);
				sql = "select * from board where m_num = " + m_num ;
			} else if (key.equals("b_no")) { // 번호 검색 (일치한 필드만 select 해야함)
				sql = "select * from board where b_no = " + keyword;
			}
		} else { // 조건 없을 때 모든 레코드 카운트
			sql = "select count(*) from board ";
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

}
