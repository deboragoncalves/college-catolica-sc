// Construa um algoritmo que
// peça um número e exiba na tela se este número é impar ou par.

Algoritmo "Exercicio01 - Par ou impar"

Var
numero: REAL

Inicio
escreva("Digite um número: ")
leia(numero)

se (numero > 0) entao
   se (numero MOD 2 = 0) entao
      escreva("Número par ", numero)
   senao
        escreva("Número impar ", numero)
   fimse
senao
     escreval("Número inválido. Tente novamente")
fimse

Fimalgoritmo