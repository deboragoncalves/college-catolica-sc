// Fa�a um algoritmo que receba o pre�o � vista de um determinado produto
// e o total de parcelas (3 ou 5), calcular o pre�o total a pagar e
// o valor da presta��o  mensal, referente ao pagamento parcelado.
// Se o pagamento for parcelado em tr�s vezes dever� ser dado
// um acr�scimo de 10% no total a ser pago. Se for parcelado em 5 vezes,
// o acr�scimo � de 20%. Exiba o valor das parcelas e o valor final a ser pago.

Algoritmo "Exercicio04"
Var
precoVista: REAL
numeroParcelas: REAL
precoTotal: REAL
prestacao: REAL
acrescimo: REAL
Inicio
   escreva("Digite o pre�o a vista de um produto: ")
   leia(precoVista)

   escreva("Digite o n�mero de parcelas a serem pagas: ")
   leia(numeroParcelas)

   se (precoVista > 0) entao
      se (numeroParcelas <> 3) e (numeroParcelas <> 5) entao
         escreval("O n�mero de parcelas informado � inv�lido, deve ser 3 ou 5. Tente novamente.")
      senao
         se (numeroParcelas = 3) entao
            acrescimo <- 10 / 100
         fimse

         se (numeroParcelas = 5) entao
            acrescimo <- 20 / 100
         fimse

         precoTotal <- precoVista + (precoVista * acrescimo)
         prestacao <- precoTotal / numeroParcelas

         escreva("Pre�o � vista: R$ ", precoVista:10:2)
         escreval("")
         escreva("Pre�o total: R$ ", precoTotal:10:2)
         escreval("")
         escreva("Parcelas: ", numeroParcelas)
         escreval("")
         escreva("Acr�scimo: ", acrescimo * 100, "%")
         escreval("")
         escreva("Presta��o: R$ ", prestacao:10:2)
      fimse

   senao
      escreval("O pre�o informado � inv�lido. Tente novamente.")
   fimse
Fimalgoritmo