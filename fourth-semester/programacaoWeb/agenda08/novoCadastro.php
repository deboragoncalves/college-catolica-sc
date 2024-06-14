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

        $sql = "INSERT INTO usuario (nome, nascimento, estado, endereco, sexo, login, senha, email, foto) VALUES ('$nome', '$nascimento', '$estado', '$endereco', '$sexo', '$login', '$senha', '$email', '$foto')";
        
        $interesses = $_POST['interesses'];
        $todosInteresses = "";

        if(isset($interesses)) {
            if(!empty($interesses)){
                foreach($interesses as $interesse){
                    if(!empty($interesse)) {
                        $todosInteresses = $interesse . ", " . $todosInteresses;
                    }
                }
            }
        }

        $sqlInteresse = "INSERT INTO interesse (nome) VALUES ('$todosInteresses')";

        if ($connection->query($sql) === TRUE && $connection->query($sqlInteresse) === TRUE) {
            $selectIdUsuario = "SELECT id FROM usuario ORDER BY id DESC LIMIT 1";
            $resultUsuario = $connection->query($selectIdUsuario);
            $idUsuario = null;

            if ($resultUsuario->num_rows > 0) {
                while($row = $resultUsuario->fetch_assoc()) {
                    $idUsuario = $row["id"];
                }
            }

            $selectIdInteresse = "SELECT id FROM interesse ORDER BY id DESC LIMIT 1";
            $resultInteresse = $connection->query($selectIdInteresse);
            $idInteresse = null;

            if ($resultInteresse->num_rows > 0) {
                while($row = $resultInteresse->fetch_assoc()) {
                    $idInteresse = $row["id"];
                }
            }

            if (!is_null($idInteresse) && !is_null($idUsuario)) {
                $sqlInsert = "INSERT INTO usuario_interesse (fk_usuario_id, fk_interesse_id) VALUES ('$idUsuario', '$idInteresse')";
            
                if ($connection->query($sqlInsert) === TRUE) {
                    header("Location: home.php");
                    exit();
                } else {
                    echo "<p>Erro ao inserir registro: " . $connection->error . "</p>"; 
                }
            }
        }
    }

    // Fechar a conexão quando terminar
    $connection->close();

?>