SELECT a.artista AS artista, al.album AS album
FROM artistas AS a
INNER JOIN album AS al
ON a.artista_id = al.artista_id
WHERE artista = 'Walter Phoenix'
ORDER BY album;