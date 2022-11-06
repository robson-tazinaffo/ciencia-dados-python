-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
use oficina;


-- -----------------------------------------------------
-- TABLE `oficina`.`Cliente`
-- -----------------------------------------------------
INSERT INTO `oficina`.`cliente` (Nome, telefone, email, endereco, cidade, estado, cpf_cnpj, tipo_cliente) VALUES ('Manoel Osvaldo Paulo da Mota', '(16) 99999-1234', 'osvaldop@teste.com.br', 'Rua Tal, 33', 'Betim', 'MG', '749.951.112-01', 'F');
INSERT INTO `oficina`.`cliente` (Nome, telefone, email, endereco, cidade, estado, cpf_cnpj, tipo_cliente) VALUES ('Nicole Jéssica', '(16) 99999-1234', 'nicolejessica@teste02.com.br', 'Rua Tal, 21', 'Joao Pessoa', 'PB', '749.951.113-02', 'F');
INSERT INTO `oficina`.`cliente` (Nome, telefone, email, endereco, cidade, estado, cpf_cnpj, tipo_cliente) VALUES ('Liz Mariana Mirella', '(16) 99999-4444', 'marianamirella@teste03.com.br', 'Av Treze de Maio, 1533', 'São Paulo', 'SP', '749.951.114-06', 'F');
INSERT INTO `oficina`.`cliente` (Nome, telefone, email, endereco, cidade, estado, cpf_cnpj, tipo_cliente) VALUES ('Sidnei Oliveira', '(16) 99999-5555', 'sidneioliveira@hotmail1234.com.br', 'Av Barramas, 120', 'São Paulo', 'SP', '749.951.222-08', 'F');
INSERT INTO `oficina`.`cliente` (Nome, telefone, email, endereco, cidade, estado, cpf_cnpj, tipo_cliente) VALUES ('Matos Correa ME', '(16) 99999-1456', 'matosematos@hotmail.com.br', 'Rua Castro Alves, 85', 'São Paulo', 'SP', '33.753.645/0001-54', 'J');

-- -----------------------------------------------------
-- TABLE `oficina`.`equipe`
-- -----------------------------------------------------
INSERT INTO `oficina`.`equipe` (Identificacao) VALUES ('EQUIPE 1');
INSERT INTO `oficina`.`equipe` (Identificacao) VALUES ('EQUIPE 2');
INSERT INTO `oficina`.`equipe` (Identificacao) VALUES ('EQUIPE 3');
INSERT INTO `oficina`.`equipe` (Identificacao) VALUES ('EQUIPE 4');

-- -----------------------------------------------------
-- TABLE `oficina`.`especialidade`
-- -----------------------------------------------------
INSERT INTO `oficina`.`especialidade` (Identificacao) VALUES ('MECANICA');
INSERT INTO `oficina`.`especialidade` (Identificacao) VALUES ('ELETRICA');
INSERT INTO `oficina`.`especialidade` (Identificacao) VALUES ('PNEUS');
INSERT INTO `oficina`.`especialidade` (Identificacao) VALUES ('OUTROS');


-- -----------------------------------------------------
-- TABLE `oficina`.`funcionario`
-- -----------------------------------------------------
INSERT INTO `oficina`.`funcionario` (idEspecialidade, idEquipe, Nome, endereco, cidade, estado, telefone,  complemento, cpf_cnpj, tipo) VALUES (1, 1, 'Mauro Gomes', 'Rua Tal, 33', 'Betim', 'MG', '(16) 99999-1234', '', '749.951.112-01', 'F');
INSERT INTO `oficina`.`funcionario` (idEspecialidade, idEquipe, Nome, endereco, cidade, estado, telefone,  complemento, cpf_cnpj, tipo) VALUES (2, 2, 'Paulo Silva', 'Rua Cinco, 85', 'Betim', 'MG', '(16) 99999-8888', '', '749.951.001-01', 'F');
INSERT INTO `oficina`.`funcionario` (idEspecialidade, idEquipe, Nome, endereco, cidade, estado, telefone,  complemento, cpf_cnpj, tipo) VALUES (2, 2, 'Isidoro Cortez', 'Av Marginal Direita, 76', 'Betim', 'MG', '(16) 99999-7777', '', '749.951.003-03', 'F');


-- -----------------------------------------------------
-- Table `oficina`.`fornecedor`
-- -----------------------------------------------------
INSERT INTO Fornecedor (razao_social, cnpj, endereco, cidade, estado, cep) VALUES ('Osmar Bonfim Ltda.', '22.866.136/0001-11', 'Rua Acre, 217', 'Campinas', 'SP', '15.680-000');
INSERT INTO Fornecedor (razao_social, cnpj, endereco, cidade, estado, cep) VALUES ('Valdomiro Espíndola', '92.813.647/0001-50', 'Av. Palmares, 1830', 'Ribeirão Preto', 'SP', '16.320-000');


