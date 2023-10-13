import imagem1Joinville from "./images/joinville1.jpg";
import imagem2Joinville from "./images/joinville2.jpg";
import imagem3Joinville from "./images/joinville3.jpg";
import imagem4Joinville from "./images/joinville4.jpg";
import imagem5Joinville from "./images/joinville5.jpg";
import imagem6Joinville from "./images/joinville6.jpg";

function MinhaCidade() {
  return (
    <>
      <div className="flex flex-col items-center mt-[20px] mb-[20px]">
        <span className="text-xl mb-[10px]">
          Dados Estatísticos - IBGE 2022 - Joinville:
        </span>
        <span className="mb-[5px]">População: 617mil pessoas</span>
        <span className="mb-[5px]">PIB per capita: R$ 60.890,86</span>
        <span className="mb-[5px]">IDH (Indice Desenvolvimento humano): 0,809</span>
        <span className="mb-[5px]">Salário médio mensal: 2,9 salários mínimos</span>
      </div>
      <div className="flex justify-center w-[100%]">
        <div className="flex justify-center w-[30%] p-2">
          <img src={imagem1Joinville} alt="Imagem Joinville"></img>
        </div>
        <div className="flex justify-center w-[30%] p-2">
          <img src={imagem2Joinville} alt="Imagem Joinville"></img>
        </div>
        <div className="flex justify-center w-[30%] p-2">
          <img src={imagem3Joinville} alt="Imagem Joinville"></img>
        </div>
      </div>
      <div className="flex justify-center w-[100%]">
        <div className="flex justify-center w-[30%] p-2">
          <img src={imagem4Joinville} alt="Imagem Joinville"></img>
        </div>
        <div className="flex justify-center w-[30%] p-2">
          <img src={imagem5Joinville} alt="Imagem Joinville"></img>
        </div>
        <div className="flex justify-center w-[30%] p-2">
          <img src={imagem6Joinville} alt="Imagem Joinville"></img>
        </div>
      </div>
    </>
  );
}

export default MinhaCidade;
