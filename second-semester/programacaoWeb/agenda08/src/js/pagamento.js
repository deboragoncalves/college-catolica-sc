window.onload = () => {
    getDadosPacote();
}

const getDadosPacote = () => {
    let dadosPacote = JSON.parse(localStorage.getItem("pacote"));
    let pacote = document.querySelector("#pacote");
    pacote.textContent += dadosPacote.cidade;
    let valor = document.querySelector("#valor");
    valor.textContent += dadosPacote.preco.toLocaleString('pt-br',{style: 'currency', currency: 'BRL'});
}