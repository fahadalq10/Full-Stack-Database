<?php
session_start();

// Check if the user is logged in, otherwise redirect to login page
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit;
}

include 'database.php'; 

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $crime_class = $_POST['crime_class'];
    $date_ch = $_POST['date_ch'];
    $appeal_start = $_POST['appeal_start'];
    $hearing_date = $_POST['hearing_date'];
    $appeal_cutoff = $_POST['appeal_cutoff'];
    $arresting_officer = $_POST['arresting_officer'];
    $crime_code = $_POST['crime_code'];
    $fine = $_POST['fine'];
    $court_fee = $_POST['court_fee'];
    $paid = $_POST['paid'];
    $payment_due = $_POST['payment_due'];
    $charge_status = $_POST['charge_status'];

    // Insert new crime record into the database
    $stmt = $pdo->prepare("INSERT INTO Crime (crime_class, date_ch, appeal_start, hearing_date, appeal_cutoff, arresting_officer, crime_code, fine, court_fee, paid, payment_due, charge_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$crime_class, $date_ch, $appeal_start, $hearing_date, $appeal_cutoff, $arresting_officer, $crime_code, $fine, $court_fee, $paid, $payment_due, $charge_status]);

    // Redirect to crime.php after insertion
    header("Location: crime.php");
    exit;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Crime Record</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <h1>Create New Crime Record</h1>
    <form action="create_crime.php" method="post">
        <input type="text" name="crime_class" placeholder="Crime Class" required><br>
        <p>Date Charged </p>
        <input type="date" name="date_ch" placeholder="Date Charged" required><br>
        <p> Appeal Start </p>
        <input type="date" name="appeal_start" placeholder="Appeal Start" required><br>
        <p> Hearing Date </p>
        <input type="date" name="hearing_date" placeholder="Hearing Date" required><br>
        <p> Appeal Cutoff </p>
        <input type="date" name="appeal_cutoff" placeholder="Appeal Cutoff" required><br>
        <input type="text" name="arresting_officer" placeholder="Arresting Officer" required><br>
        <input type="text" name="crime_code" placeholder="Crime Code" required><br>
        <input type="number" name="fine" placeholder="Fine" step="0.01" required><br>
        <input type="number" name="court_fee" placeholder="Court Fee" step="0.01" required><br>
        <input type="number" name="paid" placeholder="Paid" step="0.01" required><br>
        <p> Payment Due Date </p>
        <input type="date" name="payment_due" placeholder="Payment Due" required><br>
        <input type="text" name="charge_status" placeholder="Charge Status" required><br>
        <button type="submit">Submit</button>
        <button type="button" onclick="location.href='crime.php';">Cancel</button>
    </form>
</body>
</html>