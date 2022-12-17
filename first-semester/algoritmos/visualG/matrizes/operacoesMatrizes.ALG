Algoritmo "Exercicio01 - Matrizes"

procedimento exibirMenu()

inicio
   escreval("Digite uma opção para o menu:")
   escreval("1 - Soma das matrizes")
   escreval("2 - Subtração das matrizes")
   escreval("3 - Multiplicação das matrizes")
   escreval("4 - Transposta das matrizes")
   escreval("5 - Diagonal principal")
   escreval("6 - Sair do menu")
fimprocedimento

procedimento operacaoMenu(opcaoUsuario: INTEIRO)

inicio
   se ((opcaoUsuario >= 1) E (opcaoUsuario <= 6)) entao
      se (opcaoUsuario = 1) entao
         somaMatrizes()
      senao
         se (opcaoUsuario = 2) entao
            subtracaoMatrizes()
         senao
            se (opcaoUsuario = 3) entao
               multiplicacaoMatrizes()
            senao
               se (opcaoUsuario = 4) entao
                  transpostaMatrizes()
               senao
                  se (opcaoUsuario = 5) entao
                     diagonalPrincipalMatrizes()
                  fimse
               fimse
            fimse
         fimse
      fimse

      se (opcaoUsuario <> 6) entao
         escreval("")
         exibirMenu()
         leia(opcaoUsuario)
         operacaoMenu(opcaoUsuario)
      fimse
   senao
      escreval("Opção inválida. Tente novamente.")
      escreval("")
      exibirMenu()
      leia(opcaoUsuario)
      operacaoMenu(opcaoUsuario)
   fimse

fimprocedimento

procedimento somaMatrizes()
var
   matriz1: vetor[1..5, 1..5] de REAL
   matriz2: vetor[1..5, 1..5] de REAL
   linha: INTEIRO
   coluna: INTEIRO
