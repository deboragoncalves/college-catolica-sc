-- Considere o modelo relacional a seguir, que representa uma biblioteca de uma empresa.
-- Os atributos sublinhados são as chaves.
-- Atributos com o mesmo nome são chaves estrangeiras, entre as tabelas. 
-- Todos os atributos são de tipo caracter, à exceção de isbn, num_emp e idade. 
-- O atributo data é de tipo data. Escreva o código SQL para criar as tabelas em um banco de dados relacional.

-- funcionario(num_emp, nome, escritorio, idade) 
-- livros(isbn, titulo, autores, editora) 
-- emprestimo(num_emp, isbn, data) 

CREATE TABLE funcionario (
    num_emp INT NOT NULL,
    nome VARCHAR(100),
    escritorio VARCHAR(100),
    idade INT,
    PRIMARY KEY (num_emp)
);


CREATE TABLE livros (
    isbn INT NOT NULL,
    titulo VARCHAR(100),
    autores VARCHAR (100),
    editora VARCHAR (100),
    PRIMARY KEY (isbn)
);


CREATE TABLE emprestimo (
    isbn INT NOT NULL,
    num_emp INT,
    data DATE,
    PRIMARY KEY (isbn),
    FOREIGN KEY (isbn) REFERENCES livros (isbn),
    FOREIGN KEY (num_emp) REFERENCES funcionario (num_emp)
);