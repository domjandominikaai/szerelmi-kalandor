<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
require_once 'db.php';

$type = isset($_GET['type']) ? $conn->real_escape_string($_GET['type']) : 'wrong';

$sql = "SELECT message_text FROM funny_messages WHERE type = '$type' ORDER BY RAND() LIMIT 1";
$result = $conn->query($sql);

if ($row = $result->fetch_assoc()) {
    echo json_encode(["success" => true, "message" => $row['message_text']]);
} else {
    echo json_encode(["success" => false, "error" => "Nincs üzenet."]);
}
$conn->close();
?>