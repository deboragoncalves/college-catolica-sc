const limparCadastro = () => {
    document.querySelector("#cadastro-nome").value = "";
    document.querySelector("#cadastro-email").value = "";
    document.querySelector("#cadastro-nascimento").value = "";
    document.querySelector("#cadastro-endereco").value = "";
    document.querySelector("#cadastro-login").value = "";
    document.querySelector("#cadastro-senha").value = "";
    document.querySelector("#cadastro-estado").options.selectedIndex = 0;
    document.querySelector('#masculino').checked = false;
    document.querySelector('#feminino').checked = false;
    document.querySelector('#checkboxPraia').checked = false;
    document.querySelector('#checkboxCampo').checked = false;
    document.querySelector('#checkboxNacionais').checked = false;
    document.querySelector('#checkboxInternacionais').checked = false;
    document.querySelector('#checkboxSerra').checked = false;
    document.querySelector('#checkboxCidade').checked = false;
}

const salvarCadastro = () => {
    const cadastroValido = validarCadastro();

    if (cadastroValido) {
        let containerMensagemForm = document.querySelector("#container-mensagem-form");
        containerMensagemForm.innerHTML = "";
        window.location.href = "pagamento.html";
    } else {
        let containerMensagemForm = document.querySelector("#container-mensagem-form");
        containerMensagemForm.innerHTML = "";

        let formularioInvalido = document.createElement("p");
        formularioInvalido.textContent = "Formulário inválido. Tente novamente";
        formularioInvalido.style.color = "red";
        formularioInvalido.style.margin = "20px 0";
        containerMensagemForm.appendChild(formularioInvalido);
    }
}

const validarCadastro = () => {
    let nome = document.querySelector("#cadastro-nome").value;
    let email = document.querySelector("#cadastro-email").value;
    let dataNascimento = document.querySelector("#cadastro-nascimento").value;
    let endereco = document.querySelector("#cadastro-endereco").value;
    let login = document.querySelector("#cadastro-login").value;
    let senha = document.querySelector("#cadastro-senha").value;
    let estado = document.querySelector("#cadastro-estado");
    let sexoMasculino = document.querySelector('#masculino');
    let sexoFeminino = document.querySelector('#feminino');

    let cadastroValido = true;

    if (!nome || nome.length < 3) {
        cadastroValido = false;
    }

    if (!email || email.length < 3) {
        cadastroValido = false;
    }

    if (!dataNascimento || email < 10) {
        cadastroValido = false;
    }

    if (!endereco || endereco.length < 3) {
        cadastroValido = false;
    }

    if (!login || login.length < 3) {
        cadastroValido = false;
    }

    if (!senha || senha.length < 3) {
        cadastroValido = false;
    }

    if (estado.options.selectedIndex == 0) {
        cadastroValido = false;
    }

    if (!sexoMasculino.checked && !sexoFeminino.checked) {
        cadastroValido = false;
    }

    return cadastroValido;
}