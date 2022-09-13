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