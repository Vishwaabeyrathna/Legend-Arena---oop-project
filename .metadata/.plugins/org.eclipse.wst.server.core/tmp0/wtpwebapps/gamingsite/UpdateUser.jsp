<%@ page import="com.registration.User" %>
<%@ page import="com.registration.UserDAO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h1>Update User Details</h1>

<%-- Get the user ID from the request parameter --%>
<c:set var="user_id" value="${param.user_id}"/>

<%-- Fetch the user details using the user_id --%>
<%
    int userId = Integer.parseInt(request.getParameter("user_id"));
    User user = UserDAO.getUserById(userId); // Ensure you have this method in UserDAO
%>

<%-- Check if the user is found and populate the form with current data --%>
<% if (user != null) { %>

<!-- Display the user details in a form -->
<form action="updateuser" method="POST">
    <input type="hidden" name="user_id" value="<%= user.getUser_id() %>">
    
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" value="<%= user.getName() %>" required><br><br>
    
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" value="<%= user.getUsername() %>" required><br><br>
    
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required><br><br>
    
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required><br><br>
    
    <label for="user_role">User Role:</label>
    <input type="text" id="user_role" name="user_role" value="<%= user.getUser_role() %>" required><br><br>
    
    <input type="submit" value="Update User">
</form>

<% } else { %>
    <p>User not found.</p>
<% } %>

<a href="DisplayUsersServlet">Back to User List</a>

</body>
</html>
