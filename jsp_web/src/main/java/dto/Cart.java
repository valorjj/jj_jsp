package dto;

public class Cart {

	private int p_no;
	private String p_size;
	private int p_count;

	public Cart() {
	}

	public Cart(int p_no, String p_size, int p_count) {
		this.p_no = p_no;
		this.p_size = p_size;
		this.p_count = p_count;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

	public int getP_count() {
		return p_count;
	}

	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

}
