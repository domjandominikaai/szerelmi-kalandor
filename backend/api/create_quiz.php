<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') exit;

require_once 'db.php';

// Egyedi kód generálása (pl: love-65f2a1b)
$unique_code = 'love-' . substr(md5(uniqid(mt_rand(), true)), 0, 8);

// A slug ugyanaz lesz mint az unique_code
$slug = $unique_code;

$sql = "INSERT INTO quizzes (title, unique_code, slug) 
        VALUES ('Új meglepetés kvíz', '$unique_code', '$slug')";

if ($conn->query($sql)) {
    echo json_encode([
        "success" => true,
        "quiz_id" => $conn->insert_id,
        "unique_code" => $unique_code
    ]);
} else {
    echo json_encode(["success" => false, "error" => $conn->error]);
}

$conn->close();
?>