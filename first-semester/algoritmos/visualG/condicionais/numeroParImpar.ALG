// Construa um algoritmo que
// pe�a um n�mero e exiba na tela se este n�mero � impar ou par.

Algoritmo "Exercicio01 - Par ou impar"

Var
numero: REAL

Inicio
escreva("Digite um n�mero: ")
leia(numero)

se (numero > 0) entao
   se (numero MOD 2 = 0) entao
      escreva("N�mero par ", numero)
   senao
        escreva("N�mero impar ", numero)
   fimse
senao
     escreval("N�mero inv�lido. Tente novamente")
fimse

Fimalgoritmo