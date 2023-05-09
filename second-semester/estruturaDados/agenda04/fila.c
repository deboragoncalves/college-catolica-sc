#include <stdio.h>

struct fila {
    int vetorInteiros[5];
    int fim;
};

int main() {
    // inicializando fila
    struct fila f;
    
    // todos os elementos com valor 0
    for (int contador = 0; contador < 5; contador++) {
        f.vetorInteiros[contador] = 0;
    }

    // fim apontando para posicao inicial 0
    f.fim = 0;
    
    // inserindo dados na fila
    printf("Inserindo elementos na fila:\n");
    
    for (int contador = 0; contador < 5; contador++) {
        int novoElemento;
            
        printf("Digite o novo elemento a ser inserido na fila:\n");
        scanf("%d", &novoElemento);
        
        // fim aponta para posicao 0 no inicio
        // e vai sendo incrementado para inserir as proximas posicoes
        f.vetorInteiros[f.fim] = novoElemento;
        f.fim += 1;
    }

    // imprimindo dados na fila
    printf("\n\n");
    printf("Imprimindo elementos na fila após remover primeiro elemento:\n");
    
    for (int contador = 0; contador < 5; contador++) {
        printf("%d ", f.vetorInteiros[contador]);
    }
    
    // removendo dados da fila
    int elementoInicial = f.vetorInteiros[0];
    printf("\n\n");

    printf("Removendo primeiro elemento da fila: %d", elementoInicial);

    // reposicionar elementos
    // o elemento que estava na posicao 1 vai para posicao 0 e assim por diante
	for (int contador = 0; contador < f.fim; contador++) {
	    f.vetorInteiros[contador] = f.vetorInteiros[contador + 1];
    }
    
    f.fim--;
    
    // imprimindo dados na fila
    printf("\n\n");
    printf("Imprimindo elementos na fila:\n");
    
    for (int contador = 0; contador < f.fim; contador++) {
        printf("%d ", f.vetorInteiros[contador]);
    }
}
