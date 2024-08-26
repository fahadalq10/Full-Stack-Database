<?php
session_start();
include 'database.php'; // Includes your database connection

$message = ''; // To hold a message for the user

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    if (!empty($username) && !empty($password)) {
        // Prepare SQL to prevent SQL injection
        $sql = 'SELECT * FROM users WHERE username = :username';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':username' => $username]);
        $user = $stmt->fetch();

        if ($user && password_verify($password, $user['password'])) {
            // If the password is correct, set up the session
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $user['username'];
            header('Location: welcome.php'); // Redirect to a welcome or home page
            exit;
        } else {
            $message = 'Incorrect username or password.';
        }
    } else {
        $message = 'Both fields are required.';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <h1>Login</h1>
    <p><?= $message ?></p>
    <form action="login.php" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
        </div>
        <div>
            <button type="submit">Login</button>
            <button onclick="location.href='index.php';">Back</button>

        </div>
        <p>Don't have an account? <a href="register.php">Register here</a>.</p>
    </form>
</body>
</html>