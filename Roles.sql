-- Criando roles e permissões
-- Criando regra padrão para consulta (DQL)
CREATE ROLE select_role;
GRANT SELECT ON *.* TO select_role;

-- Criando regra padrão para comandos DML e DQL
CREATE ROLE dml_dql_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO dml_dql_role;

-- Criando regra padrão para comandos DDL
CREATE ROLE ddl_role;
GRANT CREATE, ALTER, DROP, TRUNCATE ON *.* TO ddl_role;

-- Criando usuário com regra padrão para consulta
CREATE USER 'consulta_user'@'localhost' IDENTIFIED BY 'senha123';
GRANT select_role TO 'consulta_user'@'localhost';
SET DEFAULT ROLE select_role TO 'consulta_user'@'localhost';

-- Criando usuário com regra padrão para DML e DQL
CREATE USER 'dml_dql_user'@'localhost' IDENTIFIED BY 'senha456';
GRANT dml_dql_role TO 'dml_dql_user'@'localhost';
SET DEFAULT ROLE dml_dql_role TO 'dml_dql_user'@'localhost';

-- Criando usuário com regra padrão para DDL
CREATE USER 'ddl_user'@'localhost' IDENTIFIED BY 'senha789';
GRANT ddl_role TO 'ddl_user'@'localhost';
SET DEFAULT ROLE ddl_role TO 'ddl_user'@'localhost';

-- Criando uma view com dados de Clientes e Funcionarios
CREATE VIEW ClienteFuncionario AS
    SELECT 
        c.nome AS nome_cliente,
        c.telefone AS telefone_cliente,
        f.nome AS nome_funcionario,
        f.telefone AS telefone_funcionario
    FROM
        Clientes c
            JOIN
        Vendas v ON c.id = v.id_cliente
            JOIN
        Funcionarios f ON v.id_funcionario = f.id;

-- Criando regra para consulta na view
CREATE ROLE select_view_role;
GRANT SELECT ON ClienteFuncionario TO select_view_role;

-- Criando usuário com regra padrão para consulta da view
CREATE USER 'view_user'@'localhost' IDENTIFIED BY 'senha000';
GRANT select_view_role TO 'view_user'@'localhost';
SET DEFAULT ROLE select_view_role TO 'view_user'@'localhost';

-- Criando uma transação única
START TRANSACTION;