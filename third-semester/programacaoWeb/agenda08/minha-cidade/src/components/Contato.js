import Header from "./Header";
import Footer from "./Footer";
import { useState } from "react";

function Contato() {
  const [dadosValidosForm, setDadosValidosForm] = useState(false);
  const [dadosForm, setDadosForm] = useState({
    nome: "",
    email: "",
    assunto: "",
    mensagem: "",
  });

  const enviarDadosForm = (event) => {
    event.preventDefault();
    console.log(dadosForm);
    let dadosValidos =
      dadosForm.nome &&
      dadosForm.email &&
      dadosForm.assunto &&
      dadosForm.mensagem;
    dadosValidos ? setDadosValidosForm(true) : setDadosValidosForm(false);
  };

  return (
    <>
      <Header />
      <form className="flex flex-col items-center" onSubmit={enviarDadosForm}>
        <div className="flex flex-col w-[50%] pl-2">
          <h5 className="mt-5">Contato</h5>
          <input
            type="text"
            onChange={(e) => {
              setDadosValidosForm(false);
              setDadosForm({ ...dadosForm, nome: e.target.value });
            }}
            placeholder="Nome"
            id="nome"
            className="mt-5 p-2 bg-gray-50 text-gray-900"
          />
          <input
            type="email"
            onChange={(e) => {
              setDadosValidosForm(false);
              setDadosForm({
                ...dadosForm,
                email: e.target.value,
              });
            }}
            placeholder="Email"
            id="email"
            className="mt-5 p-2 bg-gray-50 text-gray-900"
          />
          <input
            type="text"
            onChange={(e) => {
              setDadosValidosForm(false);
              setDadosForm({
                ...dadosForm,
                assunto: e.target.value,
              });
            }}
            placeholder="Assunto"
            id="assunto"
            className="mt-5 p-2 bg-gray-50 text-gray-900"
          />
          <textarea
            placeholder="Mensagem"
            onChange={(e) => {
              setDadosValidosForm(false);
              setDadosForm({ ...dadosForm, mensagem: e.target.value });
            }}
            id="mensagem"
            className="mt-5 p-2 bg-gray-50 text-gray-900"
          />
          <button
            type="submit"
            className="w-[5rem] mt-5 text-white bg-blue-700 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
          >
            Enviar
          </button>
          {dadosValidosForm ? (
            <div className="mt-5">
              <p>Dados enviados com sucesso!</p>
              <p>Nome: {dadosForm.nome}</p>
              <p>Email: {dadosForm.email}</p>
              <p>Assunto: {dadosForm.assunto}</p>
              <p>Mensagem: {dadosForm.mensagem}</p>
            </div>
          ) : (
            <></>
          )}
        </div>
      </form>
      <Footer />
    </>
  );
}

export default Contato;
