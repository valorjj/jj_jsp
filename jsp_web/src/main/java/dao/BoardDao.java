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

	public ArrayList<Board> board_list() {

		ArrayList<Board> boards = new ArrayList<>();
		String sql = "select * from board order by b_no desc";

		try {
			psmt = conn.prepareStatement(sql);
			res = psmt.executeQuery();
			while (res.next()) {
				Board board = new Board(res.getInt(1), res.getString(2), res.getString(3), res.getInt(4),
						res.getString(5), res.getString(6), res.getInt(7), res.getInt(8));
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
						res.getString(5), res.getString(6), res.getInt(7), res.getInt(8));
				return board;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
