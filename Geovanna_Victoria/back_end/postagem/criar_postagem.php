<?php
include 'cors.php';
include 'conexao.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Recebe o corpo da requisição
    $data = file_get_contents("php://input");
    $requestData = json_decode($data);

    // Campos esperados
    $titulo = $requestData->Titulo ?? null;
    $conteudo = $requestData->Conteudo ?? null;
    $autor = $requestData->Autor ?? null;
    $imagem = $requestData->Imagem ?? null;

    if (!$titulo || !$conteudo || !$autor) {
        echo json_encode([
            "erro" => "Campos obrigatórios: Titulo, Conteudo, Autor"
        ]);
        exit;
    }

    $sql = "INSERT INTO Postagens (Titulo, Conteudo, Autor, Imagem, DataCriacao)
            VALUES ('$titulo', '$conteudo', '$autor', '$imagem', NOW())";

    if ($connection->query($sql) === true) {
        echo json_encode([
            "mensagem" => "Postagem criada com sucesso!",
            "CodPostagem" => $connection->insert_id
        ]);
    } else {
        echo json_encode([
            "erro" => "Erro ao criar postagem: " . $connection->error
        ]);
    }
}
?>
