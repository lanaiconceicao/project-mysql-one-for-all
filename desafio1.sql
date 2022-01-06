DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
  plano_id INT AUTO_INCREMENT,
  plano VARCHAR(45),
  preco DECIMAL(4,2),
  PRIMARY KEY (plano_id)
) engine = InnoDB;

CREATE TABLE usuarios(
  usuario_id INT AUTO_INCREMENT,
  usuario VARCHAR(50),
  idade INT,
  plano_id INT NOT NULL,
  data_assinatura DATE,
  PRIMARY KEY (usuario_id),
  FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

CREATE TABLE artistas(
  artista_id INT AUTO_INCREMENT,
  artista VARCHAR(50),
  PRIMARY KEY (artista_id)
) engine = InnoDB;

CREATE TABLE seguindo(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE album(
  album_id INT AUTO_INCREMENT,
  album VARCHAR(255),
  artista_id INT NOT NULL,
  ano_lancamento YEAR,
  PRIMARY KEY (album_id),
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

CREATE TABLE cancoes(
  cancao_id INT AUTO_INCREMENT,
  cancao VARCHAR(255),
  duracao_segundos INT,
  artista_id INT NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (cancao_id),
  FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
  FOREIGN KEY (album_id) REFERENCES album(album_id)
) engine = InnoDB;

CREATE TABLE usuario_historico(
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  data_reproducao DATETIME,
  PRIMARY KEY (usuario_id, cancao_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
) engine = InnoDB;

INSERT INTO planos (plano, preco)
VALUES ('gratuito', 0),
('familiar', 7.99),
('universitario', 5.99),
('pessoal', 6.99);

INSERT INTO usuarios (usuario, idade, plano_id, data_assinatura)
VALUES ('Thati', 23, 1, '2019-10-20'),
('Cintia', 35, 2, '2019-10-20'),
('Bill', 20, 3, '2019-06-05'),
('Roger', 45, 4, '2020-05-13'),
('Norman', 58, 4, '2017-02-17'),
('Patrick', 33, 2, '2017-01-06'),
('Vivian', 26, 3, '2018-01-05'),
('Carol', 19, 3, '2018-02-14'),
('Angelina', 42, 2, '2018-04-29'),
('Paul', 46, 2, '2017-01-17');

INSERT INTO artistas (artista)
VALUES ('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon'),
('Tyler Isle'),
('Fog');

INSERT INTO seguindo (usuario_id, artista_id)
VALUES (1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 3),
(6, 1),
(7, 2),
(7, 5),
(8, 1),
(8, 5),
(9, 6),
(9, 4),
(9, 3),
(10, 2),
(10, 6);

INSERT INTO album (album, artista_id, ano_lancamento)
VALUES
('Envious', 1, 1990),
('Exuberant', 1, 1993),
('Hallowed Steam', 2, 1995),
('Incandescent', 3, 1998),
('Temporary Culture', 4, 2001),
('Library of liberty', 4, 2003),
('Chained Down', 5, 2007),
('Cabinet of fools', 5, 2012),
('No guarantees', 5, 2015),
('Apparatus', 6, 2015);

INSERT INTO cancoes (cancao, duracao_segundos, artista_id, album_id)
VALUES
('Soul For Us', 200, 1, 1),
('Reflections Of Magic', 163, 1, 1),
('Dance With Her Own', 116, 1, 1),
('Troubles Of My Inner Fire', 203, 1, 2),
('Time Fireworks', 152, 1, 2),
('Magic Circus', 105, 2, 3),
('Honey, So Do I', 207, 2, 3),
("Sweetie, Let's Go Wild", 139, 2, 3),
("She Knows", 244, 2, 3),
('Fantasy For Me', 100, 3, 4),
('Celebration Of More', 146, 3, 4),
('Rock his Everything', 223, 3, 4),
('Home Forever', 231, 3, 4),
('Diamond Power', 241, 3, 4),
("Let's Be Silly", 132, 3, 4),
('Thang Of Thunder', 240, 4, 5),
('Words Of Her Life', 185, 4, 5),
('Without My Streets', 176, 4, 5),
('Need Of The Evening', 190, 4, 6),
('History Of My Roses', 222, 4, 6),
('Without My Love', 111, 4, 6),
('Walking And Game', 123, 4, 6),
('Young And Father', 197, 4, 6),
('Finding My Traditions', 179, 5, 7),
('Walking And Man', 229, 5, 7),
('Hard And Time', 135, 5, 7),
("Honey, I'm A Lone Wolf", 150, 5, 7),
("She Thinks I Won't Stay Tonight", 166, 5, 8),
("He Heard You're Bad For Me", 154, 5, 8),
("He Hopes We Can't Stay", 210, 5, 8),
('I Know I Know', 117, 5, 8),
("He's Walking Away", 159, 5, 9),
("He's Trouble", 138, 5, 9),
('I Heard I Want To Bo Alone', 120, 5, 9),
('I Ride Alone', 151, 5, 9),
('Honey', 79, 6, 10),
('You Cheated On Me', 95, 6, 10),
("Wouldn't Be Nice", 213, 6, 10),
('Baby', 136, 6, 10),
('You Make Me Feel So..', 83, 6, 10);

INSERT INTO usuario_historico (usuario_id, cancao_id, data_reproducao)
VALUES
(1, 36, '2020-02-28 10:45:55'),
(1, 25, '2020-05-02 05:30:35'),
(1, 23, '2020-03-06 11:22:33'),
(1, 14, '2020-08-05 08:05:17'),
(1, 15, '2020-09-14 16:32:22'),
(2, 34, '2020-01-02 07:40:33'),
(2, 24, '2020-05-16 06:16:22'),
(2, 21, '2020-10-09 12:27:48'),
(2, 39, '2020-09-21 13:14:46'),
(3, 6, '2020-11-13 16:55:13'),
(3, 3, '2020-12-05 18:38:30'),
(3, 26, '2020-07-30 10:00:00'),
(4, 2, '2021-08-15 17:10:10'),
(4, 35, '2021-07-10 15:20:30'),
(4, 27, '2021-01-09 01:44:33'),
(5, 7, '2020-07-03 19:33:28'),
(5, 12, '2017-02-24 21:14:22'),
(5, 14, '2020-08-06 15:23:43'),
(5, 1, '2020-11-10 13:52:27'),
(6, 38, '2019-02-07 20:33:48'),
(6, 29, '2017-01-24 00:31:17'),
(6, 30, '2017-10-12 12:35:20'),
(6, 22, '2018-05-29 14:56:41'),
(7, 5, '2018-05-09 22:30:49'),
(7, 4, '2020-07-27 12:52:58'),
(7, 11, '2018-01-16 18:40:43'),
(8, 39, '2018-03-21 16:56:40'),
(8, 40, '2020-10-18 13:38:05'),
(8, 32, '2019-05-25 08:14:03'),
(8, 33, '2021-08-15 21:37:09'),
(9, 16, '2021-05-24 17:23:45'),
(9, 17, '2018-12-07 22:48:52'),
(9, 8, '2021-03-14 06:14:26'),
(9, 9, '2020-04-01 03:36:00'),
(10, 20, '2017-02-06 08:21:34'),
(10, 21, '2017-12-04 05:33:43'),
(10, 12, '2017-07-27 05:24:49'),
(10, 13, '2017-12-25 01:03:57');