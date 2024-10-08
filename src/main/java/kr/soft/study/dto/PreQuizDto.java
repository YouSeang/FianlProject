package kr.soft.study.dto;

public class PreQuizDto {
    private int id;
    private String category;
    private String question;
    private boolean answer;
    private String explanation;
    private String imageUrl;  // 이미지 URL 필드 추가


	// Getters and setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getQuestion() {
        return question;
    }
    public void setQuestion(String question) {
        this.question = question;
    }
    public boolean isAnswer() {
        return answer;
    }
    public void setAnswer(boolean answer) {
        this.answer = answer;
    }
    public String getExplanation() {
        return explanation;
    }
    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }
    public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
}
