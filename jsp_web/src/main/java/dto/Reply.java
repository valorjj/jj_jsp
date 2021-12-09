package dto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import dao.MemberDao;

public class Reply {

	private int r_no;
	private String r_content;
	private String r_date;
	private int m_num;
	private int b_no;
	private String r_writer;

	// 1. 빈 생성자
	public Reply() {
	}

	// 1. 풀 생성자
	public Reply(int r_no, String r_content, String r_date, int m_num, int b_no) {
		this.r_no = r_no;
		this.r_content = r_content;
		this.r_date = r_date;
		this.m_num = m_num;
		this.b_no = b_no;
		this.r_writer = MemberDao.getmemberDao().member_find_id(m_num);
	}

	// 1. 댓글 등록 시 사용할 생성자
	public Reply(String r_content, int m_num, int b_no) {
		this.r_content = r_content;
		this.m_num = m_num;
		this.b_no = b_no;
		this.r_writer = MemberDao.getmemberDao().member_find_id(m_num);
		/*
		 * DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); Date
		 * today = new Date(); this.r_date = dateFormat.format(today);
		 */
	}

	// 1. 등록된 댓글을 출력할 때 사용할 생성자
	public Reply(String r_content, String r_date, int m_num) {
		this.r_content = r_content;
		this.r_date = r_date;
		this.m_num = m_num;
		this.r_writer = MemberDao.getmemberDao().member_find_id(m_num);

	}
	
	
	

	
	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

}
