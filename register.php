<?php
include 'database.php';

$message = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    if (!empty($username) && !empty($password)) {
        $sql = 'INSERT INTO users (username, password) VALUES (:username, :password)';
        $stmt = $pdo->prepare($sql);

        if ($stmt->execute([':username' => $username, ':password' => $hashed_password])) {
            $message = 'User registered successfully!';
            header('Location: login.php');
        } else {
            $message = 'Username already exists!';
        }
    } else {
        $message = 'Username and password are required!';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="static/css/style.css"> 
    <title>Register</title>
</head>
<body>
    <h1>Register</h1>
    <p><?= $message ?></p>
    <form action="register.php" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" name="username" id="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>
        </div>
        <div>
            <button type="submit">Register</button>
            <button onclick="location.href='login.php';">Back</button>

        </div>
    </form>
</body>
</html>