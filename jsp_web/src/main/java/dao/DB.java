package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {

	// 1. 빌드 -> 라이브러리 추가
	// 2. 프로젝트 내 WEB-INF -> lib -> 라이브러리 추가

	protected Connection conn;
	protected ResultSet res;
	protected PreparedStatement psmt;

	// 1. 생성자
	public DB(){

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/jsp?serverTimezone-UTC", "root", "1234");
			System.out.println("DB 연결 성공");

		} catch (ClassNotFoundException e) {
			System.out.println("DB 연결 실패 ");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("DB 연결 실패 ");
			e.printStackTrace();
		}
	}

}
