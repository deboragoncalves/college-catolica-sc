// Construa um algoritmo que receba 3 n�meros e mostre-os em ordem crescente;

Algoritmo "Exercicio02 - Ordenar n�meros"

Var
   numero1: REAL
   numero2: REAL
   numero3: REAL
   numeroMaior: REAL
   numeroMenor: REAL

Inicio
   escreva("Digite o primeiro n�mero: ")
   leia(numero1)

   escreva("Digite o segundo n�mero: ")
   leia(numero2)

   escreva("Digite o terceiro n�mero: ")
   leia(numero3)

   se ((numero1 > 0) e (numero2 > 0) e (numero3 > 0)) entao
      escreval("N�meros: ", numero1, ", ", numero2, ", ", numero3)

      // iguais
      se ((numero1 = numero2) ou (numero2 = numero3)) entao
         escreval("Os n�meros s�o iguais. Tente novamente.")
      fimse

      se (numero1 > numero2) e (numero1 > numero3) entao
         escreval("Ordem crescente:")
         se (numero2 > numero3) entao
            escreva(numero3, ", ", numero2, ", ", numero1)
         senao
            se (numero3 > numero2) entao
               escreva(numero2, ", ", numero3, ", ", numero1)
            fimse
         fimse
      fimse

      se (numero2 > numero1) e (numero2 > numero3) entao
         escreval("Ordem crescente:")
         se (numero1 > numero3) entao
            escreva(numero3, ", ", numero1, ", ", numero2)
         senao
            se (numero3 > numero1) entao
               escreva(numero1, ", ", numero3, ", ", numero2)
            fimse
         fimse
      fimse

      se (numero3 > numero1) e (numero3 > numero2) entao
         escreval("Ordem crescente:")
         se (numero1 > numero2) entao
            escreva(numero2, ", ", numero1, ", ", numero3)
         senao
            se (numero2 > numero1) entao
               escreva(numero1, ", ", numero2, ", ", numero3)
            fimse
         fimse
      fimse

   senao
      escreval("N�mero inv�lido. Tente novamente")
   fimse

Fimalgoritmo