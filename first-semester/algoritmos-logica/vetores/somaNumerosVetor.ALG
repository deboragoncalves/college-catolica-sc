// Um vetor de 10 números inteiros e mostre a soma dos números.

Algoritmo "Exercicio01 - Soma de vetor de inteiros"

Var
   vetorInteiros: vetor[0..9] de inteiro
   contador: inteiro
   somatorio: inteiro
Inicio

   contador <- 0
   enquanto ((contador >= 0) E (contador <= 9)) faca
      escreva("Digite um número inteiro: ")
      leia(vetorInteiros[contador])

      contador <- contador + 1
   fimenquanto

   contador <- 0
   somatorio <- 0
   
   escreval("")

   enquanto ((contador >= 0) E (contador <= 9)) faca
      escreva("Item")
      escreva(contador + 1)
      escreva(" do vetor: ")
      escreva(vetorInteiros[contador])
      escreval("")
      
      somatorio <- somatorio + vetorInteiros[contador]
      
      contador <- contador + 1
   fimenquanto
   
   escreval("")
   escreva("Soma:")
   escreva(somatorio)

Fimalgoritmo