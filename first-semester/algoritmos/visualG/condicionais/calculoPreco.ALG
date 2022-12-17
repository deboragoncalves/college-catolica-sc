// Faça um algoritmo que receba o preço à vista de um determinado produto
// e o total de parcelas (3 ou 5), calcular o preço total a pagar e
// o valor da prestação  mensal, referente ao pagamento parcelado.
// Se o pagamento for parcelado em três vezes deverá ser dado
// um acréscimo de 10% no total a ser pago. Se for parcelado em 5 vezes,
// o acréscimo é de 20%. Exiba o valor das parcelas e o valor final a ser pago.

Algoritmo "Exercicio04"
Var
precoVista: REAL
numeroParcelas: REAL
precoTotal: REAL
prestacao: REAL
acrescimo: REAL
Inicio
   escreva("Digite o preço a vista de um produto: ")
   leia(precoVista)

   escreva("Digite o número de parcelas a serem pagas: ")
   leia(numeroParcelas)

   se (precoVista > 0) entao
      se (numeroParcelas <> 3) e (numeroParcelas <> 5) entao
         escreval("O número de parcelas informado é inválido, deve ser 3 ou 5. Tente novamente.")
      senao
         se (numeroParcelas = 3) entao
            acrescimo <- 10 / 100
         fimse

         se (numeroParcelas = 5) entao
            acrescimo <- 20 / 100
         fimse

         precoTotal <- precoVista + (precoVista * acrescimo)
         prestacao <- precoTotal / numeroParcelas

         escreva("Preço à vista: R$ ", precoVista:10:2)
         escreval("")
         escreva("Preço total: R$ ", precoTotal:10:2)
         escreval("")
         escreva("Parcelas: ", numeroParcelas)
         escreval("")
         escreva("Acréscimo: ", acrescimo * 100, "%")
         escreval("")
         escreva("Prestação: R$ ", prestacao:10:2)
      fimse

   senao
      escreval("O preço informado é inválido. Tente novamente.")
   fimse
Fimalgoritmo