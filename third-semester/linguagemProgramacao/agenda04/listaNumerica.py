listaInteiros = [];
contador = 0;

print("Populando lista de inteiros com 5 itens: ");

while contador < 5:
    print("");
    print("Informe um numero: ");
    numero = int(input());
    listaInteiros.append(numero);
    contador += 1;

contador = 0;
print("");
print("Imprimindo valores da lista:");

for numero in listaInteiros:
    print(numero);