package kr.soft.study.dto;

import java.time.LocalDateTime;

public class SmishingLogDto {

	private int id;
	private String user_id;
	private LocalDateTime sent_at;

	public SmishingLogDto() {
	}

	public SmishingLogDto(int id, String user_id, LocalDateTime sent_at) {
		this.id = id;
		this.user_id = user_id;
		this.sent_at = sent_at;
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

	public LocalDateTime getSent_at() {
		return sent_at;
	}

	public void setSent_at(LocalDateTime sent_at) {
		this.sent_at = sent_at;
	}

	@Override
	public String toString() {
		return "SmishingLogDto{" + "id=" + id + ", user_id='" + user_id + '\'' + ", sent_at=" + sent_at + '}';
	}
}