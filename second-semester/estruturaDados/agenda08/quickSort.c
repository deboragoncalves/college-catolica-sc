#include <stdio.h>
#include <stdlib.h>

int compararNumerosCrescente(const void* n1, const void* n2) {
    // convertendo pra inteiro
    if (*(int*) n1 == *(int*) n2) {
        return 0;
    } else if (*(int*) n1 < *(int*) n2) {
        return -1;
    } else if (*(int*) n1 > *(int*) n2) {
        return 1;
    }
}

int main()
{
    int tamanhoArray = 14;
    int arrayNumeros[14] = {45, 7, 10, 4, 13, 17, 20, 16, 41, 21, 38, 43, 31, 2};
    int contador;

    printf("Ordem inicial do array: \n");
    
    for (contador = 0; contador < tamanhoArray; contador++) {
        printf("%d ", arrayNumeros[contador]);
    }

    // QuickSort
    // usar funcao nativa do C
    // 3o argumento é o tamanho de cada elemento do array
    // 4o é a funcao de ordenação, retornando 0 se iguais, -1 se n2 > n1 e 1 se n1 > n2 
    qsort(arrayNumeros, tamanhoArray, sizeof(tamanhoArray), compararNumerosCrescente);
    
    printf("\n\n");
    printf("Array ordenado: \n");
    
    for (contador = 0; contador < tamanhoArray; contador++) {
        printf("%d ", arrayNumeros[contador]);
    }

    return 0;
}
