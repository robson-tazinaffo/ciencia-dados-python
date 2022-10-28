-- -----------------------------------------------------
-- Filtros com Clausula where:
-- Consultas tabelas sem clausalas:
-- Obs.: Não muito indicado por motivo de performance:
-- -----------------------------------------------------
select * from ecommerce.Cliente;
select * from ecommerce.Produto;


-- -----------------------------------------------------
-- Filtros com Clausula where:
-- Consultas:
-- -----------------------------------------------------
select * from ecommerce.Cliente where idCliente=5;
select * from ecommerce.Produto where Descricao like '%Testes%';
select * from ecommerce.pedido where idPedido=2;


-- -----------------------------------------------------
-- Empressões para atributos com derivação
-- Concatenizações:
-- -----------------------------------------------------

-- Crie expressões para gerar atributos derivados
select (sum(valor_pedido)+sum(Frete)) as TotalPedido from ecommerce.pedido;




-- Defina ordenações dos dados com ORDER BY
select Identificacao, Valor from ecommerce.Produto order by valor desc;

-- Condições de filtros aos grupos – HAVING Statement
select idCategoria, sum(Valor) from ecommerce.Produto group by idCategoria having count(idCategoria)>1;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
select c.Identificacao, p.Identificacao, p.Descricao, p.Valor
    from ecommerce.Produto p
    inner join ecommerce.Categoria c on p.idCategoria = c.id
	

-- PERGUNTAS
-- 1) Quantos pedidos foram feitos por cada cliente?
select Count(p.idCliente), c.Nome
    from ecommerce.Pedido p
    inner join ecommerce.Cliente c on p.idCliente = c.id
    group by p.idCliente, c.Nome

-- 2) Algum vendedor também é fornecedor?
select f.RazaoSocial from ecommerce.Fornecedor f where f.CNPJ in (select t.CNPJ from ecommerce.VendedorTerceiro t)

-- 3) Relação de produtos fornecedores e estoques;
select f.RazaoSocial, p.Identificacao, pe.Quantidade
    from ecommerce.Produto p
    inner join ecommerce.ProdutoFornecedor pf on p.id = pf.idProduto
    inner join ecommerce.Fornecedor f on f.id = pf.idFornecedor
    inner join ecommerce.ProdutoEstoque pe on p.id = pe.idProduto

-- 4) Relação de nomes dos fornecedores e nomes dos produtos;-- 4) Relação de nomes dos fornecedores e nomes dos produtos;
select f.RazaoSocial as Fornecedor, p.Identificacao as Produto
    from ecommerce.Produto p
    inner join ecommerce.ProdutoFornecedor pf on p.id = pf.idProduto
    inner join ecommerce.Fornecedor f on f.id = pf.idFornecedor