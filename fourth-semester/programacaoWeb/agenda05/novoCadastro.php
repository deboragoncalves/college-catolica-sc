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
        $nascimentoFormat = date("d/m/Y", strtotime($nascimento));
        $estado = filter_input(INPUT_POST, 'cadastro-estado');
        $endereco = $_POST['cadastro-endereco'];
        $sexo = $_POST['radioSexo'];
        $login = $_POST['cadastro-login'];
        $senha = $_POST['cadastro-senha'];

        $sql = "INSERT INTO usuario (nome, nascimento, estado, endereco, interesses, sexo, login, senha, email) VALUES ('$nome', '$email', '$nascimentoFormat', '$estado', '$endereco', '', '$sexo', '$login', '$senha')";

        if ($connection->query($sql) === TRUE) {
            echo "Registro inserido com sucesso!";
        } else {
            echo "Erro ao inserir registro: " . $connection->error;
        }
    }

    // Fechar a conexão quando terminar
    $connection->close();

?>