--Count total number of flights per carrier in 2007 (Screenshot#1)

USE ${db};

SELECT UniqueCarrier as carrier_code, count(*) as total_count
	FROM flight
	GROUP BY UniqueCarrier;