-- -----------------------------------------------------
-- TABLE `oficina`.`marca`
-- -----------------------------------------------------
INSERT INTO `oficina`.`marca` (Identificacao) VALUES ('RENAULT');
INSERT INTO `oficina`.`marca` (Identificacao) VALUES ('FORD');
INSERT INTO `oficina`.`marca` (Identificacao) VALUES ('CHEVROLET');
INSERT INTO `oficina`.`marca` (Identificacao) VALUES ('VOLKSWAGEM');
INSERT INTO `oficina`.`marca` (Identificacao) VALUES ('FIAT');
INSERT INTO `oficina`.`marca` (Identificacao) VALUES ('HYUNDAI');
INSERT INTO `oficina`.`marca` (Identificacao) VALUES ('HONDA');
INSERT INTO `oficina`.`marca` (Identificacao) VALUES ('TOYOTA');

-- -----------------------------------------------------
-- TABLE `oficina`.`modelo`
-- -----------------------------------------------------
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (3,'CORSA');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (4,'GOL');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (6,'AZYRA');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (8,'COROLLA');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (5,'UNO');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (5,'TORO');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (2,'MUSTANG');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (7,'CIVIC');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (2,'RANGER');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (1,'LOGAN');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (2,'KA');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (4,'JETTA');
INSERT INTO `oficina`.`modelo` (idMarca, Identificacao) VALUES (1,'DUSTER');


-- -----------------------------------------------------
-- TABLE `oficina`.`veiculo`
-- -----------------------------------------------------
INSERT INTO `oficina`.`veiculo` (idModelo, cor, placa) VALUES (1, 1, 'TJT5012');
INSERT INTO `oficina`.`veiculo` (idModelo, cor, placa) VALUES (2, 2, 'ZYK6599');
INSERT INTO `oficina`.`veiculo` (idModelo, cor, placa) VALUES (3, 1, 'MRT2020');
INSERT INTO `oficina`.`veiculo` (idModelo, cor, placa) VALUES (4, 3, 'JKT0009');

-- -----------------------------------------------------
-- TABLE `oficina`.`servico`
-- -----------------------------------------------------
INSERT INTO `oficina`.`servico` (idVeiculo, idTabela_Servico, idEquipe, idStatus_servico, descricao, valor_pecas, valor_maoobra, data_inicio, data_termino) VALUES (1, 1, 1, 1, 'Troca de velas', 75.90, 35.00, '2022-10-31', '2022-11-02' );


-- -----------------------------------------------------
-- TABLE `oficina`.`produto`
-- -----------------------------------------------------
INSERT INTO `oficina`.`produto` (idFornecedor, Identificacao, Valor) VALUES (1, 'JOGO DE VELAS', 75.90);
INSERT INTO `oficina`.`produto` (idFornecedor, Identificacao, Valor) VALUES (2, 'AMORTECEDOR', 49.90);
INSERT INTO `oficina`.`produto` (idFornecedor, Identificacao, Valor) VALUES (1, 'CORREIA DENTADA', 500.00);
INSERT INTO `oficina`.`produto` (idFornecedor, Identificacao, Valor) VALUES (2, 'PNEU ARO 13 GODYAR', 250.00);
INSERT INTO `oficina`.`produto` (idFornecedor, Identificacao, Valor) VALUES (1, 'LIMPADOR DIANTEIRO', 60.00);
INSERT INTO `oficina`.`produto` (idFornecedor, Identificacao, Valor) VALUES (1, 'FAROL DIANTEIRO GOL', 160.00);


-- -----------------------------------------------------
-- TABLE `oficina`.`status_os`
-- -----------------------------------------------------
INSERT INTO status_os (Identificacao) VALUES ('Aguardando Autorizaçao');
INSERT INTO status_os (Identificacao) VALUES ('Entregue');
INSERT INTO status_os (Identificacao) VALUES ('Em andamento');


-- -----------------------------------------------------
-- TABLE `oficina`.`status_servico`
-- -----------------------------------------------------
INSERT INTO Status_Servico (Identificacao) VALUES ('Aguardando Autorizaçao');
INSERT INTO Status_Servico (Identificacao) VALUES ('Entregue');
INSERT INTO Status_Servico (Identificacao) VALUES ('Em andamento');

-- -----------------------------------------------------
-- TABLE `oficina`.`tabelaservico`
-- -----------------------------------------------------
INSERT INTO `oficina`.`tabelaservico` (`Identificacao`,`ValorTabela`) VALUES ('TROCA DE VELAS', 35.00);
INSERT INTO `oficina`.`tabelaservico` (`Identificacao`,`ValorTabela`) VALUES ('TROCA DE OLEO', 35.00);

-- -----------------------------------------------------
-- TABLE `oficina`.`servico`
-- -----------------------------------------------------
INSERT INTO `oficina`.`servico` (idVeiculo, idTabela_Servico, idEquipe, idStatus_servico, descricao, valor_pecas, valor_maoobra, data_inicio, data_termino) VALUES (1, 1, 1, 1, 'Troca de velas', 75.90, 35.00, '2022-10-31', '2022-11-02' );

-- -----------------------------------------------------
-- TABLE `oficina`.`ordem_servico`
-- -----------------------------------------------------
INSERT INTO `oficina`.`ordem_servico` (idCliente, idVeiculo, idStatus, Data_Emissao, Data_Conclusao, Valor, Data_Autorizacao, Obs ) VALUES (1, 4, 1, '2022-10-31', '2022-11-03', 110.90, '2022-10-31', 'Observacao');
  `


