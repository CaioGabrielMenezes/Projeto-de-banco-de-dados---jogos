CREATE TABLE desenvolvedora (
	id_desenvolvedora SERIAL PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	pais_origem VARCHAR (30),
	ano_fundacao INT
);



CREATE TABLE jogo(
	id_jogo SERIAL,
	id_desenvolvedora INT,
	nome VARCHAR(50) NOT NULL,
	ano_lancamento INT NOT NULL,
	descricao TEXT,
	classificacao_indicativa INT,
	preco NUMERIC(10,2) NOT NULL,

	CONSTRAINT pk_id_jogo PRIMARY KEY(id_jogo),
	CONSTRAINT fk_id_desenvolvedora FOREIGN KEY(id_desenvolvedora) REFERENCES desenvolvedora(id_desenvolvedora)
);



CREATE TABLE genero(
	id_genero SERIAL,
	descricao VARCHAR(30) NOT NULL,

	CONSTRAINT pk_id_genero PRIMARY KEY(id_genero)
);

CREATE TABLE genero_jogo(
	id_genero INT NOT NULL,
	id_jogo INT NOT NULL,
	PRIMARY KEY(id_jogo, id_genero),

	CONSTRAINT fk_id_jogo FOREIGN KEY(id_jogo) REFERENCES jogo(id_jogo),
	CONSTRAINT fk_id_genero FOREIGN KEY (id_genero) REFERENCES genero(id_genero)
	
);

CREATE TABLE plataforma(
	id_plataforma SERIAL PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	fabricante VARCHAR(30),
	ano_lancamento INT
);

CREATE TABLE jogo_plataforma(
	id_jogo INT NOT NULL,
	id_plataforma INT NOT NULL,
	PRIMARY KEY(id_jogo, id_plataforma),

	CONSTRAINT fk_id_jogo FOREIGN KEY(id_jogo) REFERENCES jogo(id_jogo),
	CONSTRAINT fk_id_plataforma FOREIGN KEY(id_plataforma) REFERENCES plataforma(id_plataforma)
);

CREATE TABLE usuario(
	id_usuario SERIAL PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	email VARCHAR(60) UNIQUE,
	data_nascimento DATE
);

CREATE TABLE avaliacao(
	id_avaliacao SERIAL PRIMARY KEY,
	nota INTEGER CHECK(nota BETWEEN 0 AND 10),
	comentario TEXT,
	data_avaliacao DATE default CURRENT_DATE,
	id_usuario INT NOT NULL,
	id_jogo INT NOT NULL,

	CONSTRAINT fk_id_usuario FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
	CONSTRAINT fk_id_jogo FOREIGN KEY(id_jogo) REFERENCES jogo(id_jogo)
);

CREATE TABLE dlc(
	id_dlc SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descricao TEXT,
	data_lancamento DATE NOT NULL,
	preco NUMERIC(10, 2),
	id_jogo INT NOT NULL,

	CONSTRAINT fk_id_jogo FOREIGN KEY (id_jogo) REFERENCES jogo(id_jogo)
);

--------------------------------------------------------------------------
INSERT INTO desenvolvedora(nome, pais_origem, ano_fundacao)
VALUES('Rockstar Games', 'Estados Unidos', 1998);

INSERT INTO desenvolvedora(nome, pais_origem, ano_fundacao)
VALUES('CD projekt red', 'Polônia', 2002);

INSERT INTO desenvolvedora(nome, pais_origem, ano_fundacao)
VALUES('Nintendo', 'Japão', 1889);

SELECT * FROM jogo;
--------------------------------------------------------------------------

INSERT INTO jogo(nome, ano_lancamento, preco, id_desenvolvedora)
VALUES('Red Dead Redemption 2', 2018, 199.90, 1);

INSERT INTO jogo(nome, ano_lancamento, preco, id_desenvolvedora)
VALUES('The Witcher 3: Wild Hunt', 2015, 149.90, 2);

INSERT INTO jogo(nome, ano_lancamento, preco, id_desenvolvedora)
VALUES('The Legend of Zelda: Breath of the Wild', 2017, 249.90, 3);

