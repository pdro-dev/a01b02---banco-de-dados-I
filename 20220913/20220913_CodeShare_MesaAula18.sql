Pedro Simoes
Igor Matos
Mauricio Sampaio
Johny Joaquim
Marcos Araujo

/* 
AULA 18 - EXERCICIO MESA

Criando stored procedures sobre a  base e-Market 
*/


/*
1) Empregados

a) Crie uma SP que liste os sobrenomes e nomes dos empregados, ordenados alfabeticamente.
b) Invoque a SP para verificar o resultado.
*/

USE emarket;

DROP PROCEDURE IF EXISTS sp_nomeCompletoAsc;

DELIMITER $$
CREATE PROCEDURE sp_nomeCompletoAsc()
BEGIN
SELECT nome, sobrenome
FROM empregados
ORDER BY nome;
END $$
DELIMITER ;

CALL sp_nomeCompletoAsc();

/*
2) Empregados por cidade

a) Crie uma SP que leva o nome de uma cidade e lista os funcionários dessa cidade
b) Invoque a SP para listar os empregados de Seattle.
*/
USE emarket;

DROP PROCEDURE IF EXISTS sp_lista_funcionarios;

DELIMITER %%
CREATE PROCEDURE sp_lista_funcionarios(IN city VARCHAR(15))
BEGIN
	SELECT *
    FROM empregados
	WHERE Cidade = city;
END %%
DELIMITER ;
CALL  sp_lista_funcionarios("Seattle");



/*
3) Clientes por país

a) Crie uma SP que recebe o nome de um país e retorne o número de clientes naquele país.
b) Invoque a SP para consultar a quantidade de clientes de Portugal.
*/

USE emarket;

DROP PROCEDURE IF EXISTS sp_clientes_por_pais;

DELIMITER %%
CREATE PROCEDURE sp_clientes_por_pais
(
    IN p_pais VARCHAR(50)
)
BEGIN
    SELECT COUNT (*) AS TotalClientes
    FROM clientes
    WHERE Pais = p_pais;
END %%
DELIMITER ;
CALL sp_clientes_por_pais('Portugal')



/*
4) Produtos sem estoque

a) Crie uma SP que receba um número e liste os produtos cujo estoque está abaixo desse número. O resultado deve mostrar o nome do produto, o Estoque atual e o nome da categoria à qual o produto pertence.
b) Liste os produtos com menos de 10 unidades no estoque;
c) Liste os produtos sem estoque.
*/


DROP PROCEDURE IF EXISTS sp_numero_de_produtos;

DELIMITER %%
CREATE PROCEDURE sp_numero_de_produtos (IN p_numero INT)
BEGIN
	SELECT produtos.ProdutoNome,produtos.UnidadesEstoque,categorias.CategoriaNome
    FROM produtos
    INNER JOIN categorias ON categorias.CategoriaID = produtos.CategoriaID
	WHERE produtos.UnidadesEstoque < p_numero;
END %%
DELIMITER ;
CALL sp_numero_de_produtos(10);
CALL sp_numero_de_produtos(1);


/*
5) Vendas com desconto

a) Crie uma SP que receba uma porcentagem e 
	lista os nomes dos produtos 
  que foram vendidos com desconto igual ou superior ao valor indicado, 
  indicando, também,  o nome do cliente a quem foi vendido.
  
b) Liste as informações dos produtos que foram vendidos com um desconto superior a 10%.
*/
-- -----------------------
USE emarket;

DROP PROCEDURE IF EXISTS sp_vendas_com_desconto;

DELIMITER %%
CREATE PROCEDURE sp_vendas_com_desconto
(
    IN p_desconto DOUBLE
)
BEGIN
    SELECT 
        c.Contato AS NomeCliente,
        p.ProdutoNome AS Produto,
        df.Desconto AS Desconto
    FROM faturas f
    JOIN clientes c ON f.ClienteId = c.ClienteId
    JOIN detalheFatura df ON f.FaturaId = df.FaturaId
    JOIN produtos p ON df.ProdutoId = p.ProdutoId
    WHERE df.Desconto >= p_desconto;
    
END %%
DELIMITER ;


CALL sp_vendas_com_desconto(0.1);

-- DROP PROCEDURE sp_vendas_com_desconto;








