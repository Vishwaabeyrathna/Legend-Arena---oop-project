package com.addgame;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GameLibraryServlet
 */


@WebServlet("/GameLibraryServlet")
public class GameLibraryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch games from DAO
        List<Game> games = GameDAO.getAllGames(); 
        
        // Pass the list of games to the JSP
        request.setAttribute("games", games);
        
        // Forward to games.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("games.jsp");
        dispatcher.forward(request, response);
    }
}

