// Fa�a um algoritmo que receba nome e 3 notas de N alunos,
//  
//  
// verifique se ele est� aprovado ( >=7) em exame (entre 5 e 7) ou reprovado (< 5).
// Mostre nome, m�dia e situa��o. O programa dever� solicitar se deseja
// ou n�o parar depois de cada aluno. Mostre tamb�m a quantidade de alunos digitados.

Algoritmo "Exercicio04 - Notas"

Var
   quantidadeAlunos: INTEIRO
   nome: CARACTERE
   nota1: REAL
   nota2: REAL
   nota3: REAL
   totalNotas: REAL
   mediaNotas: REAL
   situacao: CARACTERE
   prosseguir: INTEIRO
   contador: INTEIRO

Inicio

   escreval("Digite a quantidade de alunos: ")
   leia(quantidadeAlunos)

   se (quantidadeAlunos <> 0) entao
      contador <- 1
      escreval("")

      enquanto ((quantidadeAlunos >= contador) E (contador > 0)) faca
         escreval("")
         escreva("Nome do aluno: ")
         leia(nome)

         escreval("")
         escreva("Digite a primeira nota: ")
         leia(nota1)

         escreval("")
         escreva("Digite a segunda nota: ")
         leia(nota2)

         escreval("")
         escreva("Digite a terceira nota: ")
         leia(nota3)

         se ((nota1 <> 0) ou (nota2 <> 0) ou (nota3 <> 0)) entao
            totalNotas <- nota1 + nota2 + nota3
            mediaNotas <- totalNotas / 3

            se (mediaNotas >= 7) entao
               situacao <- "Aprovado"
            senao
               se ((mediaNotas >= 5) E (mediaNotas < 7)) entao
                  situacao <- "Em exame"
               senao
                  situacao <- "Reprovado"
               fimse

            fimse

            escreval("")
            escreva("Nome: ")
            escreva(nome)
            escreval("")
            escreva("M�dia: ")
            escreva(mediaNotas:2:1)
            escreval("")
            escreva("Situa��o: ")
            escreva(situacao)
            escreval("")
            escreva("Quantidade de alunos digitados: ")
            escreva(contador)

            se (quantidadeAlunos <> contador) entao
               escreval("")
               escreval("Deseja continuar para o pr�ximo aluno? Digite 1 (positivo) e 0 (interromper): ")
               leia(prosseguir)

               se (prosseguir = 1) entao
                  contador <- contador + 1
               senao
                  contador <- 0
               fimse
            senao
               contador <- 0
            fimse

         senao
            escreva("Notas inv�lidas. Tente novamente.")
            contador <- 0
         fimse
      fimenquanto

   senao
      escreval("Quantidade de alunos inv�lida. Tente novamente.")
   fimse

Fimalgoritmo