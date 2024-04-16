<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dados do Usuário</title>
</head>
<style>
    p, h2 {
        font-family: Arial, sans-serif;
    }
</style>
<body>
    <?php
    // Verifica se o formulário foi enviado
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nome = $_POST['cadastro-nome'];
        $email = $_POST['cadastro-email'];
        $dataNascimento = $_POST['cadastro-nascimento'];
        
        $dataNascimentoFormat = date("d/m/Y", strtotime($dataNascimento));        
        $dataNascimentoDate = new DateTime($dataNascimento);
        $hojeDate = new Datetime(date('d/m/Y'));
        $diff = $hojeDate->diff($dataNascimentoDate);
        $idade = intval($diff->format('%Y'));
        $maiorIdade = "";
        if ($idade > 18) {
            $maiorIdade = "É maior de idade.";
        } else {
            $maiorIdade = "É menor de idade.";
        }

        $estado = filter_input(INPUT_POST, 'cadastro-estado');
        $endereco = $_POST['cadastro-endereco'];
        $sexo = $_POST['radioSexo'];
        $login = $_POST['cadastro-login'];
        $senha = $_POST['cadastro-senha'];
        $titulo = "";

        if ($sexo == "Feminino") {
            $titulo = "Olá Sra.";
        } else {
            $titulo = "Olá Sr.";
        }
        
        echo "<p><strong>$titulo</strong></p>"; 
        echo "<p><strong>Nome:</strong> $nome</p>";
        echo "<p><strong>Email:</strong> $email</p>";
        echo "<p><strong>Data de nascimento:</strong> $dataNascimentoFormat</p>";
        echo "<p><strong>$maiorIdade</strong></p>";
        echo "<p><strong>Estado:</strong> $estado</p>";
        echo "<p><strong>Endereço:</strong> $endereco</p>";
        echo "<p><strong>Sexo:</strong> $sexo</p>";

    } else {
        echo "<p>Erro: O formulário não foi enviado.</p>";
    }
    ?>
</body>
</html>
