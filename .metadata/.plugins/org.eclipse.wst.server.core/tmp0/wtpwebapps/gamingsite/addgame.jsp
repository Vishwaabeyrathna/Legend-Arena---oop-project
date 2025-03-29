<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Game</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .form-container h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #343a40;
        }
        .form-container label {
            font-weight: 500;
            color: #495057;
        }
        .form-container button {
            background-color: #ffc107;
            color: #212529;
            border: none;
        }
        .form-container button:hover {
            background-color: #e0a800;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h1>Add New Game</h1>
            <form action="addgame" method="post">
                <div class="mb-3">
                    <label for="title" class="form-label">Game Title:</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="Enter game title" required>
                </div>

                <div class="mb-3">
                    <label for="genre" class="form-label">Genre:</label>
                    <input type="text" class="form-control" id="genre" name="genre" placeholder="Enter genre" required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Description:</label>
                    <textarea class="form-control" id="description" name="description" rows="3" placeholder="Write a short description"></textarea>
                </div>

                <div class="mb-3">
                    <label for="release_date" class="form-label">Release Date:</label>
                    <input type="date" class="form-control" id="release_date" name="release_date">
                </div>

                <div class="mb-3">
                    <label for="developer" class="form-label">Developer:</label>
                    <input type="text" class="form-control" id="developer" name="developer" placeholder="Enter developer name">
                </div>

                <div class="mb-3">
                    <label for="trailer_url" class="form-label">Trailer URL:</label>
                    <input type="url" class="form-control" id="trailer_url" name="trailer_url" placeholder="https://example.com/trailer">
                </div>

                <div class="mb-3">
                    <label for="cover_image_path" class="form-label">Cover Image Path:</label>
                    <input type="text" class="form-control" id="cover_image_path" name="cover_image_path" placeholder="/images/game-cover.jpg" required>
                </div>

                <button type="submit" class="btn btn-warning w-100">Add Game</button>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
