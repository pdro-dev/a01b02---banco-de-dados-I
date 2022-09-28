/*
1. Suas consultas deverão contemplar o CRUD;
2. Utilize Alter Table para acrescentar uma coluna a uma tabela.
3. Crie uma procedure que, dado um número como parâmetro, retorne dados 
de duas ou mais tabelas.
4. Crie uma view que contemple os principais dados do banco, de forma que qualquer usuário possa manipular os dados apenas pela view criada
*/
-- USE checkpoint_3;

-- CRUD
-- CREATE
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('VIP', 4);

-- READ
SELECT * FROM funcionarios;

SELECT * FROM comanda;

-- UPDATE
UPDATE mesa SET mesaTipo = 'VIP' WHERE mesaId = 1;

-- DELETE
DELETE FROM mesa WHERE mesaId > 10;

-- INSERT mesaTipo balcao para 1 lugar
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('balcao', 1);


-- INSERT FUNCIONARIO
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('João', 'Souza', '2019-01-01', '1990-01-01', 'Garçom');




-- 2. Utilize Alter Table para acrescentar uma coluna a uma tabela.

ALTER TABLE funcionarios ADD COLUMN salario FLOAT;

SET SQL_SAFE_UPDATES = 0;
-- atualizar salarios de todos os cargos
UPDATE funcionarios SET salario = 1000.00 WHERE cargo = 'Garçom';
UPDATE funcionarios SET salario = 2000.00 WHERE cargo = 'Cozinheiro';
UPDATE funcionarios SET salario = 3000.00 WHERE cargo = 'Gerente';
UPDATE funcionarios SET salario = 2000.00 WHERE cargo = 'Maitre';
UPDATE funcionarios SET salario = 1000.00 WHERE cargo = 'Commins';
UPDATE funcionarios SET salario = 10000.00 WHERE cargo = 'Chef';
UPDATE funcionarios SET salario = 1000.00 WHERE cargo = 'Auxiliar de Cozinha';
UPDATE funcionarios SET salario = 1000.00 WHERE cargo = 'Barman';
UPDATE funcionarios SET salario = 1000.00 WHERE cargo = 'Auxiliar de Limpeza';
UPDATE funcionarios SET salario = 1000.00 WHERE cargo = 'Segurança';
SET SQL_SAFE_UPDATES = 1;


