// Construa um algoritmo que receba 2 n�meros
// fa�a as 4 opera��es b�sicas da matem�tica com eles e mostre o resultado de cada opera��o.

Algoritmo "Exercicio 04 - Opera��es b�sicas"

Var
numero1: REAL
numero2: REAL

resultadoSoma: REAL
resultadoSubtracao: REAL
resultadoMultiplicacao: REAL
resultadoDivisao: REAL
Inicio
escreval("Digite o n�mero 1:")
leia(numero1)


se (numero1 > 0) entao
   escreval()
   escreval("Digite o n�mero 2:")
   leia(numero2)
   
   se (numero2 > 0) entao

      resultadoSoma <- numero1 + numero2
      resultadoSubtracao <- numero1 - numero2
      resultadoMultiplicacao <- numero1 * numero2
      resultadoDivisao <- numero1 / numero2
      
      escreval()
      escreval("Soma:")
      escreval(resultadoSoma)
      escreval("Subtra��o:")
      escreval(resultadoSubtracao)
      escreval("Multiplica��o:")
      escreval(resultadoMultiplicacao)
      escreval("Divis�o:")
      escreval(resultadoDivisao)
      
   senao
        escreva("N�mero inv�lido. Tente novamente.")
   fimse

senao
     escreva("N�mero inv�lido. Tente novamente.")
fimse


Fimalgoritmo