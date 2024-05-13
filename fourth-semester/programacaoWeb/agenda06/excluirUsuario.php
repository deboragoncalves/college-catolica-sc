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

        $consultaSqlFoto = "SELECT foto FROM usuario WHERE id =". $id;
        if (!$result = $connection->query($consultaSqlFoto)) {
            die("Erro ao executar consulta.");
        }
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $foto = $row["foto"];
                $caminhoFoto = "C:/xampp/htdocs/agenda06/fotos/" . $foto;

                if (file_exists($caminhoFoto)) {
                    if (unlink($caminhoFoto)) {
                        $deleteSql = "DELETE FROM usuario WHERE id = $id";
                        $resultadoUsuario = mysqli_query($connection, $deleteSql);
                                
                        if ($resultadoUsuario) {
                            header("Location: index.php");
                            exit();
                        } else {
                            echo "<p>Erro ao excluir os dados.</p>";
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
