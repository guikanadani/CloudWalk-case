-- SELECAO DE TODOS OS DADOS 

SELECT * FROM logistic-case-v4.csv

-- QUANTIDADE DE ENTREGAS/RETORNOS/CANCELAMENTOS 

SELECT 
	STATUS,
	COUNT(ID) AS TOTAIS
FROM logistic-case-v4.csv
GROUP BY STATUS;

-- SELEÇÃO DE ESTADO POR QUANTIDADE DE ENTREGAS/CANCELAMENTOS/RECUSA 

SELECT
	STATE,
	COUNT(CASE WHEN STATUS = 'delivered' THEN 1 END) AS ENTREGAS,
	COUNT(CASE WHEN STATUS = 'returned' THEN 1 END) AS RETORNOS,
	COUNT(CASE WHEN STATUS = 'cancelled' THEN 1 END) AS CANCELADOS
FROM logistic-case-v4.csv
GROUP BY STATE
ORDER BY ENTREGAS DESC;

-- SELEÇÃO DE CIDADES POR QUANTIDADE DE ENTREGA/CANCELAMENTOS/RECUSA

SELECT
	CITY,
	COUNT(CASE WHEN STATUS = 'delivered' THEN 1 END) AS ENTREGAS,
	COUNT(CASE WHEN STATUS = 'returned' THEN 1 END) AS RETORNOS,
	COUNT(CASE WHEN STATUS = 'cancelled' THEN 1 END) AS CANCELADOS
FROM logistic-case-v4.csv
GROUP BY CITY
ORDER BY ENTREGAS DESC;

-- SELEÇÃO DE QUANTIDADE DE ENTREGA/RETORNO/ CANCELAMENTO POR ESTADO 


SELECT
	STATE,
	COUNT(CASE WHEN STATUS = 'delivered' THEN 1 END) AS ENTREGAS,
	COUNT(CASE WHEN STATUS = 'returned' THEN 1 END) AS RETORNOS,
	COUNT(CASE WHEN STATUS = 'cancelled' THEN 1 END) AS CANCELADOS
FROM logistic-case-v4.csv
GROUP BY STATE
ORDER BY RETORNOS DESC;


-- SELEÇÃO DE ESTADO E CIDADE POR QUANTIDA DE ENTREGA/CANCELAMENTO/RECUSA

SELECT
	STATE,
	CITY,
	COUNT(CASE WHEN STATUS = 'delivered' THEN 1 END) AS ENTREGAS,
	COUNT(CASE WHEN STATUS = 'returned' THEN 1 END) AS RETORNOS,
	COUNT(CASE WHEN STATUS = 'cancelled' THEN 1 END) AS CANCELADOS
FROM logistic-case-v4.csv
GROUP BY STATE, CITY
ORDER BY ENTREGAS DESC;

-- SELEÇÃO DE ESTADO E CIDADE POR QUANTIDADE DE ENTREGA TOTAL 

SELECT
	state,
	city,
	count(*) as quantidade
from logistic-case-v4.csv
group by state, city
order by quantidade desc;

-- SOMATORIA E MEDIA DO CUSTO POR ESTADO 

SELECT 
	STATE,
	SUM(SHIPMENT_COST) AS SOMATORIA,
	AVG(SHIPMENT_COST) AS MEDIA
FROM logistic-case-v4.csv
GROUP BY STATE
ORDER BY MEDIA DESC;

-- SOMATORIA E MEDIA DO CUSTO POR ESTADO 

SELECT 
	CITY,
	SUM(SHIPMENT_COST) AS SOMATORIA,
	AVG(SHIPMENT_COST) AS MEDIA
FROM logistic-case-v4.csv
GROUP BY CITY
ORDER BY MEDIA DESC;

-- QUANTIDA GASTA DE ENVIO POR QUANTIDADE DE ENTREGA POR ESTADO 

SELECT 
	STATE,
	COUNT(*) AS ENTREGAS,
	SUM(SHIPMENT_COST) AS SOMATORIA, 
	AVG(SHIPMENT_COST) AS MEDIA 
FROM logistic-case-v4.csv
GROUP BY STATE
ORDER BY STATE DESC;

-- SOMATORIA DE GASTOS DAS ENTREGAS CANCELADAS E RECUSADAS

SELECT
	STATUS, 
	SUM(SHIPMENT_COST) AS SOMATORIA, 
	AVG(SHIPMENT_COST) AS MEDIA 
FROM logistic-case-v4.csv
GROUP BY STATUS

SELECT
	SUM(SHIPMENT_COST) AS SOMATORIA
FROM logistic-case-v4.csv


SELECT * FROM logistic-case-v4.csv
where id = '35593';
