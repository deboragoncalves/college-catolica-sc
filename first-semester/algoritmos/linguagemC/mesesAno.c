#include <stdio.h>

#include <string.h>

int main()
{

    int n1;

    printf("Digite um numero de 1 a 12: ");

    scanf("%d", &n1);

    char resultado[100];

    switch (n1)
    {

    case 1:

        strcpy(resultado, "Janeiro");

        break;

    case 2:

        strcpy(resultado, "Fevereiro");

        break;

    case 3:

        strcpy(resultado, "Marco");

        break;

    case 4:

        strcpy(resultado, "Abril");

        break;

    case 5:

        strcpy(resultado, "Maio");

        break;

    case 6:

        strcpy(resultado, "Junho");

        break;

    case 7:

        strcpy(resultado, "Julho");

        break;

    case 8:

        strcpy(resultado, "Agosto");

        break;

    case 9:

        strcpy(resultado, "Setembro");

        break;

    case 10:

        strcpy(resultado, "Outubro");

        break;

    case 11:

        strcpy(resultado, "Novembro");

        break;

    case 12:

        strcpy(resultado, "Dezembro");

        break;

    default:

        strcpy(resultado, "Mes invalido.");

        break;
    }

    printf("Numero: %d\n", n1);

    printf("Resultado: %s", resultado);
}