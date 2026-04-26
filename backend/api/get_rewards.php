<?php
header("Access-Control-Allow-Origin: https://szerelmi-kalandor-kviz.hu");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");

// Beemeljük a központi adatbázis kapcsolatot (ami mysqli-t használ)
require_once 'db.php'; 

// Lekérdezés véletlenszerű sorrenddel
$query = "SELECT id, name FROM rewards ORDER BY RAND()";
$result = $conn->query($query); // mysqli-nél így indítjuk a lekérdezést

if ($result) {
    $rewards = [];
    
    // mysqli-nél fetch_assoc() metódust használunk
    while ($row = $result->fetch_assoc()) {
        $rewards[] = [
            "id" => $row['id'],
            "name" => $row['name']
        ];
    }

    if (count($rewards) > 0) {
        echo json_encode([
            "success" => true,
            "rewards" => $rewards
        ]);
    } else {
        echo json_encode([
            "success" => false,
            "message" => "Nincsenek jutalmak az adatbázisban.",
            "rewards" => []
        ]);
    }
} else {
    // Ha hiba van a lekérdezésben
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "message" => "Adatbázis hiba: " . $conn->error
    ]);
}

$conn->close(); // A kapcsolat lezárása
?>