--------------------------------------------------------------------------

INSERT INTO genero(descricao)
VALUES('Ação');

INSERT INTO genero(descricao)
VALUES('RPG');

INSERT INTO genero(descricao)
VALUES('Aventura');

INSERT INTO genero(descricao)
VALUES('Mundo Aberto');

SELECT * FROM jogo;
--------------------------------------------------------------------------

INSERT INTO genero_jogo(id_jogo, id_genero)
VALUES(1, 1);

INSERT INTO genero_jogo(id_jogo, id_genero)
VALUES(1, 4);

INSERT INTO genero_jogo(id_jogo, id_genero)
VALUES(2, 2);

INSERT INTO genero_jogo(id_jogo, id_genero)
VALUES(2, 4);

INSERT INTO genero_jogo(id_jogo, id_genero)
VALUES(3, 1);

INSERT INTO genero_jogo(id_jogo, id_genero)
VALUES(3, 3);

INSERT INTO genero_jogo(id_jogo, id_genero)
VALUES(3, 4);

--------------------------------------------------------------------------

INSERT INTO plataforma(nome, fabricante)
VALUES('Playstation 4', 'Sony');

INSERT INTO plataforma(nome, fabricante, ano_lancamento)
VALUES('Xbox One', 'Microsoft', 2013);

INSERT INTO plataforma(nome, fabricante, ano_lancamento)
VALUES('Nintendo Switch', 'Nintendo', 2017);

INSERT INTO plataforma(nome, fabricante)
VALUES('PC', 'diversos');

--------------------------------------------------------------------------

INSERT INTO jogo_plataforma(id_jogo, id_plataforma)
VALUES(1, 1);

INSERT INTO jogo_plataforma(id_jogo, id_plataforma)
VALUES(1, 2);

INSERT INTO jogo_plataforma(id_jogo, id_plataforma)
VALUES(1, 4);

INSERT INTO jogo_plataforma(id_jogo, id_plataforma)
VALUES(2, 1);

INSERT INTO jogo_plataforma(id_jogo, id_plataforma)
VALUES(2, 2);

INSERT INTO jogo_plataforma(id_jogo, id_plataforma)
VALUES(2, 4);

INSERT INTO jogo_plataforma(id_jogo, id_plataforma)
VALUES(3, 3);

--------------------------------------------------------------------------

INSERT INTO usuario(nome, email, data_nascimento)
VALUES('Caio Silva', 'caio@email.com', '2001-04-02');

INSERT INTO usuario(nome, email)
VALUES('Amanda Costa', 'amanda@email.com');

INSERT INTO usuario(nome, email)
VALUES('Lucas Oliveira', 'lucas@email.com');

UPDATE usuario
SET data_nascimento = '1999-05-13'
WHERE id_usuario = 2;

UPDATE usuario
SET data_nascimento = '2005-08-20'
WHERE id_usuario = 4;

SELECT * FROM usuario;

--------------------------------------------------------------------------

INSERT INTO avaliacao(nota, comentario, id_usuario, id_jogo)
VALUES(10, 'Jogo incrível, mundo vivo e história cativante!', 1, 1);

INSERT INTO avaliacao(nota, comentario, id_usuario, id_jogo)
VALUES(9, 'Sistema de combate excelente e trilha sonora épica.', 2, 2);

INSERT INTO avaliacao(nota, comentario, id_usuario, id_jogo)
VALUES(10, 'Simplesmente o melhor jogo do Switch.', 4, 3);

SELECT * FROM avaliacao;

--------------------------------------------------------------------------

INSERT INTO dlc(nome, descricao, data_lancamento, preco, id_jogo)
VALUES('Blood and Wine', 'Nova região e missões para The Witcher 3', '2016-05-31', 49.90, 2);

INSERT INTO dlc(nome, descricao, data_lancamento, preco, id_jogo)
VALUES('Undead Nightmare', 'Campanha zumbi para Red Dead Redemption', '2010-10-26', 29.90, 1);

SELECT * FROM dlc;

--------------------------------------------------------------------------
