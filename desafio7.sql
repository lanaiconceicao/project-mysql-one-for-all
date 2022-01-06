SELECT a.artista AS artista,
al.album AS album,
COUNT(DISTINCT s.usuario_id) AS seguidores
FROM artistas AS a
INNER JOIN album AS al
ON a.artista_id = al.artista_id
INNER JOIN seguindo AS s
ON a.artista_id = s.artista_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista ASC, album ASC;