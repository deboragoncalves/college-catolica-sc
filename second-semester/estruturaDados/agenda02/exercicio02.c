#include <stdio.h>

/*
Tendo como base o exercício 02 da agenda 01, escreva um programa que imprima 
a soma dos números 1 até o menor número do vetor. 

Você irá criar uma função dentro do programa original que receberá 
o menor número encontrado no vetor e, recursivamente, 
fará a soma dos números de 1 a N. 

*/

int main() {
    int tamanhoVetor, contador, elementoVetor;
    
    printf("Informe o tamanho do vetor: \n");
    scanf("%d", &tamanhoVetor);
    
    int listaInteiros[tamanhoVetor];
    
    printf("\n");
    printf("Preencha os valores do vetor: \n");
    for(contador = 0; contador < tamanhoVetor; contador++) {
        printf("Digite o elemento %d: ", contador + 1);
        scanf("%d", &elementoVetor);
        listaInteiros[contador] = elementoVetor;
    }
    
    printf("\n");

    int menorNumero = 9999;

    // determinando menor numero
    for(contador = 0; contador < tamanhoVetor; contador++) {
        int numeroAtual = listaInteiros[contador];
        
        if (numeroAtual < menorNumero) {
            menorNumero = numeroAtual;
        }
        
    }
    
    printf("Menor número: %d\n", menorNumero);

    // somando menores numeros
    int somaNumeros = somarMenoresNumeros(menorNumero);
    printf("Soma dos menores números: %d\n", somaNumeros);

    return 0;
}

int somarMenoresNumeros(int menorNumero) {
    int somaNumeros = 0;

    if (menorNumero != 0) {
        somaNumeros = menorNumero + somarMenoresNumeros(menorNumero - 1);
    }

    return somaNumeros;
}