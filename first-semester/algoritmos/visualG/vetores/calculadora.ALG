// Fa�a um algoritmo para simular uma calculadora simples,
// o usu�rio dever� informar 2 n�meros e a opera��o que deseja fazer
// (adi��o, subtra��o, divis�o ou multiplica��o),
// utilize procedimento para realizar o c�lculo e retornar o resultado.

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

   escreva("Digite a opera��o desejada (+, -, * ou /): ")
   leia(operacao)
   escreval("")
   escreva("Digite o primeiro n�mero: ")
   leia(n1)
   escreval("")
   escreva("Digite o segundo n�mero: ")
   leia(n2)
   escreval("")

   se ((operacao = "+") ou (operacao = "-") ou (operacao = "*") ou (operacao = "/")) entao
      calculoOperacao(n1, n2, operacao)

      escreval("")
      escreva("Primeiro n�mero: ")
      escreva(n1:5:2)
      escreval("")
      escreva("Segundo n�mero: ")
      escreva(n2:5:2)
      escreval("")
      escreva("Opera��o: ")
      escreva(operacao)
      escreval("")
      escreva("Resultado: ")
      escreva(resultado:5:2)
   senao
      escreval("Opera��o inv�lida. Tente novamente.")
   fimse

Fimalgoritmo