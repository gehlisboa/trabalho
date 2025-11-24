<?php
    include '../cors.php';
    include '../conexao.php';

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Obtém o corpo da solicitação POST
        $data = file_get_contents("php://input");

        // Decodifica o JSON para um objeto PHP
        $requestData = json_decode($data);
        
        // Agora você pode acessar os dados usando $requestData
        $codigo = $requestData->CodPostagem;

        // Consulta agora será para a tabela de Postagens
        $sql = "SELECT * FROM Postagens WHERE CodPostagem = '$codigo'";

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
