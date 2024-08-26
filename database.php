<?php
$host = 'localhost'; // Usually localhost
$dbname = 'precinct'; // database name
$username = 'root'; // database username
$password = ''; // database password

$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Turns on error exceptions
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Sets default fetch to associative array
    PDO::ATTR_EMULATE_PREPARES => false, // Disables emulation mode for prepared statements
];

try {
    $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";
    $pdo = new PDO($dsn, $username, $password, $options);
} catch (PDOException $e) {
    die('Connection failed: ' . $e->getMessage());
}

?>