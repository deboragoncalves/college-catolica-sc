-- Considere o modelo relacional abaixo, referente a um banco de dados de uma empresa de seguros. 
-- Escreva o código SQL para criar as tabelas. 
-- Considere que os atributos sublinhados são as chaves e atributos com o mesmo nome são chaves estrangeiras, entre as tabelas:

-- pessoa(id_motorista, nome, endereco) 
-- carro(renavam, placa, modelo, ano) 
-- acidente(numero_ocorrencia, data, local) 
-- pertence(id_motorista, renavam) 
-- participacao(id_motorista, renavam, numero_ocorrencia, valor_dano) 
 
-- Os campos: placa, modelo, local, nome, endereco possuem tipo caracter. 

-- O campo data possui tipo data. O campo valor_dano possui tipo real. Os outros campos possuem tipo numérico.

CREATE TABLE pessoa (
    id_motorista INT NOT NULL AUTOINCREMENT,
    nome VARCHAR(100),
    endereco VARCHAR(100),
    PRIMARY KEY(id_motorista)
);


CREATE TABLE carro (
    renavam INT NOT NULL,
    placa VARCHAR(100),
    modelo VARCHAR(100),
    ano INT,
    PRIMARY KEY (renavam)
);


CREATE TABLE acidente (
    numero_ocorrencia INT NOT NULL,
    data DATE,
    local VARCHAR(100),
    PRIMARY KEY (numero_ocorrencia)
);


CREATE TABLE pertence (
    id_motorista INT NOT NULL,
    renavam INT,
    PRIMARY KEY (id_motorista),
    FOREIGN KEY (id_motorista) REFERENCES pessoa (id_motorista),
    FOREIGN KEY (renavam) REFERENCES carro (renavam)
);


CREATE TABLE participacao (
    id_motorista INT NOT NULL,
    renavam INT,
    numero_ocorrencia INT,
    valor_dano REAL,
    PRIMARY KEY (id_motorista),
    FOREIGN KEY (id_motorista) REFERENCES pessoa (id_motorista),
    FOREIGN KEY (renavam) REFERENCES carro (renavam),
    FOREIGN KEY (numero_ocorrencia) REFERENCES acidente (numero_ocorrencia)
);