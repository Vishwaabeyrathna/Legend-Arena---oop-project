<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Check if the user is logged in, redirect if not
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Review</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }

        .form-container {
            background: #1c1c1c;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        .form-container input,
        .form-container textarea {
            background-color: #333;
            color: white;
            border: 1px solid #555;
            border-radius: 5px;
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
        }

        .form-container button {
            background-color: #28a745;
            border: none;
            padding: 10px 20px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Update Your Review</h1>

        <div class="form-container">
            <form action="updatereview" method="Get">
                <input type="hidden" name="review_id" value="${param.review_id}">
                <input type="hidden" name="game_id" value="${param.game_id}">

                <div class="mb-3">
                    <label for="rating" class="form-label">Rating</label>
                    <input type="number" class="form-control" id="rating" name="rating" min="1.0" max="10.0" value="${param.rating}" required>   
                </div>

                <div class="mb-3">
                    <label for="comment" class="form-label">Comment</label>
                    <textarea class="form-control" id="comment" name="comment" rows="4" required>${param.comment}</textarea>
                </div>

                <button type="submit" class="btn btn-success">Update Review</button>
            </form>
        </div>
    </div>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
