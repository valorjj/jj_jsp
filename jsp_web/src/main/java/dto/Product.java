package dto;

import java.text.DecimalFormat;

public class Product {

	private int p_no;
	private String p_name;
	private int p_price;
	private String p_category;
	private String p_manufacturer;
	private int p_status;
	private String p_size;
	private int p_instock;
	private String p_image;
	private String p_contents;
	private String p_date;
	
	public String get_decimal() {
		DecimalFormat decimalFormat = new DecimalFormat("###,###");
		return decimalFormat.format(this.p_price);
	}
	
	public String get_status() {
		if(this.p_status==1) {return "준비중";}
		if(this.p_status==2) {return "판매중";}
		if(this.p_status==3) {return "품절";}
		return null;
	}

	public Product() {
	}

	public Product(int p_no, String p_name, int p_price, String p_category, String p_manufacturer, int p_status,
			String p_size, int p_instock, String p_image, String p_contents, String p_date) {
		this.p_no = p_no;
		this.p_name = p_name;

		this.p_price = p_price;
		this.p_category = p_category;
		this.p_manufacturer = p_manufacturer;
		this.p_status = p_status;
		this.p_size = p_size;
		this.p_instock = p_instock;
		this.p_image = p_image;
		this.p_contents = p_contents;
		this.p_date = p_date;
	}

	public Product(String p_name, int p_price, String p_category, String p_manufacturer, int p_status, String p_size,
			int p_instock, String p_image, String p_contents) {
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_category = p_category;
		this.p_manufacturer = p_manufacturer;
		this.p_status = p_status;
		this.p_size = p_size;
		this.p_instock = p_instock;
		this.p_image = p_image;
		this.p_contents = p_contents;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

	public String getP_manufacturer() {
		return p_manufacturer;
	}

	public void setP_manufacturer(String p_manufacturer) {
		this.p_manufacturer = p_manufacturer;
	}

	public int getP_status() {
		return p_status;
	}

	public void setP_status(int p_status) {
		this.p_status = p_status;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

	public int getP_instock() {
		return p_instock;
	}

	public void setP_instock(int p_instock) {
		this.p_instock = p_instock;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public String getP_contents() {
		return p_contents;
	}

	public void setP_contents(String p_contents) {
		this.p_contents = p_contents;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	
	

}
