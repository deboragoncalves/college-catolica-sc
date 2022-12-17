// Faça um algoritmo para receber o nome de 2 times de futebol
// e quantos gols cada time marcou em  um jogo.
// Escrever o nome do time vencedor.
// Caso não haja vencedor deverá ser impressa a palavra EMPATE.

Algoritmo "Exercicio03 - Times de futebol"

Var
   time1: CARACTERE
   time2: CARACTERE
   golsTime1: REAL
   golsTime2: REAL
   resultado: CARACTERE

Inicio

   escreva("Digite o primeiro time: ")
   leia(time1)

   escreva("Digite quantos gols marcou o primeiro time: ")
   leia(golsTime1)

   escreva("Digite o segundo time: ")
   leia(time2)

   escreva("Digite quantos gols marcou o segundo time: ")
   leia(golsTime2)

   se ((Compr(time1) > 0) e (Compr(time2) > 0)) entao
      se (golsTime1 > 0) e (golsTime2 > 0) entao
         se (golsTime1 > golsTime2) entao
            escreva("Time 1: ", time1)
            escreval("")
            escreva("Gols do time 1: ", golsTime1)
            escreval("")
            escreva("Time 2: ", time2)
            escreval("")
            escreva("Gols do time 2: ", golsTime2)
            
            resultado <- "O time 1 " + time1 + " venceu."
         senao
              se (golsTime2 > golsTime1) entao
                 resultado <- "O time 2 " + time2 + " venceu."
              senao
                   resultado <- "Os times empataram."
              fimse
         fimse
         
         escreval(resultado)
      senao
         escreval("Número de gols inválidos. Tente novamente.")
      fimse
   senao
      escreval("Times inválidos. Tente novamente.")
   fimse

Fimalgoritmo