// crie um pseudoc�digo para um programa de avalia��o de m�dia de alunos

Algoritmo "Media de Alunos"

Var
notaAluno: REAL
contador: REAL
somaNotas: REAL
mediaNotas: REAL

Inicio
escreval("Calcular a m�dia de notas de um aluno:")
escreval("Digite a nota do aluno. Se quiser parar digite 0:")
leia(notaAluno)
contador <- 1

enquanto ((notaAluno <> 0)) faca
   escreval("")
   somaNotas <- somaNotas + notaAluno
   escreval("Digite a nota do aluno:")
   leia(notaAluno)
   
   se (notaAluno <> 0) entao
       contador <- contador + 1
   fimse

fimenquanto

mediaNotas <- somaNotas / contador
escreval("")
escreval("M�dia de notas de aluno:")
escreval(mediaNotas:2:1)

escreval("")
se (mediaNotas < 6) entao
   escreval("Reprovado")
senao
   escreval("Aprovado")
fimse

Fimalgoritmo