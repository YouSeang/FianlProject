package kr.soft.study.dto;

public class QuizDto {
	  private int index;
	    private String category;
	    private String question;
	    private boolean answer;
	    private int points;
	    private String explanation;

	    // Constructors
	    public QuizDto() {
	    }

	    public QuizDto(int index, String category, String question, boolean answer, int points, String explanation) {
	        this.index = index;
	        this.category = category;
	        this.question = question;
	        this.answer = answer;
	        this.points = points;
	        this.explanation = explanation;
	    }

	    // Getters and Setters
	    public int getIndex() {
	        return index;
	    }

	    public void setIndex(int index) {
	        this.index = index;
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

	    public int getPoints() {
	        return points;
	    }

	    public void setPoints(int points) {
	        this.points = points;
	    }

	    public String getExplanation() {
	        return explanation;
	    }

	    public void setExplanation(String explanation) {
	        this.explanation = explanation;
	    }
	}
