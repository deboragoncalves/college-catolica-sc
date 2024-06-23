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
        $id = $_GET['id'];
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
            if (!$resultado) {
                die("Erro ao atualizar o usuario.");
            }

            $selectUsuarioInteresse = "SELECT fk_usuario_id FROM usuario_interesse WHERE fk_usuario_id = $id";
            $resultUsuarioInteresse = $connection->query($selectUsuarioInteresse);
              
            if ($resultUsuarioInteresse->num_rows > 0) {
              while($row = $resultUsuarioInteresse->fetch_assoc()) {
                $deletarInteresse = "DELETE FROM usuario_interesse WHERE fk_usuario_id = $id";
                $resultDeleteInteresse = mysqli_query($connection, $deletarInteresse);
                if (!$resultDeleteInteresse) {
                    die("Erro ao excluir o interesse do usuario.");
                }
              }
            }

            $interesses = $_POST['interesses'];
            $todosInteresses = "";
        
            if(isset($interesses)) {
                if(!empty($interesses)){
                    foreach($interesses as $interesse){
                        if(!empty($interesse)) {
                            $sqlInsert = "INSERT INTO usuario_interesse (fk_usuario_id, fk_interesse_id) VALUES ('$id', '$interesse')";

                            if ($connection->query($sqlInsert) === false) {
                                die("Erro na inserção: " . $connection->error);
                            }
                        }
                    }
                }
            }
        }
    }

    $connection->close();

    header("Location: home.php");
    exit();

?>