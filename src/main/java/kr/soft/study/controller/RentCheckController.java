package kr.soft.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.soft.study.command.AdminPreQuizCommand;
import kr.soft.study.dao.RentCheckDao;
import kr.soft.study.dto.PreQuizDto;
import kr.soft.study.util.Command;

@Controller
public class RentCheckController {

    Command command = null;

	
    @Autowired
    private RentCheckDao rentCheckDao;
    
    @RequestMapping("/admin/quiz2")
    public String adminQuiz(HttpServletRequest request, Model model) {
        System.out.println("어드민 비디오 관리");
        model.addAttribute("request", request);
        command = new AdminPreQuizCommand();
        command.execute(model);
        return "admin/adminQuiz2";
    }

    @RequestMapping("/admin/quizAdd2")
    public String addQuiz(Model model) {
        model.addAttribute("quiz", new PreQuizDto());
        return "admin/adminQuizAdd2";
    }

    @RequestMapping(value = "/admin/quizSave2", method = RequestMethod.POST)
    public String saveQuiz(@ModelAttribute("quiz") PreQuizDto quiz) {
        if (quiz.getId() > 0) {
        	rentCheckDao.updatePreQuiz(quiz);
        } else {
        	rentCheckDao.addPreQuiz(quiz);
        }
        return "redirect:/admin/quiz2";
    }

    @RequestMapping("/admin/quizEdit2")
    public String editQuiz(@RequestParam("id") int id, Model model) {
    	PreQuizDto quiz = rentCheckDao.getPreQuizById(id);
        model.addAttribute("quiz", quiz);
        return "admin/quizForm2";
    }

    @RequestMapping(value = "/admin/quizDelete2", method = RequestMethod.POST)
    public String deleteQuiz(@RequestParam("id") int id) {
    	rentCheckDao.deletePreQuiz(id);
        return "redirect:/admin/quiz2";
    }

    @GetMapping("/preCheckQuiz")
    public String showPreCheckQuiz() {
        return "security/preCheckQuiz";
    }

    @GetMapping("/api/getQuiz")
    @ResponseBody
    public Map<String, Object> getQuiz(@RequestParam(value = "index", defaultValue = "0") int index) {
        List<PreQuizDto> quizzes = rentCheckDao.getPreQuizzesByCategory("전세계약전 사전점검");
        Map<String, Object> response = new HashMap<>();
        
        if (index < quizzes.size()) {
            response.put("question", quizzes.get(index).getQuestion());
            response.put("totalQuestions", quizzes.size()); // 총 퀴즈 개수 반환
        } else {
            response = null; // 더 이상 질문이 없을 경우
        }

        return response;
    }
    
    @PostMapping("/api/checkAnswer")
    @ResponseBody
    public boolean checkAnswer(@RequestParam("index") int index, @RequestParam("answer") String answer) {
        List<PreQuizDto> quizzes = rentCheckDao.getPreQuizzesByCategory("전세계약전 사전점검");
        if (index < quizzes.size()) {
            PreQuizDto quiz = quizzes.get(index);
            return quiz.isAnswer() == answer.equals("O");
        }
        return false;
    }

	/*
	 * @RequestMapping(value = "/game/quiz/category/{category}", method =
	 * RequestMethod.GET)
	 * 
	 * @ResponseBody public List<PreQuizDto> getPreQuizzesByCategory(@PathVariable
	 * String category) { List<PreQuizDto> quizzs =
	 * RentCheckDao.getPreQuizzesByCategory(category);
	 * System.out.println("Fetched Quizzes: " + quizzs); // 로그 추가 return quizzs; }
	 */
    
}
