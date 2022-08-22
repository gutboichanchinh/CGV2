package my.com.entity;

public class OrderDetail {

	private int id;

	private String productName;

	private String description;

	private float subtotal;

	private float fee;

	private float total;

	public OrderDetail() {
	}

	public OrderDetail(String productName, String description, String subtotal, String fee, String total) {
		super();
		this.productName = productName;
		this.description = description;
		this.subtotal = Float.parseFloat(subtotal);
		this.fee = Float.parseFloat(fee);
		this.total = Float.parseFloat(total);
	}

	public String getProductName() {
		return productName;
	}

	public String getDescription() {
		return description;
	}

	public String getSubtotal() {
		return String.format("%.2f", subtotal);
	}

	public String getTotal() {
		return String.format("%.2f", total);
	}

	public String getFee() {
		return String.format("%.2f", fee);
	}

	public int getId() {
		return id;
	}

}
