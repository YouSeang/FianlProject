package kr.soft.study.dto;

import java.util.List;

public class SmishingDto {
	private int id;
	private String type;
	private String description;
	private String adminText;
	private String imageUrl;

	public SmishingDto() {
		super();
	}

	public SmishingDto(int id, String type, String description, String adminText, String imageUrl) {
		super();
		this.id = id;
		this.type = type;
		this.description = description;
		this.adminText = adminText;
		this.imageUrl = imageUrl;
	}

	public String getAdminText() {
		return adminText;
	}

	public void setAdminText(String adminText) {
		this.adminText = adminText;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imgageUrl) {
		this.imageUrl = imgageUrl;
	}

}
