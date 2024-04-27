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
    p {
        margin: 10px;
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
    }

    .botao-cadastro:hover {
        color: white;
        font-weight: bold;
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

        $sql = "SELECT * FROM usuario";
        $result = $connection->query($sql);
        
        if ($result->num_rows > 0) {
            // Loop através dos resultados e exibir os dados
            while($row = $result->fetch_assoc()) {
                $id = $row["id"];
                $nome = $row["nome"];
                $email = $row["email"];
                $nascimento = $row["nascimento"];
                $estado = $row["estado"];
                $endereco = $row["endereco"];
                $sexo = $row["sexo"];
                $interesses = $row["interesses"];
                echo "<p>Registro " . $id . "<br>";
                echo "<p>Nome: " . $nome. "<br>";
                echo "<p>Email: " . $email. "<br>";
                echo "<p>Nascimento " . $nascimento . "<br>";
                echo "<p>Nome: " . $nome. "<br>";
                echo "<p>Email: " . $email. "<br>";

            }
        } else {
            echo "0 registros";
        }

        // Fechar a conexão quando terminar
        $connection->close();

    ?>    
    <a href="formularioCadastro.html" class="btn botao-cadastro">Cadastrar novo registro</a>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
</body>
</html>
