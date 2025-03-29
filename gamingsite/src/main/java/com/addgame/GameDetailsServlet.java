package com.addgame;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reviews.Review;
import com.reviews.ReviewDAO;

import java.io.IOException;
import java.util.List;

@WebServlet("/GameDetailsServlet")

public class GameDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int gameId = Integer.parseInt(request.getParameter("game_id"));

            // Fetch game details
            Game game = GameDAO.getGameById(gameId);
            request.setAttribute("game", game);

            // Fetch reviews for the game
            ReviewDAO reviewDAO = new ReviewDAO();
            List<Review> reviews = reviewDAO.getReviewsByGameId(gameId);
            request.setAttribute("reviews", reviews);

            // Fetch median rating
            double medianRating = 0;
			try {
				medianRating = GameDAO.getMedianRatingByGameId(gameId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            request.setAttribute("medianRating", medianRating);

            // Forward to the JSP page
            request.getRequestDispatcher("gameDetails.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }}
