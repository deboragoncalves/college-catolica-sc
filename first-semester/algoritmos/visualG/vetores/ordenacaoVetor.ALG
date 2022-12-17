// Um vetor de 20 elementos e coloque-os em ordem crescente.

Algoritmo "Exercicio03 - Ordem crescente"

Var
   vetorNumeros: vetor[1..20] de real
   contador: inteiro
   contadorAux: inteiro
   numeroAux: real
Inicio

   contador <- 1
   enquanto ((contador >= 1) E (contador <= 20)) faca
      escreva("Digite um número: ")
      leia(vetorNumeros[contador])

      contador <- contador + 1
   fimenquanto

   contador <- 1

   escreval("")
   escreval("Vetor não ordenado:")

   enquanto ((contador >= 1) E (contador <= 20)) faca
      escreva(vetorNumeros[contador])

      se (contador <> 20) entao
         escreva(", ")
      fimse

      contador <- contador + 1
   fimenquanto

   contador <- 1

   para contador de 1 ate 20 passo 1 faca
      para contadorAux de contador + 1 ate 20 passo 1 faca
         se (vetorNumeros[contador] > vetorNumeros[contadorAux]) entao
            // Trocar
            numeroAux <- vetorNumeros[contador]
            vetorNumeros[contador] <- vetorNumeros[contadorAux]
            vetorNumeros[contadorAux] <- numeroAux
         fimse
      fimpara
   fimpara

   contador <- 1

   escreval("")
   escreval("")
   escreval("Vetor ordenado:")

   enquanto ((contador >= 1) E (contador <= 20)) faca
      escreva(vetorNumeros[contador])

      se (contador <> 20) entao
         escreva(", ")
      fimse

      contador <- contador + 1
   fimenquanto

Fimalgoritmo