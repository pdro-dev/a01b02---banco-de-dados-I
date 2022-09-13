USE emarket;

DROP PROCEDURE IF EXISTS sp_clientes_por_pais;

DELIMITER %%
CREATE PROCEDURE sp_clientes_por_pais
(
    IN p_pais VARCHAR(50)
)
BEGIN
    SELECT 
		Pais,
		COUNT(*) AS TotalClientes
    FROM clientes
    WHERE Pais = p_pais;
    
END %%
DELIMITER ;

CALL sp_clientes_por_pais('Portugal');