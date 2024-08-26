<?php
include 'database.php';  
$crime_id = $_GET['crime_id'] ?? null;

if (!$crime_id) {
    die('Crime ID is required');
}

// Fetch the current details of the crime for the form
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $stmt = $pdo->prepare("SELECT * FROM Crime WHERE crime_id = ?");
    $stmt->execute([$crime_id]);
    $crime = $stmt->fetch();
    if (!$crime) {
        die('Crime not found');
    }
}

// Handle the post request to update the crime
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $crime_class = $_POST['crime_class'] ?? $crime['crime_class'];
    $date_ch = $_POST['date_ch'] ?? $crime['date_ch'];
    $appeal_start = $_POST['appeal_start'] ?? $crime['appeal_start'];
    $hearing_date = $_POST['hearing_date'] ?? $crime['hearing_date'];
    $appeal_cutoff = $_POST['appeal_cutoff'] ?? $crime['appeal_cutoff'];
    $crime_code = $_POST['crime_code'] ?? $crime['crime_code'];
    $fine = $_POST['fine'] ?? $crime['fine'];
    $court_fee = $_POST['court_fee'] ?? $crime['court_fee'];
    $paid = $_POST['paid'] ?? $crime['paid'];
    $payment_due = $_POST['payment_due'] ?? $crime['payment_due'];
    $charge_status = $_POST['charge_status'] ?? $crime['charge_status'];

    $updateSql = "UPDATE Crime SET crime_class = ?, date_ch = ?, appeal_start = ?, hearing_date = ?, appeal_cutoff = ?, crime_code = ?, fine = ?, court_fee = ?, paid = ?, payment_due = ?, charge_status = ? WHERE crime_id = ?";
    $stmt = $pdo->prepare($updateSql);
    $stmt->execute([$crime_class, $date_ch, $appeal_start, $hearing_date, $appeal_cutoff, $crime_code, $fine, $court_fee, $paid, $payment_due, $charge_status, $crime_id]);
    header("Location: crime.php");
    exit;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Crime</title>
</head>
<body>
    <h1>Update Crime</h1>
    <form action="update_crime.php?crime_id=<?= htmlspecialchars($crime_id) ?>" method="post">
        <label for="crime_class">Crime Class:</label>
        <input type="text" name="crime_class" id="crime_class" value="<?= htmlspecialchars($crime['crime_class']) ?>"><br>
        <label for="date_ch">Date Charged:</label>
        <input type="date" name="date_ch" id="date_ch" value="<?= htmlspecialchars($crime['date_ch']) ?>"><br>
        <label for="appeal_start">Appeal Start Date:</label>
        <input type="date" name="appeal_start" id="appeal_start" value="<?= htmlspecialchars($crime['appeal_start']) ?>"><br>
        <label for="hearing_date">Hearing Date:</label>
        <input type="date" name="hearing_date" id="hearing_date" value="<?= htmlspecialchars($crime['hearing_date']) ?>"><br>
        <label for="appeal_cutoff">Appeal Cutoff Date:</label>
        <input type="date" name="appeal_cutoff" id="appeal_cutoff" value="<?= htmlspecialchars($crime['appeal_cutoff']) ?>"><br>
        <label for="crime_code">Crime Code:</label>
        <input type="text" name="crime_code" id="crime_code" value="<?= htmlspecialchars($crime['crime_code']) ?>"><br>
        <label for="fine">Fine ($):</label>
        <input type="number" step="0.01" name="fine" id="fine" value="<?= htmlspecialchars($crime['fine']) ?>"><br>
        <label for="court_fee">Court Fee ($):</label>
        <input type="number" step="0.01" name="court_fee" id="court_fee" value="<?= htmlspecialchars($crime['court_fee']) ?>"><br>
        <label for="paid">Paid ($):</label>
        <input type="number" step="0.01" name="paid" id="paid" value="<?= htmlspecialchars($crime['paid']) ?>"><br>
        <label for="payment_due">Payment Due:</label>
        <input type="date" name="payment_due" id="payment_due" value="<?= htmlspecialchars($crime['payment_due']) ?>"><br>
        <label for="charge_status">Charge Status:</label>
        <input type="text" name="charge_status" id="charge_status" value="<?= htmlspecialchars($crime['charge_status']) ?>"><br>
        <button type="submit">Update</button>
        <button type="button" onclick="window.location.href='crime.php'">Cancel</button>
    </form>
</body>
</html>