<?php
include 'cors.php';
include 'conexao.php';

header("Content-Type: application/json; charset=utf-8");

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $json = file_get_contents("php://input");
    $data = json_decode($json);

    $usuario = $data->usuario ?? null;
    $senha   = $data->senha ?? null;

    if (!$usuario || !$senha) {
        echo json_encode(["erro" => "Informe usuário e senha."]);
        exit;
    }

    $sql = "SELECT * FROM login WHERE usuario='$usuario' LIMIT 1";
    $result = $connection->query($sql);

    if ($result->num_rows == 0) {
        echo json_encode(["erro" => "Usuário não encontrado."]);
        exit;
    }

    $row = $result->fetch_assoc();

    if (password_verify($senha, $row["senha"])) {
        echo json_encode([
            "mensagem" => "Login realizado com sucesso!",
            "id" => $row["id"]
        ]);
    } else {
        echo json_encode(["erro" => "Senha inválida."]);
    }
}
?>
