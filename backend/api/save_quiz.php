<?php
header("Access-Control-Allow-Origin: https://szerelmi-kalandor-kviz.hu");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");

require_once 'db.php'; // A már beállított jelszavas db.php

$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    die(json_encode(["error" => "Nincs adat a mentéshez!"]));
}

try {
    // 1. Kvíz mentése vagy frissítése (ID=1-es alapértelmezett kvízhez)
    $quiz_id = 1; 
    $title = $conn->real_escape_string($data['title']);
    $conn->query("UPDATE quizzes SET title = '$title' WHERE id = $quiz_id");

    // 2. Régi kérdések törlése (ha újraírjuk az egészet), vagy csak új hozzáadása
    // Most a legegyszerűbb, ha töröljük a régi kérdéseket ehhez a kvízhez és betesszük az újakat
    $conn->query("DELETE FROM questions WHERE quiz_id = $quiz_id");

    foreach ($data['questions'] as $q) {
        $text = $conn->real_escape_string($q['text']);
        $correct_answer = $conn->real_escape_string($q['options'][0]); // A vásárló által beírt válasz
        
        // A rossz válaszok elővétele a pool-ból
        $w1 = isset($q['wrong_pool'][0]) ? $conn->real_escape_string($q['wrong_pool'][0]) : '---';
        $w2 = isset($q['wrong_pool'][1]) ? $conn->real_escape_string($q['wrong_pool'][1]) : '---';
        $w3 = isset($q['wrong_pool'][2]) ? $conn->real_escape_string($q['wrong_pool'][2]) : '---';

        // Válaszok összekeverése (opcionális, vagy fixen option_a a jó)
        // Most tegyük az 'option_a'-ba a jót, a többibe a rosszat
        $sql = "INSERT INTO questions (quiz_id, question_text, option_a, option_b, option_c, option_d, correct_index) 
                VALUES ($quiz_id, '$text', '$correct_answer', '$w1', '$w2', '$w3', 0)";
        
        $conn->query($sql);
    }

    echo json_encode(["success" => true, "message" => "Kvíz elmentve!"]);

} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}

$conn->close();
?>