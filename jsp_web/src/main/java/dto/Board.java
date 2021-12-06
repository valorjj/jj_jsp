package dto;

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
		this.b_date = b_date;
		this.b_file = b_file;
		this.b_view = b_view;
		this.b_activation = b_activation;
	}

	// 1. 등록 생성자 
	public Board(String b_title, String b_content, int m_num, String b_file) {
		this.b_title = b_title;
		this.b_content = b_content;
		this.m_num = m_num;
		this.b_file = b_file;
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

}
