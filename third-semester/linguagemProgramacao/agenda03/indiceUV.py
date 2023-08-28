print("Informe o indice UV:");
indiceUV = int(input());

if indiceUV <= 2:
    print("BAIXO");

elif indiceUV > 2 and indiceUV <= 5:
    print("MODERADO");

elif indiceUV > 5 and indiceUV <= 7:
    print("ALTO");

elif indiceUV > 7 and indiceUV <= 10:
    print("MUITO ALTO");

else:
    print("EXTREMO");