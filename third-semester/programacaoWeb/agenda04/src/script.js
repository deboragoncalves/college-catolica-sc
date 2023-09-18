const carregarPagina = (pagina) => {
    let containerPagina = document.querySelector("#paginas");

    // busca as paginas e retorna se deu certo ou nao
    let requisicao = new XMLHttpRequest();
    requisicao.onreadystatechange = () => {
        // verificar se concluiu a busca (estado 4) e se deu certo 200
        if (requisicao.readyState == 4 && requisicao.status == 200) {
            // exibir na pagina a resposta da requisicao
            containerPagina.innerHTML = requisicao.response;
        }
    }
    
    // carregar a pagina
    requisicao.open("GET", `src/${pagina}.html`);
    requisicao.send();
}