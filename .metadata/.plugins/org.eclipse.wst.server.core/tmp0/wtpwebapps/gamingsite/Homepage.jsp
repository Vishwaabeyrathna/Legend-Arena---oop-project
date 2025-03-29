<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.addgame.Game" %>

<%
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("dashboard.jsp");
    }

    // Retrieve top-rated games from the request attribute
    List<Game> topGames = (List<Game>) request.getAttribute("topGames");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Legend Arena</title>
    <link rel="stylesheet" href="CSS/homepage.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Swiper CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* Swiper container styling */
        .swiper-container {
            width: 100%;
            padding: 20px 0;
        }

        .swiper-slide {
            display: flex;
            justify-content: center;
        }

        .review-card {
            width: 90%;
            max-width: 300px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .review-image {
            height: 200px;
            object-fit: cover;
        }

        .rating {
            margin: 10px 0;
            font-size: 1.2em;
            color: #ffcc00;
        }

        .game-buttons .btn {
            margin: 5px 0;
            width: 100%;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<h1 class="text-center my-4">Welcome, ${sessionScope.name}!</h1>

<!-- Carousel Section -->
<div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://4kwallpapers.com/images/wallpapers/call-of-duty-modern-3840x2160-12618.jpg" class="d-block w-100" alt="Game 1">
            <div class="carousel-caption">
                <h5>Explore the latest RPGs</h5>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://i.ytimg.com/vi/eppILLnKK3M/maxresdefault.jpg" class="d-block w-100" alt="Game 2">
            <div class="carousel-caption">
                <h5>Top-rated games of the year</h5>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://www.psu.com/wp/wp-content/uploads/2020/09/Red-Dead-Redemption-2-PS4-Wallpaper-50.jpg" class="d-block w-100" alt="Game 3">
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

<!-- Top-Rated Games Section -->
<section class="reviews py-5">
    <div class="container">
        <h2 class="text-center">Top Ratings</h2>
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <%
                    if (topGames != null && !topGames.isEmpty()) {
                        for (Game game : topGames) {
                %>
                <div class="swiper-slide">
                    <div class="card review-card">
                        <img src="<%= game.getCover_image_path() %>" class="card-img-top review-image" alt="<%= game.getTitle() %>">
                        <div class="card-body text-center">
                            <h3 class="card-title"><%= game.getTitle() %></h3>
                            <div class="rating">
                                <i class="fas fa-star"></i> <%= game.getMedianRating() %>/10
                            </div>
                            <div class="game-buttons">
                                <a href="gameDetails?game_id=<%= game.getGame_id() %>" class="btn btn-primary">View Details</a>
                                <form action="addtocart" method="POST" class="mt-2">
                                    <input type="hidden" name="game_id" value="<%= game.getGame_id() %>">
                                    <button type="submit" class="btn btn-success">Add to Favorites</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <p class="text-center">No top-rated games available.</p>
                <%
                    }
                %>
            </div>
            <!-- Swiper navigation buttons -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
        <div class="text-center mt-4">
            <a href="games" class="btn btn-secondary">Show More Games</a>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />

<!-- Bootstrap and Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
    const swiper = new Swiper('.swiper-container', {
        slidesPerView: 1,
        spaceBetween: 20,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        breakpoints: {
            640: {
                slidesPerView: 2,
                spaceBetween: 20,
            },
            768: {
                slidesPerView: 3,
                spaceBetween: 30,
            },
            1024: {
                slidesPerView: 4,
                spaceBetween: 40,
            }
        },
    });
</script>
</body>
</html>
