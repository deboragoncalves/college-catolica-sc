<?php
    session_start();

    // Verificando se o usuário está logado
    if (!isset($_SESSION['loginSuccess']) || $_SESSION['loginSuccess'] !== true) {
        header("Location: index.php");
        exit();
    }

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
        $id = $_GET['id'] ?? "";
        if(isset($id)) { 
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

            $sql = "UPDATE usuario SET nome = '$nome', email = '$email', nascimento = '$nascimento', estado = '$estado', endereco = '$endereco', sexo = '$sexo', login = '$login', senha = '$senha', foto = '$foto' WHERE id = $id";
            $resultado = mysqli_query($connection, $sql);

            if ($resultado) {
                header("Location: home.php");
                exit();
            } else {
                echo "<p>Erro ao atualizar os dados.</p>";
            }
        }
    }

    // Fechar a conexão quando terminar
    $connection->close();

?>