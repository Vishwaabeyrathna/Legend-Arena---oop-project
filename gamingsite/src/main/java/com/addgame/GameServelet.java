package com.addgame;

import java.io.IOException;



import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GameServelet")
public class GameServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String description = request.getParameter("description");
        String release_date = request.getParameter("release_date");
        String developer = request.getParameter("developer");
        String trailer_url = request.getParameter("trailer_url");
        String cover_image_path = request.getParameter("cover_image_path");

        boolean isTrue = GameDAO.addgame(title, genre, description, release_date, developer, trailer_url, cover_image_path);

        if (isTrue) {
            request.setAttribute("games", GameDAO.getAllGames());
            RequestDispatcher dis = request.getRequestDispatcher("./games.jsp");
            dis.forward(request, response);
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
            dis2.forward(request, response);
        }
    } 
}
