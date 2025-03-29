
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
    }
%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${game.title} - Game Details</title>
    <link rel="stylesheet" href="CSS/gameDetails.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Overall Rating Section Styling */
.overall-rating {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 15px; /* Increased gap for spacing */
    font-size: 1.8rem; /* Slightly larger text for emphasis */
    font-weight: bold;
    color: #333;
    margin-bottom: 20px; /* Extra space below the rating section */
}

/* Stars container */
.rating-stars {
    display: flex;
    gap: 8px; /* Adjusted gap between stars */
}

/* Star styling with Metacritic-inspired color palette and shadow */
.rating-stars i {
    font-size: 2.8rem; /* Slightly larger star size */
    color: #FFD700; /* Gold color for stars */
    text-shadow: 0 4px 8px rgba(0, 0, 0, 0.2), 
                 0 1px 2px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
    animation: heartbeat 1.5s infinite ease-in-out; /* Smooth heartbeat animation */
    transition: transform 0.2s ease, color 0.3s ease; /* Smooth hover transition */
}

/* Add hover effect for stars */
.rating-stars i:hover {
    transform: scale(1.3); /* Slight scaling on hover */
    color: #FFC107; /* Brighter gold on hover */
}

/* Heartbeat animation for stars */
@keyframes heartbeat {
    0%, 100% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.25); /* Slightly larger heartbeat effect */
    }
}

/* Additional styling for the rating text */
.rating-text {
    color: #6C757D; /* Subtle grey for accompanying text */
    font-size: 1.5rem; /* Slightly larger than default */
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.15); /* Soft shadow for text */
}
        
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container mt-5">
    <h1 class="text-center">${game.title}</h1>
    <div class="row mt-4">
        <div class="col-md-4 text-center">
            <img src="${game.cover_image_path}" alt="${game.title}" class="img-fluid game-cover">
        </div>
        <div class="col-md-8">
            <div class="game-details">
                <h3>Genre: ${game.genre}</h3>
                <p>${game.description}</p>
                <p><strong>Release Date:</strong> ${game.release_date}</p>
                <p><strong>Developer:</strong> ${game.developer}</p>
                <a href="${game.trailer_url}" class="btn btn-primary" target="_blank">Watch Trailer</a>
            </div>
        </div>
    </div>

    <!-- Overall Rating Section -->
    <div class="mt-4 text-center">
        <div class="overall-rating">
            <div class="rating-stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <i class="far fa-star"></i>
            </div>
            <span class="rating-text">Overall Rating: <fmt:formatNumber value="${medianRating}" pattern="#.#" />/10</span>
            
        </div>
    </div>

    <!-- Give Review Button -->
    <div class="mt-3">
        <form action="addReview.jsp" method="post">
            <input type="hidden" name="game_id" value="${game.game_id}">
            <input type="hidden" name="user_id" value="${sessionScope.user_id}">
            <button type="submit" class="btn btn-success">Give Review</button>
        </form>
    </div>

    <!-- Reviews Section -->
   <div class="mt-5">
        <h2>Customer Reviews</h2>

        <!-- Logged-in User's Reviews -->
        <div class="your-reviews">
            <h4>Your Reviews</h4>
            <c:if test="${empty reviews}">
                <p>You haven't left a review yet. Be the first to share your thoughts!</p>
            </c:if>
            <c:forEach var="review" items="${reviews}">
                <c:if test="${review.userId == sessionScope.user_id}">
                    <div class="review-box bg-light p-3 mb-3">
                        <h5>${review.userName}</h5>
                        <p><strong>Rating:</strong> <fmt:formatNumber value="${review.rating}" pattern="#.#" />/10</p>
                        <p><strong>Comment:</strong> ${review.comment}</p>
                        <p><small><em>${review.createdAt}</em></small></p>
                      <a href="UpdateReview.jsp?review_id=${review.reviewId}&game_id=${game.game_id}&rating=<fmt:formatNumber value='${review.rating}' pattern='#' />&comment=${review.comment}" 
   onclick="return confirm('Are you sure you want to update this review?')" 
   class="btn btn-warning btn-sm">Edit</a>
                      
                       
                        <a href="deleteReview?reviewId=${review.reviewId}&gameId=${game.game_id}" 
                           onclick="return confirm('Are you sure you want to delete this review?')" 
                           class="btn btn-danger btn-sm">Delete</a>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <!-- Other Users' Reviews -->
        <div class="other-reviews mt-4">
            <h4>Other Reviews</h4>
            <c:if test="${empty reviews}">
                <p>No reviews yet. Be the first to leave a review!</p>
            </c:if>
            <c:forEach var="review" items="${reviews}">
                <c:if test="${review.userId != sessionScope.user_id}">
                    <div class="review-box border p-3 mb-3">
                        <h5>${review.userName}</h5>
                        <p><strong>Rating:</strong> <fmt:formatNumber value="${review.rating}" pattern="#.#" />/10</p>
                        <p><strong>Comment:</strong> ${review.comment}</p>
                        <p><small><em>${review.createdAt}</em></small></p>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
