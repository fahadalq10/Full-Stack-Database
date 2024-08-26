<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choose Role</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .button-container {
        display: flex;
        }
        .button {
            padding: 10px 20px;
            font-size: 16px;
            margin: 10px;
            cursor: pointer;
        }
        .rounded-image {
        border-radius: 30%;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="image.png" class = "rounded-image" width = "350px" height = "350px">
        <!-- <p></p> -->
        <div>
        <button class="button" onclick="location.href='login.php'">Police</button>
        <button class="button" onclick="location.href='welcome_c.php'">Civilian</button>
        </div>
    </div>
</body>
</html>
