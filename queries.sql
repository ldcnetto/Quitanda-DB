-- Inserindo um novo cliente
INSERT INTO Clientes (nome, email, telefone, cep_cliente, n_residencial) 
VALUES ('Mariana Oliveira', 'mariana.oliveira@email.com', 81123456789, 50080000, 10);

-- Atualizando o telefone de um funcionário
UPDATE Funcionarios 
SET telefone = 81987654321 
WHERE id = 1;

-- Deletando um produto do estoque
DELETE FROM Estoque
WHERE id_produto = 2;

COMMIT;

-- Exemplos de consultas
-- Selecionar todos os clientes
SELECT * FROM Clientes;

-- Selecionar nome e telefone dos clientes
SELECT nome, telefone FROM Clientes;

-- Selecionar endereços no bairro Boa Vista
SELECT * FROM Enderecos WHERE bairro = 'Boa Vista';

-- Selecionar nomes distintos dos clientes
SELECT DISTINCT nome FROM Clientes;

-- Selecionar nome do cliente e do funcionário que realizaram uma venda em uma data específica
SELECT c.nome AS cliente_nome, f.nome AS funcionario_nome 
FROM Clientes c
JOIN Vendas v ON c.id = v.id_cliente
JOIN Funcionarios f ON v.id_funcionario = f.id
WHERE v.data_hora = '2023-10-26 10:00:00';

-- União de clientes e funcionários
SELECT nome AS pessoa, telefone AS contato, 'Cliente' AS tipo FROM Clientes
UNION
SELECT nome AS pessoa, telefone AS contato, 'Funcionário' AS tipo FROM Funcionarios;

-- Junção interna entre clientes e funcionários
SELECT c.nome AS cliente_nome, c.telefone AS cliente_telefone,
       f.nome AS funcionario_nome, f.telefone AS funcionario_telefone
FROM Clientes c
INNER JOIN Vendas v ON c.id = v.id_cliente
INNER JOIN Funcionarios f ON v.id_funcionario = f.id;

-- Diferença entre clientes e funcionários
SELECT * FROM Clientes
WHERE id NOT IN (SELECT id FROM Funcionarios);

-- Produto cartesiano entre clientes e funcionários
SELECT * FROM Clientes
CROSS JOIN Funcionarios;

-- Selecionar clientes que moram em Recife
SELECT * FROM Clientes
WHERE cep_cliente IN (SELECT cep FROM Enderecos WHERE cidade = 'Recife');

-- Selecionar clientes cujo nome começa com 'A'
SELECT * FROM Clientes WHERE nome LIKE 'A%';

-- Ordenar clientes por nome em ordem ascendente
SELECT * FROM Clientes ORDER BY nome ASC;

-- Contar o número de clientes
SELECT COUNT(*) FROM Clientes;

-- Agrupar endereços por cidade e contar quantos existem em cada cidade
SELECT cidade, COUNT(*) FROM Enderecos GROUP BY cidade;