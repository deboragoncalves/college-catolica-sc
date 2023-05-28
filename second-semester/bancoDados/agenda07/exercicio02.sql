-- Considere o banco de dados de funcionários a seguir. Atributos sublinhados são chaves, atributos com mesmo nome em tabelas diferentes são chaves estrangeiras. Escreva as seguintes consultas SQL:
-- funcionario(nome_funcionario, rua, cidade) 
-- trabalha(nome_funcionario, nome_empresa, salario) 
-- empresa(nome_empresa, cidade) 
-- gerencia(nome_funcionario, nome_gerente) 

-- Note que nome_gerente também é uma chave estrangeira para a tabela funcionario, através do atributo nome_funcionario (ou seja, um funcionário pode ser um gerente).

-- a) Encontre todos o nomes, ruas e cidades de todos os funcionários que têm um salário maior do que R$ 3.000,00 
-- b) Encontre os nomes e as cidades dos funcionários que trabalham para a Tigre 
-- c) Encontre todas as empresas localizadas em Joinville 
-- d) Encontre todos os nomes de funcionários que moram na mesma cidade onde trabalham.

-- Resposta letra a
SELECT *
FROM funcionario
WHERE nome_funcionario IN (
    SELECT nome_funcionario 
    FROM trabalha
    WHERE salario > 3000;
);

-- Resposta letra b
SELECT nome_funcionario, cidade
FROM funcionario 
WHERE nome_funcionario IN (
    SELECT nome_funcionario
    FROM trabalha
    WHERE nome_empresa IN (
        SELECT nome_empresa 
        FROM empresa
        WHERE nome_empresa = 'Tigre';
     );
);

-- Resposta letra c
SELECT nome_empresa 
FROM empresa
WHERE cidade = 'Joinville';

-- Resposta letra d
SELECT f.nome_funcionario
FROM funcionario as f
INNER JOIN empresa as e
    ON f.cidade = e.cidade;
