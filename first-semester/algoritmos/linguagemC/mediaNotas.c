#include <stdio.h>

int main()

{

    float n1, n2, n3, n4, somaNotas, mediaNotas;

    printf("Digite a 1a nota: \n");

    scanf("%f", &n1);

    printf("Digite a 2a nota: \n");

    scanf("%f", &n2);

    printf("Digite a 3a nota: \n");

    scanf("%f", &n3);

    printf("Digite a 4a nota: \n");

    scanf("%f", &n4);

    somaNotas = n1 + n2 + n3 + n4;

    mediaNotas = somaNotas / 4;

    printf("\n");

    printf("Media das notas: %.1f\n", mediaNotas);

    return 0;
}