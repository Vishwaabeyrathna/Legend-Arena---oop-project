package com.favourites;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RemoveFromFavorites")
public class RemoveFromFavoritesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");
        int gameId = Integer.parseInt(request.getParameter("game_id"));

        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if the user is not authenticated
            return;
        }

        FavoriteDAO favoriteDAO = new FavoriteDAO();
        try {
            favoriteDAO.removeFavorite(userId, gameId);  // Add method to remove favorite in FavoriteDAO
            response.sendRedirect("favourite.jsp"); // Redirect back to the favorites page
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while removing the game from favorites.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
