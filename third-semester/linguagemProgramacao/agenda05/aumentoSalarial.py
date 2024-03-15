matrizAumentoSalarial = [['Joao', 1400], ['Vitor', 2000], ['Ana', 2100], ['Pedro', 1200]];
aumento = 0.1;
novoSalario = 0;
novaMatriz = [];

for lista in matrizAumentoSalarial:
    novoSalario = (lista[1] * aumento) + lista[1];
    novosDadosFuncionario = [lista[0], novoSalario];
    novaMatriz.append(novosDadosFuncionario);
    print(novosDadosFuncionario);

# imprimindo matriz
print(novaMatriz);

