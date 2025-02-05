-- Criando a tabela Enderecos
CREATE TABLE Enderecos (
  cep INT UNSIGNED PRIMARY KEY COMMENT 'CEP do endereço (apenas números)',
  logradouro VARCHAR(50) NOT NULL COMMENT 'Nome da rua, avenida, etc.',
  bairro VARCHAR(50) NOT NULL COMMENT 'Bairro do endereço',
  cidade VARCHAR(20) NOT NULL COMMENT 'Cidade do endereço',
  tipo ENUM('Cliente', 'Funcionario', 'Fornecedor', 'Transportadora') NOT NULL COMMENT 'Tipo de endereço (Cliente, Funcionario, Fornecedor, Transportadora)'
) COMMENT = 'Tabela que armazena os endereços de clientes, funcionários, fornecedores e transportadoras';

-- Criando a tabela Clientes
CREATE TABLE Clientes (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID único do cliente',
  nome VARCHAR(60) NOT NULL COMMENT 'Nome completo do cliente',
  email VARCHAR(100) COMMENT 'Endereço de e-mail do cliente',
  telefone BIGINT UNSIGNED NOT NULL COMMENT 'Número de telefone do cliente (apenas números)',
  cep_cliente INT UNSIGNED NOT NULL COMMENT 'CEP do endereço do cliente',
  n_residencial INT UNSIGNED NOT NULL COMMENT 'Número residencial do cliente',
  FOREIGN KEY (cep_cliente) REFERENCES Enderecos (cep) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que armazena informações dos clientes';

-- Criando a tabela Cargos
CREATE TABLE Cargos (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID único do cargo',
  descricao VARCHAR(40) NOT NULL COMMENT 'Descrição do cargo'
) COMMENT = 'Tabela que armazena os cargos dos funcionários';

-- Criando a tabela Funcionarios
CREATE TABLE Funcionarios (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID único do funcionário',
  cpf CHAR(11) NOT NULL UNIQUE COMMENT 'CPF do funcionário (apenas números)',
  nome VARCHAR(60) NOT NULL COMMENT 'Nome completo do funcionário',
  id_cargo INT NOT NULL COMMENT 'ID do cargo do funcionário',
  telefone BIGINT UNSIGNED NOT NULL COMMENT 'Número de telefone do funcionário (apenas números)',
  cep_funcionario INT UNSIGNED COMMENT 'CEP do endereço do funcionário',
  n_residencial INT UNSIGNED COMMENT 'Número residencial do funcionário',
  FOREIGN KEY (id_cargo) REFERENCES Cargos (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (cep_funcionario) REFERENCES Enderecos (cep) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que armazena informações dos funcionários';

-- Criando a tabela Fornecedores
CREATE TABLE Fornecedores (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID único do fornecedor',
  razao_social VARCHAR(60) NOT NULL COMMENT 'Razão social do fornecedor',
  telefone BIGINT UNSIGNED NOT NULL COMMENT 'Número de telefone do fornecedor (apenas números)',
  email VARCHAR(100) NOT NULL COMMENT 'Endereço de e-mail do fornecedor',
  cep_fornecedor INT UNSIGNED COMMENT 'CEP do endereço do fornecedor',
  n_comercial INT UNSIGNED COMMENT 'Número comercial do fornecedor',
  FOREIGN KEY (cep_fornecedor) REFERENCES Enderecos (cep) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que armazena informações dos fornecedores';

-- Criando a tabela Fornecedor_PF (Pessoa Física)
CREATE TABLE Fornecedor_PF (
  cpf CHAR(11) PRIMARY KEY COMMENT 'CPF do fornecedor pessoa física (apenas números)',
  razao_social VARCHAR(60) COMMENT 'Razão social do fornecedor pessoa física',
  id_fornecedor INT NOT NULL COMMENT 'ID do fornecedor associado',
  FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores (id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que armazena informações de fornecedores pessoa física';

-- Criando a tabela Fornecedor_PJ (Pessoa Jurídica)
CREATE TABLE Fornecedor_PJ (
  cnpj VARCHAR(14) PRIMARY KEY COMMENT 'CNPJ do fornecedor pessoa jurídica (apenas números)',
  razao_social VARCHAR(60) COMMENT 'Razão social do fornecedor pessoa jurídica',
  id_fornecedor INT NOT NULL COMMENT 'ID do fornecedor associado',
  FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores (id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que armazena informações de fornecedores pessoa jurídica';

-- Criando a tabela Transportadoras
CREATE TABLE Transportadoras (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID único da transportadora',
  cnpj VARCHAR(14) NOT NULL UNIQUE COMMENT 'CNPJ da transportadora (apenas números)',
  razao_social VARCHAR(60) NOT NULL COMMENT 'Razão social da transportadora',
  email VARCHAR(100) NOT NULL COMMENT 'Endereço de e-mail da transportadora',
  telefone BIGINT UNSIGNED NOT NULL COMMENT 'Número de telefone da transportadora (apenas números)',
  cep_transportadora INT UNSIGNED COMMENT 'CEP do endereço da transportadora',
  n_comercial INT UNSIGNED COMMENT 'Número comercial da transportadora',
  FOREIGN KEY (cep_transportadora) REFERENCES Enderecos (cep) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que armazena informações das transportadoras';

-- Criando a tabela Produtos
CREATE TABLE Produtos (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID único do produto',
  descricao VARCHAR(100) NOT NULL COMMENT 'Descrição do produto',
  preco DECIMAL(10,2) NOT NULL COMMENT 'Preço do produto (até 10 dígitos, 2 decimais)',
  CONSTRAINT chk_preco CHECK (preco > 0) -- Garante que o preço seja maior que zero
) COMMENT = 'Tabela que armazena informações dos produtos';

-- Criando a tabela Produtos_fornecedores
CREATE TABLE Produtos_fornecedores (
  id_produto INT COMMENT 'ID do produto',
  id_fornecedor INT COMMENT 'ID do fornecedor',
  PRIMARY KEY (id_produto, id_fornecedor),
  FOREIGN KEY (id_produto) REFERENCES Produtos (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores (id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que relaciona produtos e fornecedores';

-- Criando a tabela Formas_pagamento
CREATE TABLE Formas_pagamento (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID único da forma de pagamento',
  descricao VARCHAR(20) NOT NULL COMMENT 'Descrição da forma de pagamento'
) COMMENT = 'Tabela que armazena as formas de pagamento disponíveis';

-- Criando a tabela Vendas
CREATE TABLE Vendas (
  id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID único da venda',
  id_cliente INT NOT NULL COMMENT 'ID do cliente que realizou a compra',
  id_funcionario INT NOT NULL COMMENT 'ID do funcionário que realizou a venda',
  data_hora DATETIME NOT NULL COMMENT 'Data e hora da venda',
  id_pagamento INT NOT NULL COMMENT 'ID da forma de pagamento utilizada',
  FOREIGN KEY (id_cliente) REFERENCES Clientes (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_funcionario) REFERENCES Funcionarios (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_pagamento) REFERENCES Formas_pagamento (id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que armazena informações das vendas realizadas';

-- Criando a tabela Itens_venda
CREATE TABLE Itens_venda (
  id_venda INT COMMENT 'ID da venda',
  id_produto INT COMMENT 'ID do produto vendido',
  PRIMARY KEY (id_venda, id_produto),
  FOREIGN KEY (id_venda) REFERENCES Vendas (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_produto) REFERENCES Produtos (id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que relaciona vendas e produtos vendidos';

-- Criando a tabela Estoque
CREATE TABLE Estoque (
  id_produto INT PRIMARY KEY COMMENT 'ID do produto em estoque',
  quantidade INT UNSIGNED NOT NULL COMMENT 'Quantidade do produto em estoque',
  data DATE NOT NULL COMMENT 'Data da última atualização do estoque',
  id_funcionario INT NOT NULL COMMENT 'ID do funcionário que atualizou o estoque',
  FOREIGN KEY (id_produto) REFERENCES Produtos (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (id_funcionario) REFERENCES Funcionarios (id) ON DELETE CASCADE ON UPDATE CASCADE
) COMMENT = 'Tabela que armazena informações do estoque de produtos';

-- Criando índices para melhorar o desempenho
CREATE INDEX idx_cep ON Enderecos(cep);
CREATE INDEX idx_id_cliente ON Vendas(id_cliente);
CREATE INDEX idx_id_produto ON Produtos_fornecedores(id_produto);

-- Comentários adicionais para documentação
ALTER TABLE Clientes COMMENT = 'Tabela que armazena informações dos clientes';
ALTER TABLE Funcionarios COMMENT = 'Tabela que armazena informações dos funcionários';
ALTER TABLE Fornecedores COMMENT = 'Tabela que armazena informações dos fornecedores';
ALTER TABLE Fornecedor_PF COMMENT = 'Tabela que armazena informações de fornecedores pessoa física';
ALTER TABLE Fornecedor_PJ COMMENT = 'Tabela que armazena informações de fornecedores pessoa jurídica';
ALTER TABLE Transportadoras COMMENT = 'Tabela que armazena informações das transportadoras';
ALTER TABLE Produtos COMMENT = 'Tabela que armazena informações dos produtos';
ALTER TABLE Produtos_fornecedores COMMENT = 'Tabela que relaciona produtos e fornecedores';
ALTER TABLE Formas_pagamento COMMENT = 'Tabela que armazena as formas de pagamento disponíveis';
ALTER TABLE Vendas COMMENT = 'Tabela que armazena informações das vendas realizadas';
ALTER TABLE Itens_venda COMMENT = 'Tabela que relaciona vendas e produtos vendidos';
ALTER TABLE Estoque COMMENT = 'Tabela que armazena informações do estoque de produtos';
