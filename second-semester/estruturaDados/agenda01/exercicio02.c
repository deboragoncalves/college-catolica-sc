#include <stdio.h>

// Escreva um programa em C que receba do usuário elementos, 
// que serão inseridos em um vetor. 
// Faça com que seu programa encontre o menor e o maior elementos no vetor. 
// Por fim, mostre esses valores na tela.

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

    int maiorNumero = 0;
    int menorNumero = 9999;

    for(contador = 0; contador < tamanhoVetor; contador++) {
        int numeroAtual = listaInteiros[contador];
        
        if (numeroAtual > maiorNumero) {
            maiorNumero = numeroAtual;
        }
        
        if (numeroAtual < menorNumero) {
            menorNumero = numeroAtual;
        }
        
    }
    
    printf("Menor número: %d\n", menorNumero);
    printf("Maior número: %d\n", maiorNumero);

    return 0;
}


