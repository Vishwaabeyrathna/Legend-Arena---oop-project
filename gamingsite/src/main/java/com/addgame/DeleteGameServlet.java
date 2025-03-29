package com.addgame;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteGameServlet")
public class DeleteGameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int game_id = Integer.parseInt(request.getParameter("game_id"));

        boolean isDeleted = GameDAO.deleteGame(game_id);

        if (isDeleted) {
            response.sendRedirect("GameLibraryServlet");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}

