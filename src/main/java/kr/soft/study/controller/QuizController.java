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
        System.out.println("���� ���� ����");
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
        System.out.println("Fetched Quizzes: " + quizzs); // �α� �߰�
        return quizzs;
    }

    @RequestMapping(value = "/game/quiz/points/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> updateGamePoints(HttpSession session, @RequestBody Map<String, Object> pointsData) {
        Map<String, String> response = new HashMap<>();
        try {
            System.out.println("updateGamePoints �޼��� ȣ���");
            UserDto user = (UserDto) session.getAttribute("user");
            if (user == null || user.getUser_id() == null) {
                System.out.println("���ǿ� ���̵� ����");
                response.put("message", "User is not logged in.");
                return response;
            }

            String userId = user.getUser_id();

            // pointsEarned �� �����ϰ� ��ȯ�ϱ�
            Integer pointsEarned = 0;
            Object pointsEarnedObj = pointsData.get("pointsEarned");
            if (pointsEarnedObj instanceof Number) {
                pointsEarned = ((Number) pointsEarnedObj).intValue();
            } else if (pointsEarnedObj != null) {
                try {
                    pointsEarned = Integer.parseInt(pointsEarnedObj.toString());
                } catch (NumberFormatException e) {
                    System.out.println("Failed to parse pointsEarned: " + pointsEarnedObj);
                }
            }

            // quizId �� �����ϰ� ��ȯ�ϱ�
            Integer quizId = 0;
            Object quizIdObj = pointsData.get("quizId");
            if (quizIdObj instanceof Number) {
                quizId = ((Number) quizIdObj).intValue();
            } else if (quizIdObj != null) {
                try {
                    quizId = Integer.parseInt(quizIdObj.toString());
                } catch (NumberFormatException e) {
                    System.out.println("Failed to parse quizId: " + quizIdObj);
                }
            }

            String pointReason = (String) pointsData.get("pointReason");
            String fullPointReason = "���� ID:" + quizId + " " + pointReason;

            System.out.println("Updating points for userId: " + userId + ", quizId: " + quizId + ", pointsEarned: " + pointsEarned + ", pointReason: " + fullPointReason);
            pointsCommand.updatePoints(userId, pointsEarned, fullPointReason, quizId);

            response.put("message", "����Ʈ�� ������Ʈ�Ǿ����ϴ�.");
        } catch (Exception e) {
            e.printStackTrace(); // ������ ���� Ʈ���̽��� �ֿܼ� ���
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
	 * points.getPointReason()); // ����Ʈ ���� �߰� String resultMessage =
	 * pointsCommand.execute(params); Map<String, String> response = new
	 * HashMap<>(); response.put("message", resultMessage); return response; }
	 */

