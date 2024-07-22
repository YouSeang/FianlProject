/*
 * package kr.soft.study.controller;
 * 
 * import kr.soft.study.dao.*; import kr.soft.study.dto.QuizDto; import
 * kr.soft.study.command.*; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.*;
 * 
 * @Controller // @RequestMapping("/game/quiz") public class quizController {
 * 
 * @Autowired private QuizService quizService;
 * 
 * 
 * @RequestMapping("/game/quiz") public String quiz(Model model) {
 * System.out.println("quiz"); return "game/quiz"; }
 * 
 * @RequestMapping("/game/quizresult") public String quizresult(Model model) {
 * System.out.println("quizresult"); return "game/quizresult"; }
 * 
 * 
 * @RequestMapping("/{id}") public QuizDto getQuiz(@PathVariable int id) {
 * return quizService.getQuizById(id); }
 * 
 * @RequestMapping("/check") public String
 * checkAnswer(@RequestParam("questionId") int
 * questionId, @RequestParam("answer") boolean userAnswer) { return
 * quizService.checkAnswer(questionId, userAnswer); } }
 */