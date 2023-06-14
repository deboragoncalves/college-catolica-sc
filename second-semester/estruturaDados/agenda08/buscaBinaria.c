#include <stdio.h>

// recursiva - funcao que chama a si mesma
int buscaBinariaRecursiva(int *vetor, int numeroBuscado, int inicio, int fim) {
    int meio;
    
    if (inicio <= fim) {
        meio = (inicio + fim) / 2;
        if (vetor[meio] == numeroBuscado) {
            // retornar indice do numero encontrado
            return meio;
        } else {
            // numero maior ou menor que meio
            if (numeroBuscado < vetor[meio]) {
                // mudar apontamento do fim. fim = meio-1
                return buscaBinariaRecursiva(vetor, numeroBuscado, inicio, meio - 1);
            } else {
                // mudar apontamento do inicio. inicio = meio+1
                return buscaBinariaRecursiva(vetor, numeroBuscado, meio + 1, fim);
            }
            
        }
    }
    
    // numero nao encontrado
    return -1; 
}

int main()
{
    int tamanhoVetor;
    printf("Digite o tamanho do vetor: ");
    scanf("%d", &tamanhoVetor);

    int vetor[tamanhoVetor];
    
    printf("\n");
    for (int contador = 0; contador < tamanhoVetor; contador++) {
        printf("Digite o elemento %d do vetor: ", contador + 1);
        scanf("%d", &vetor[contador]);
    }

    printf("\n");
    printf("Ordem inicial do vetor: ");
    
    for (int contador = 0; contador < tamanhoVetor; contador++) {
        printf("%d ", vetor[contador]);
    }

    // ordenar vetor usando bubbleSort
    
    for (int contador = 1; contador < tamanhoVetor; contador++) {
        for (int contadorAuxiliar = 0; contadorAuxiliar < tamanhoVetor - 1; contadorAuxiliar++) {
            
            // verificar se item atual é maior que item anterior
            // se sim trocar, se não manter

            if (vetor[contadorAuxiliar] > vetor[contadorAuxiliar + 1]) {
                int numeroAuxiliar = vetor[contadorAuxiliar];
                vetor[contadorAuxiliar] = vetor[contadorAuxiliar + 1];
                vetor[contadorAuxiliar + 1] = numeroAuxiliar;
            }
        }
    }
    
    printf("\n\n");
    printf("Vetor ordenado: ");
    for (int contador = 0; contador < tamanhoVetor; contador++) {
        printf("%d ", vetor[contador]);
    }

    
    int numero;
    printf("\n\n");
    printf("Digite o numero que deseja encontrar: ");
    scanf("%d", &numero);
    
    int resultadoBusca = buscaBinariaRecursiva(vetor, numero, 0, tamanhoVetor - 1);
    printf("\n");
    printf("Resultado Busca Binaria Recursiva: ");  
    
    if (resultadoBusca == -1) {
        printf("Numero %d nao encontrado", numero);
    } else {
        printf("Numero %d esta na posicao %d", numero, resultadoBusca);
    }
    
    return 0;
}
