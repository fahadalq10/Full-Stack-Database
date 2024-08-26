<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Case Records</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <h1>Case Records</h1>
    <button onclick="location.href='logout.php';">Logout</button>
    <button onclick="location.href='welcome.php';">Back</button>
    <?php
    include 'database.php';
    $sql = 'SELECT * FROM cases'; 
    $stmt = $pdo->query($sql);
    echo "<table>";
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "<tr>";
    foreach ($row as $key => $value) {
        echo "<th>$key</th>";
    }
    echo "</tr>";
    do {
        echo "<tr>";
        foreach ($row as $value) {
            echo "<td>$value</td>";
        }
        echo "</tr>";
    } while ($row = $stmt->fetch(PDO::FETCH_ASSOC));
    echo "</table>";
    ?>
</body>
</html>