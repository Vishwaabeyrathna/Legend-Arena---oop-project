<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Legend Arena - Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS for Styling -->
    <style>
        body {
            
            color: #fff; /* White text */
            font-family: 'Arial', sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }
        .login-container {
            background-color: #333; /* Slightly lighter gray for container */
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
        }
        .login-container h1 {
            color: #ffc107; /* Yellow text for emphasis */
            font-weight: bold;
            font-size: 24px;
        }
        .form-control {
            background-color: #444; /* Dark input fields */
            border: none;
            color: #fff; /* White text */
        }
        .form-control:focus {
            background-color: #555;
            box-shadow: none;
            border: 1px solid #ffc107; /* Yellow border on focus */
        }
        .btn-primary {
            background-color: #ffc107; /* Yellow button */
            border: none;
            color: #000; /* Black text on button */
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #e0a800; /* Darker yellow on hover */
        }
        a {
            color: #ffc107; /* Yellow links */
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .login-links {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <div class="login-container text-center">
        <h1>Login to Legend Arena</h1>
        <form action="login" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" name="username" id="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100 mb-3">Login</button>
            <div class="login-links">
                <a href="forgotPassword.jsp">Forgot Password?</a>
                <a href="Registration.jsp">Register</a>
            </div>
        </form>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
