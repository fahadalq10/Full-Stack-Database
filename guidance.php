<?php
$conn = new PDO("mysql:host=localhost;dbname=precinct", "root", "");
$sql = "SELECT * FROM appeal";
$stmt = $conn->prepare($sql);
$stmt->execute();
echo 'Criminal information: <br />';
while ($row = $stmt->fetch())
{ echo '----------------------------------------<br />';
    if (isset($row["file_hearing"])) {
        echo $row["file_hearing"] . ' ';
    } else {
        echo "First name not available";
    }
    if (isset($row["file_date"])) {
        echo $row["file_date"] . '<br />';
    } else {
        echo "Last name not available";
    };
}
?>