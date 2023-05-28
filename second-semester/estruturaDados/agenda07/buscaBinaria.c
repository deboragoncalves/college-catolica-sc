#include <stdio.h>

int buscaBinaria(int tamanhoVetor, int* vetor, int numero) {

    int inicioVetor = 0;
    int fimVetor = tamanhoVetor - 1; // sempre inicia com 0
    int meioVetor;
    int numeroEncontrado = 0;
    
    // se existir elementos vetor. se inicio > fim, vetor foi percorrido
    while (inicioVetor <= fimVetor) {
        meioVetor = (inicioVetor + fimVetor) / 2;
        if (numero < vetor[meioVetor]) {
            // numero esta na primeira metade
            // mover o fim do vetor apontando para o ultimo elemento da primeira metade 
            fimVetor = meioVetor - 1;
        } else if (numero > vetor[meioVetor]) {
            // segunda metade
            // mover inicio vetor para primeiro elemento da segunda metade
            inicioVetor = meioVetor + 1;
        } else {
            // encontrado, retorna 1
            numeroEncontrado = 1;
            return numeroEncontrado;
        }
    }
    
    return numeroEncontrado;
}

int main()
{
    int tamanhoVetor;
    printf("Digite o tamanho do vetor: ");
    scanf("%d", &tamanhoVetor);

    int vetor[tamanhoVetor];
    
    for (int contador = 0; contador < tamanhoVetor; contador++) {
        printf("Digite o elemento %d do vetor, em ordem crescente: ", contador + 1);
        scanf("%d", &vetor[contador]);
    }
    
    int numero;
    printf("Digite o numero que deseja encontrar: ");
    scanf("%d", &numero);
    
    int numeroEncontrado = buscaBinaria(tamanhoVetor, vetor, numero);
    
    if (numeroEncontrado == 1) {
        printf("Valor encontrado: %d", numero);
    } else {
        printf("Valor nao encontrado");
    }
    
    return numeroEncontrado;    
}