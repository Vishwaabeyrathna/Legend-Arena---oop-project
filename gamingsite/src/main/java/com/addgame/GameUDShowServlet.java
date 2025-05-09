package com.addgame;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GameUDShowServlet")
public class GameUDShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Game> games = GameDAO.getAllGames();
        request.setAttribute("games", games);
        RequestDispatcher dispatcher = request.getRequestDispatcher("gamesTable.jsp");
        dispatcher.forward(request, response);
    }
}
