<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
require_once 'db.php';

try {
    // Csak a 0-ás ID-jú (sablon) kérdésekből sorsolunk
   // Az új template_questions táblából húz
$sql = "SELECT id, question_text, category 
        FROM template_questions 
        ORDER BY RAND() LIMIT 1";
    $result = $conn->query($sql);

    if ($result && $row = $result->fetch_assoc()) {
        $category = $row['category'];
        
        $pool_sql = "SELECT answer_text FROM answer_pool WHERE category = '$category' ORDER BY RAND() LIMIT 3";
        $pool_result = $conn->query($pool_sql);
        
        $wrong_pool = [];
        if ($pool_result) {
            while($p_row = $pool_result->fetch_assoc()) {
                $wrong_pool[] = $p_row['answer_text'];
            }
        }

        echo json_encode([
            "text" => $row['question_text'],
            "category" => $category,
            "wrong_pool" => $wrong_pool
        ]);
    } else {
        echo json_encode(["error" => "Nincs elérhető sablon kérdés (quiz_id = 0)"]);
    }
} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
$conn->close();
?>