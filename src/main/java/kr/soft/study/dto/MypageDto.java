package kr.soft.study.dto;

import java.sql.Timestamp;

//일단 usercoupon과 points 테이블에 변수 모두 가져옴
public class MypageDto {

	private String user_id;
	private Timestamp point_time;
	private String point_reason;
	private int points_earned;
	private String points_used;
	private Timestamp usage_time;
	private String usage_type;
	private int total_points;

	private int coupon_id;
	private Timestamp issue_date;
	private Timestamp use_date;
	private Boolean isUsed;
	private Integer unused_coupons;

	public MypageDto() {
		super();
	}

	public MypageDto(String user_id, Timestamp point_time, String point_reason, int points_earned, String points_used,
			Timestamp usage_time, String usage_type, int total_points, int coupon_id, Timestamp issue_date,
			Timestamp use_date, Boolean isUsed, Integer unused_coupons) {
		super();
		this.user_id = user_id;
		this.point_time = point_time;
		this.point_reason = point_reason;
		this.points_earned = points_earned;
		this.points_used = points_used;
		this.usage_time = usage_time;
		this.usage_type = usage_type;
		this.total_points = total_points;
		this.coupon_id = coupon_id;
		this.issue_date = issue_date;
		this.use_date = use_date;
		this.isUsed = isUsed;
		this.unused_coupons = unused_coupons;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Timestamp getPoint_time() {
		return point_time;
	}

	public void setPoint_time(Timestamp point_time) {
		this.point_time = point_time;
	}

	public String getPoint_reason() {
		return point_reason;
	}

	public void setPoint_reason(String point_reason) {
		this.point_reason = point_reason;
	}

	public int getPoints_earned() {
		return points_earned;
	}

	public void setPoints_earned(int points_earned) {
		this.points_earned = points_earned;
	}

	public Timestamp getUsage_time() {
		return usage_time;
	}

	public void setUsage_time(Timestamp usage_time) {
		this.usage_time = usage_time;
	}

	public String getUsage_type() {
		return usage_type;
	}

	public void setUsage_type(String usage_type) {
		this.usage_type = usage_type;
	}

	public int getTotal_points() {
		return total_points;
	}

	public void setTotal_points(int total_points) {
		this.total_points = total_points;
	}

	public int getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
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

	public Boolean getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(Boolean isUsed) {
		this.isUsed = isUsed;
	}

	public Integer getUnused_coupons() {
		return unused_coupons;
	}

	public void setUnused_coupons(Integer unused_coupons) {
		this.unused_coupons = unused_coupons;
	}

	public String getpoints_used() {
		return points_used;
	}

	public void setpoints_used(String points_used) {
		this.points_used = points_used;
	}

}
