<?php
include 'database.php';
$crime_id = $_GET['crime_id'] ?? null;  // Get the crime_id from the query string

if ($crime_id) {
    $sql = "DELETE FROM Crime WHERE crime_id = :crime_id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['crime_id' => $crime_id]);
}

header("Location: crime.php");  // Redirect back to the crime page
exit;
?>