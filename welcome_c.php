<?php
// session_start();

// Check if the user is logged in, otherwise redirect to login page
// if (!isset($_SESSION['username'])) {
//     header('Location: login.php');
//     exit;
// }

// Username to display
// $username = htmlspecialchars($_SESSION['username']);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="stylesheet" href="static/css/style.css"> <!-- Make sure the CSS path is correct -->
</head>
<body>
    <h1>Welcome, user!</h1>
    <button onclick="location.href='logout.php';">Logout</button>
    <p>Select an option below:</p>
    <div>
        <button onclick="location.href='crime_c.php';">Crime Records</button>
        <button onclick="location.href='criminal_c.php';">Criminal Records</button>
        <button onclick="location.href='policeofficer_c.php';">Police Officer Records</button>

    </div>
</body>
</html>