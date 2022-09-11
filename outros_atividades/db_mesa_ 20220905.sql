Gabriel Teodoro
Agenor Junior
Jhonatan Talinco
Francisco Kelvin
Pedro Simoes


/*
Relatórios II parte I - Revisando INNER JOIN
Faça uma consulta sobre o faturamento do e-market. Inclua as seguintes
informações:
● ID da fatura
● data da fatura
● nome da empresa de correio (O id da empresa consta da tabela
faturas no campo FormaEnvio
● nome do cliente
● categoria do produto vendido
● nome do produto(Você chega ao produto consultando os detalhes da
fatura)
● preço unitário
● quantidade
*/
SELECT
	f.FaturaId,
    dataFatura,
    co.Empresa as 'empresa de correio',
    cl.empresa as cliente,
    categ.CategoriaNome as categoria,
    pr.ProdutoNome as produto,
    df.PrecoUnitario as 'preco unitario',
    df.Quantidade
FROM faturas as f
INNER JOIN correios as co
	ON co.CorreioID = f.FormaEnvio
INNER JOIN clientes as cl
	ON f.ClienteID = cl.ClienteID
INNER JOIN detalhefatura as df
	ON f.faturaId = df.FaturaId
INNER JOIN produtos as pr
	ON pr.ProdutoID = df.produtoID
INNER JOIN categorias as categ
	ON pr.CategoriaID = categ.CategoriaID




/*Relatórios II parte II - INNER, LEFT e RIGHT JOIN*/
/*
1. Liste todas as categorias junto com informações sobre seus produtos.
Incluir todas as categorias, mesmo que não tenham produtos.
*/

SELECT
		cat.CategoriaNome,
    prod.*
FROM categorias as cat
LEFT JOIN produtos as prod
	ON cat.CategoriaID = prod.CategoriaID

/*
2. Liste as informações de contato de clientes que nunca compraram no
emarket.
*/
SELECT 
	c.empresa as cliente
FROM clientes as c
LEFT JOIN faturas as f
	ON f.ClienteID = c.ClienteID
WHERE 
    FaturaId IS NULL


/*
3. Faça uma lista de produtos. Para cada um, indique seu nome,
categoria e as informações de contato de seu fornecedor. Lembre-se
que podem existir produtos para os quais o fornecedor não foi
indicado.
*/
SELECT 
	prod.ProdutoNome as produto,
    cat.categorianome as categoria,
    prov.Contato
FROM produtos as prod
LEFT JOIN provedores as prov
	ON prod.ProvedorID = prov.ProvedorID
LEFT JOIN categorias as cat
	ON cat.CategoriaID = prod.CategoriaID
ORDER BY prod.produtonome;


/*
4. Para cada categoria, liste o preço unitário médio de seus produtos.
*/

SELECT
	cat.categoriaNome,
	AVG(prod.precounitario) as 'Média de preço'
FROM categorias AS cat
LEFT JOIN produtos AS prod
	ON prod.CategoriaID = cat.CategoriaID
GROUP BY cat.CategoriaNome



/*
5. Para cada cliente, indique a última nota fiscal de compra. Inclua
clientes que nunca compraram no e-market.
*/

SELECT
	c.ClienteID,
	c.Contato,
    f.FaturaId,
	DATE_FORMAT(MAX(f.DataFatura), "%d/%m/%Y") AS data_fatura
FROM clientes AS c
LEFT JOIN faturas as f
	ON c.ClienteID = f.ClienteID
GROUP BY c.Contato
ORDER BY data_fatura

/*
6. Todas as faturas têm uma empresa de correio associada (envio). Gere
uma lista com todas as empresas de correio e o número de faturas
correspondentes. Execute a consulta usando RIGHT JOIN.
*/

SELECT
    c.Empresa,
    COUNT(f.FaturaId)
FROM correios as c
RIGHT JOIN faturas as f
	ON c.CorreioID = f.FormaEnvio
GROUP BY c.Empresa
