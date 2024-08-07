package kr.soft.study.controller;

import kr.soft.study.dto.Game;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/game")
public class GameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Game game = (Game) session.getAttribute("game");

        if (game == null) {
            game = new Game();
            session.setAttribute("game", game);
        }

        request.setAttribute("game", game);
        request.getRequestDispatcher("/WEB-INF/views/game.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        response.sendRedirect("game");
    }
}
