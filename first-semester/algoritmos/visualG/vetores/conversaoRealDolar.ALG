// Fa�a um algoritmo que tenha um menu de convers�o de R$ para US$
// e US$ para R$, cada convers�o dever� ter uma fun��o que receba o valor
// e cota��o e retorna o valor convertido

Algoritmo "Exercicio04 - Convers�o de moedas"

funcao converteRealDolar(valor: real; cotacao: real):real
var
inicio
   se ((valor <> 0) e (cotacao <> 0)) entao
      retorne valor * cotacao
   fimse
fimfuncao

funcao converteDolarReal(valor: real; cotacao: real):real
var
inicio
   se ((valor <> 0) e (cotacao <> 0)) entao
      retorne valor * cotacao
   fimse
fimfuncao

Var
   opcaoMenu: INTEIRO
   valor: REAL
   valorConvertido: REAL
   cotacao: REAL

Inicio

   escreva("Digite 1 para converter R$ para US$ e 2 para converter US$ para R$: ")
   leia(opcaoMenu)
   escreval("")
   escreva("Digite o valor a ser convertido: ")
   leia(valor)
   escreval("")

   se (valor <> 0) entao
      se (opcaoMenu = 1) entao
         cotacao <- 5.2
         valorConvertido <- converteRealDolar(valor, cotacao)

         escreval("")
         escreva("Valor em R$: ")
         escreva(valor:5:2)
         escreval("")
         escreva("Valor em US$: ")
         escreva(valorConvertido:5:2)
      senao
         se (opcaoMenu = 2) entao
            cotacao <- 0.19
            valorConvertido <- converteDolarReal(valor, cotacao)

            escreval("")
            escreva("Valor em R$: ")
            escreva(valor:5:2)
            escreval("")
            escreva("Valor em US$: ")
            escreva(valorConvertido:5:2)

         senao
            escreval("Op��o inv�lida. Tente novamente.")
         fimse
      fimse
   senao
      escreval("Valor inv�lido. Tente novamente.")
   fimse

Fimalgoritmo