package com.addgame;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateGameServlet")
public class UpdateGameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve game_id parameter
            String gameIdStr = request.getParameter("game_id");

            // Validate if game_id is not null or empty
            if (gameIdStr != null && !gameIdStr.isEmpty()) {
                int game_id = Integer.parseInt(gameIdStr); // Parse game_id
                
                // Retrieve other form data
                String title = request.getParameter("title");
                String genre = request.getParameter("genre");
                String description = request.getParameter("description");
                String release_date = request.getParameter("release_date");
                String developer = request.getParameter("developer");
                String trailer_url = request.getParameter("trailer_url");
                String cover_image_path = request.getParameter("cover_image_path");

                // Update the game in the database
                boolean isUpdated = GameDAO.updateGame(game_id, title, genre, description, release_date, developer, trailer_url, cover_image_path);

                // Redirect based on update result
                if (isUpdated) {
                    response.sendRedirect("GameLibraryServlet");
                } else {
                    response.sendRedirect("error.jsp");
                }
            } else {
                // If game_id is invalid, redirect to error page
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle invalid number format for game_id
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
