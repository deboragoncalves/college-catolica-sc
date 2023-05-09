#include <stdio.h>
// Parte 01: Criar duas variáveis do mesmo tipo e atribuir um valor inicial.
// Parte 02: Criar uma função que receba as referências a estas variáveis 
// e inverta (o conteúdo da primeira vai para a segunda e vice e versa).

void invertendoValores(int a, int b) {
    int variavelReferencia = a;
    a = b;
    b = variavelReferencia;
    printf("\n");
    printf("Invertendo valores: \n");
    printf("Valor A: %d\n", a);
    printf("Valor B: %d", b);
}

int main()
{
    int variavelA = 5;
    int variavelB = 2;
    printf("Valores iniciais: \n");
    printf("Valor A: %d\n", variavelA);
    printf("Valor B: %d", variavelB);
    
    invertendoValores(variavelA, variavelB);
    return 0;
}
