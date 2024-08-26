<?php
include 'database.php';  // Assumes database.php connects to your database
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
    $arresting_officer = $_POST['arresting_officer'] ?? $crime['arresting_officer'];
    $crime_code = $_POST['crime_code'] ?? $crime['crime_code'];
    $fine = $_POST['fine'] ?? $crime['fine'];
    $court_fee = $_POST['court_fee'] ?? $crime['court_fee'];
    $paid = $_POST['paid'] ?? $crime['paid'];
    $payment_due = $_POST['payment_due'] ?? $crime['payment_due'];
    $charge_status = $_POST['charge_status'] ?? $crime['charge_status'];

    $updateSql = "UPDATE Crime SET crime_class = ?, date_ch = ?, appeal_start = ?, hearing_date = ?, appeal_cutoff = ?, arresting_officer = ?, crime_code = ?, fine = ?, court_fee = ?, paid = ?, payment_due = ?, charge_status = ? WHERE crime_id = ?";
    $stmt = $pdo->prepare($updateSql);
    $stmt->execute([$crime_class, $date_ch, $appeal_start, $hearing_date, $appeal_cutoff, $arresting_officer, $crime_code, $fine, $court_fee, $paid, $payment_due, $charge_status, $crime_id]);
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
        <!-- Repeat for other fields -->
        <button type="submit">Update</button>
    </form>
</body>
</html>