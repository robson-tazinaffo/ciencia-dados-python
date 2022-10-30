-- -----------------------------------------------------
-- Table `ecommerce`.`endereco_entrega`
-- -----------------------------------------------------
INSERT INTO `ecommerce`.`endereco_entrega` (endereco, cidade, estado, cep) VALUES 
('Rua Teste 1, 123', 'São Joaquim da Barra', 'SP','14.600-000');
INSERT INTO `ecommerce`.`endereco_entrega` (endereco, cidade, estado, cep) VALUES 
('Rua Teste 2, 123', 'Guara', 'SP','14.540-000');
INSERT INTO `ecommerce`.`endereco_entrega` (endereco, cidade, estado, cep) VALUES 
('Rua Teste 3, 123', 'Orlandia', 'SP','15.520-000');
INSERT INTO `ecommerce`.`endereco_entrega` (endereco, cidade, estado, cep) VALUES 
('Rua Teste 4, 123', 'Ipua', 'SP','14.580-000');
INSERT INTO `ecommerce`.`endereco_entrega` (endereco, cidade, estado, cep) VALUES 
('Rua Teste 5, 123', 'Morro Agudo', 'SP','15.120-000');

-- -----------------------------------------------------
-- Table `ecommerce`.`pessoa`
-- -----------------------------------------------------
INSERT INTO pessoa (Nome, Identificacao, Endereco, Cpf_cnpj, email, tipo_pessoa, endereco_entrega) VALUES ('Joaquim Manuel da Silva', 'Fisica', 'Rua Quinze, 233', '749.951.988-06', 'joaquim@uol.br',1,1);
INSERT INTO pessoa (Nome, Identificacao, Endereco, Cpf_cnpj, email, tipo_pessoa, endereco_entrega) VALUES ('Natalino Lopez', 'Fisica', 'Rua Tal, 233', '749.951.555-06', 'natalino02@ig.com',1,2);
INSERT INTO pessoa (Nome, Identificacao, Endereco, Cpf_cnpj, email, tipo_pessoa, endereco_entrega) VALUES ('Rhuan  Martinez', 'Fisica', 'Av Marg. Direita, 400', '749.951.123-06', 'martimez005@hotmail.com',2,3);
INSERT INTO pessoa (Nome, Identificacao, Endereco, Cpf_cnpj, email, tipo_pessoa, endereco_entrega) VALUES ('Leticia Lellipe', 'Fisica', 'Rua Felipe Escolari, 21', '749.951.456-06', 'leticiafellipe01@outlook.com',1,4);
INSERT INTO pessoa (Nome, Identificacao, Endereco, Cpf_cnpj, email, tipo_pessoa, endereco_entrega) VALUES ('Pablo de Carvalho', 'Fisica', 'Rua Sagalo, 123', '749.951.789-06', 'plabloecommerce2022@gmail.com',2,5);

-- -----------------------------------------------------
-- Table `ecommerce`.`fornecedor`
-- -----------------------------------------------------
INSERT INTO Fornecedor (razao_social, cnpj, endereco, cidade, estado, cep) VALUES ('Osmar Bonfim Ltda.', '22.866.136/0001-11', 'Rua Acre, 217', 'Campinas', 'SP', '15.680-000');
INSERT INTO Fornecedor (razao_social, cnpj, endereco, cidade, estado, cep) VALUES ('Valdomiro Espíndola', '92.813.647/0001-50', 'Av. Palmares, 1830', 'Ribeirão Preto', 'SP', '16.320-000');

-- -----------------------------------------------------
-- Table `ecommerce`.`categoria_produto`
-- -----------------------------------------------------
INSERT INTO categoria_produto (descricao) VALUES ('Informatica');
INSERT INTO categoria_produto (descricao) VALUES ('Papelaria');
INSERT INTO categoria_produto (descricao) VALUES ('Vestuário');
INSERT INTO categoria_produto (descricao) VALUES ('Livraria');

-- -----------------------------------------------------
-- Table `ecommerce`.`produto`
-- -----------------------------------------------------
INSERT INTO produto (categoria_produto, Descricao, Valor) VALUES (1, 'Mouse Multilaser Helmans', 25.50);
INSERT INTO produto (categoria_produto, Descricao, Valor) VALUES (1, 'Teclado Slim Logitech', 45.80);
INSERT INTO produto (categoria_produto, Descricao, Valor) VALUES (2, 'Pacote Papel A4', 8.50);
INSERT INTO produto (categoria_produto, Descricao, Valor) VALUES (3, 'Camiseta Polo', 25.00);
INSERT INTO produto (categoria_produto, Descricao, Valor) VALUES (3, 'Calça Jeans Masculina Tam. 42', 115.60);
INSERT INTO produto (categoria_produto, Descricao, Valor) VALUES (4, 'MySQl do básico ao avançado 3a Edição', 70.80);

