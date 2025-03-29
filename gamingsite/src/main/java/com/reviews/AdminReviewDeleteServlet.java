package com.reviews;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminReviewDeleteServlet")
public class AdminReviewDeleteServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ReviewDAO reviewDAO = new ReviewDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the delete parameter is present
        String deleteId = request.getParameter("deleteId");
        if (deleteId != null) {
            try {
                int reviewId = Integer.parseInt(deleteId);
                reviewDAO.deleteReview(reviewId);
                request.setAttribute("message", "Review deleted successfully.");
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid review ID.");
            }
        }

        // Fetch all reviews
        List<Review> adminreviews = reviewDAO.getAllReviews();
        request.setAttribute("adminreviews", adminreviews);

        // Forward to the JSP page
        request.getRequestDispatcher("adminreviews.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
