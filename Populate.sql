-- Inserindo dados na tabela Enderecos

INSERT INTO Enderecos (cep, logradouro, bairro, cidade, tipo) VALUES
  (50010000, 'Rua da Aurora', 'Boa Vista', 'Recife', 'Cliente'),
  (50020000, 'Rua do Bom Jesus', 'Santo Antônio', 'Recife', 'Cliente'),
  (50030000, 'Rua do Príncipe', 'Boa Vista', 'Recife', 'Cliente'),
  (50040000, 'Avenida Beberibe', 'Beberibe', 'Recife', 'Cliente'),
  (50050000, 'Avenida Conde da Boa Vista', 'Boa Vista', 'Recife', 'Cliente'),
  (50060000, 'Rua da Imperatriz', 'Santo Antônio', 'Recife', 'Cliente'),
  (50070000, 'Avenida Sul', 'Santo Antônio', 'Recife', 'Cliente'),
  (50080000, 'Rua do Apolo', 'Boa Vista', 'Recife', 'Funcionario'),
  (50090000, 'Rua do Sol', 'Boa Vista', 'Recife', 'Funcionario'),
  (50100000, 'Rua da Lua', 'Santo Antônio', 'Recife', 'Funcionario'),
  (50110000, 'Avenida da Estrela', 'Boa Vista', 'Recife', 'Funcionario'),
  (50120000, 'Avenida da Constelação', 'Beberibe', 'Recife', 'Funcionario'),
  (50130000, 'Rua da Paz', 'Boa Vista', 'Recife', 'Fornecedor'),
  (50140000, 'Rua da Alegria', 'Santo Antônio', 'Recife', 'Fornecedor'),
  (50150000, 'Avenida da Esperança', 'Boa Vista', 'Recife', 'Fornecedor'),
  (50160000, 'Avenida da Vitória', 'Boa Vista', 'Recife', 'Transportadora'),
  (50170000, 'Rua da Liberdade', 'Santo Antônio', 'Recife', 'Transportadora');

-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (nome, email, telefone, cep_cliente, n_residencial) VALUES
  ('Ana Maria Silva', 'ana.silva@email.com', 81999999999, 50010000, 123),
  ('João Pedro Santos', 'joao.santos@email.com', 81888888888, 50020000, 456),
  ('Maria da Luz Oliveira', 'maria.oliveira@email.com', 81777777777, 50030000, 789),
  ('Carlos Eduardo Costa', 'carlos.costa@email.com', 81666666666, 50040000, 101),
  ('Fernanda Alves Souza', 'fernanda.souza@email.com', 81555555555, 50050000, 202),
  ('Luiz Henrique Santos', 'luiz.santos@email.com', 81444444444, 50060000, 303);

-- Inserindo dados na tabela Cargos
INSERT INTO Cargos (descricao) VALUES
  ('Gerente de Loja'),
  ('Vendedor'),
  ('Caixa'),
  ('Estoquista');

-- Inserindo dados na tabela Funcionarios
INSERT INTO Funcionarios (cpf, nome, id_cargo, telefone, cep_funcionario, n_residencial) VALUES
  ('11122233344', 'Ana Paula Oliveira', 1, 81999999999, 50090000, 101),
  ('55566677788', 'Bruno Silva Santos', 2, 81888888888, 50100000, 202),
  ('99900011122', 'Carla Maria Costa', 3, 81777777777, 50110000, 303),
  ('44455566677', 'Daniel Ferreira', 4, 81666666666, 50120000, 404);

-- Inserindo dados na tabela Fornecedores
INSERT INTO Fornecedores (razao_social, telefone, email, cep_fornecedor, n_comercial) VALUES
  ('Empresa A LTDA', 81444444444, 'empresaA@email.com', 50130000, 10),
  ('Empresa B LTDA', 81333333333, 'empresaB@email.com', 50140000, 20),
  ('Empresa C LTDA', 81222222222, 'empresaC@email.com', 50150000, 30);

-- Inserindo dados na tabela Fornecedor_PF
INSERT INTO Fornecedor_PF (cpf, razao_social, id_fornecedor) VALUES
  ('88899900011', 'José da Silva', 1),
  ('12345678901', 'Maria Oliveira', 2);

-- Inserindo dados na tabela Fornecedor_PJ
INSERT INTO Fornecedor_PJ (cnpj, razao_social, id_fornecedor) VALUES
  ('12345678901234', 'Empresa X LTDA', 3);

-- Inserindo dados na tabela Transportadoras
INSERT INTO Transportadoras (cnpj, razao_social, email, telefone, cep_transportadora, n_comercial) VALUES
  ('00011122233445', 'Transportadora Alpha', 'alpha@email.com', 81111111111, 50160000, 40),
  ('55566677788990', 'Transportadora Beta', 'beta@email.com', 81222222222, 50170000, 50);

-- Inserindo dados na tabela Produtos
INSERT INTO Produtos (descricao, preco) VALUES
  ('Camiseta', 29.90),
  ('Calça Jeans', 99.90),
  ('Sapato', 149.90),
  ('Blusa de frio', 49.90),
  ('Short', 39.90),
  ('Vestido', 79.90);

-- Inserindo dados na tabela Produtos_fornecedores
INSERT INTO Produtos_fornecedores (id_produto, id_fornecedor) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 1),
  (5, 2),
  (6, 3);

-- Inserindo dados na tabela Formas_pagamento
INSERT INTO Formas_pagamento (descricao) VALUES
  ('Dinheiro'),
  ('Cartão de Crédito'),
  ('Cartão de Débito'),
  ('Pix');

-- Inserindo dados na tabela Vendas
INSERT INTO Vendas (id_cliente, id_funcionario, data_hora, id_pagamento) VALUES
  (1, 1, '2023-10-26 10:00:00', 1),
  (2, 2, '2023-10-27 14:30:00', 2),
  (3, 3, '2023-10-28 16:15:00', 3),
  (4, 4, '2023-10-29 18:00:00', 4);

-- Inserindo dados na tabela Itens_venda
INSERT INTO Itens_venda (id_venda, id_produto) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4);

-- Inserindo dados na tabela Estoque
INSERT INTO Estoque (id_produto, quantidade, data, id_funcionario) VALUES
  (1, 100, '2023-10-26', 4),
  (2, 50, '2023-10-26', 3),
  (3, 20, '2023-10-26', 2),
  (4, 75, '2023-10-26', 1);