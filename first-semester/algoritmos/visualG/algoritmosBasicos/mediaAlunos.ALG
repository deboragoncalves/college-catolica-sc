// Construa um algoritmo que receba o nome e 4 notas de um aluno, exiba a média e o nome do aluno

Algoritmo "Exercicio 03 - Notas"

Var
nomeAluno01: CARACTERE
notaAluno01: REAL

nomeAluno02: CARACTERE
notaAluno02: REAL

nomeAluno03: CARACTERE
notaAluno03: REAL

nomeAluno04: CARACTERE
notaAluno04: REAL

somaNotas: REAL
mediaNotas: REAL

Inicio
escreval("Calcular a média de notas de 4 alunos:")
escreval("Digite o nome do primeiro aluno:")
leia(nomeAluno01)

escreval("Digite a nota do primeiro aluno:")
leia(notaAluno01)

se (notaAluno01 > 0) entao

   escreval()
   escreval("Nome do primeiro aluno:")
   escreval(nomeAluno01)
   escreval("Nota do primeiro aluno:")
   escreval(notaAluno01)

   escreval()
   escreval("Digite o nome do segundo aluno:")
   leia(nomeAluno02)
   
   escreval("Digite a nota do segundo aluno:")
   leia(notaAluno02)
   
   se (notaAluno02 > 0) entao
   
      escreval()
      escreval("Nome do segundo aluno:")
      escreval(nomeAluno02)
      escreval("Nota do segundo aluno:")
      escreval(notaAluno02)
   
      escreval()
      escreval("Digite o nome do terceiro aluno:")
      leia(nomeAluno03)

      escreval("Digite a nota do terceiro aluno:")
      leia(notaAluno03)
      
      se (notaAluno03 > 0) entao

         escreval()
         escreval("Nome do terceiro aluno:")
         escreval(nomeAluno03)
         escreval("Nota do segundo aluno: ")
         escreval(notaAluno03)
      
         escreval()
         escreval("Digite o nome do quarto aluno:")
         leia(nomeAluno04)

         escreval("Digite a nota do quarto aluno:")
         leia(notaAluno04)
      
         escreval()
         escreval("Nome do quarto aluno:")
         escreval(nomeAluno04)
         escreval("Nota do quarto aluno:")
         escreval(notaAluno04)
      
         somaNotas <- notaAluno01 + notaAluno02 + notaAluno03 + notaAluno04
         mediaNotas <- somaNotas / 4;

         escreval()
         escreval("Soma dos notas:")
         escreval(somaNotas)
         escreval()
         escreval("Média dos alunos:")
         escreval(mediaNotas)

      senao
           escreva("Nota do segundo aluno invalida. Tente novamente.")
      fimse
   
   senao
        escreva("Nota do segundo aluno invalida. Tente novamente.")
   fimse

senao
   escreva("Nota do primeiro aluno invalida. Tente novamente.")
fimse
Fimalgoritmo