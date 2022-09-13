USE emarket;

DROP PROCEDURE IF EXISTS sp_lista_funcionarios;

DELIMITER %%
CREATE PROCEDURE sp_lista_funcionarios
(
	IN p_cidade VARCHAR(15)
)
BEGIN
	SELECT *
    FROM empregados
	WHERE Cidade = p_cidade;
END %%
DELIMITER ;

CALL sp_lista_funcionarios("Seattle");
