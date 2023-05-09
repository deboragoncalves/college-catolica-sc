#include <stdio.h>
#include <stdlib.h>

typedef struct no {
	int valor;
	// ponteiro que vai apontar para subarvore direita e esquerda
	struct no* direita;
	struct no* esquerda;
}NoArvoreBinaria;

NoArvoreBinaria* inserirElemento(NoArvoreBinaria* raiz, int numero) {
	if (raiz == NULL) {
		// fazer alocação de memória
		// criar novo no
		NoArvoreBinaria* noAuxiliar = malloc(sizeof(NoArvoreBinaria));
		// apontar para o campo valor
		noAuxiliar -> valor = numero;
		// raiz é nula, primeiro no, ponteiros nulos	
		noAuxiliar -> esquerda = NULL;
		noAuxiliar -> direita = NULL;
		return noAuxiliar;
    } else {
	    // a partir do segundo elemento, verificar se numero a ser inserido é menor que a raiz
        // chamar funcao pra inserir novamente, passando o ponteiro da esquerda

        if (numero < raiz -> valor) {
        // inserir esquerda
        // esquerda vai ser null quando só tem o nó raiz
            raiz -> esquerda = inserirElemento(raiz -> esquerda, numero);
        } else {
        // direita
            raiz -> direita = inserirElemento(raiz -> direita, numero);
        }
        // sempre retornar o ponteiro

        return raiz;
	
    } 
}

NoArvoreBinaria* removerNoSemFilhos(NoArvoreBinaria* raiz, int elementoRemover) {
    // verificar se arvore esta vazia 
    if (raiz == NULL) {
        printf("Elemento não encontrado na árvore binária. Tente novamente.\n");
        return NULL;
    } else {
        // ver onde está o elemento a ser removido
        if (raiz -> valor == elementoRemover) {
            // elemento encontrado
            // se for igual ao elemento raiz, verificar se no possui filhos
            // se ambos os ponteiros for null, no não tem filho, desalocar espaço na memória - free
            free(raiz);
            printf("\n");
            printf("Elemento removido: %d", elementoRemover);
            printf("\n");
            // apontar ponteiro para NULL
            return NULL;
        } else {
            // procurar elemento
            // ver se é menor que o no raiz, se for, percorrer arvore esquerda
            if (raiz -> valor > elementoRemover) {
                raiz -> esquerda = removerNoSemFilhos(raiz -> esquerda, elementoRemover);
            } else {
                raiz -> direita = removerNoSemFilhos(raiz -> direita, elementoRemover);
            }

            return raiz;
        }
    }
}

void imprimirArvore(NoArvoreBinaria* raiz) {
	// verificar se é nula a raiz
	if (raiz != NULL) {
    	// imprimir raiz
    	printf("%d ", raiz -> valor);
    	// imprimir tudo a esquerda, passando o ponteiro da esquerda
    	imprimirArvore(raiz -> esquerda);
    	// imprimir tudo a direita
        imprimirArvore(raiz -> direita);
    }
}

int main() {
    // criar ponteiro com raiz nula
    NoArvoreBinaria* raiz = NULL;
    // primeiro no
    raiz = inserirElemento(raiz, 50);
    raiz = inserirElemento(raiz, 25);
    raiz = inserirElemento(raiz, 100);
	printf("Arvore binaria: \n");
    imprimirArvore(raiz);
    
    raiz = removerNoSemFilhos(raiz, 100);
    printf("Arvore binaria: \n");
    imprimirArvore(raiz);
    
}
