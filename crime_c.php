<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crime Records</title>
    <!-- Ensure the CSS path is correct -->
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <h1>Crime Records</h1>
    <button onclick="location.href='logout.php';">Logout</button>
    <button onclick="location.href='welcome_c.php';">Back</button>
    <?php
    // Database connection variables
    $host = 'localhost'; // Host name
    $dbname = 'precinct'; // Database name
    $username = 'root'; // Database username
    $password = ''; // Database password

    // Create PDO connection
    $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";
    $options = [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ];
    
    try {
        $pdo = new PDO($dsn, $username, $password, $options);
    } catch (PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
        exit;
    }

    // SQL to fetch data from crime table
    $sql = 'SELECT * FROM crime';
    $stmt = $pdo->prepare($sql);
    $stmt->execute();

    // Fetch data and create HTML table
    $result = $stmt->fetchAll();
    if ($result) {
        echo "<table>";
        echo "<tr>";
        // Creating header row based on columns in the table
        foreach ($result[0] as $key => $value) {
            echo "<th>$key</th>";
        }
        echo "</tr>";
        // Output data of each row
        foreach ($result as $row) {
            echo "<tr>";
            foreach ($row as $cell) {
                echo "<td>$cell</td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "0 results";
    }
    ?>
</body>
</html>