-- -----------------------------------------------------
-- Table `ecommerce`.`produto_fornecedor`
-- -----------------------------------------------------
INSERT INTO produto_fornecedor (idProduto, idFornecedor) VALUES (2, 1);
INSERT INTO produto_fornecedor (idProduto, idFornecedor) VALUES (3, 2);

-- -----------------------------------------------------
-- Table `ecommerce`.`estoque`
-- -----------------------------------------------------
INSERT INTO estoque (localizacao) VALUES ('Setor A');
INSERT INTO estoque (localizacao) VALUES ('Setor B');
INSERT INTO estoque (localizacao) VALUES ('Setor C');
INSERT INTO estoque (localizacao) VALUES ('Setor D');

-- -----------------------------------------------------
-- Table `ecommerce`.`produto_estoque`
-- -----------------------------------------------------
INSERT INTO produto_estoque (idProduto, idEstoque, Quantidade) VALUES (2, 1, 10);
INSERT INTO produto_estoque (idProduto, idEstoque, Quantidade) VALUES (3, 2, 15);


-- -----------------------------------------------------
-- Table `ecommerce`.`status_pedido`
-- -----------------------------------------------------
INSERT INTO status_pedido (descricao) VALUES ('ABERTO');
INSERT INTO status_pedido (descricao) VALUES ('EM ANDAMENTO');
INSERT INTO status_pedido (descricao) VALUES ('EM PAUSA');
INSERT INTO status_pedido (descricao) VALUES ('CANCELADO');
INSERT INTO status_pedido (descricao) VALUES ('CONCLUÍDO');

-- -----------------------------------------------------
-- Table `ecommerce`.`tipo_pedido`
-- -----------------------------------------------------
INSERT INTO tipo_pedido (descricao) VALUES ('Venda');
INSERT INTO tipo_pedido (descricao) VALUES ('Orçamento');
INSERT INTO tipo_pedido (descricao) VALUES ('Condicional');
INSERT INTO tipo_pedido (descricao) VALUES ('Troca');

-- -----------------------------------------------------
-- Table `ecommerce`.`forma_pagamento`
-- -----------------------------------------------------
INSERT INTO forma_pagamento (descricao) VALUES ('Dinheiro');
INSERT INTO forma_pagamento (descricao) VALUES ('Debito');
INSERT INTO forma_pagamento (descricao) VALUES ('Credito');
INSERT INTO forma_pagamento (descricao) VALUES ('Boleto');




DAQUI PRA BAIXO ******************************


-- -----------------------------------------------------
-- Table `ecommerce`.`pedido`
-- -----------------------------------------------------
INSERT INTO pedido (descricao, pessoa, tipo_pedido, frete, Entrega_idEntrega, valor_pedido, valor_total, status_pedido) VALUES ('Venda', 1, 1, 12.00, 2, 150.50, 162.50, 1);
INSERT INTO pedido (descricao, pessoa, tipo_pedido, frete, Entrega_idEntrega, valor_pedido, valor_total, status_pedido) VALUES ('Venda', 1, 1, 12.00, 3, 150.50, 162.50, 1);

  
-- -----------------------------------------------------
-- Table `ecommerce`.`pedido_entrega`
-- -----------------------------------------------------
INSERT INTO pedido_entrega (id_pedido, previsao, entrega_status, data_status, cod_rastreio) VALUES (1, '2022-10-25', 'Aguardando separação', now(), '123456789' );
INSERT INTO pedido_entrega (id_pedido, previsao, entrega_status, data_status, cod_rastreio) VALUES (2, '2022-10-26', 'Aguardando separação', now(), '456789012' );

-- -----------------------------------------------------
-- Table `ecommerce`.`pedido_produto`
-- -----------------------------------------------------
INSERT INTO pedido_produto (idPedido, idProduto) VALUES (2, 2);
INSERT INTO pedido_produto (idPedido, idProduto) VALUES (2, 3);

-- -----------------------------------------------------
-- Table `ecommerce`.`pedido_pagamento`
-- -----------------------------------------------------
INSERT INTO pedido_pagamento (idPedido, vencimento, parcela, valor, documento, tipo_pagamento) VALUES (1, '2022/12/21', 1, 5.75, '12345', 1);



