import csv

# abrir arquivo
arquivoCsv = open("ocorrencia.csv", "rt", errors='ignore');
 
# ler arquivo
# csv.reader
reader = csv.reader(arquivoCsv, delimiter=";")
for linha in reader:
    print(linha);