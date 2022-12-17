#include <stdio.h>

int main()

{

    int n1, n2, n3;

    printf("Digite tres valores inteiros: ");

    scanf("%d%d%d", &n1, &n2, &n3);

    int maior, menor, meio;

    if (n3 > n2 && n3 > n1)
    {

        maior = n3;
    }
    else if (n2 > n3 && n2 > n1)
    {

        maior = n2;
    }
    else
    {

        maior = n1;
    }

    if (n3 < n2 && n3 < n1)
    {

        menor = n3;
    }
    else if (n2 < n3 && n2 < n1)
    {

        menor = n2;
    }
    else
    {

        menor = n1;
    }

    if ((maior == n2 && menor == n1) || (maior == n1 && menor == n2))
    {

        meio = n3;
    }
    else if ((maior == n2 && menor == n3) || (maior == n3 && menor == n2))
    {

        meio = n1;
    }
    else
    {

        meio = n2;
    }

    printf("Valores em ordem decrescente: %d, %d e %d\n", maior, meio, menor);
}