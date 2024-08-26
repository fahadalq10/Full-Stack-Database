<?php
session_start();

// Check if the user is logged in, otherwise redirect to login page
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit;
}

// Username to display
$username = htmlspecialchars($_SESSION['username']);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="stylesheet" href="static/css/style.css"> 
</head>
<body>
    <h1>Welcome, <?= $username; ?>!</h1>
    <button onclick="location.href='logout.php';">Logout</button>

    <p>Select an option below:</p>
    <div>
        <button onclick="location.href='crime.php';">Crime Records</button>
        <button onclick="location.href='criminal.php';">Criminal Records</button>
        <button onclick="location.href='phoneno.php';">Phone Numbers</button>
        <button onclick="location.href='policeofficer.php';">Police Officer Records</button>
        <button onclick="location.href='sentance.php';">Sentence Records</button>
        <button onclick="location.href='appeal.php';">Appeal Records</button>
        <button onclick="location.href='cases.php';">Case Records</button>
        <button onclick="location.href='charges.php';">Charge Records</button>
    </div>
</body>
</html>