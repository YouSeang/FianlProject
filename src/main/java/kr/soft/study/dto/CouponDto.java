package kr.soft.study.dto;

public class CouponDto {

	private int id;
	private String coupon_type;
	private String coupon_image;
	int coupon_points;

	public CouponDto() {
		super();
	}

	public CouponDto(int id, String coupon_type, String coupon_image, int coupon_points) {
		super();
		this.id = id;
		this.coupon_type = coupon_type;
		this.coupon_image = coupon_image;
		this.coupon_points = coupon_points;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCoupon_type() {
		return coupon_type;
	}

	public void setCoupon_type(String coupon_type) {
		this.coupon_type = coupon_type;
	}

	public String getCoupon_image() {
		return coupon_image;
	}

	public void setCoupon_image(String coupon_image) {
		this.coupon_image = coupon_image;
	}

	public int getCoupon_points() {
		return coupon_points;
	}

	public void setCoupon_points(int coupon_points) {
		this.coupon_points = coupon_points;
	}

}
