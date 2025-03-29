package com.favourites;


import com.addgame.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RemoveFromFavoritesServlet")
public class AddToFavoritesServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id"); // User must be logged in
        int gameId = Integer.parseInt(request.getParameter("game_id"));

        if (userId == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if not authenticated
            return;
        }

        FavoriteDAO favoriteDAO = new FavoriteDAO();
        try {
            Favorite favorite = new Favorite(userId, gameId);
            favoriteDAO.addFavorite(favorite);
            response.sendRedirect("favourite.jsp"); // Redirect to favorites page
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while adding the game to favorites.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
