<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dados do Usuário</title>
</head>
<style>
    p, h2 {
        font-family: Arial, sans-serif;
    }
</style>
<body>
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

        echo "Conexão bem-sucedida";

        // Fechar a conexão quando terminar
        $connection->close();

    ?>
</body>
</html>
