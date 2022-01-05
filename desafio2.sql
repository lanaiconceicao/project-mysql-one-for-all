USE SpotifyClone;
SELECT COUNT(c.cancao_id), COUNT(artista_id), COUNT(album_id)
FROM cancoes AS c
INNER JOIN tabela2 AS t2
ON t1.coluna_em_comum = t2.coluna_em_comum;