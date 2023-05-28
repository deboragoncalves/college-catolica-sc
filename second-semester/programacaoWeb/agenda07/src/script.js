let dadosPacotes = [];

const getDadosPacotes = async () => {
    let responseDadosPacotes = await fetch("./dados/dadosPacotes.json");
    dadosPacotes =  await responseDadosPacotes.json();
}

window.onload = getDadosPacotes();

const getPacote = async cidade => {
    let pacote;

    for (let contador = 0; contador < dadosPacotes.length; contador++) {
        if (dadosPacotes[contador].cidade == cidade) { 
            pacote = dadosPacotes[contador];
            localStorage.setItem("pacote", JSON.stringify(pacote));

            setTimeout(() => {
                window.location.href = "detalhesPacotes.html";
            }, 500);
        }
    }
}

