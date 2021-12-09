package dto;

public class PLike {

	private int plike_no;
	private int p_no;


	private int m_num;

	public PLike() {
	}

	public PLike(int plike_no, int p_no, int m_num) {
		this.plike_no = plike_no;
		this.p_no = p_no;
		this.m_num = m_num;
	}

	public PLike(int p_no, int m_num) {
		this.p_no = p_no;
		this.m_num = m_num;
	}
	
	public int getPlike_no() {
		return plike_no;
	}

	public void setPlike_no(int plike_no) {
		this.plike_no = plike_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}


}
