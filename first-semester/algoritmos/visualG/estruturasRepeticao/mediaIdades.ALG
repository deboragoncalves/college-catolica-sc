// Desenvolva um algoritmo que pe�a a idade de 15 pessoas,
// ao final mostre a m�dia de idade destas pessoas e quantas delas podem votar.

Algoritmo "Exercicio03 - Idades"

Var
   idade: INTEIRO
   contador: INTEIRO
   totalIdades: INTEIRO
   mediaIdades: REAL
   totalEleitoras: INTEIRO
Inicio
   contador <- 1
   totalIdades <- 0
   totalEleitoras <- 0

   enquanto ((contador >= 1) E (contador <= 15)) faca
      escreval("")
      escreval("Digite a sua idade:")
      leia(idade)

      se (idade <> 0) entao
         totalIdades <- totalIdades + idade

         se (idade >= 18) entao
            totalEleitoras <- totalEleitoras + 1
         fimse

         contador <- contador + 1
      senao
         escreval("Idade inv�lida. Tente novamente.")
         contador <- 0
      fimse
   fimenquanto

   se (contador > 0) entao
      // escreval("Somat�rio das idades: ")
      // escreva(totalIdades)
      se (totalIdades > 0) entao
         mediaIdades <- totalIdades / contador
         escreval("")
         escreva("M�dia das idades: ")
         escreva(mediaIdades:2:0)
      fimse

      escreval("")
      escreva("Total de pessoas eleitoras:")
      escreva(totalEleitoras)
   fimse

Fimalgoritmo