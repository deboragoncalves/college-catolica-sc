// Construa um algoritmo que pe�a o sal�rio bruto mensal
// e o nome de um funcion�rio, calcule e apresente os valores conforme modelo abaixo:

Algoritmo "Exercicio 05 - Sal�rio"

Var
nome: CARACTERE
salarioBruto: REAL

impostoRenda: REAL
inss: REAL
sindicado: REAL
somatorioDescontos: REAL

salarioLiquido: REAL
Inicio
escreval("Digite seu nome:")
leia(nome)

escreval("Digite seu sal�rio bruto:")
leia(salarioBruto)

se (salarioBruto > 0) entao
   impostoRenda <- salarioBruto * (15 / 100)
   inss <- salarioBruto * (11 / 100)
   sindicado <- salarioBruto * (3 / 100)
   
   somatorioDescontos <- impostoRenda + inss + sindicado
   salarioLiquido <- salarioBruto - somatorioDescontos
   
   escreval()
   escreval("Funcion�rio: " + nome)
   escreva("Sal�rio bruto: R$ ")
   escreva(salarioBruto)
   
   escreval()
   escreva("(-) IR (15%): R$ ")
   escreva(impostoRenda)
   escreval()
   escreva("(-) INSS (11%): R$ ")
   escreva(inss)
   escreval()
   escreva("(-) Sindicado (3%): R$ ")
   escreva(sindicado)
   
   escreval()
   escreva("Sal�rio L�quido: R$ ")
   escreva(salarioLiquido)
senao
     escreval("Valor inv�lido. Tente novamente.")
fimse

Fimalgoritmo