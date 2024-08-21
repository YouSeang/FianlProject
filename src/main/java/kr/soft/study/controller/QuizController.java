package kr.soft.study.controller;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.soft.study.command.AdminQuizCommand;
import kr.soft.study.command.PointsCommand;
import kr.soft.study.dao.QuizDao;
import kr.soft.study.dto.QuizDto;
import kr.soft.study.dto.UserDto;
import kr.soft.study.dto.PointsDto;
import kr.soft.study.util.Command;

@Controller
public class QuizController {

    Command command = null;

    @Autowired
    private QuizDao quizDao;

    @Autowired
    private PointsCommand pointsCommand;

    @RequestMapping("/admin/quiz")
    public String adminQuiz(HttpServletRequest request, Model model) {
        System.out.println("어드민 비디오 관리");
        model.addAttribute("request", request);
        command = new AdminQuizCommand();
        command.execute(model);
        return "admin/adminQuiz";
    }

    @RequestMapping("/admin/quizAdd")
    public String addQuiz(Model model) {
        model.addAttribute("quiz", new QuizDto());
        return "admin/adminQuizAdd";
    }

    @RequestMapping(value = "/admin/quizSave", method = RequestMethod.POST)
    public String saveQuiz(@ModelAttribute("quiz") QuizDto quiz) {
        if (quiz.getId() > 0) {
            quizDao.updateQuiz(quiz);
        } else {
            quizDao.addQuiz(quiz);
        }
        return "redirect:/admin/quiz";
    }

    @RequestMapping("/admin/quizEdit")
    public String editQuiz(@RequestParam("id") int id, Model model) {
        QuizDto quiz = quizDao.getQuizById(id);
        model.addAttribute("quiz", quiz);
        return "admin/quizForm";
    }

    @RequestMapping(value = "/admin/quizDelete", method = RequestMethod.POST)
    public String deleteQuiz(@RequestParam("id") int id) {
        quizDao.deleteQuiz(id);
        return "redirect:/admin/quiz";
    }

    @RequestMapping(value = "/game/quiz/category/{category}", method = RequestMethod.GET)
    @ResponseBody
    public List<QuizDto> getQuizzesByCategory(@PathVariable String category) {
        List<QuizDto> quizzs = quizDao.getQuizzesByCategory(category);
        System.out.println("Fetched Quizzes: " + quizzs); // 로그 추가
        return quizzs;
    }

    @RequestMapping(value = "/game/quiz/points/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> updateGamePoints(HttpSession session, @RequestBody Map<String, Object> pointsData) {
        Map<String, String> response = new HashMap<>();
        try {
            UserDto user = (UserDto) session.getAttribute("user");
            if (user == null || user.getUser_id() == null) {
                response.put("message", "로그인하시면 포인트가 적립됩니다.");
                return response;
            }

            String userId = user.getUser_id();
            Integer pointsEarned = ((Number) pointsData.get("pointsEarned")).intValue();
            Integer quizId = ((Number) pointsData.get("quizId")).intValue();
            String pointReason = "퀴즈 ID:" + quizId + " " + (String) pointsData.get("pointReason");

            boolean isPointAdded = pointsCommand.updatevideoPoints(userId, pointsEarned, pointReason, quizId);

            if (isPointAdded) {
                response.put("message", "포인트가 업데이트되었습니다.");
            } else {
                response.put("message", "포인트가 이미 지급되었습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("message", "Error occurred while updating points.");
        }
        return response;
    }

}


	/*
	 * @RequestMapping(value = "/game/quiz/points/update", method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public Map<String, String> updateGamePoints(@RequestBody
	 * PointsDto points) { Map<String, Object> params = new HashMap<>();
	 * params.put("userId", points.getUserId()); params.put("Id", points.getId());
	 * params.put("points", points.getPointsEarned()); params.put("pointReason",
	 * points.getPointReason()); // 포인트 이유 추가 String resultMessage =
	 * pointsCommand.execute(params); Map<String, String> response = new
	 * HashMap<>(); response.put("message", resultMessage); return response; }
	 */

