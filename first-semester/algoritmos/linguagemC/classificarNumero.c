#include <stdio.h>
#include <string.h>

int main()

{

    int n1;

    printf("Digite um numero: ");

    scanf("%d", &n1);

    char resultado[100];

    if (n1 > 0)
    {

        strcpy(resultado, "Numero positivo.");
    }
    else if (n1 < 0)
    {

        strcpy(resultado, "Numero negativo.");
    }
    else if (n1 == 0)
    {

        strcpy(resultado, "Numero zero.");
    }

    printf("Numero: %d\n", n1);

    printf("Resultado: %s", resultado);
}
