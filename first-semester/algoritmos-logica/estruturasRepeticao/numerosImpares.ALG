// Construa um algoritmo que mostre somente os números ímpares de 1 a 20 (inclusive)

Algoritmo "Exercicio01 - Impares"

Var
   contador: REAL

Inicio

   contador <- 0;

   enquanto ((contador >= 0) E (contador <= 20)) faca
      se (contador MOD 2 <> 0) entao
         escreva("Número impar: ")
         escreva(contador)
         escreval("")
      fimse
      contador <- contador + 1;
   fimenquanto

Fimalgoritmo