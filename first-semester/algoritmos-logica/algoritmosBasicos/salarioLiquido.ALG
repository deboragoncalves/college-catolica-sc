// Construa um algoritmo que peça o salário bruto mensal
// e o nome de um funcionário, calcule e apresente os valores conforme modelo abaixo:

Algoritmo "Exercicio 05 - Salário"

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

escreval("Digite seu salário bruto:")
leia(salarioBruto)

se (salarioBruto > 0) entao
   impostoRenda <- salarioBruto * (15 / 100)
   inss <- salarioBruto * (11 / 100)
   sindicado <- salarioBruto * (3 / 100)
   
   somatorioDescontos <- impostoRenda + inss + sindicado
   salarioLiquido <- salarioBruto - somatorioDescontos
   
   escreval()
   escreval("Funcionário: " + nome)
   escreva("Salário bruto: R$ ")
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
   escreva("Salário Líquido: R$ ")
   escreva(salarioLiquido)
senao
     escreval("Valor inválido. Tente novamente.")
fimse

Fimalgoritmo