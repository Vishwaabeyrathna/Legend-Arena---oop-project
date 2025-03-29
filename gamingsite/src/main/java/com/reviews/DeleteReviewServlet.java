package com.reviews;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteReviewServlet")
public class DeleteReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve the review ID from the request
            String reviewIdParam = request.getParameter("reviewId");

            if (reviewIdParam == null || reviewIdParam.isEmpty()) {
                response.getWriter().write("Invalid request: Review ID is missing.");
                return;
            }

            int reviewId = Integer.parseInt(reviewIdParam);

            // Call DAO method to delete the review
            ReviewDAO reviewDAO = new ReviewDAO();
            boolean isDeleted = reviewDAO.deleteReview(reviewId);

            if (isDeleted) {
                // Redirect back to the game details page after successful deletion
                String gameId = request.getParameter("gameId"); // Optional: Pass game_id if required
                response.sendRedirect("gameDetails?game_id=" + gameId);
            } else {
                response.getWriter().write("Failed to delete the review.");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("Invalid review ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred while deleting the review.");
        }
    }
}
