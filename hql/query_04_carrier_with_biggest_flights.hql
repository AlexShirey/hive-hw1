--Find the carrier who served the biggest number of flights (Screenshot#4)

USE ${db};

SELECT UniqueCarrier as carrier_code, count(*) as total_count
	FROM flight
	GROUP BY UniqueCarrier
	ORDER BY total_count DESC
	LIMIT 1;