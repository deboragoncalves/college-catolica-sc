#include <stdio.h>

#include <string.h>

int main()
{

    int numeroAlunos, mediaAluno, mediaTurma = 0, somaMediasAlunos = 0;

    printf("Digite o numero de alunos: ");

    scanf("%d", &numeroAlunos);

    char resultado[100];

    for (int index = 1; index <= numeroAlunos; index++)
    {

        int n1, n2, n3;

        printf("Digite tres valores inteiros das notas do aluno ");

        printf("%d", index);

        printf(": ");

        scanf("%d%d%d", &n1, &n2, &n3);

        mediaAluno = (n1 + n2 + n3) / 3;

        printf("Media do aluno ");

        printf("%d", index);

        printf(": ");

        printf("%d", mediaAluno);

        printf("\n\n");

        somaMediasAlunos += mediaAluno;
    }

    mediaTurma = somaMediasAlunos / numeroAlunos;

    printf("Numero de alunos: %d\n", numeroAlunos);
    printf("Media da turma: %d", mediaTurma);
}