import numpy;

empregados = [['Joao', 1400], ['Vitor', 2000], ['Ana', 2100], ['Pedro', 1200]];
matrizEmpregados = numpy.array(empregados);
aumento = 0.1;
novaMatrizEmpregados = [];

print("Matriz inicial:");
for dadosEmpregado in empregados:
  print(dadosEmpregado);

for dadosEmpregado in matrizEmpregados:
  linhaEmpregado = numpy.array(dadosEmpregado);
  novaLinhaEmpregado = [];
  for infoEmpregado in linhaEmpregado:
    if infoEmpregado.isdigit():
      infoEmpregado = float(infoEmpregado);
      novaLinhaEmpregado.append((infoEmpregado * aumento) + infoEmpregado);
    else:
      novaLinhaEmpregado.append(infoEmpregado);
  
  novaMatrizEmpregados.append(novaLinhaEmpregado);

print("");
print("Matriz atualizada apos aumento salarial de 10%:");
for dadosEmpregado in novaMatrizEmpregados:
  print(dadosEmpregado);