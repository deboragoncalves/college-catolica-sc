#include <stdio.h>
#include <stdlib.h>

// estrutura vai ter o tipo de dado da lista e o ponteiro
typedef struct estruturaNumeros {
	int numero;
	// ponteiro tem que ser do mesmo tipo da estrutura 
    // ponteiro sempre ira apontar para o proximo item
    // no ultimo item da lista, ponteiro aponta para null
	struct estruturaNumeros *ponteiro;
} typeDefEstruturaNumeros;


int main()
{
    // lista encadeada possui 2 ponteiros
    // declarando ponteiro que aponta para o inicio da lista
    typeDefEstruturaNumeros * ponteiroInicioLista;

    // declarando ponteiro que aponta para o proximo elemento
    typeDefEstruturaNumeros * ponteiroProximoElemento;

    // malloc - se der sucesso, retorna um ponteiro. se der erro, retorna null. recebe como parametro a variável size_t, que representa o numero de bytes
    // size_of - retorna o tamanho do tipo da variável, em bytes
    ponteiroInicioLista = (typeDefEstruturaNumeros *) malloc(sizeof(typeDefEstruturaNumeros));

    // se ponteiro for null, erro, sair do programa
    if (ponteiroInicioLista == NULL) {
    	exit(1);
    }

    ponteiroProximoElemento = ponteiroInicioLista;

    // preencher lista tamanho 3
    for (int contador = 1; contador <= 3; contador++) {
    	// imprimir texto
    	printf("Digite o elemento %d da lista: \n", contador);
    	
    	// ler item da lista
    	// ponteiro aponta para variavel numero, que é o dado da lista
    	scanf("%d", &ponteiroProximoElemento -> numero);
    	
    	// imprimir variavel lida
    	printf("Elemento %d: %d \n", contador, ponteiroProximoElemento -> numero);
    	
    	// pulando linha
    	printf("\n");
    }
    
    return 0;
}
