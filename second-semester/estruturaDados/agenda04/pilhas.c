#include <stdio.h>

struct pilha {
    int vetorInteiros[5];
    int topo;
};

int main() {
    // declarando pilha
    struct pilha p;
    
    // inicializando, apontando topo para posicao -1
    p.topo = -1;
    
    printf("Inserindo elementos na pilha: \n");
    
    for (int contador = 0; contador < 5; contador++) {
        int novoElemento;
                
        printf("Digite o valor a ser inserido na pilha: \n");
        scanf("%d", &novoElemento);
                
        // incrementar topo, para inserir sempre na proxima posicao
        // topo inicia na posicao -1, incrementa pra ir para posicao 0, posicao inicial do vetor
        // assim por diante...
        p.topo += 1;
        p.vetorInteiros[p.topo] = novoElemento;
    }
    
    printf("\n");
    printf("Imprimindo elementos da pilha: ");
    for (int contador = 0; contador <= p.topo; contador++) {
        printf("%d ", p.vetorInteiros[contador]);
    }
    
    printf("\n");
    printf("Removendo ultimo elemento da pilha: %d", p.vetorInteiros[p.topo]);
    // diminuir topo
    p.topo -=1;
    
    printf("\n");
    printf("Imprimindo elementos da pilha após remover ultimo elemento: ");
    for (int contador = 0; contador <= p.topo; contador++) {
        printf("%d ", p.vetorInteiros[contador]);
    }
    
}
