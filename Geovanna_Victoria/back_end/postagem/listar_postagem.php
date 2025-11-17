<?php
include 'cors.php';
include 'conexao.php';


if ($_SERVER["REQUEST_METHOD"] == "GET") {


$sql = "SELECT * FROM Postagens";


$result = $connection->query($sql);


if ($result->num_rows > 0) {
$postagens = [];
while ($row = $result->fetch_assoc()) {
array_push($postagens, $row);
}


$response = [
'postagens' => $postagens
];


} else {
$response = [
'postagens' => 'Nenhuma postagem encontrada!'
];
}


echo json_encode($response);
} // Fim If
?>