inicio

   escreval("  ")
   para linha de 1 ate 5 faca
      para coluna de 1 ate 5 faca
         escreva("Matriz 1 - Digite um valor para a linha ", linha, " e coluna ", coluna, ": ")
         leia(matriz1[linha, coluna])
      fimpara
   fimpara

   escreval("  ")
   para linha de 1 ate 5 faca
      para coluna de 1 ate 5 faca
         escreva("Matriz 2 - Digite um valor para a linha ", linha, " e coluna ", coluna, ": ")
         leia(matriz2[linha, coluna])
      fimpara
   fimpara

   escreval("  ")
   escreval("Matriz 1: ")
   para linha de 1 ate 5 faca
      para coluna de 1 ate 5 faca
         escreva(matriz1[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

   escreval("  ")
   escreval("Matriz 2: ")
   para linha de 1 ate 5 faca
      para coluna de 1 ate 5 faca
         escreva(matriz2[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

   escreval("  ")
   escreval("Matriz Resultante - Soma das matrizes 1 e 2: ")
   para linha de 1 ate 5 faca
      para coluna de 1 ate 5 faca
         matrizResultadoSoma[linha, coluna] <- matriz1[linha, coluna] + matriz2[linha, coluna]
      fimpara
   fimpara

   escreval("  ")
   para linha de 1 ate 5 faca
      para coluna de 1 ate 5 faca
         escreva(matrizResultadoSoma[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

fimprocedimento

procedimento subtracaoMatrizes()
var
   matriz: vetor[1..6, 1..6] de REAL
   linha: INTEIRO
   coluna: INTEIRO
   numeroSubtracao: REAL
inicio

   escreval("  ")
   para linha de 1 ate 6 faca
      para coluna de 1 ate 6 faca
         escreva("Matriz - Digite um valor para a linha ", linha, " e coluna ", coluna, ": ")
         leia(matriz[linha, coluna])
      fimpara
   fimpara

   escreval(" ")
   escreva("Digite o número para subtrair dos elementos da matriz: ")
   leia(numeroSubtracao)

   escreval("  ")
   escreval("Matriz: ")
   para linha de 1 ate 6 faca
      para coluna de 1 ate 6 faca
         escreva(matriz[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

   escreval("  ")
   escreva("Matriz Resultante - Subtracao do numero ", numeroSubtracao, " da matriz: ")
   para linha de 1 ate 6 faca
      para coluna de 1 ate 6 faca
         matrizResultadoSubtracao[linha, coluna] <- matriz[linha, coluna] - numeroSubtracao
      fimpara
   fimpara

   escreval("  ")
   para linha de 1 ate 6 faca
      para coluna de 1 ate 6 faca
         escreva(matrizResultadoSubtracao[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

fimprocedimento

procedimento multiplicacaoMatrizes()
var
   matriz1: vetor[1..3, 1..3] de REAL
   matriz2: vetor[1..3, 1..3] de REAL
   linha: INTEIRO
   coluna: INTEIRO
inicio

   escreval("  ")
   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         escreva("Matriz 1 - Digite um valor para a linha ", linha, " e coluna ", coluna, ": ")
         leia(matriz1[linha, coluna])
      fimpara
   fimpara

   escreval("  ")
   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         escreva("Matriz 2 - Digite um valor para a linha ", linha, " e coluna ", coluna, ": ")
         leia(matriz2[linha, coluna])
      fimpara
   fimpara

   escreval("  ")
   escreval("Matriz 1: ")
   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         escreva(matriz1[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

   escreval("  ")
   escreval("Matriz 2: ")
   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         escreva(matriz2[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

   escreval("  ")
   escreval("Matriz Resultante - Multiplicação das matrizes 1 e 2: ")
   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         matrizResultadoMultiplicacao[linha, coluna] <- matriz1[linha, coluna] * matriz2[linha, coluna]
      fimpara
   fimpara

   escreval("  ")
   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         escreva(matrizResultadoMultiplicacao[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

fimprocedimento

procedimento transpostaMatrizes()

var
   transpostaSoma: vetor[1..5, 1..5] de REAL
   transpostaSubtracao: vetor[1..6, 1..6] de REAL
   transpostaMultiplicacao: vetor[1..3, 1..3] de REAL
   linha: INTEIRO
   coluna: INTEIRO
inicio
   para linha de 1 ate 5 faca
      para coluna de 1 ate 5 faca
         transpostaSoma[linha, coluna] <- matrizResultadoSoma[coluna, linha]
      fimpara
   fimpara

   escreval("  ")
   escreval("Matriz transposta - Opção 1:")
   para linha de 1 ate 5 faca
      para coluna de 1 ate 5 faca
         escreva(transpostaSoma[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

   para linha de 1 ate 6 faca
      para coluna de 1 ate 6 faca
         transpostaSubtracao[linha, coluna] <- matrizResultadoSubtracao[coluna, linha]
      fimpara
   fimpara

   escreval("  ")
   escreval("Matriz transposta - Opção 2:")
   para linha de 1 ate 6 faca
      para coluna de 1 ate 6 faca
         escreva(transpostaSubtracao[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         transpostaMultiplicacao[linha, coluna] <- matrizResultadoMultiplicacao[coluna, linha]
      fimpara
   fimpara

   escreval("  ")
   escreval("Matriz transposta - Opção 3:")
   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         escreva(transpostaMultiplicacao[linha, coluna])
      fimpara
      escreval("  ")
   fimpara

fimprocedimento


procedimento diagonalPrincipalMatrizes()

var
   diagonalPrincipalOpcao1: REAL
   diagonalPrincipalOpcao2: REAL
   diagonalPrincipalOpcao3: REAL
   linha: INTEIRO
   coluna: INTEIRO
inicio
   diagonalPrincipalOpcao1 <- 0
   diagonalPrincipalOpcao2 <- 0
   diagonalPrincipalOpcao3 <- 0

   para linha de 1 ate 5 faca
      para coluna de 1 ate 5 faca
         se (linha = coluna) entao
            diagonalPrincipalOpcao1 <- diagonalPrincipalOpcao1 + matrizResultadoSoma[linha, coluna]
         fimse
      fimpara
   fimpara

   para linha de 1 ate 6 faca
      para coluna de 1 ate 6 faca
         se (linha = coluna) entao
            diagonalPrincipalOpcao2 <- diagonalPrincipalOpcao2 + matrizResultadoSubtracao[linha, coluna]
         fimse
      fimpara
   fimpara

   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         se (linha = coluna) entao
            diagonalPrincipalOpcao3 <- diagonalPrincipalOpcao3 + matrizResultadoMultiplicacao[linha, coluna]
         fimse
      fimpara
   fimpara

   escreval("")
   escreval("Soma da diagonal principal - Opção 1: ", diagonalPrincipalOpcao1)
   escreval("Soma da diagonal principal - Opção 2: ", diagonalPrincipalOpcao2)
   escreval("Soma da diagonal principal - Opção 3: ", diagonalPrincipalOpcao3)

fimprocedimento

Var
   opcaoUsuario: INTEIRO
   matrizResultadoSoma: vetor[1..5, 1..5] de REAL
   matrizResultadoSubtracao: vetor[1..6, 1..6] de REAL
   matrizResultadoMultiplicacao: vetor[1..3, 1..3] de REAL
Inicio
   exibirMenu()
   leia(opcaoUsuario)
   operacaoMenu(opcaoUsuario)
Fimalgoritmo