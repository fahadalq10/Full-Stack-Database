<?php
include 'database.php';

// Initialize an empty array to store criminals
$criminals = [];

// Check if a search term is submitted and sanitize it
$search = $_GET['search'] ?? '';
$search = trim($search);  // Remove unnecessary whitespace

if ($search) {
    // Prepare and execute the search query with wildcard matching
    $stmt = $pdo->prepare("SELECT * FROM Criminal WHERE criminal_name LIKE :search");
    $stmt->execute(['search' => "%$search%"]);
    $criminals = $stmt->fetchAll();
} else {
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criminal Records</title>
    <link rel="stylesheet" href="static/css/style.css">  
    <style> 
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px; /* Add margin bottom to separate from the buttons */
    }

    /* Add margin between buttons */
    .container button {
        margin-right: 10px;
    }
    </style>
</head>
<body>
    <h1>Criminal Records</h1>
    <div class="container">
        <form action="criminal_search.php" method="GET">
            <input type="text" name="search" placeholder="Search by name..." value="<?= htmlspecialchars($search) ?>">
            
            <button type="submit">Search</button>
               

        </form>
    </div>
    <div>
        <button onclick="location.href='index.php';">Logout</button>
        <button onclick="location.href='welcome.php';">Back</button>

    </div>
    <table>
        <thead>
            <tr>
                <th>C_id</th>
                <th>Name</th>
                <th>Street Address</th>
                <th>City Address</th>
                <th>Zipcode</th>
                <th>Violation of Status</th>
                <th>Probation Status</th>
                <th>Alias</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($criminals as $criminal): ?>
            <tr>
                <td><?= htmlspecialchars($criminal['C_id']) ?></td>
                <td><?= htmlspecialchars($criminal['criminal_name']) ?></td>
                <td><?= htmlspecialchars($criminal['street_address']) ?></td>
                <td><?= htmlspecialchars($criminal['city_address']) ?></td>
                <td><?= htmlspecialchars($criminal['zipcode']) ?></td>
                <td><?= htmlspecialchars($criminal['vio_of_status']) ?></td>
                <td><?= htmlspecialchars($criminal['probation_status']) ?></td>
                <td><?= htmlspecialchars($criminal['alias']) ?></td>
            </tr>
            <?php endforeach; ?>
            <?php if (empty($criminals) && $search): ?>
            <tr>
                <td colspan="8">No results found for "<?= htmlspecialchars($search) ?>"</td>
            </tr>
            <?php endif; ?>
        </tbody>
    </table>
</body>
</html>