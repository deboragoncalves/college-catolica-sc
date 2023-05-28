window.onload = () => {
    let dadosPacote = JSON.parse(localStorage.getItem("pacote"));
    montarLayout(dadosPacote);
}

const montarLayout = pacote => {
    let containerDetalhes = document.querySelector("#main-container-detalhes");
    let subcontainerDetalhes = document.createElement("section");

    let tituloPacote = document.createElement("h6");
    let textoTituloPacote = document.createTextNode(pacote.cidade);
    tituloPacote.appendChild(textoTituloPacote);

    let hoteis = document.createElement("p");
    let textoHoteis = document.createTextNode(`Hotéis: ${pacote.hoteis.join(", ")}`);
    hoteis.appendChild(textoHoteis);

    let preco = document.createElement("p");
    let precoFormatado = pacote.preco.toLocaleString('pt-br',{style: 'currency', currency: 'BRL'});
    let textoPreco = document.createTextNode(`Preço: ${precoFormatado}`);
    preco.appendChild(textoPreco);

    let diaHorarioSaidaIda = pacote.ida.saida;

    let diaSaidaIda = diaHorarioSaidaIda.split(" ")[0];
    let horarioSaidaIda = diaHorarioSaidaIda.split(" ")[1];

    let diaHorarioSaidaVolta = pacote.volta.saida;

    let diaSaidaVolta = diaHorarioSaidaVolta.split(" ")[0];
    let horarioSaidaVolta = diaHorarioSaidaVolta.split(" ")[1];

    let diaHorarioChegadaIda = pacote.ida.chegada;

    let diaChegadaIda = diaHorarioChegadaIda.split(" ")[0];
    let horarioChegadaIda = diaHorarioChegadaIda.split(" ")[1];

    let diaHorarioChegadaVolta = pacote.volta.chegada;

    let diaChegadaVolta = diaHorarioChegadaVolta.split(" ")[0];
    let horarioChegadaVolta = diaHorarioChegadaVolta.split(" ")[1];

    let saida = document.createElement("p");
    let textoSaida = document.createTextNode(`Saída - Dia: ${diaSaidaIda}, Horário saída: ${horarioSaidaIda}, Horário chegada: ${horarioSaidaVolta}`);
    saida.appendChild(textoSaida);

    let chegada = document.createElement("p");
    let textoChegada = document.createTextNode(`Chegada - Dia: ${diaChegadaIda}, Horário saída: ${horarioChegadaIda}, Horário chegada: ${horarioChegadaVolta}`);
    chegada.appendChild(textoChegada);

    let botaoComprar = document.createElement("button");
    let textoBotao = document.createTextNode("Comprar");
    botaoComprar.appendChild(textoBotao);
    botaoComprar.classList.add("botao-comprar");
    botaoComprar.addEventListener("click", () => {
        setTimeout(() => {
            window.location.href = "login.html";
        }, 500);
    });

    subcontainerDetalhes.appendChild(tituloPacote);
    subcontainerDetalhes.appendChild(preco);
    subcontainerDetalhes.appendChild(hoteis);
    subcontainerDetalhes.appendChild(saida);
    subcontainerDetalhes.appendChild(chegada);
    subcontainerDetalhes.appendChild(botaoComprar);
    containerDetalhes.appendChild(subcontainerDetalhes);
}


