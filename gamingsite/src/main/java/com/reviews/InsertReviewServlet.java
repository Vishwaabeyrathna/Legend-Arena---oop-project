package com.reviews;

import javax.servlet.RequestDispatcher; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/InsertReviewServlet")
public class InsertReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve user ID from session
            HttpSession session = request.getSession();
            Object userIdObj = session.getAttribute("user_id");

            if (userIdObj == null) {
                throw new IllegalArgumentException("User is not logged in.");
            }

            int userId = (int) userIdObj; // User ID from session

            // Retrieve game ID from request parameters
            String gameIdStr = request.getParameter("game_id");
            if (gameIdStr == null) {
                throw new IllegalArgumentException("Game ID is missing.");
            }

            int gameId = Integer.parseInt(gameIdStr);
            double rating = Double.parseDouble(request.getParameter("rating"));
            String comment = request.getParameter("comment");

            // Create and populate the Review object
            Review review = new Review();
            review.setUserId(userId);
            review.setGameId(gameId);
            review.setRating(rating);
            review.setComment(comment);

            // Insert the review into the database
            ReviewDAO reviewDAO = new ReviewDAO();
            if (reviewDAO.insertReview(review)) {
                // Redirect to game details page after successful review submission
            	RequestDispatcher dis =request.getRequestDispatcher("gameDetails" );
            	dis.forward(request, response);
            } else {
                response.getWriter().write("Failed to add review.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?message=" + java.net.URLEncoder.encode(e.getMessage(), "UTF-8"));
        }
    }
}
