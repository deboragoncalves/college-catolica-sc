// Construa um algoritmo que pe�a dois n�meros inteiros
// e gere os n�meros inteiros que est�o no intervalo entre eles.

Algoritmo "Exercicio02 - Intervalo"

Var
   numero1: INTEIRO
   numero2: INTEIRO
   contador: INTEIRO

Inicio

   escreva("Escreva o primeiro n�mero: ")
   leia(numero1)

   escreval("")
   escreva("Escreva o segundo n�mero: ")
   leia(numero2)

   se ((numero1 <> 0) E (numero2 <> 0)) entao
      se (numero1 = numero2) entao
         escreval("Os n�meros s�o iguais. Tente novamente.")
      fimse

      se (numero1 > numero2) entao
         contador <- numero2 + 1
         enquanto (numero1 > contador) faca
            escreva("Intervalo entre numero1")
            escreva(numero1)
            escreva(" e numero2")
            escreva(numero2)
            escreva(": ")
            escreval(contador)
            contador <- contador + 1
         fimenquanto
      fimse

      se (numero2 > numero1) entao
         contador <- numero1 + 1
         enquanto (numero2 > contador) faca
            escreva("Intervalo entre numero2")
            escreva(numero2)
            escreva(" e numero1")
            escreva(numero1)
            escreva(": ")
            escreval(contador)
            contador <- contador + 1
         fimenquanto
      fimse
   senao
      escreval("N�meros inv�lidos. Tente novamente")
   fimse

Fimalgoritmo