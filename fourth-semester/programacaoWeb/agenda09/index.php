<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
</head>
<style>
    a {
        color: white !important;
    }

    .botao-login {
        cursor: pointer;
        background-color: brown;
        color: white;
        border: none;
        border-radius: 5%;
        padding: 10px;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    .botao-login:hover {
        color: white;
        font-weight: bold;
    }

    .form-check-inline label {
      font-weight: normal !important;
    }

    div.form-group label {
      font-weight: bold;
    }

    .container-login {
        width: 30%;
        margin: 20px;
    }
</style>
<body> 
    <?php
        session_start();

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

        $action = "";
        $mensagemErro = "";

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $email = $_POST['email'];
            $senha = $_POST['senha'];
            $sql = "SELECT * FROM usuario WHERE login = '$email' AND senha = '$senha'";
            $result = $connection->query($sql);

            if ($result->num_rows > 0) {
                $_SESSION['loginSuccess'] = true;
                $_SESSION['email'] = $email;
                header("Location: home.php");
                exit();
            } else {
                $mensagemErro = "Login/senha inválidos. Tente novamente";
            }     
        
        }

        // Fechar a conexão quando terminar
        $connection->close();

    ?>
    <form action="<?php echo $action; ?>" method="post">
        <div class="container-login">
            <div class="form-group">
                <label for="email">Email</label>
                <input
                    type="text"
                    class="form-control"
                    id="email"
                    name="email"
                    placeholder="Email"
                    required
                />
            </div>
            <div class="form-group">
                <label for="senha">Senha</label>
                <input
                    type="password"
                    class="form-control"
                    id="senha"
                    name="senha"
                    placeholder="Senha"
                    required
                />
            </div>        
            <div id="container-mensagem-form"><?php echo $mensagemErro; ?></div>
            <button class="btn botao-login">Fazer login</button>
        </div>
    </form>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
</body>
</html>
