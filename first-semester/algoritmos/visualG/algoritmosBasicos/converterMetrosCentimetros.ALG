// Construa um algoritmo que  converta metros para cent�metros;

Algoritmo "Exercicio 02 - Converter metros em centimetros"

Var
numeroMetros: REAL
numeroCentimetros: REAL

Inicio
escreval("Convers�o de metros para centimetros:")
escreva("Digite um numero em metros: ")
leia(numeroMetros)

se (numeroMetros > 0) entao
numeroCentimetros <- numeroMetros * 100
escreval("")
escreval("N�mero em metros: ", numeroMetros)
escreval("N�mero em cent�metros: ", numeroCentimetros)
senao
escreval("N�mero inv�lido. Tente novamente.")
fimse
Fimalgoritmo