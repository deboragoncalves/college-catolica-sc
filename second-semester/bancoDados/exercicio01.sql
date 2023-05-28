-- Considere o modelo do banco de dados da seguradora, utilizado no exercício da última Agenda:
-- pessoa(id_motorista, nome, endereco) 
-- carro(renavam, placa, modelo, ano) 
-- acidente(numero_ocorrencia, data, local) 
-- pertence(id_motorista, renavam) 
-- participacao(id_motorista, renavam, numero_ocorrencia, valor_dano) 

-- Atributos sublinhados são chaves, atributos com mesmo nome em tabelas diferentes são chaves estrangeiras. Escreva as seguintes consultas SQL:
-- a) Listar todas as pessoas que possuem um carro cujo modelo é Palio 
-- b) Incluir um acidente qualquer no banco de dados. Você pode escolher quaisquer valores para os atributos necessários. Note que para inserir um acidente, além da tabela acidente, você deve também inserir uma linha na tabela participacao!  
-- c) Remover o carro Peugeot 206 pertencente a João da Silva. Note que além da tabela carro, você deve remover a linha da tabela pertence. Como você pode obter o id_motorista de João da Silva, para poder removê-lo da tabela pertence? 
-- d) Encontre todos os nomes das pessoas que participaram de um acidente no ano de 2017.

-- Resposta Letra a
SELECT nome 
FROM pessoa
WHERE id_motorista IN (
    SELECT p.id_motorista
    FROM carro as c 
    INNER JOIN participacao as p
        ON c.renavam = p.renavam
    WHERE c.modelo = 'Palio';
);

-- Resposta Letra b
INSERT INTO acidente (numero_ocorrencia, data, local)
VALUES (10, '2023-05-24 22:00:00', 'Joinville - SC');

INSERT INTO participacao (id_motorista, renavam, numero_ocorrencia, valor_dano)
VALUES (12, '210250', 10, 3000);

-- Resposta Letra c
DELETE FROM carro
WHERE modelo = 'Peugeot 206'
AND renavam IN (
    SELECT renavam
    FROM pertence
    WHERE id_motorista IN (
        SELECT id_motorista 
        FROM pessoa
        WHERE nome = 'João da Silva';
    );
);

DELETE FROM pertence
WHERE id_motorista IN (
    SELECT id_motorista 
    FROM pessoa
    WHERE nome = 'João da Silva';
);

-- Resposta Letra d
SELECT nome 
FROM pessoa
WHERE id_motorista IN (
    SELECT p.id_motorista
    FROM pertence AS p
    WHERE p.renavam IN (
        SELECT c.renavam 
        FROM carro AS c 
        WHERE c.ano = '2017';
    );
);