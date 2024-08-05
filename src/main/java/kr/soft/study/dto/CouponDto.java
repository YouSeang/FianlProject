package kr.soft.study.dto;

import java.sql.Timestamp;

public class CouponDto {

	private int id;
	private String coupon_id;
	private int user_id;
	private Timestamp issue_date;
	private Timestamp use_date;
	private int is_used;
	private String coupon_type;
	private String coupon_image;
	int coupon_points;

	public CouponDto() {
		super();
	}

	public CouponDto(int id, String coupon_id, int user_id, Timestamp issue_date, Timestamp use_date, int is_used,
			String coupon_type, String coupon_image, int coupon_points) {
		super();
		this.id = id;
		this.coupon_id = coupon_id;
		this.user_id = user_id;
		this.issue_date = issue_date;
		this.use_date = use_date;
		this.is_used = is_used;
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

	public String getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(String coupon_id) {
		this.coupon_id = coupon_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Timestamp getIssue_date() {
		return issue_date;
	}

	public void setIssue_date(Timestamp issue_date) {
		this.issue_date = issue_date;
	}

	public Timestamp getUse_date() {
		return use_date;
	}

	public void setUse_date(Timestamp use_date) {
		this.use_date = use_date;
	}

	public int getIs_used() {
		return is_used;
	}

	public void setIs_used(int is_used) {
		this.is_used = is_used;
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
