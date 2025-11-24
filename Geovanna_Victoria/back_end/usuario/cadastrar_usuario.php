<?php
include '../cors.php';
include '../conexao.php';

header("Content-Type: application/json; charset=utf-8");

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $json = file_get_contents("php://input");
    $data = json_decode($json);

    $usuario = $data->usuario ?? null;
    $senha   = $data->senha   ?? null;

    if (!$usuario || !$senha) {
        echo json_encode(["erro" => "Informe usuário e senha."]);
        exit;
    }

    // criptografar senha
    $senhaHash = password_hash($senha, PASSWORD_DEFAULT);

    $sql = "INSERT INTO login (usuario, senha) VALUES ('$usuario', '$senhaHash')";

    if ($connection->query($sql) === true) {
        echo json_encode(["mensagem" => "Cadastro realizado com sucesso!", "id" => $connection->insert_id]);
    } else {
        echo json_encode(["erro" => "Erro ao cadastrar: " . $connection->error]);
    }
}
?>

