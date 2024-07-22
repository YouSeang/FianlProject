package kr.soft.study.dto;

public class QuizDto {
    private int id;
    private String question;
    private boolean answer;

	   
	    public QuizDto(int id, String question, boolean answer) {
	        this.id = id;
	        this.question = question;
	        this.answer = answer;
	    }

	    // Getters and Setters
	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
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

	    
	}
