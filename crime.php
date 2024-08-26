<?php
session_start();

// Check if the user is logged in, otherwise redirect to login page
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit;
}

include 'database.php'; 

// Fetching data from the database
$sql = "SELECT * FROM Crime";
$stmt = $pdo->query($sql);
$crimes = $stmt->fetchAll();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crime Records</title>

    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <h1>Crime Records</h1>
    <button onclick="location.href='logout.php';">Logout</button>
    <button onclick="location.href='welcome.php';">Back</button>
    <table>
        <tr>
            <th>Crime ID</th>
            <th>Crime Class</th>
            <th>Date Charged</th>
            <th>Appeal Start</th>
            <th>Hearing Date</th>
            <th>Appeal Cutoff</th>
            <th>Arresting Officer</th>
            <th>Crime Code</th>
            <th>Fine</th>
            <th>Court Fee</th>
            <th>Paid</th>
            <th>Payment Due</th>
            <th>Charge Status</th>
            <th>Actions</th>
        </tr>
        <?php foreach ($crimes as $crime): ?>
        <tr>
            <td><?= htmlspecialchars($crime['crime_id']) ?></td>
            <td><?= htmlspecialchars($crime['crime_class']) ?></td>
            <td><?= htmlspecialchars($crime['date_ch']) ?></td>
            <td><?= htmlspecialchars($crime['appeal_start']) ?></td>
            <td><?= htmlspecialchars($crime['hearing_date']) ?></td>
            <td><?= htmlspecialchars($crime['appeal_cutoff']) ?></td>
            <td><?= htmlspecialchars($crime['arresting_officer']) ?></td>
            <td><?= htmlspecialchars($crime['crime_code']) ?></td>
            <td><?= htmlspecialchars($crime['fine']) ?></td>
            <td><?= htmlspecialchars($crime['court_fee']) ?></td>
            <td><?= htmlspecialchars($crime['paid']) ?></td>
            <td><?= htmlspecialchars($crime['payment_due']) ?></td>
            <td><?= htmlspecialchars($crime['charge_status']) ?></td>
            <td>
                <a href="update_crime.php?crime_id=<?= $crime['crime_id'] ?>">Update</a>
                <a href="delete_crime.php?crime_id=<?= $crime['crime_id'] ?>" onclick="return confirm('Are you sure?');">Delete</a>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>
    <button onclick="location.href='create_crime.php';">Create New Crime</button>
</body>
</html>