<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #333;
        }

        button {
            background-color: #4CAF50;
            color: #fff;
        }

        button:hover {
            background-color: #45a049;
        }

        .error-message {
            color: #dc3545;
            font-size: 14px;
            display: none;
        }
    </style>
    <link href="./legendarena.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Legend Arena</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Games</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Reviews</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="form-container">
        <h1>User Registration</h1>
        
        <!-- Check for error message -->
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
            <div class="alert alert-danger">
                <%= errorMessage %>
            </div>
        <% } %>

        <form id="registrationForm" action="register" method="post" novalidate>
            <!-- Name Field -->
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" required placeholder="Enter your full name">
                <div class="invalid-feedback">Please enter your name.</div>
            </div>

            <!-- Username Field -->
            <div class="mb-3">
                <label for="username" class="form-label">Username:</label>
                <input type="text" id="username" name="username" class="form-control" required placeholder="Choose a username">
                <div class="invalid-feedback">Please enter a username.</div>
            </div>

            <!-- Email Field -->
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required placeholder="Enter your email address">
                <div class="invalid-feedback">Please enter a valid email address.</div>
            </div>

            <!-- Password Field -->
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required placeholder="Choose a secure password">
                <div class="invalid-feedback">Please enter a password.</div>
            </div>

            <!-- Confirm Password Field -->
            <div class="mb-3">
                <label for="confirm_password" class="form-label">Confirm Password:</label>
                <input type="password" id="confirm_password" name="confirm_password" class="form-control" required placeholder="Confirm your password">
                <div class="invalid-feedback">Passwords must match.</div>
            </div>

            <!-- Role Selection -->
            <div class="mb-3">
                <label for="user_role" class="form-label">Role:</label>
                <select id="user_role" name="user_role" class="form-select" required>
                    <option value="" disabled selected>Select role</option>
                    <option value="user">User</option>
                    <option value="admin">Admin</option>
                </select>
                <div class="invalid-feedback">Please select a role.</div>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-success w-100">Register</button>
        </form>
       
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // JavaScript for form validation
    document.getElementById('registrationForm').addEventListener('submit', function (event) {
        const form = this;
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirm_password').value;

        // Reset validation
        form.classList.remove('was-validated');

        // Check if passwords match
        if (password !== confirmPassword) {
            event.preventDefault();
            event.stopPropagation();
            document.getElementById('confirm_password').classList.add('is-invalid');
        } else {
            document.getElementById('confirm_password').classList.remove('is-invalid');
        }

        // Bootstrap validation
        if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        }

        form.classList.add('was-validated');
    });
</script>
<footer>
    <div class="footer">
        <p>&copy; 2024 Legend Arena. All rights reserved.</p>
    </div>
</footer>

</body>
</html>
