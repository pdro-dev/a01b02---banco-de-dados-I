CREATE DATABASE IF NOT EXISTS sPotify;
USE sPotify;

CREATE TABLE IF NOT EXISTS usuario (
	idUsuario INT NOT NULL,
    nomeusuario VARCHAR(45),
    data_nac DATE,
    sexo VARCHAR(1),
    email VARCHAR(150),
    senha VARCHAR(45),
    PRIMARY KEY (idUsuario)
);

CREATE TABLE IF NOT EXISTS playlist (
	idPlaylist INT NOT NULL,
    idusuario INT NOT NULL,
    titulo VARCHAR(45),
    qtdcancoes INT NOT NULL,
    datacriacao DATETIME,
    CONSTRAINT PK_playlist_id PRIMARY KEY (idPlaylist),
    CONSTRAINT FK_usuario_id FOREIGN KEY (idusuario) REFERENCES usuario (idUsuario)
);