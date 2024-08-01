package kr.soft.study.dto;

import java.sql.Timestamp;

public class ShareDto {
    private int id;
    private String userId;
    private String title;
    private String contents;
    private String image;
    private Timestamp writetime;
    private String postType;

    // 기본 생성자
    public ShareDto() {
        this.postType = "main";
    }
    // 모든 필드를 사용하는 생성자
    public ShareDto(int id, String userId, String title, String contents, String image, Timestamp writetime, String postType) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.contents = contents;
        this.image = image;
        this.writetime = writetime;
        this.postType = postType;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Timestamp getWritetime() {
        return writetime;
    }

    public void setWritetime(Timestamp writetime) {
        this.writetime = writetime;
    }

    public String getPostType() {
        return postType;
    }

    public void setPostType(String postType) {
        this.postType = postType;
    }

    @Override
    public String toString() {
        return "CaseShareDTO [id=" + id + ", userId=" + userId + ", title=" + title + ", contents=" + contents
                + ", image=" + image + ", writetime=" + writetime + ", postType=" + postType + "]";
    }
}