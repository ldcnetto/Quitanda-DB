# Quitanda-DB

## Projeto Banco de Dados - Quitandaria

Este projeto foi desenvolvido como parte da disciplina de Banco de Dados e tem como objetivo a criação de um banco de dados para o sistema de uma quitandaria utilizando MySQL.

## Modelagem do Banco de Dados

O banco de dados possui as seguintes tabelas:

- **Enderecos**: Armazena informações sobre os endereços.
- **Clientes**: Contém os dados dos clientes da quitandaria.
- **Cargos**: Define os cargos dos funcionários.
- **Funcionarios**: Armazena informações dos funcionários da loja.
- **Fornecedores**: Lista os fornecedores de produtos.
- **Fornecedor_PF** e **Fornecedor_PJ**: Diferenciam fornecedores como Pessoa Física e Pessoa Jurídica.
- **Transportadoras**: Contém os dados das transportadoras.
- **Produtos**: Lista os produtos vendidos na quitandaria.
- **Produtos_fornecedores**: Define quais produtos são de quais fornecedores.
- **Formas_pagamento**: Lista as formas de pagamento aceitas.
- **Vendas**: Registra as vendas realizadas.
- **Itens_venda**: Relaciona as vendas com os produtos comprados.
- **Estoque**: Armazena a quantidade de produtos disponíveis.

```mermaid
classDiagram
    class Enderecos {
        +cep INT UNSIGNED (PK)
        +logradouro VARCHAR(50)
        +bairro VARCHAR(50)
        +cidade VARCHAR(20)
        +tipo ENUM('Cliente', 'Funcionario', 'Fornecedor', 'Transportadora')
    }

    class Clientes {
        +id INT (PK)
        +nome VARCHAR(60)
        +email VARCHAR(100)
        +telefone BIGINT UNSIGNED
        +cep_cliente INT UNSIGNED (FK)
        +n_residencial INT UNSIGNED
    }

    class Cargos {
        +id INT (PK)
        +descricao VARCHAR(40)
    }

    class Funcionarios {
        +id INT (PK)
        +cpf CHAR(11)
        +nome VARCHAR(60)
        +id_cargo INT (FK)
        +telefone BIGINT UNSIGNED
        +cep_funcionario INT UNSIGNED (FK)
        +n_residencial INT UNSIGNED
    }

    class Fornecedores {
        +id INT (PK)
        +razao_social VARCHAR(60)
        +telefone BIGINT UNSIGNED
        +email VARCHAR(100)
        +cep_fornecedor INT UNSIGNED (FK)
        +n_comercial INT UNSIGNED
    }

    class Fornecedor_PF {
        +cpf CHAR(11) (PK)
        +razao_social VARCHAR(60)
        +id_fornecedor INT (FK)
    }

    class Fornecedor_PJ {
        +cnpj VARCHAR(14) (PK)
        +razao_social VARCHAR(60)
        +id_fornecedor INT (FK)
    }

    class Transportadoras {
        +id INT (PK)
        +cnpj VARCHAR(14)
        +razao_social VARCHAR(60)
        +email VARCHAR(100)
        +telefone BIGINT UNSIGNED
        +cep_transportadora INT UNSIGNED (FK)
        +n_comercial INT UNSIGNED
    }

    class Produtos {
        +id INT (PK)
        +descricao VARCHAR(100)
        +preco DECIMAL(10,2)
    }

    class Produtos_fornecedores {
        +id_produto INT (FK)
        +id_fornecedor INT (FK)
    }

    class Formas_pagamento {
        +id INT (PK)
        +descricao VARCHAR(20)
    }

    class Vendas {
        +id INT (PK)
        +id_cliente INT (FK)
        +id_funcionario INT (FK)
        +data_hora DATETIME
        +id_pagamento INT (FK)
    }

    class Itens_venda {
        +id_venda INT (FK)
        +id_produto INT (FK)
    }

    class Estoque {
        +id_produto INT (FK)
        +quantidade INT UNSIGNED
        +data DATE
        +id_funcionario INT (FK)
    }

    Enderecos "1" -- "0..*" Clientes : cep_cliente
    Enderecos "1" -- "0..*" Funcionarios : cep_funcionario
    Enderecos "1" -- "0..*" Fornecedores : cep_fornecedor
    Enderecos "1" -- "0..*" Transportadoras : cep_transportadora
    Cargos "1" -- "0..*" Funcionarios : id_cargo
    Fornecedores "1" -- "0..1" Fornecedor_PF : id_fornecedor
    Fornecedores "1" -- "0..1" Fornecedor_PJ : id_fornecedor
    Produtos "1" -- "0..*" Produtos_fornecedores : id_produto
    Fornecedores "1" -- "0..*" Produtos_fornecedores : id_fornecedor
    Clientes "1" -- "0..*" Vendas : id_cliente
    Funcionarios "1" -- "0..*" Vendas : id_funcionario
    Formas_pagamento "1" -- "0..*" Vendas : id_pagamento
    Vendas "1" -- "0..*" Itens_venda : id_venda
    Produtos "1" -- "0..*" Itens_venda : id_produto
    Produtos "1" -- "0..1" Estoque : id_produto
    Funcionarios "1" -- "0..*" Estoque : id_funcionario
```
