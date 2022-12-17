// Em uma eleição da CIPA na empresa “Carreta S.A” existem 2 candidatos.
// 1,2 = voto para os respectivos candidatos;
// 3 = voto nulo;
// 4 = voto em branco;
// Elabore um algoritmo que leia o código do candidato e um voto. Calcule e escreva:
// total geral de votos

// total de votos para cada um dos candidatos;

// total de votos nulos;

// total de votos em branco;

// candidato vencedor;

// O algoritmo deve perguntar se o usuário quer continuar digitando votos.

Algoritmo "Exercicio05 - Votação"

Var
   voto: INTEIRO
   totalVotos: INTEIRO
   totalCandidato1: INTEIRO
   totalCandidato2: INTEIRO
   totalNulo: INTEIRO
   totalBranco: INTEIRO
   resultado: CARACTERE
   prosseguir: INTEIRO
   contador: INTEIRO
Inicio

   contador <- 1
   totalVotos <- 0
   totalCandidato1 <- 0
   totalCandidato2 <- 0
   totalNulo <- 0
   totalBranco <- 0
   prosseguir <- 0

   enquanto (contador <> 0) faca
      escreva("Digite o seu voto: ")
      leia(voto)
      escreval("")

      se ((voto = 1) ou (voto = 2) ou (voto = 3) ou (voto = 4)) entao
         se (voto = 1) entao
            totalCandidato1 <- totalCandidato1 + 1
         senao
            se (voto = 2) entao
               totalCandidato2 <- totalCandidato2 + 1
            senao
               se (voto = 3) entao
                  totalNulo <- totalNulo + 1
               senao
                  totalBranco <- totalBranco + 1
               fimse
            fimse

         fimse

         totalVotos <- totalVotos + 1

         escreval("")
         escreva("Deseja prosseguir com a votação? Digite 1 (prosseguir) ou 0 (parar): " )
         leia(prosseguir)

         se (prosseguir = 1) entao
            contador <- contador + 1
         senao
            contador <- 0
         fimse

      senao
         escreval("")
         escreva("Voto inválido. Tente novamente.")
         contador <- 0
      fimse
   fimenquanto

   se (totalCandidato1 > totalCandidato2) entao
      resultado <- "Candidato 1 venceu"
   senao
      se (totalCandidato2 > totalCandidato1) entao
         resultado <- "Candidato 2 venceu"
      senao
         resultado <- "Os candidatos empataram em número de votos"
      fimse
   fimse

   escreval("")
   escreva("Total de votos: ")
   escreva(totalVotos)
   escreval("")
   escreva("Total de votos - Candidato 1: ")
   escreva(totalCandidato1)
   escreval("")
   escreva("Total de votos - Candidato 2: ")
   escreva(totalCandidato2)
   escreval("")
   escreva("Total de votos nulos: ")
   escreva(totalNulo)
   escreval("")
   escreva("Total de votos em branco: ")
   escreva(totalBranco)
   escreval("")
   escreva("Resultado da eleição: ")
   escreva(resultado)

Fimalgoritmo