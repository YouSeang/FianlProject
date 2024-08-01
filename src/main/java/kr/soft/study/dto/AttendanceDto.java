package kr.soft.study.dto;

import java.sql.Date;

public class AttendanceDto {

	private int id;
	private String user_id;
	private Date check_in_date;

	public AttendanceDto() {
		super();
	}

	public AttendanceDto(int id, String user_id, Date check_in_date) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.check_in_date = check_in_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getCheck_in_date() {
		return check_in_date;
	}

	public void setCheck_in_date(Date check_in_date) {
		this.check_in_date = check_in_date;
	}
}
