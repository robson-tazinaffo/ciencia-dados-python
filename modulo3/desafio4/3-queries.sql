-- Recuperações simples com SELECT Statement
SELECT * FROM oficina.cliente;
SELECT * FROM oficina.funcionario;
SELECT * FROM oficina.produto;
SELECT * FROM oficina.fornecedor;


-- Filtros com WHERE Statement
SELECT * from oficina.servico where idVeiculo=4;
SELECT * FROM oficina.cliente where idCliente = 1
SELECT * FROM oficina.marca where id = 1
SELECT * FROM oficina.modelo where id = 2
SELECT * FROM oficina.fornecedor where id = 2

-- Crie expressões para gerar atributos derivados
SELECT (ma.identificacao) + '' '' + (md.identificacao) as Marca_Modelo from oficina.marca ma, oficina.modelo as md;

-- Defina ordenações dos dados com ORDER BY
SELECT Identificacao from oficina.marca order by identificacao;
SELECT Identificacao from oficina.marca order by identificacao desc;
SELECT nome, endereco, email, cidade from oficina.cliente order by nome;
SELECT nome, endereco, email, cidade from oficina.cliente order by cidade;

-- Condições de filtros aos grupos – HAVING Statement
SELECT idModelo, placa from oficina.veiculo group by idModelo having idModelo>1;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT v.placa , ma.Identificacao as marca, mo.identificacao as modelo
    from oficina.veiculo v
    inner join oficina.modelo mo on mo.id = v.idModelo
	inner join oficina.marca ma on ma.id = mo.idMarca
	

-- -----------------------------------------------------
-- Quantas ordens de serviço foram feitas para cada cliente?
-- -----------------------------------------------------

select Count(os.idCliente) as quantidade , c.Nome
    from oficina.ordem_servico os
    inner join oficina.Cliente c on os.idCliente = c.id
    group by os.idCliente, c.Nome


-- -----------------------------------------------------
-- Marca de veiculo mais atendido
-- -----------------------------------------------------
select count(os.idVeiculo) as quantidade , ma.identificacao
    from oficina.ordem_servico os
    inner join oficina.veiculo v on os.idVeiculo = v.id
    inner join oficina.modelo mo on mo.id = v.idModelo
	inner join oficina.marca ma on ma.id = mo.idMarca
	group by os.idVeiculo, ma.identificacao
	
	
-- -----------------------------------------------------
-- Relação de produtos, seu fornecedor e estoques disponivel;
-- -----------------------------------------------------
select f.RazaoSocial, p.Identificacao, pe.Quantidade
    from oficina.Produto p
    inner join oficina.Fornecedor f on f.id = p.idFornecedor
    inner join oficina.produto_estoque pe on p.id = pe.idProduto

-- -----------------------------------------------------
-- Relação de nomes dos produtos e seu fornecedor
-- -----------------------------------------------------
select f.razao_social as Fornecedor, p.Identificacao as produto
    from oficina.Produto p
    inner join oficina.Fornecedor f on f.id = p.idFornecedor