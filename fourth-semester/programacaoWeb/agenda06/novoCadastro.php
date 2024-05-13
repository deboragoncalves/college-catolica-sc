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

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Coletar dados do formulário
        $nome = $_POST['cadastro-nome'];
        $email = $_POST['cadastro-email'];
        $nascimento = $_POST['cadastro-nascimento'];
        $estado = filter_input(INPUT_POST, 'cadastro-estado');
        $endereco = $_POST['cadastro-endereco'];
        $sexo = $_POST['radioSexo'];
        $login = $_POST['cadastro-login'];
        $senha = $_POST['cadastro-senha'];
        $foto = $_POST['cadastro-foto'];

        $sql = "INSERT INTO usuario (nome, nascimento, estado, endereco, interesses, sexo, login, senha, email, foto) VALUES ('$nome', '$nascimento', '$estado', '$endereco', '', '$sexo', '$login', '$senha', '$email', '$foto')";

        if ($connection->query($sql) === TRUE) {
            header("Location: index.php");
            exit();
        } else {
            echo "<p>Erro ao inserir registro: " . $connection->error . "</p>"; 
        }
    }

    // Fechar a conexão quando terminar
    $connection->close();

?>