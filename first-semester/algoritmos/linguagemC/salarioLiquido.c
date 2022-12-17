#include <stdio.h>

int main()

{

    float salarioBruto, IR, INSS, sindicato, salarioLiquido;

    printf("Digite o salario bruto de um funcionario: \n");

    scanf("%f", &salarioBruto);

    IR = 0.15 * salarioBruto;

    INSS = 0.11 * salarioBruto;

    sindicato = 0.03 * salarioBruto;

    salarioLiquido = salarioBruto - (IR + INSS + sindicato);

    printf("\n");

    printf("Salario Bruto:            R$ %.2f\n", salarioBruto);

    printf("(-) IR        (15%%):     R$ %.2f\n", IR);

    printf("(-) INSS      (11%%):     R$ %.2f\n", INSS);

    printf("(-) Sindicato (3%%):      R$ %.2f\n", sindicato);

    printf("Salario Liquido:          R$ %.2f\n", salarioLiquido);

    return 0;
}