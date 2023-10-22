import os
import csv

infoCidade = list()

os.remove("ocorrenciasJoinville.txt")
ocorrenciasJoinville = open('ocorrenciasJoinville.txt', 'a')

with open('ocorrencia.csv', 'r', errors='ignore') as ocorrenciaArquivo:
   csvLeitura = csv.reader(ocorrenciaArquivo, delimiter=';')
   for index, linha in enumerate(csvLeitura):
    cidade = linha[8]
    codigo_ocorrencia = linha[0]
    ocorrencia_classificacao = linha[5]
    ocorrencia_dia = linha[12]
    investigacao_status = linha[15]
    if cidade == 'JOINVILLE':
        infoCidade.append(codigo_ocorrencia + " | " + ocorrencia_classificacao + " | " + ocorrencia_dia + " | " + investigacao_status + "\n")

ocorrenciasJoinville.writelines(infoCidade)
