<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Legend Arena - Header</title>
    <!-- Link to external CSS -->
    <link rel="stylesheet" href="CSS/header.css">
    <!-- FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark header-navbar">
        <div class="container">
            <a class="navbar-brand" href="Homepage">Legend Arena</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="Homepage">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="games">Show Games</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="favourite.jsp">Favourites</a></li>
                    <li class="nav-item">
                        <div class="logout-icon" onclick="toggleProfile()">
                            <i class="fas fa-user-circle"></i>
                        </div>
                        <div class="header-profile-dropdown">
                         <p>Welcome, ${sessionScope.name}</p>
                            <a href="profile" class="nav-link">Profile</a>
                            <a href="logout.jsp" class="nav-link">Log Out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JavaScript for Profile Dropdown -->
    <script>
        function toggleProfile() {
            const profileDropdown = document.querySelector('.header-profile-dropdown');
            profileDropdown.style.display = profileDropdown.style.display === 'block' ? 'none' : 'block';
        }
    </script>
</body>
</html>
