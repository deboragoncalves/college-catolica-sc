// Tarifa b�sica: residencial � R$ 12,50;
// Tarifa b�sica: comercial � R$ 21,15;
// Liga��es locais (para fixo ou celular): R$ 0,75 o minuto
// Liga��es interurbanas (para fixo ou celular): R$ 0,99 o minuto
// Sobre o valor da conta, � adicionada uma taxa de 18% para o
// Fundo Nacional de Telecomunica��es (FNT).

Algoritmo "Exercicio05"
Var
   tarifaBasicaResidencial: REAL
   tarifaBasicaComercial: REAL
   ligacaoLocal: REAL
   ligacaoInterurbana: REAL
   taxa: REAL

   telefone: CARACTERE
   tipoTelefone: REAL
   minutosLocal: REAL
   minutosInterurbana: REAL

   totalTarifaLocal: REAL
   totalTarifaInterurbana: REAL
   totalTarifas: REAL
   totalTarifasTaxa: REAL
Inicio

   escreva("Digite o seu telefone: ")
   leia(telefone)

   escreva("Digite o tipo de telefone (1 residencial e 2 para comercial): ")
   leia(tipoTelefone)

   escreva("Digite o total de minutos utilizados em chamadas locais: ")
   leia(minutosLocal)

   escreva("Digite o total de minutos utilizados em chamadas interurbanas: ")
   leia(minutosInterurbana)

   se (Compr(telefone) > 5) entao
      se (tipoTelefone = 1) ou (tipoTelefone = 2) entao
         se (minutosLocal > 0) e (minutosInterurbana > 0) entao
         
            tarifaBasicaResidencial <- 1250 / 100
            tarifaBasicaComercial <- 2115 / 100
            ligacaoLocal <- 75 / 100
            ligacaoInterurbana <- 99 / 100
            taxa <- 18 / 100
            
            se (tipoTelefone = 1) entao
               totalTarifaLocal <- tarifaBasicaResidencial + (ligacaoLocal * minutosLocal)
               totalTarifaInterurbana <- tarifaBasicaResidencial + (ligacaoInterurbana * minutosInterurbana)
            fimse

            se (tipoTelefone = 2) entao
               totalTarifaLocal <- tarifaBasicaComercial + (ligacaoLocal * minutosLocal)
               totalTarifaInterurbana <- tarifaBasicaComercial + (ligacaoInterurbana * minutosInterurbana)
            fimse
            
            totalTarifas <- totalTarifaLocal + totalTarifaInterurbana
            totalTarifasTaxa <- totalTarifas + (totalTarifas * taxa)
            
            escreval("")
            escreva("Tipo de linha: ", tipoTelefone)
            escreval("")
            escreva("Total - Tarifa local (fixo ou celular): R$ ", totalTarifaLocal:10:2)
            escreval("")
            escreva("Total - Tarifa interurbana (fixo ou celular): R$ ", totalTarifaInterurbana:10:2)
            escreval("")
            escreva("Total sem taxa FNT: R$ ", totalTarifas:10:2)
            escreval("")
            escreva("Taxa FNT: R$ ", totalTarifas * taxa:10:2)
            escreval("")
            escreva("Total com taxa FNT: R$ ", totalTarifasTaxa:10:2)
         senao
            escreval("Os minutos informados s�o inv�lidos. Tente novamente.")
         fimse
      senao
         escreval("Tipo de telefone inv�lido. Tente novamente.")
      fimse
   senao
      escreval("Telefone inv�lido. Tente novamente")
   fimse
Fimalgoritmo