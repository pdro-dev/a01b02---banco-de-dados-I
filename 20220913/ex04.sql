USE emarket;

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