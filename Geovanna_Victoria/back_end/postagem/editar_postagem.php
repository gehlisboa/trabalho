<?php
include '../cors.php';
include '../conexao.php';

if ($_SERVER["REQUEST_METHOD"] == "PUT") {

    // Recebe o corpo da requisição
    $data = file_get_contents("php://input");
    $requestData = json_decode($data);

    // Campos esperados
    $codigo = $requestData->CodPostagem ?? null;
    $titulo = $requestData->Titulo ?? null;
    $conteudo = $requestData->Conteudo ?? null;
    $autor = $requestData->Autor ?? null;
    $imagem = $requestData->Imagem ?? null;

    if (!$codigo) {
        echo json_encode([
            "erro" => "É necessário informar o CodPostagem para editar."
        ]);
        exit;
    }

    // Monta o UPDATE
    $sql = "UPDATE Postagens SET 
                Titulo='$titulo', 
                Conteudo='$conteudo', 
                Autor='$autor', 
                Imagem='$imagem'
            WHERE CodPostagem='$codigo'";

    if ($connection->query($sql) === true) {
        echo json_encode([
            "mensagem" => "Postagem atualizada com sucesso!"
        ]);
    } else {
        echo json_encode([
            "erro" => "Erro ao atualizar postagem: " . $connection->error
        ]);
    }
}
?>
