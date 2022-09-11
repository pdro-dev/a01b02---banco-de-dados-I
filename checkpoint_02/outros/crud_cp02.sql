-- INSERIR DADOS NA TABELA ENTIDADE EMPRESAS
INSERT INTO tb_empresa (`nome`, `cnpj`, `website`, `telefone`, `email`, `descricaoEmpresa`, `id_palestrante`) VALUES
('Empresa 1', '123456789', 'www.empresa1.com.br', '11 1234-5678', 'Empresa de teste 1', 'Empresa de teste 1', NULL),
('Empresa 2', '123456789', 'www.empresa2.com.br', '11 1234-5678', 'Empresa de teste 2', 'Empresa de teste 2', NULL),
('Empresa 3', '123456789', 'www.empresa3.com.br', '11 1234-5678', 'Empresa de teste 3', 'Empresa de teste 3', NULL),
('Empresa 4', '123456789', 'www.empresa4.com.br', '11 1234-5678', 'Empresa de teste 4', 'Empresa de teste 4', NULL),
('Empresa 5', '123456789', 'www.empresa5.com.br', '11 1234-5678', 'Empresa de teste 5', 'Empresa de teste 5', NULL);

-- INSERIR DADOS NA TABELA ENTIDADE PALESTRANTES
INSERT INTO tb_palestrante (`nome`, `sobrenome`, `cpf`, `telefone`, `email`, `id_empresa`, `vip`) VALUES
('Palestrante 1', 'Sobrenome 1', '123456789', '11 1234-5678', 'Palestrante de teste 1', null, FALSE),
('Palestrante 2', 'Sobrenome 2', '123456789', '11 1234-5678', 'Palestrante de teste 2', null, TRUE),
('Palestrante 3', 'Sobrenome 3', '123456789', '11 1234-5678', 'Palestrante de teste 3', null, FALSE),
('Palestrante 4', 'Sobrenome 4', '123456789', '11 1234-5678', 'Palestrante de teste 4', null, FALSE),
('Palestrante 5', 'Sobrenome 5', '123456789', '11 1234-5678', 'Palestrante de teste 5', null, TRUE),
('Palestrante 6', 'Sobrenome 6', '123456789', '11 1234-5678', 'Palestrante de teste 6', null, FALSE),
('Palestrante 7', 'Sobrenome 7', '123456789', '11 1234-5678', 'Palestrante de teste 7', null, FALSE),
('Palestrante 8', 'Sobrenome 8', '123456789', '11 1234-5678', 'Palestrante de teste 8', null, TRUE),
('Palestrante 9', 'Sobrenome 9', '123456789', '11 1234-5678', 'Palestrante de teste 9', null, FALSE),
('Palestrante 10', 'Sobrenome 10', '123456789', '11 1234-5678', 'Palestrante de teste 10', null, FALSE);

-- ATUALIZAR DADOS NA TABELA ENTIDADE EMPRESAS (SETANDO O ID DO PALESTRANTE)
UPDATE tb_empresa SET `id_palestrante` = 1 WHERE (`id_empresa` = 1);
UPDATE tb_empresa SET `id_palestrante` = 2 WHERE (`id_empresa` = 2);
UPDATE tb_empresa SET `id_palestrante` = 3 WHERE (`id_empresa` = 3);
UPDATE tb_empresa SET `id_palestrante` = 4 WHERE (`id_empresa` = 4);
UPDATE tb_empresa SET `id_palestrante` = 5 WHERE (`id_empresa` = 5);
-- ATUALIZAR DADOS NA TABELA ENTIDADE EMPRESAS (SETANDO O EMAIL)
UPDATE tb_empresa SET `email` = 'empresa1@email.com' WHERE (`nome` = 'Empresa 1' AND `id_empresa` > 0);
UPDATE tb_empresa SET `email` = 'empresa2@email.com' WHERE (`nome` = 'Empresa 2' AND `id_empresa` > 0);
UPDATE tb_empresa SET `email` = 'empresa3@email.com' WHERE (`nome` = 'Empresa 3' AND `id_empresa` > 0);
UPDATE tb_empresa SET `email` = 'empresa4@email.com' WHERE (`nome` = 'Empresa 4' AND `id_empresa` > 0);
UPDATE tb_empresa SET `email` = 'empresa5@email.com' WHERE (`nome` = 'Empresa 5' AND `id_empresa` > 0);

-- ATUALIZAR DADOS DA TABELA ENTIDADE PALESTRANTE (SETANDO O ID DA EMPRESA E O EMAIL DO PALESTRANTE)
UPDATE tb_palestrante SET `id_empresa` = 1, `email` = 'palestrante_1@email.com' WHERE (`id_palestrante` = 1);
UPDATE tb_palestrante SET `id_empresa` = 2, `email` = 'palestrante_2@email.com' WHERE (`id_palestrante` = 2);
UPDATE tb_palestrante SET `id_empresa` = 3, `email` = 'palestrante_3@email.com' WHERE (`id_palestrante` = 3);
UPDATE tb_palestrante SET `id_empresa` = 4, `email` = 'palestrante_4@email.com' WHERE (`id_palestrante` = 4);
UPDATE tb_palestrante SET `id_empresa` = 5, `email` = 'palestrante_5@email.com' WHERE (`id_palestrante` = 5);

-- EXCLUIR DADOS NA TABELA ENTIDADE PALESTRANTES
DELETE FROM tb_palestrante WHERE (`id_palestrante` > 5);
-- RESET AUTO INCREMENT DA TABELA ENTIDADE PALESTRANTES
ALTER TABLE tb_palestrante AUTO_INCREMENT = 6;
-- INSERIR DADOS NA TABELA ENTIDADE PALESTRANTES
INSERT INTO tb_palestrante (`nome`, `sobrenome`, `cpf`, `telefone`, `email`, `id_empresa`, `vip`) VALUES
('Palestrante 9', 'Sobrenome 9', '123456789', '11 1234-5678', 'Palestrante de teste 9', null, FALSE),
('Palestrante 10', 'Sobrenome 10', '123456789', '11 1234-5678', 'Palestrante de teste 10', null, FALSE);


-- SELECIONAR DADOS DA TABELA ENTIDADE PALESTRANTES
SELECT * FROM tb_palestrante;

-- SELECIONAR REGISTROS ENVOLVENDO JOIN COM DUAS TABELAS E ALGUM TIPO DE AGRESGAÇÃO
SELECT tb_palestrante.nome, tb_palestrante.sobrenome, tb_palestrante.cpf, tb_palestrante.email, tb_palestrante.vip, tb_empresa.nome, tb_empresa.email 
FROM tb_palestrante INNER JOIN tb_empresa ON tb_palestrante.id_empresa = tb_empresa.id_empresa;

-- SELECT * FROM tb_empresa;
-- DELETE FROM tb_empresa WHERE tb_empresa.id_empresa > 0;
-- ALTER TABLE tb_empresa auto_increment = 1;

-- SELECT * FROM tb_palestrante
-- DELETE FROM tb_palestrante WHERE tb_palestrante.id_palestrante > 0;
-- ALTER TABLE tb_palestrante auto_increment = 1;