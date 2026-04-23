<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit;
}

require_once 'db.php';

$input = file_get_contents("php://input");
$data = json_decode($input, true);

if (empty($data)) {
    echo json_encode(["success" => false, "error" => "Nincs adat."]);
    exit;
}

try {
    $quiz_id = (int)$data['quiz_id'];
    $quiz_title = $conn->real_escape_string($data['quiz_title'] ?? 'Az Én Kvízem');
    $q = $data['question'];

    // 1. Kvíz címének frissítése
    $conn->query("UPDATE quizzes SET title = '$quiz_title' WHERE id = $quiz_id");

    // 2. Kérdés és kategória tisztítása
    $text = $conn->real_escape_string($q['text']);
    $category = $conn->real_escape_string($q['category'] ?? 'altalanos');
    $correct_answer = $conn->real_escape_string($q['options'][0]);

    // 3. SZIGORÚ KATEGÓRIA-ALAPÚ SORSOLÁS
    // Itt kényszerítjük a PHP-t, hogy csak az adott kategóriából válogasson rossz válaszokat
    $pool_sql = "SELECT answer_text FROM answer_pool 
                 WHERE category = '$category' 
                 AND answer_text != '$correct_answer' 
                 ORDER BY RAND() LIMIT 3";
    
    $pool_result = $conn->query($pool_sql);
    $wrong_answers = [];

    if ($pool_result && $pool_result->num_rows > 0) {
        while ($p_row = $pool_result->fetch_assoc()) {
            $wrong_answers[] = $conn->real_escape_string($p_row['answer_text']);
        }
    }

    // Biztonsági háló: ha a kategóriában nincs elég válasz, feltöltjük általánosokkal
    if (count($wrong_answers) < 3) {
        $needed = 3 - count($wrong_answers);
        $backup_sql = "SELECT answer_text FROM answer_pool 
                       WHERE category = 'altalanos' 
                       AND answer_text != '$correct_answer' 
                       ORDER BY RAND() LIMIT $needed";
        $backup_res = $conn->query($backup_sql);
        if ($backup_res) {
            while ($b_row = $backup_res->fetch_assoc()) {
                $wrong_answers[] = $conn->real_escape_string($b_row['answer_text']);
            }
        }
    }

    // Válaszok szétosztása változókba
    $w1 = isset($wrong_answers[0]) ? $wrong_answers[0] : '---';
    $w2 = isset($wrong_answers[1]) ? $wrong_answers[1] : '---';
    $w3 = isset($wrong_answers[2]) ? $wrong_answers[2] : '---';

    // 4. MENTÉS: Most már a garantáltan kategóriába illő válaszokat írjuk be
    $sql = "INSERT INTO questions (quiz_id, question_text, category, option_a, option_b, option_c, option_d, correct_index) 
            VALUES ($quiz_id, '$text', '$category', '$correct_answer', '$w1', '$w2', '$w3', 0)";

    if ($conn->query($sql)) {
        echo json_encode([
            "success" => true, 
            "message" => "Kérdés elmentve a kategóriának megfelelő válaszokkal!",
            "debug_category" => $category
        ]);
    } else {
        echo json_encode(["success" => false, "error" => $conn->error]);
    }

} catch (Exception $e) {
    echo json_encode(["success" => false, "error" => $e->getMessage()]);
}

$conn->close();
?>