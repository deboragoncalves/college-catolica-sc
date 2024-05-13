<?php
    // Configurações do banco de dados
    $host = "localhost"; 
    $user = "root"; 
    $password = ""; 
    $database = "dbusuario"; 

    // Conexão com o banco de dados
    $connection = new mysqli($host, $user, $password, $database);

    // Verifica a conexão
    if ($connection->connect_error) {
        die("Falha na conexão: " . $connection->connect_error);
    }

    if(isset($_GET['id'])) {
        $id = $_GET['id'];
                
        // Construir a URL da próxima página com os parâmetros
        $url = "formularioCadastro.php?id=" . urlencode($id);

        // Redirecionar para a próxima página
        header("Location: $url");
        exit;
    } else {
        echo "ID do usuário não especificado.";
    }
?>
