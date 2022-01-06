SELECT ROUND(MIN(pl.preco), 2) AS faturamento_minimo,
ROUND(MAX(pl.preco), 2) AS faturamento_maximo,
ROUND(AVG(pl.preco), 2) AS faturamento_medio,
ROUND(SUM(pl.preco), 2) AS faturamento_total
FROM usuarios AS us
INNER JOIN planos AS pl
ON pl.plano_id = us.plano_id;