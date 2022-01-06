SELECT COUNT(uh.usuario_id) AS quantidade_musicas_no_historico
FROM usuarios AS u
INNER JOIN usuario_historico AS uh
ON u.usuario_id = uh.usuario_id
WHERE usuario = 'Bill'
GROUP BY usuario;