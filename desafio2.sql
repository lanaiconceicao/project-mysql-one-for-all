SELECT COUNT(DISTINCT c.cancao_id) as cancoes,
COUNT(DISTINCT a.artista_id) AS artistas,
COUNT(DISTINCT al.album_id) AS albuns
FROM cancoes AS c
INNER JOIN artistas AS a
ON c.artista_id = a.artista_id
INNER JOIN album AS al
ON a.artista_id = al.artista_id;