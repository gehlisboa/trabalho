<?php
include '../cors.php';
include '../conexao.php';

header("Content-Type: application/json; charset=UTF-8");

// Aceita DELETE ou POST (servidores locais às vezes não enviam DELETE corretamente)
if ($_SERVER["REQUEST_METHOD"] === "DELETE" || $_SERVER["REQUEST_METHOD"] === "POST") {

    // Lê JSON vindo da requisição
    $data = file_get_contents("php://input");
    $requestData = json_decode($data);

    if (!isset($requestData->CodPostagem)) {
        echo json_encode(["mensagem" => "ID não recebido."]);
        exit;
    }

    $codigo = $requestData->CodPostagem;

    // Query delete
    $sql = "DELETE FROM Postagens WHERE CodPostagem='$codigo'";

    if ($connection->query($sql) === TRUE) {
        echo json_encode(["mensagem" => "Postagem apagada com sucesso!"]);
    } else {
        echo json_encode(["mensagem" => "Erro: " . $connection->error]);
    }
}
?>



