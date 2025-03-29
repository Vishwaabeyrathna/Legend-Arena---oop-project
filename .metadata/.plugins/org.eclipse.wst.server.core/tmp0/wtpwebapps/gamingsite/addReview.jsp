<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Check if the user is logged in
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get the game ID from the request parameters
    String gameId = request.getParameter("game_id");
%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave a Review</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="CSS/addReview.css">
</head>
<jsp:include page="header.jsp" />

<body>


    <div class="review-container">
        <h1 class="review-title">Leave a Review</h1>
        <!-- Review Form -->
        <form action="insertreview" method="GET">
            <!-- Hidden Fields for User and Game IDs -->
            <input type="hidden" name="user_id" value="<%= session.getAttribute("user_id") %>">
            <input type="hidden" name="game_id" value="<%= gameId %>">
            
            <!-- Rating Input -->
            <div class="mb-3">
                <label for="rating" class="form-label">Rating (out of 10):</label>
                <input type="number" id="rating" name="rating" class="form-control rating-input" min="1.0" max="10.0" required>
            </div>
            
            <!-- Comment Input -->
            <div class="mb-3">
                <label for="comment" class="form-label">Comment:</label>
                <textarea id="comment" name="comment" class="form-control" required></textarea>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="Review-submit-btn">Submit Review</button>
        </form>

        <!-- Link to game details page -->
        <a href="gameDetails?game_id=<%=gameId%>" class="back-link">Back to Game Details</a>
    </div>
</body>
<jsp:include page="footer.jsp" />

</html>
