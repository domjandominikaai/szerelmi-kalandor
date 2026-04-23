<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Behúzzuk a központi adatbázis kapcsolatot
include_once 'db.php'; 

// Feltételezzük, hogy a db.php-ban a kapcsolat változója: $conn
if (!$conn) {
    die(json_encode(["error" => "Adatbázis kapcsolat nem található"]));
}

$conn->set_charset("utf8");

// 1. Lekérjük a kérdéseket véletlenszerű sorrendben
$sql = "SELECT id, question_text  AS text, category FROM questions ORDER BY RAND() LIMIT 10";
$result = $conn->query($sql);

$questions = [];

if ($result && $result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $category = $row['category'];
        
        // 2. Minden kérdés kategóriájához lekérünk egy halom lehetséges válasz-opciót
        // Ebből fogunk a frontend-en +3-at választani
        $pool_sql = "SELECT answer_text FROM answer_pool WHERE category = '$category' ORDER BY RAND() LIMIT 15";
        $pool_result = $conn->query($pool_sql);
        
        $wrong_pool = [];
        if ($pool_result) {
            while($p_row = $pool_result->fetch_assoc()) {
                $wrong_pool[] = $p_row['answer_text'];
            }
        }

        $questions[] = [
            "id" => $row['id'],
            "text" => $row['text'],
            "category" => $category,
            "wrong_pool" => $wrong_pool // Ez az Angularnak a "tartalék" válaszlista
        ];
    }
}

echo json_encode(["questions" => $questions]);
$conn->close();
?>