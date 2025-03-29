package com.reviews;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UpdateReviewServlet")
public class UpdateReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve parameters from the request
            int reviewId = Integer.parseInt(request.getParameter("review_id"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            int gameId = Integer.parseInt(request.getParameter("game_id"));

            // Create a Review object
            Review review = new Review();
            review.setReviewId(reviewId);
            review.setRating(rating);
            review.setComment(comment);

            // Update the review using ReviewDAO
            ReviewDAO reviewDAO = new ReviewDAO();
            boolean isUpdated = reviewDAO.updateReview(review);

            // Redirect to game details page with the correct game_id
            if (isUpdated) {
                response.sendRedirect("gameDetails?game_id=" + gameId);
            } else {
                response.getWriter().write("Failed to update the review.");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("Invalid input. Please check your data.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred while processing your request.");
        }
    }
}
