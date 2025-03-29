<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Reviews</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .delete-btn {
            background-color: red;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        .delete-btn:hover {
            background-color: darkred;
        }
        .message {
            color: green;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>

<h1>Admin Review Management</h1>

<!-- Display success or error messages -->
<c:if test="${not empty message}">
    <p class="message">${message}</p>
</c:if>
<c:if test="${not empty error}">
    <p class="error">${error}</p>
</c:if>

<!-- Reviews Table -->
<table>
    <thead>
        <tr>
            <th>Review ID</th>
            <th>User ID</th>
            <th>User Name</th>
            <th>Rating</th>
            <th>Comment</th>
            <th>Created At</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="review" items="${adminreviews}">
            <tr>
                <td>${review.reviewId}</td>
                <td>${review.userId}</td>
                <td>${review.userName}</td>
                <td>${review.rating}</td>
                <td>${review.comment}</td>
                <td>${review.createdAt}</td>
                <td>
                    <form action="AdminReviewDeleteServlet" method="get" style="display:inline;">
                        <input type="hidden" name="deleteId" value="${review.reviewId}">
                        <button type="submit"onclick="return confirm('Are you sure you want to delete this review?')" class="delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
