/*
Nesta aula estamos trabalhando a criação, execução, 
modificação e exclusão de Stored Procedures.
*/

-- Criação de Stored Procedures

/*
Exercícios:
Utilizando a base de dados musimundos_v2, na tabela clientes crie as 
procedures:
1) Crie uma procedure que retorna o nome e sobrenome concatenados e 
também o email de todos os clientes.
2) Crie uma procedure que retorna o nome completo (nome e sobrenome 
concatenados) e também o endereço completo (endereço, cidade, estado 
e país) de um cliente pelo id informado.
3) Crie uma procedure que retorna o nome do cliente e o valor total de cada 
uma das suas faturas pelo id do cliente informado.
*/

-- 1) Crie uma procedure que retorna o nome e sobrenome concatenados e também o email de todos os clientes.

DELIMITER $$
DROP PROCEDURE IF EXISTS `musimundos_v2`.`sp_clientes`
CREATE PROCEDURE sp_clientes

BEGIN
    SELECT CONCAT(nome, ' ', sobrenome) AS nome_completo, email
    FROM clientes;
END $$
DELIMITER ;
