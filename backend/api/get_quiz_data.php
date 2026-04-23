<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
require_once 'db.php';

$code = isset($_GET['code']) ? $conn->real_escape_string($_GET['code']) : '';

// 1. Kvíz címe
$quiz_title = "Szerelmi Kvíz";
$res_title = $conn->query("SELECT title FROM quizzes WHERE unique_code = '$code' LIMIT 1");
if ($res_title && $row_t = $res_title->fetch_assoc()) {
    $quiz_title = $row_t['title'];
}

// 2. Kérdések lekérése - most már category-val együtt!
$sql = "SELECT q.question_text, q.option_a, q.category 
        FROM questions q
        JOIN quizzes z ON q.quiz_id = z.id
        WHERE z.unique_code = '$code'";

$result = $conn->query($sql);
$questions = [];

if ($result) {
    while ($row = $result->fetch_assoc()) {
        $correct_answer = $row['option_a'];
        $category = !empty($row['category']) ? $row['category'] : 'altalanos';

        // 3. Rossz válaszokat az answer_pool-ból húzzuk a kategória alapján!
        $pool_sql = "SELECT answer_text FROM answer_pool 
                     WHERE category = '$category' 
                     AND answer_text != '" . $conn->real_escape_string($correct_answer) . "'
                     ORDER BY RAND() LIMIT 3";
        $pool_result = $conn->query($pool_sql);

        $options = [$correct_answer];
        if ($pool_result) {
            while ($p_row = $pool_result->fetch_assoc()) {
                $options[] = $p_row['answer_text'];
            }
        }

        // 4. Összekeverjük
        shuffle($options);
        $correct_index = array_search($correct_answer, $options);

        $questions[] = [
            "text" => $row['question_text'],
            "options" => $options,
            "correctIndex" => $correct_index
        ];
    }
}

echo json_encode([
    "title" => $quiz_title,
    "questions" => $questions
]);

$conn->close();
?>