<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cadastro</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
  </head>
  <style>
    #container-cadastro {
        width: 30%;
        margin: 20px;
    }

    .botao-cadastro {
        cursor: pointer;
        background-color: brown;
        color: white;
        border: none;
        border-radius: 5%;
        padding: 10px;
    }

    .form-check-inline label {
      font-weight: normal !important;
    }

    div.form-group label {
      font-weight: bold;
    }
  </style>

  <body>
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

    $nome = "";
    $email = "";
    $nascimento = "";
    $estado = "";
    $endereco = "";
    $sexo = "";
    $login = ""; 
    $senha = "";
    $foto = "";
    $caminhoFoto = "";

    $action = "novoCadastro.php";

    // Conexão com o banco de dados
    $connection = new mysqli($host, $user, $password, $database);

    // Verifica a conexão
    if ($connection->connect_error) {
        die("Falha na conexão: " . $connection->connect_error);
    }

    $id = $_GET['id'] ?? "";
    if(isset($id)) {
      $sql = "SELECT * FROM usuario WHERE id = '$id'";
      $result = $connection->query($sql);
              
      if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
          $nome = $row["nome"];
          $email = $row["email"];
          $nascimento = $row["nascimento"];
          $estado = $row["estado"];
          $endereco = $row["endereco"];
          $sexo = $row["sexo"];
          $login = $row["login"];
          $senha = $row["senha"];
          $foto = $row["foto"];
          $caminhoFoto = "C:/xampp/htdocs/agenda09/fotos/" . $foto;
          $action = "atualizarUsuario.php?id=" . $id;
        }
      }
    }
  
    $sqlInteresses = "SELECT * FROM interesse";
    $resultInteresses = $connection->query($sqlInteresses);
    
    $interesses = array();
    if ($resultInteresses->num_rows > 0) {
      while($row = $resultInteresses->fetch_assoc()) {
        $idInteresse = $row["id"];
        $nomeInteresse = $row["nome"];
        $interesse = array($idInteresse, $nomeInteresse);
        array_push($interesses, $interesse);
      }
    }

    if(isset($id)) {
      $sqlInteressesUsuario = "SELECT fk_interesse_id FROM usuario_interesse WHERE fk_usuario_id = $id";
      $resultInteressesUsuario = $connection->query($sqlInteressesUsuario);
      $interessesUsuario = array();
      if ($resultInteressesUsuario->num_rows > 0) {
        while($row = $resultInteressesUsuario->fetch_assoc()) {
          $idInteresse = $row["fk_interesse_id"];
          array_push($interessesUsuario, $idInteresse);
        }
      }
    }
  
    ?>
    <section id="container-cadastro">
      <h5>Cadastro</h5>
      <form action="<?php echo $action; ?>" method="post">
        <div class="form-group">
          <label for="cadastro-nome">Nome completo</label>
          <input
            type="text"
            class="form-control"
            id="cadastro-nome"
            name="cadastro-nome"
            placeholder="Nome"
            value="<?php echo $nome; ?>"
            required
          />
        </div>
        <div class="form-group">
          <label for="cadastro-email">Email</label>
          <input
            type="email"
            class="form-control"
            id="cadastro-email"
            name="cadastro-email"
            placeholder="Email"
            value="<?php echo $email; ?>"
            required
          />
        </div> 
        <div class="form-group">
          <label for="cadastro-nascimento">Data de nascimento</label>
          <input
            type="date"
            class="form-control"
            id="cadastro-nascimento"
            name="cadastro-nascimento"
            placeholder="Data de nascimento"
            value="<?php echo $nascimento; ?>"
            required
          />
        </div>
        <div class="form-group container-select">
          <label for="cadastro-estado">Estado</label>
          <select name="cadastro-estado" id="cadastro-estado" class="form-control" required>
            <option selected value="" <?php echo $estado == "" ? "selected" : "" ?>>Estado</option>
            <option value="Santa Catarina" <?php echo $estado == "Santa Catarina" ? "selected" : "" ?>>Santa Catarina</option>
            <option value="Paraná" <?php echo $estado == "Paraná" ? "selected" : "" ?>>Paraná</option>
            <option value="Rio Grande do Sul" <?php echo $estado == "Rio Grande do Sul" ? "selected" : "" ?>>Rio Grande do Sul</option>
            <option value="São Paulo" <?php echo $estado == "São Paulo" ? "selected" : "" ?>>São Paulo</option>
            <option value="Rio de Janeiro" <?php echo $estado == "Rio de Janeiro" ? "selected" : "" ?>>Rio de Janeiro</option>
            <option value="Minas Gerais" <?php echo $estado == "Minas Gerais" ? "selected" : "" ?>>Minas Gerais</option>
            <option value="Espírito Santo" <?php echo $estado == "Espírito Santo" ? "selected" : "" ?>>Espírito Santo</option>
          </select>
        </div>
        <div class="form-group">
          <label for="cadastro-endereco">Endereço</label>
          <input
            type="text"
            class="form-control"
            id="cadastro-endereco"
            name="cadastro-endereco"
            placeholder="Endereço"
            value="<?php echo $endereco; ?>"
            required
            
          />
        </div>
        <div class="form-group">
          <label>Sexo</label>
          <div class="container-input">
            <div class="form-check form-check-inline">
              <input required class="form-check-input" type="radio" name="radioSexo" id="masculino" value="Masculino" <?php echo $sexo == "Masculino" ? "checked" : "" ?>>
              <label class="form-check-label" for="masculino">
                Masculino
              </label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="radioSexo" id="feminino" value="Feminino" <?php echo $sexo == "Feminino" ? "checked" : "" ?>>
              <label class="form-check-label" for="feminino">
                Feminino
              </label>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label>Categorias de interesse:</label>
          <div class="container-input container-input-checkbox">
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="<?php echo $interesses[0][0] ?>" name="interesses[]" <?php echo in_array($interesses[0][0], $interessesUsuario, ) ? "checked" : "" ?>>
              <label class="form-check-label" for="checkboxCampo"><?php echo ucfirst($interesses[0][1]) ?></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="<?php echo $interesses[1][0] ?>" name="interesses[]" <?php echo in_array($interesses[1][0], $interessesUsuario) ? "checked" : "" ?>>
              <label class="form-check-label" for="checkboxPraia"><?php echo ucfirst($interesses[1][1]) ?></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="<?php echo $interesses[2][0] ?>" name="interesses[]" <?php echo in_array($interesses[2][0], $interessesUsuario) ? "checked" : "" ?>>
              <label class="form-check-label" for="checkboxNacionais"><?php echo ucfirst($interesses[2][1]) ?></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="<?php echo $interesses[3][0] ?>" name="interesses[]" <?php echo in_array($interesses[3][0], $interessesUsuario) ? "checked" : "" ?>>
              <label class="form-check-label" for="checkboxInternacionais"><?php echo ucfirst($interesses[3][1]) ?></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="<?php echo $interesses[4][0] ?>" name="interesses[]" <?php echo in_array($interesses[4][0], $interessesUsuario) ? "checked" : "" ?>>
              <label class="form-check-label" for="checkboxSerra"><?php echo ucfirst($interesses[4][1]) ?></label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" value="<?php echo $interesses[5][0] ?>" name="interesses[]" <?php echo in_array($interesses[5][0], $interessesUsuario) ? "checked" : "" ?>>
              <label class="form-check-label" for="checkboxCidade"><?php echo ucfirst($interesses[5][1]) ?></label>
            </div>
          </div>
        </div>          
        <div class="form-group">
          <label for="cadastro-login">Login</label>
          <input
            type="email"
            class="form-control"
            id="cadastro-login"
            name="cadastro-login"
            placeholder="Login"
            required
            value="<?php echo $login; ?>"
            />
        </div>
        <div class="form-group">
          <label for="cadastro-senha">Senha</label>
          <input
            type="password"
            class="form-control"
            id="cadastro-senha"
            name="cadastro-senha"
            placeholder="Senha"
            value="<?php echo $senha; ?>"
            required
          />
        </div>
        <div class="form-group">
          <label for="cadastro-foto">Foto:</label>
          <input
            type="file"
            accept=".jpg,.jpeg,.png" 
            placeholder="Clique aqui para selecionar um arquivo"
            class="form-control"
            id="cadastro-foto"
            name="cadastro-foto"
            value="<?php echo $caminhoFoto; ?>"
            required
          />
        </div>
        <div id="container-mensagem-form"></div>
        <button type="reset" class="btn botao-cadastro">Limpar</button>
        <button type="submit" class="btn botao-cadastro">Salvar</button>
    </form>
    </section>
    <section id="dados-usuario"></section>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
