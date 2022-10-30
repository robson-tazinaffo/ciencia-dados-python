-- -----------------------------------------------------
-- Filtros com Clausula where:
-- Consultas tabelas sem clausalas:
-- Obs.: Não muito indicado por motivo de performance:
-- -----------------------------------------------------
select * from ecommerce.pessoa;
select * from ecommerce.produto;


-- -----------------------------------------------------
-- Filtros com Clausula where:
-- Consultas:
-- -----------------------------------------------------
select * from ecommerce.pessoa where idPessoa=5;
select * from ecommerce.produto where upper(descricao) like '%MOUSE%';
select * from ecommerce.pedido where idPedido=2;


-- -----------------------------------------------------
-- Empressões para atributos com derivação
-- Concatenizações:
-- -----------------------------------------------------

-- Crie expressões para gerar atributos derivados
select (sum(valor_pedido)+sum(Frete)) as TotalPedido from ecommerce.pedido where idPedido=2;


-- -----------------------------------------------------
-- Ordenação:
-- Defina ordenações dos dados com ORDER BY
-- -----------------------------------------------------
select descricao, Valor from ecommerce.Produto order by valor desc;
select descricao, Valor from ecommerce.Produto order by valor asc;

-- -----------------------------------------------------
-- Filtragem:
-- HAVING Statement
-- -----------------------------------------------------
select categoria_produto, sum(Valor) from ecommerce.Produto group by categoria_produto having count(categoria_produto) > 1;

-- -----------------------------------------------------
-- Junçoes (JOIN):
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- -----------------------------------------------------
select c.descricao as Categoria, p.Descricao, p.Valor
    from ecommerce.produto p
    inner join ecommerce.categoria_produto c on p.categoria_produto = c.idCategoria	
	
	
	
-- -----------------------------------------------------
-- PERGUNTAS
-- -----------------------------------------------------

-- 1) Qual o total de pedidos por cliente?
select count(p.idCliente), c.Nome
    from ecommerce.Pedido p
    inner join ecommerce.Cliente c on p.idCliente = c.id
    group by p.idCliente, c.Nome

-- 2) Pessoa é cliente, vendedor, ou ambos?
SELECT p.Nome, p.endereco, p.email,
	CASE p.tipo_pessoa 
	WHEN 1 THEN ('CLIENTE') 
	WHEN 2 THEN ('VENDEDOR')
	ELSE ('AMBOS') END AS cliente_ou_vendedor
	FROM pessoa p
 
-- 3) Relação de produtos fornecedores e estoques;
select f.razao_social, p.descricao, pe.quantidade
    from ecommerce.produto p
    inner join ecommerce.produto_fornecedor pf on p.idProduto = pf.idProduto
    inner join ecommerce.Fornecedor f on f.idFornecedor = pf.idFornecedor
    inner join ecommerce.produto_estoque pe on p.idProduto = pe.Produto_idProduto
	
-- 4) Relação de nomes dos fornecedores e nomes dos produtos;
select f.RazaoSocial as Fornecedor, p.Identificacao as Produto
    from ecommerce.Produto p
    inner join ecommerce.ProdutoFornecedor pf on p.id = pf.idProduto
    inner join ecommerce.Fornecedor f on f.id = pf.idFornecedor
	
-- 5-Total de lançamentos por tipo de lançamento	
select count(p.tipo_pedido) as total, t.descricao
    from ecommerce.Pedido p
    inner join ecommerce.tipo_pedido t on p.tipo_pedido = t.idtipo_pedido
    group by t.descricao
