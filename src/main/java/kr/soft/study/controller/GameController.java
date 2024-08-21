package kr.soft.study.controller;

import kr.soft.study.command.PointsCommand;
import kr.soft.study.dto.Game;
import kr.soft.study.dto.UserDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/game") // Ŭ���� ������ ����
public class GameController {

    @Autowired
    private PointsCommand pointsCommand;

    @RequestMapping(value = "/game", method = RequestMethod.GET)
    public String getGame(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Game game = (Game) session.getAttribute("game");

        if (game == null) {
            game = new Game();
            session.setAttribute("game", game);
        }

        request.setAttribute("game", game);
        return "game/game"; // �� �̸��� ��ȯ
    }

    @RequestMapping(value = "/game", method = RequestMethod.POST)
    public String postGame(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Game game = (Game) session.getAttribute("game");

        if (game == null) {
            game = new Game();
            session.setAttribute("game", game);
        }

        String action = request.getParameter("action");
        if ("reset".equals(action)) {
            game.reset();
        }

        session.setAttribute("game", game);
        return "redirect:/game/game"; // ��� �����̷�Ʈ
    }

    @RequestMapping(value = "/end", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> endGame(@RequestBody Map<String, Object> gameData, HttpSession session) {
        UserDto user = (UserDto) session.getAttribute("user");
        Map<String, String> response = new HashMap<>();

        if (user == null || user.getUser_id() == null) {
            response.put("message", "�α����ؾ� ����Ʈ�� �����˴ϴ�.");
            return response;
        }

        String userId = user.getUser_id();
        int gameScore = ((Integer) gameData.get("score")).intValue();
        int pointsEarned = gameScore * 5; // 1���� 5����Ʈ
        String pointReason = "������ ��� ����";

        // ����Ʈ ���� ó��
        Map<String, Object> pointParams = new HashMap<>();
        pointParams.put("userId", userId);
        pointParams.put("pointReason", pointReason);
        pointParams.put("gameScore", gameScore); // gameScore �߰�

        String pointUpdateMessage = pointsCommand.execute(pointParams);

        // ���� �޽��� ����
        response.put("message", pointUpdateMessage);
        return response;
    }
}