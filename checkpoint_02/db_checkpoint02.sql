
/*
O MODELO BUSCA REPRESENTAR UM BANCO DE DADOS PARA REGISTRO DE APRESENTAÇÕES CORPORATIVAS PRESENCIAIS EM UM EDIFÍCIO COMERCIAL PARA EVENTOS.

ARMAZENA AS EMPRESAS, SEUS REPRESENTANTES, PALESTRANTES E OS PARTICIPANTES DO EVENTO. ASSIM COMO O LOCAL, DATA E HORAS DE INÍCIO E FIM E DESCRIÇÃO DAS APRESENTAÇÕES.

GUARDA TAMBÉM OS REGISTROS DE INGRESSOS. 
*/

/*
FEEDBACK
"Não fez uso das convenções de banco de dados. O que uma seta representa? É uma relação 1:n? 1:1? N:N? Impossível identificar. Não entendi pq EMPRESA > PARTICIPANTE tem duas relações: uma através do campo idRepresentantePrincipal e outra com idEmpresa. Não seria mais elegante separar participante de um palestrante, por exemplo? E aí, nesse caso, relacionaria EMPRESA > PALESTRANTE"
*/


/*
CHECKPOINT 2

Após ter todo seu modelo estruturado no checkpoint I, você deve fazer a criação do banco de dados no Workbench e deixar, ao menos, um exemplo de cada operação (CRUD), em pelo menos uma entidade do seu modelo, pronta para teste em um arquivo sql.

O arquivo de script da resposta deve conter:
    ● Criação do banco de dados.
    ● Criação das tabelas com chaves primárias e estrangeiras.
    ● Ide dados em inserção uma das tabelas.
    ● Atualização de dados em uma das tabelas.
    ● Exclusão de dados em uma das tabelas.
    ● Seleção de dados de uma das tabelas.
    ● Seleção de registros envolvendo join com pelo menos duas tabelas e algum tipo de agregação

*/

-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS `checkpoint_02`;

-- Criação das tabelas com chaves primárias e estrangeiras
USE `checkpoint_02`;



-- CRIAR TABELA ENTIDADE EMPRESAS
CREATE TABLE IF NOT EXISTS `checkpoint_02`.`tb_empresa` (
    `id_empresa` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `cnpj` VARCHAR(45) NOT NULL,
    `website` VARCHAR(45) NOT NULL,
    `telefone` VARCHAR(45) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `descricaoEmpresa` VARCHAR(45) NOT NULL,
    `id_palestrante` INT,

    PRIMARY KEY (`id_empresa`)
    -- FOREIGN KEY (`id_palestrante`) REFERENCES `tb_palestrante`(`id_palestrante`)
);

-- CRIAR TABELA ENTIDADE PALESTRANTES
CREATE TABLE IF NOT EXISTS `checkpoint_02`.`tb_palestrante` (
    `id_palestrante` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `sobrenome` VARCHAR(45) NOT NULL,
    `cpf` VARCHAR(45) NOT NULL,
    `telefone` VARCHAR(45) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `id_empresa` INT,
    `vip` BOOLEAN,

    PRIMARY KEY (`id_palestrante`),
    FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa`(`id_empresa`)
);

ALTER TABLE `tb_empresa` ADD FOREIGN KEY (`id_palestrante`) REFERENCES `tb_palestrante`(`id_palestrante`);


-- CRIAR TABELA ENTIDADE PARTICIPANTES
CREATE TABLE IF NOT EXISTS `checkpoint_02`.`tb_participante` (
    `id_participante` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `sobrenome` VARCHAR(45) NOT NULL,
    `cpf` VARCHAR(45) NOT NULL,
    `telefone` VARCHAR(45) NOT NULL,
    `email` VARCHAR(45) NOT NULL,
    `vip` BOOLEAN,
    `representante` BOOLEAN,
    `nomeEmpresa` VARCHAR(45),

    PRIMARY KEY (`id_participante`)
);

-- CRIAR TABELA ENTIDADE SALA
CREATE TABLE IF NOT EXISTS `checkpoint_02`.`tb_sala` (
    `id_sala` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NOT NULL,
    `capacidade` INT NOT NULL,
    `andar` INT NOT NULL,

    PRIMARY KEY (`id_sala`)
);

-- CRIAR TABELA ENTIDADE APRESENTACAO
CREATE TABLE IF NOT EXISTS `checkpoint_02`.`tb_apresentacao` (
    `id_apresentacao` INT NOT NULL AUTO_INCREMENT,
    `data` DATE NOT NULL,
    `horaInicio` TIME NOT NULL,
    `horaFim` TIME NOT NULL,
    `descricao` VARCHAR(45) NOT NULL,
    `id_empresa` INT NOT NULL,
    `id_sala` INT NOT NULL,

    PRIMARY KEY (`id_apresentacao`),
    FOREIGN KEY (`id_empresa`) REFERENCES `tb_empresa`(`id_empresa`),
    FOREIGN KEY (`id_sala`) REFERENCES `tb_sala`(`id_sala`)
);

-- CRIAR TABELA ENTIDADE INGRESSOS
CREATE TABLE IF NOT EXISTS `checkpoint_02`.`tb_ingresso` (
    `id_ticket` INT NOT NULL AUTO_INCREMENT,
    `valor` DECIMAL(10,2) NOT NULL,
    `id_apresentacao` INT NOT NULL,
    `id_participante` INT NOT NULL,

    PRIMARY KEY (`id_ticket`),
    FOREIGN KEY (`id_apresentacao`) REFERENCES `tb_apresentacao`(`id_apresentacao`),
    FOREIGN KEY (`id_participante`) REFERENCES `tb_participante`(`id_participante`)
);

/* CRUD
    ● Inserção de dados em uma das tabelas.
    ● Atualização de dados em uma das tabelas.
    ● Exclusão de dados em uma das tabelas.
    ● Seleção de dados de uma das tabelas.
    ● Seleção de registros envolvendo join com pelo menos duas tabelas e algum tipo de agregação
*/

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