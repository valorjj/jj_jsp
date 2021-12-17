package dto;

public class POrderDetail {

	private int orderdetail_no;
	private int order_no;
	private int p_no;
	private int p_count;
	private int delivery_state;

	public POrderDetail() {
	}

	public POrderDetail(int orderdetail_no, int order_no, int p_no, int p_count, int delivery_state) {
		this.orderdetail_no = orderdetail_no;
		this.order_no = order_no;
		this.p_no = p_no;
		this.p_count = p_count;
		this.delivery_state = delivery_state;
	}

	public POrderDetail(int order_no, int p_no, int p_count, int delivery_state) {
		this.order_no = order_no;
		this.p_no = p_no;
		this.p_count = p_count;
		this.delivery_state = delivery_state;
	}

	public int getOrderdetail_no() {
		return orderdetail_no;
	}

	public void setOrderdetail_no(int orderdetail_no) {
		this.orderdetail_no = orderdetail_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getP_count() {
		return p_count;
	}

	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

	public int getDelivery_state() {
		return delivery_state;
	}

	public void setDelivery_state(int delivery_state) {
		this.delivery_state = delivery_state;
	}

}
