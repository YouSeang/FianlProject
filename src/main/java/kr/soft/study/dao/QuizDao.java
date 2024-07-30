package kr.soft.study.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.soft.study.dto.QuizDto;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface QuizDao {	 
	
	QuizDto getQuizById(int id);
	
	public ArrayList<QuizDto> getQuizs();
	
	public List<QuizDto> getQuizzesByCategory(String category);
	 
	public void addQuiz(QuizDto quiz);
	public void updateQuiz(QuizDto quiz);
	public void deleteQuiz(int id);
}
