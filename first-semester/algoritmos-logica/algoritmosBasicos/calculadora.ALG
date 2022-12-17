// Construa um algoritmo que receba 2 números
// faça as 4 operações básicas da matemática com eles e mostre o resultado de cada operação.

Algoritmo "Exercicio 04 - Operações básicas"

Var
numero1: REAL
numero2: REAL

resultadoSoma: REAL
resultadoSubtracao: REAL
resultadoMultiplicacao: REAL
resultadoDivisao: REAL
Inicio
escreval("Digite o número 1:")
leia(numero1)


se (numero1 > 0) entao
   escreval()
   escreval("Digite o número 2:")
   leia(numero2)
   
   se (numero2 > 0) entao

      resultadoSoma <- numero1 + numero2
      resultadoSubtracao <- numero1 - numero2
      resultadoMultiplicacao <- numero1 * numero2
      resultadoDivisao <- numero1 / numero2
      
      escreval()
      escreval("Soma:")
      escreval(resultadoSoma)
      escreval("Subtração:")
      escreval(resultadoSubtracao)
      escreval("Multiplicação:")
      escreval(resultadoMultiplicacao)
      escreval("Divisão:")
      escreval(resultadoDivisao)
      
   senao
        escreva("Número inválido. Tente novamente.")
   fimse

senao
     escreva("Número inválido. Tente novamente.")
fimse


Fimalgoritmo