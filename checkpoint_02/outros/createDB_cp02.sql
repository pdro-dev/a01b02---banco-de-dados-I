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