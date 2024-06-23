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

        if ($connection->query($sql) === TRUE) {
            $selectIdUsuario = "SELECT id FROM usuario ORDER BY id DESC LIMIT 1";
            $resultUsuario = $connection->query($selectIdUsuario);
            $idUsuario = null;

            if ($resultUsuario->num_rows > 0) {
                while($row = $resultUsuario->fetch_assoc()) {
                    $idUsuario = $row["id"];
                }
            }

            if (!is_null($idUsuario)) {
                $selectUsuarioInteresse = "SELECT fk_usuario_id FROM usuario_interesse WHERE fk_usuario_id = $idUsuario";
                if ($selectUsuarioInteresse->num_rows > 0) {
                    while($row = $selectUsuarioInteresse->fetch_assoc()) {
                        $usuarioId = $row["fk_usuario_id"];    
                        
                        $deletarInteresse = "DELETE FROM usuario_interesse WHERE fk_usuario_id = $usuarioId";
                        $resultDeleteInteresse = mysqli_query($connection, $deletarInteresse);
                        if (!$resultDeleteInteresse) {
                            echo "<p>Erro ao excluir o interesse do usuario.</p>";
                        }
                    }
                }
            }

            if (!is_null($idUsuario)) {
                $interesses = $_POST['interesses'];
                $todosInteresses = "";
        
                if(isset($interesses)) {
                    if(!empty($interesses)){
                        foreach($interesses as $interesse){
                            if(!empty($interesse)) {
                                $sqlInsert = "INSERT INTO usuario_interesse (fk_usuario_id, fk_interesse_id) VALUES ('$idUsuario', '$interesse')";

                                if ($connection->query($sqlInsert) === false) {
                                    die("Erro na inserção: " . $connection->error);
                                }
                            }
                        }
                    }
                }        
            }

            $connection->close();
            header("Location: home.php");
            exit();
        }
    }

    // Fechar a conexão quando terminar
    $connection->close();

?>