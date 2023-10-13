from funcionario import Funcionario

funcionario1 = Funcionario("Teste", 1000);
print("Funcionario:", funcionario1.nome);
print("Funcionario - Salario Inicial:", funcionario1.salario);
aumentoSalarial = 0.1
funcionario1.conceder_aumento(aumentoSalarial);
print("Funcionario - Salario Final com aumento de 10%:", funcionario1.salario);

print("");
funcionario2 = Funcionario("Debora", 2000);
print("Funcionario:", funcionario2.nome);
print("Funcionario - Salario Inicial:", funcionario2.salario);
aumentoSalarial = 0.1
funcionario2.conceder_aumento(aumentoSalarial);
print("Funcioanrio - Salario Final com aumento de 10%:", funcionario2.salario);