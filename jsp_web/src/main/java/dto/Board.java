package dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import dao.MemberDao;

public class Board {

	// 1. 필드
	private int b_no;
	private String b_title;
	private String b_content;
	private int m_num;
	private String b_date;
	private String b_file;
	private int b_view;
	private int b_activation;
	private String b_file2;
	private String b_writer;

	// 1. 빈 생성자
	public Board() {
	}

	// 1. 전체 생성자
	public Board(int b_no, String b_title, String b_content, int m_num, String b_date, String b_file, int b_view,
			int b_activation) {
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.m_num = m_num;

		Date today = new Date();

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("hh : mm");
		try {
			Date date = dateFormat.parse(b_date); // [문자열] DB --> 날짜형 변환
			this.b_date = dateFormat.format(date); // 형식 변환
			if (this.b_date.equals(dateFormat.format(today))) {
				this.b_date = dateFormat2.format(today);
			} else {
				this.b_date = dateFormat.format(date);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		this.b_file = b_file;
		this.b_view = b_view;
		this.b_activation = b_activation;
		this.b_writer = MemberDao.getmemberDao().member_find_id(m_num);
	}

	public Board(int b_no, String b_title, String b_content, int m_num, String b_date, String b_file, int b_view,
			int b_activation, String b_file2) {
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.m_num = m_num;

		Date today = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("hh : mm");
		try {
			Date date = dateFormat.parse(b_date); // [문자열] DB --> 날짜형 변환
			this.b_date = dateFormat.format(date); // 형식 변환
			if (this.b_date.equals(dateFormat.format(today))) {
				this.b_date = dateFormat2.format(today);
			} else {
				this.b_date = dateFormat.format(date);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		this.b_file = b_file;
		this.b_view = b_view;
		this.b_activation = b_activation;
		this.b_file2 = b_file2;
		this.b_writer = MemberDao.getmemberDao().member_find_id(m_num);
	}

	// 1. 등록 생성자
	public Board(String b_title, String b_content, int m_num, String b_file) {
		this.b_title = b_title;
		this.b_content = b_content;
		this.m_num = m_num;
		this.b_file = b_file;
	}

	// 1. 첨부파일 2개일 때 생성자
	public Board(String b_title, String b_content, int m_num, String b_file, String b_file2) {
		this.b_title = b_title;
		this.b_content = b_content;
		this.m_num = m_num;
		this.b_file = b_file;
		this.b_file2 = b_file2;
	}

	// 1. 수정 생성자
	public Board(int b_no, String b_title, String b_content, String b_file, String b_file2) {
		this.b_no = b_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_file = b_file;
		this.b_file2 = b_file2;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public String getB_file() {
		return b_file;
	}

	public void setB_file(String b_file) {
		this.b_file = b_file;
	}

	public int getB_view() {
		return b_view;
	}

	public void setB_view(int b_view) {
		this.b_view = b_view;
	}

	public int getB_activation() {
		return b_activation;
	}

	public void setB_activation(int b_activation) {
		this.b_activation = b_activation;
	}

	public String getB_file2() {
		return b_file2;
	}

	public void setB_file2(String b_file2) {
		this.b_file2 = b_file2;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

}
