// Um vetor de 15 palavras e mostre-os na ordem inversa.

Algoritmo "Exercicio02 - Vetor de strings"

Var
   vetorCaracteres: vetor[0..14] de caractere
   contador: inteiro
Inicio

   contador <- 0
   enquanto ((contador >= 0) E (contador <= 14)) faca
      escreva("Digite uma palavra: ")
      leia(vetorCaracteres[contador])

      se (Compr(vetorCaracteres[contador]) = 0) entao
         escreval("Palavra inválida. Tente novamente.")
         contador <- -1
      senao
         contador <- contador + 1
      fimse
   fimenquanto

   se (contador <> -1) entao
      contador <- 14

      escreval("")

      enquanto ((contador >= 0) E (contador <= 14)) faca
         se (Compr(vetorCaracteres[contador]) > 0) entao
            escreva("Item")
            escreva(contador + 1)
            escreva(" do vetor: ")
            escreva(vetorCaracteres[contador])
            escreval("")

            contador <- contador - 1
         fimse
      fimenquanto
   fimse

Fimalgoritmo