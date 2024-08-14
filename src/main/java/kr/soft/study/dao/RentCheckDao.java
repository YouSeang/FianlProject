package kr.soft.study.dao;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.soft.study.dto.PreQuizDto;

@Repository
public interface RentCheckDao {

    PreQuizDto getPreQuizById(int id);
    
    List<PreQuizDto> getPreQuizzesByCategory(String category);
    
    void addPreQuiz(PreQuizDto prequiz);
    void updatePreQuiz(PreQuizDto prequiz);
    void deletePreQuiz(int id);
}