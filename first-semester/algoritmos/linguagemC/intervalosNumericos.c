#include <stdio.h>

#include <string.h>

int main()
{

    int n1, n2, numeroAuxiliar;

    printf("Digite dois valores inteiros: ");

    scanf("%d%d", &n1, &n2);

    char resultado[100];

    printf("Numero 1: %d\n", n1);

    printf("Numero 2: %d\n", n2);

    if (n1 == n2)
    {

        strcpy(resultado, "Numeros iguais.");

        printf("Resultado: %s\n", resultado);
    }
    else if (n2 > n1)
    {

        numeroAuxiliar = n1 + 1;

        while (n2 > numeroAuxiliar)
        {

            printf("Numero: %d\n", numeroAuxiliar);

            numeroAuxiliar = numeroAuxiliar + 1;
        }
    }
    else if (n1 > n2)
    {

        numeroAuxiliar = n2 + 1;

        while (n1 > numeroAuxiliar)
        {

            printf("Numero: %d\n", numeroAuxiliar);

            numeroAuxiliar = numeroAuxiliar + 1;
        }
    }
}
