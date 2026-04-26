<?php
header("Access-Control-Allow-Origin: https://szerelmi-kalandor-kviz.hu");
header("Content-Type: application/json; charset=UTF-8");
require_once 'db.php';

$code = isset($_GET['code']) ? $conn->real_escape_string($_GET['code']) : '';

// 1. Kvíz cím
$quiz_title = "Szerelmi Kvíz";
$res_title = $conn->query("SELECT title FROM quizzes WHERE unique_code = '$code' LIMIT 1");
if ($res_title && $row_t = $res_title->fetch_assoc()) {
    $quiz_title = $row_t['title'];
}

// 2. Kérdések lekérése az összes opcióval
$sql = "SELECT q.question_text, q.option_a, q.option_b, q.option_c, q.option_d, q.category
        FROM questions q
        JOIN quizzes z ON q.quiz_id = z.id
        WHERE z.unique_code = '$code'
        ORDER BY q.id ASC";

$result = $conn->query($sql);
$questions = [];

if ($result) {
    while ($row = $result->fetch_assoc()) {
        $correct_answer = $row['option_a'];
        $category = !empty($row['category']) ? $row['category'] : 'altalanos';

        // Szűrjük ki a null, üres és '---' placeholder értékeket
        $wrong_stored = array_values(array_filter(
            [$row['option_b'], $row['option_c'], $row['option_d']],
            fn($v) => $v !== null && $v !== '' && $v !== '---'
        ));

        if (count($wrong_stored) >= 3) {
            // Van 3 mentett rossz válasz → ezeket használjuk
            $options = array_merge([$correct_answer], $wrong_stored);
        } else {
            // Hiányoznak a mentett rossz válaszok → az answer_pool-ból pótoljuk
            $needed = 3 - count($wrong_stored);

            // Az összes kizárandó értéket összegyűjtjük
            $exclude_values = array_merge([$correct_answer], $wrong_stored);
            $exclude_escaped = array_map(fn($v) => "'" . $conn->real_escape_string($v) . "'", $exclude_values);
            $exclude_sql = implode(',', $exclude_escaped);

            // Próbáljuk a saját kategóriából
            $pool_sql = "SELECT answer_text FROM answer_pool
                         WHERE category = '$category'
                         AND answer_text NOT IN ($exclude_sql)
                         ORDER BY RAND() LIMIT $needed";
            $pool_result = $conn->query($pool_sql);
            $from_pool = [];
            if ($pool_result) {
                while ($p = $pool_result->fetch_assoc()) {
                    $from_pool[] = $p['answer_text'];
                }
            }

            // Ha nem elég, az 'altalanos' kategóriából pótlunk
            if (count($from_pool) < $needed && $category !== 'altalanos') {
                $needed2 = $needed - count($from_pool);
                $backup_sql = "SELECT answer_text FROM answer_pool
                               WHERE category = 'altalanos'
                               AND answer_text NOT IN ($exclude_sql)
                               ORDER BY RAND() LIMIT $needed2";
                $backup_result = $conn->query($backup_sql);
                if ($backup_result) {
                    while ($b = $backup_result->fetch_assoc()) {
                        $from_pool[] = $b['answer_text'];
                    }
                }
            }

            $options = array_merge([$correct_answer], $wrong_stored, $from_pool);
        }

        // Ha valamiért mégis kevesebb mint 2 opció lenne, kihagyjuk a kérdést
        if (count($options) < 2) continue;

        // Megkeverjük és megkeressük a helyes index-et
        shuffle($options);
        $correct_index = array_search($correct_answer, $options);

        $questions[] = [
            "text"         => $row['question_text'],
            "options"      => array_values($options),
            "correctIndex" => (int)$correct_index
        ];
    }
}

echo json_encode([
    "title"     => $quiz_title,
    "questions" => $questions
]);

$conn->close();
?>
