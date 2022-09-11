CREATE DATABASE DHTube;
USE DHTube;

CREATE TABLE pais(
idPais  int (11) auto_increment not null PRIMARY KEY ,
nome VARCHAR(100)
);

CREATE TABLE avatar (
idAvatar INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45),
  urlimagem VARCHAR(100)
);

CREATE TABLE usuario (
idUsuario INT(11) AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (45),
email VARCHAR(45),
senha VARCHAR (45),
dataNascimento DATETIME,
cep VARCHAR(25),
pais_idPais INT(11),
Avatar_idAvatar INT(11),
FOREIGN KEY (pais_idPais) REFERENCES pais (idPais),
FOREIGN KEY (Avatar_idAvatar) REFERENCES avatar(idAvatar)
);

CREATE TABLE playlist (
	idPlaylist INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45),
  dataCriacao DATETIME,
  privado SMALLINT(6),
  usuario_IdUsuario INT,
  CONSTRAINT FK_playlist FOREIGN KEY (usuario_IdUsuario) REFERENCES usuario(IdUsuario)
);

CREATE TABLE canal (
idCanal  INT (11) AUTO_INCREMENT not null PRIMARY KEY,
usuario_idUsuario INT (11) not null,
  CONSTRAINT FK_idUsuario Foreign key   (usuario_idUsuario)  references usuario(idUsuario),
  nome VARCHAR (45),
  descricao TEXT,
  dataCriacao DATETIME
);

CREATE TABLE video(
idVideo  INT (11) AUTO_INCREMENT not null PRIMARY KEY,
usuario_idUsuario INT (11) not null,
titulo VARCHAR(100),
descricao TEXT,
tamanho DOUBLE,
nomeArquivo VARCHAR (100),
duracao DOUBLE,
imagem VARCHAR(100),
qtdReproducoes INT(11),
qtdLikes INT (11),
qtdDeslikes INT (11),
privado SMALLINT(6),
dataPubilicacao DATETIME,
  CONSTRAINT FKidUsuario Foreign Key (usuario_idUsuario) references usuario(idUsuario)
);

CREATE TABLE playlist_video (
	Video_idVideo INT(11) NOT NULL,
  Playlist_idPlaylist INT(11) NOT NULL,
  FOREIGN KEY (Video_idVideo) REFERENCES video (idVideo),
  FOREIGN KEY (Playlist_idPlaylist) REFERENCES playlist (idPlaylist)
);