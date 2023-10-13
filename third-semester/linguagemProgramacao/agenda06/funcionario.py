class Funcionario:
    def __init__(self, nome, salario):
        self.nome = nome
        self.salario = salario

    def conceder_aumento(self, percentual):
        self.salario = self.salario + (self.salario * percentual)