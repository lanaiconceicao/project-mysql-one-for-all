SELECT c.cancao AS nome,
COUNT(us.cancao_id) AS reproducoes
FROM cancoes AS c
INNER JOIN usuario_historico AS us
ON c.cancao_id = us.cancao_id
INNER JOIN usuarios AS u
ON us.usuario_id = u.usuario_ID
WHERE u.plano_id = 1 OR u.plano_id = 4
GROUP BY nome
ORDER BY nome ASC;