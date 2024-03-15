# abrir arquivo
arquivoOcorrencias = open("ocorrenciasJoinville.txt", "rt");
for linha in arquivoOcorrencias.readlines():
    print(linha);