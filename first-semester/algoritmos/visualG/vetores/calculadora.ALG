// Faça um algoritmo para simular uma calculadora simples,
// o usuário deverá informar 2 números e a operação que deseja fazer
// (adição, subtração, divisão ou multiplicação),
// utilize procedimento para realizar o cálculo e retornar o resultado.

Algoritmo "Exercicio05 - Calculadora"

procedimento calculoOperacao(n1: real; n2: real; operacao: caractere):real

inicio
   se (operacao = "+") entao
      resultado <- n1 + n2
   senao
      se (operacao = "-") entao
         resultado <- n1 - n2
      senao
         se (operacao = "*") entao
            resultado <- n1 * n2
         senao
            se (operacao = "/") entao
               resultado <- n1 / n2
            fimse
         fimse
      fimse
   fimse

fimprocedimento

Var
   n1: REAL
   n2: REAL
   resultado: REAL
   operacao: CARACTERE

Inicio

   escreva("Digite a operação desejada (+, -, * ou /): ")
   leia(operacao)
   escreval("")
   escreva("Digite o primeiro número: ")
   leia(n1)
   escreval("")
   escreva("Digite o segundo número: ")
   leia(n2)
   escreval("")

   se ((operacao = "+") ou (operacao = "-") ou (operacao = "*") ou (operacao = "/")) entao
      calculoOperacao(n1, n2, operacao)

      escreval("")
      escreva("Primeiro número: ")
      escreva(n1:5:2)
      escreval("")
      escreva("Segundo número: ")
      escreva(n2:5:2)
      escreval("")
      escreva("Operação: ")
      escreva(operacao)
      escreval("")
      escreva("Resultado: ")
      escreva(resultado:5:2)
   senao
      escreval("Operação inválida. Tente novamente.")
   fimse

Fimalgoritmo