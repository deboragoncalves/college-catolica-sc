// Construa um algoritmo que receba seus dados pessoais,
// armazene em variáveis e os mostre em tela como: nome, endereço,
// telefone, email, CPF, RG, e outros;

Algoritmo "Exercicio01 - Dados pessoais"

Var
// Dados pessoais
nome: CARACTERE
telefone: CARACTERE
email: CARACTERE
documentoCPF: CARACTERE
documentoRG: CARACTERE

// Dados do endereço
rua: CARACTERE
numero: CARACTERE
bairro: CARACTERE
cidade: CARACTERE
estado: CARACTERE

Inicio
escreva("Digite seu nome: ")
leia(nome)

escreva("Digite sua rua: ")
leia(rua)

escreva("Digite seu numero: ")
leia(numero)

escreva("Digite seu bairro: ")
leia(bairro)

escreva("Digite sua cidade: ")
leia(cidade)

escreva("Digite seu estado: ")
leia(estado)

escreva("Digite seu telefone (DD + numero): ")
leia(telefone)

escreva("Digite seu email (exemplo@exemplo.com.br): ")
leia(email)

escreva("Digite seu CPF (000.000.000-00): ")
leia(documentoCPF)

escreva("Digite seu RG (0.000.000): ")
leia(documentoRG)

escreval("")
escreval("Dados pessoais: ")
escreval("Nome: " + nome)
escreval("Telefone: " + telefone)
escreval("Email: " + email)
escreval("CPF: " + documentoCPF)
escreval("RG: " + documentoRG)

escreval("")
escreval("Dados do endereço: ")
escreval("Rua: " + rua)
escreval("Número: " + numero)
escreval("Bairro: " + bairro)
escreval("Cidade: " + cidade)
escreval("Estado: " + estado)
Fimalgoritmo