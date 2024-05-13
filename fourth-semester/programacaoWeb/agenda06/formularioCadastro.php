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
    $interesses = "";
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
          $interesses = $row["interesses"];
          $login = $row["login"];
          $senha = $row["senha"];
          $foto = $row["foto"];
          $caminhoFoto = "C:/xampp/htdocs/agenda06/fotos/" . $foto;
          $action = "atualizarUsuario.php?id=" . $id;
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
            <option selected value="">Estado</option>
            <option value="Santa Catarina">Santa Catarina</option>
            <option value="Paraná">Paraná</option>
            <option value="Rio Grande do Sul">Rio Grande do Sul</option>
            <option value="São Paulo">São Paulo</option>
            <option value="Rio de Janeiro">Rio de Janeiro</option>
            <option value="Minas Gerais">Minas Gerais</option>
            <option value="Espírito Santo">Espírito Santo</option>
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
              <input required class="form-check-input" type="radio" name="radioSexo" id="masculino" value="Masculino">
              <label class="form-check-label" for="masculino">
                Masculino
              </label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="radioSexo" id="feminino" value="Feminino">
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
              <input class="form-check-input" type="checkbox" id="checkboxPraia" value="praia">
              <label class="form-check-label" for="checkboxPraia">Praia</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="checkboxCampo" value="campo">
              <label class="form-check-label" for="checkboxCampo">Campo</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="checkboxNacionais" value="nacionais">
              <label class="form-check-label" for="checkboxNacionais">Nacionais</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="checkboxInternacionais" value="internacionais">
              <label class="form-check-label" for="checkboxInternacionais">Internacionais</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="checkboxSerra" value="serra">
              <label class="form-check-label" for="checkboxSerra">Serra</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="checkboxCidade" value="cidade">
              <label class="form-check-label" for="checkboxCidade">Cidade</label>
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
