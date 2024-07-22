/*
 * package kr.soft.study.command; import kr.soft.study.dto.*; import
 * org.springframework.stereotype.Service;
 * 
 * @Service public class QuizService {
 * 
 * public QuizDto getQuizById(int id) { // 데이터베이스에서 퀴즈를 조회하는 로직 return new
 * QuizDto(id, "Example Question?", true); }
 * 
 * public String checkAnswer(int questionId, boolean userAnswer) { QuizDto quiz
 * = getQuizById(questionId); if (quiz.isAnswer() == userAnswer) { return
 * "정답입니다!"; } else { return "틀렸습니다!"; } } }
 */