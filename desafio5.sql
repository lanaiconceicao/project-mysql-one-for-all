-- cancao de cancoes
-- usuario_id (group by) mostra quantas vezes o usuario ouviu a musica
-- cancao_id tb está na tabela cancoes INNER JOIN para ler o nome das cancoes
-- SUM todas as vezes que a pessoa ouviu
-- Mostrar só as duas mais ouvidas: ORDER BY + LIMIT

SELECT c.cancao AS cancao,
COUNT(uh.cancao_id) AS reproducoes
FROM cancoes AS c
INNER JOIN usuario_historico AS uh
ON uh.cancao_id = c.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;