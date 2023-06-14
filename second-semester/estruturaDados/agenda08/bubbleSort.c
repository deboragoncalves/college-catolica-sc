#include <stdio.h>

int main()
{
    int tamanhoArray = 14;
    int arrayNumeros[14] = {45, 7, 10, 4, 13, 17, 20, 16, 41, 21, 38, 43, 31, 2};
    int contador, contadorAuxiliar;
    int numeroAuxiliar;

    printf("Ordem inicial do array: \n");
    
    for (contador = 0; contador < tamanhoArray; contador++) {
        printf("%d ", arrayNumeros[contador]);
    }
    
    for (contador = 1; contador < tamanhoArray; contador++) {
        for (contadorAuxiliar = 0; contadorAuxiliar < tamanhoArray - 1; contadorAuxiliar++) {
            // ordenacao Bubble Sort
            // verificar se item atual é maior que item anterior
            // se sim trocar, se não manter
            
            if (arrayNumeros[contadorAuxiliar] > arrayNumeros[contadorAuxiliar + 1]) {
                numeroAuxiliar = arrayNumeros[contadorAuxiliar];
                arrayNumeros[contadorAuxiliar] = arrayNumeros[contadorAuxiliar + 1];
                arrayNumeros[contadorAuxiliar + 1] = numeroAuxiliar;
            }
        }
    }
    
    printf("\n\n");
    printf("Array ordenado: \n");
    
    for (contador = 0; contador < tamanhoArray; contador++) {
        printf("%d ", arrayNumeros[contador]);
    }

    return 0;
}
