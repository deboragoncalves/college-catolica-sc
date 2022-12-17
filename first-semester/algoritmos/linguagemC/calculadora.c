#include <stdio.h>

int main()
{

    int n1, n2, soma, subtracao, multiplicacao, divisao;

    printf("Digite o 1o numero: \n");

    scanf("%i", &n1);

    printf("Digite o 2o numero: \n");

    scanf("%i", &n2);

    soma = n1 + n2;

    subtracao = n1 - n2;

    multiplicacao = n1 * n2;

    divisao = n1 / n2;

    printf("\n");

    printf("Soma: %i\n", soma);

    printf("Subtracao: %i\n", subtracao);

    printf("Multiplicacao: %i \n", multiplicacao);

    printf("Divisao: %i \n", divisao);

    return 0;
}