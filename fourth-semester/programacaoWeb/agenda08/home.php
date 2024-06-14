<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar Usuário</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
</head>
<style>
    a {
        color: black;
    }

    .bi-pencil-fill, .bi-trash-fill {
        margin: 0 10px;
        cursor: pointer;
    }

    p {
        margin: 0 10px;
    }

    p, h2 {
        font-family: Arial, sans-serif;
    }

    .botao-cadastro {
        cursor: pointer;
        background-color: brown;
        color: white;
        border: none;
        border-radius: 5%;
        padding: 10px;
        margin-top: 20px;
        margin-bottom: 20px;
        margin-left: 10px;
    }

    .botao-cadastro:hover {
        color: white;
        font-weight: bold;
    }
</style>
<body> 
    <a href="formularioCadastro.php" class="btn botao-cadastro">Cadastrar novo registro</a>
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

        $sql = "SELECT * FROM usuario";
        $result = $connection->query($sql);
        
        if ($result->num_rows > 0) {
            // Loop através dos resultados e exibir os dados
            while($row = $result->fetch_assoc()) {
                $id = $row["id"];
                $nome = $row["nome"];
                $email = $row["email"];
                $nascimento = $row["nascimento"];
                $dataNascimentoFormat = date("d/m/Y", strtotime($nascimento));
                $estado = $row["estado"];
                $endereco = $row["endereco"];
                $sexo = $row["sexo"];
                $foto = $row["foto"];
                $listaInteresses = "";

                $idUsuarioInteresse = "SELECT fk_interesse_id FROM usuario_interesse WHERE fk_usuario_id = $id LIMIT 1";
                $resultUsuarioInteresse = $connection->query($idUsuarioInteresse);
    
                if ($resultUsuarioInteresse->num_rows > 0) {
                    while($row = $resultUsuarioInteresse->fetch_assoc()) {
                        $idInteresse = $row["fk_interesse_id"];
                        if (!is_null($idInteresse)) {
                            $interesses = "SELECT nome FROM interesse WHERE id = $idInteresse LIMIT 1";
                            $resultInteresses = $connection->query($interesses);
                            if ($resultInteresses->num_rows > 0) {
                                while($row = $resultInteresses->fetch_assoc()) {
                                    $listaInteresses = $row["nome"];
                                }
                            }
                        }
                    }
                }

                echo '<p><b>Registro ' . $id . '</b>';
                echo '<a href="editarUsuario.php?id='.$id.'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16"><path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/></svg></a>';
                echo '<a href="excluirUsuario.php?id='.$id.'"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16"><path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/></svg></a>';
                echo '</p>';
                echo "<p>Nome: " . $nome. "</p>";
                echo "<p>Email: " . $email. "</p>";
                echo "<p>Nascimento " . $dataNascimentoFormat . "</p>";
                echo "<p>Estado: " . $estado. "</p>";
                echo "<p>Endereço: " . $endereco. "</p>";
                echo "<p>Sexo: " . $sexo. "</p>";

                if (!empty($listaInteresses)) {
                    echo "<p>Interesses: " . $listaInteresses. "</p>";
                }
                
                if(!empty($foto)) { 
                    echo "<p>Foto: </p><br>";
                    echo "<img style='padding: 0 10px; margin-bottom: 30px;' src='http://localhost/agenda08/fotos/" . $foto . "' width='300' height='300'>";
                }
            }
        }

        // Fechar a conexão quando terminar
        $connection->close();

    ?>    
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
</body>
</html>
