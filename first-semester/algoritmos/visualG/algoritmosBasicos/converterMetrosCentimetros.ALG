// Construa um algoritmo que  converta metros para centímetros;

Algoritmo "Exercicio 02 - Converter metros em centimetros"

Var
numeroMetros: REAL
numeroCentimetros: REAL

Inicio
escreval("Conversão de metros para centimetros:")
escreva("Digite um numero em metros: ")
leia(numeroMetros)

se (numeroMetros > 0) entao
numeroCentimetros <- numeroMetros * 100
escreval("")
escreval("Número em metros: ", numeroMetros)
escreval("Número em centímetros: ", numeroCentimetros)
senao
escreval("Número inválido. Tente novamente.")
fimse
Fimalgoritmo