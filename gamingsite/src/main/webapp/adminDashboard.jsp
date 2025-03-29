<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Legend Arena</title>
     <link rel="stylesheet" href="CSS/admindash.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    
</head>
<body>
    
<jsp:include page="header.jsp" />

    <!-- Admin Dashboard -->
    <div class="dashboard-container">
        <h1 class="dashboard-title">Admin Dashboard</h1>
        <h2 class="text-center mb-4">Welcome, ${sessionScope.name}!</h2>
        <p class="text-center">Manage users, games, and reviews effectively from this centralized panel.</p>
        <div class="dashboard-buttons">
            <a href="addgame.jsp" class="dashboard-button">Add Game</a>
            <a href="editgame" class="dashboard-button">Edit Games</a>
            <a href="displayusers" class="dashboard-button">Manage Users</a>
            <a href="adminreviews" class="dashboard-button">Manage Reviews</a>
        </div>
    </div>

  <jsp:include page="footer.jsp" />
    
</body>
</html>
