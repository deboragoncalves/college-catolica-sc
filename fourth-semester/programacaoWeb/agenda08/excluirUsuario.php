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

    if(isset($_GET['id'])) {
        $id = $_GET['id'];    
        
        $consultaUsuarioInteresse = "SELECT * FROM usuario_interesse WHERE fk_usuario_id = $id LIMIT 1";
        if (!$result = $connection->query($consultaUsuarioInteresse)) {
            die("Erro ao executar consulta.");
        }
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $interesseId = $row["fk_interesse_id"];
                $usuarioId = $row["fk_usuario_id"];

                if (!is_null($interesseId) && !is_null($usuarioId) && !empty($interesseId) && !empty($usuarioId)) {
                    $deletarInteresse = "DELETE FROM interesse WHERE id = $interesseId";
                    $resultadoInteresse = mysqli_query($connection, $deletarInteresse);
                    if (!$resultadoInteresse) {
                        echo "<p>Erro ao excluir o interesse.</p>";
                    }
    
                    $deletarUsuarioInteresse = "DELETE FROM usuario_interesse WHERE fk_interesse_id = $interesseId AND fk_usuario_id = $usuarioId";
                    $resultadoUsuarioInteresse = mysqli_query($connection, $deletarUsuarioInteresse);
                    if (!$resultadoUsuarioInteresse) {
                        echo "<p>Erro ao excluir o intesse do usuario.</p>";
                    }
                }

            }
        }

        $consultaSqlFoto = "SELECT foto FROM usuario WHERE id =". $id;
        if (!$result = $connection->query($consultaSqlFoto)) {
            die("Erro ao executar consulta.");
        }
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $foto = $row["foto"];
                $caminhoFoto = "C:/xampp/htdocs/agenda08/fotos/" . $foto;

                if (file_exists($caminhoFoto)) {
                    if (unlink($caminhoFoto)) {
                        $deleteSql = "DELETE FROM usuario WHERE id = $id";
                        $resultadoUsuario = mysqli_query($connection, $deleteSql);
                                
                        if ($resultadoUsuario) {
                            header("Location: home.php");
                            exit();
                        } else {
                            echo "<p>Erro ao excluir os dados do usuário.</p>";
                        }               
                    } else {
                        echo '<p>Ocorreu um erro ao tentar remover a foto.</p>';
                    }
                } else {
                    echo '<p>A foto não foi encontrada.</p>';
                }

            }
        }

    } else {
        echo "ID do usuário não especificado.";
    }
?>
