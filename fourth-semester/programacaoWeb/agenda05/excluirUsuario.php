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
        $sql = "DELETE FROM usuario WHERE id = $id";
        $resultado = mysqli_query($connection, $sql);
                
        if ($resultado) {
            header("Location: index.php");
            exit();
        } else {
            echo "<p>Erro ao excluir os dados.</p>";
        }
    } else {
        echo "ID do usuário não especificado.";
    }
?>
