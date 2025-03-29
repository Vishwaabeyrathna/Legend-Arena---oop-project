<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Legend Arena</title>
         <link rel="stylesheet" href="CSS/header.css">
         <link rel="stylesheet" href="CSS/footer.css">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>


.carousel {
    position: relative;
    z-index: 1; /* Ensure the carousel stays behind the profile dropdown */
}
        
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark header-navbar">
        <div class="container">
            <a class="navbar-brand" href="#">Legend Arena</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="games">Show Games</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Reviews</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="favourite.jsp">Favourites</a></li>
                    <li class="nav-item">
                        <div class="logout-icon" onclick="toggleProfile()">
                            <i class="fas fa-user-circle"></i>
                        </div>
                        <div class="header-profile-dropdown">
                        
                            <a href="profile" class="nav-link">Profile</a>
                            <a href="login.jsp" class="nav-link">Log In</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://wallpapercg.com/download/black-myth-wukong-3840x2160-25790.jpeg" class="d-block w-100" alt="Game 1">
            <div class="carousel-caption">
                <h5>Explore the latest RPGs</h5>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://cdn2.unrealengine.com/uk-acv-meteor-complete-epic-store-landscape-2560x1440-2560x1440-a12cb2c4e4e0.png" class="d-block w-100" alt="Game 2">
            <div class="carousel-caption">
                <h5>Top-rated games of the year</h5>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://cdn2.unrealengine.com/tetra-preorder-standard-edition-epic-store-landscape-2560x1440-2560x1440-430970417.jpg" class="d-block w-100" alt="Game 3">
            <div class="carousel-caption">
                <h5>New indie game releases</h5>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>



<footer>
    <div class="footer-container">
    <div class="container text-center">
        <!-- Social Media Icons -->
        <div class="footer-icons mb-3">
            <a href="#" class="footer-icon"><i class="fab fa-facebook fa-2x"></i></a>
            <a href="#" class="footer-icon"><i class="fab fa-twitter fa-2x"></i></a>
            <a href="#" class="footer-icon"><i class="fab fa-instagram fa-2x"></i></a>
            <a href="#" class="footer-icon"><i class="fab fa-youtube fa-2x"></i></a>
        </div>

        <!-- Copyright Text -->
        <p class="footer-text">&copy; 2024 Legend Arena. All rights reserved.</p>
    </div>
</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
        function toggleProfile() {
            const profileDropdown = document.querySelector('.header-profile-dropdown');
            profileDropdown.style.display = profileDropdown.style.display === 'block' ? 'none' : 'block';
        }
    </script>
</body>
</html>
