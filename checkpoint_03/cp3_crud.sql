-- consultas CRUD
-- USE checkpoint_3;

-- CRUD
-- CREATE
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('VIP', 4);

-- READ
SELECT * FROM funcionarios;

-- UPDATE
UPDATE mesa SET mesaTipo = 'VIP' WHERE mesaId = 1;

-- DELETE
DELETE FROM mesa WHERE mesaId > 10;

-- INSERT mesaTipo balcao para 1 lugar
INSERT INTO mesa (mesaTipo, qtdLugares) VALUES ('balcao', 1);


-- INSERT FUNCIONARIO
INSERT INTO funcionarios (nome, sobrenome, dataContrat, dataNasc, cargo) VALUES ('João', 'Souza', '2019-01-01', '1990-01-01', 'Garçom');


/*
1. Suas consultas deverão contemplar o CRUD;
2. Utilize Alter Table para acrescentar uma coluna a uma tabela.
3. Crie uma procedure que, dado um número como parâmetro, retorne dados 
de duas ou mais tabelas.
4. Crie uma view que contemple os principais dados do banco, de forma que qualquer usuário possa manipular os dados apenas pela view criada
*/

-- 2. Utilize Alter Table para acrescentar uma coluna a uma tabela.

ALTER TABLE funcionarios ADD COLUMN salario FLOAT;





