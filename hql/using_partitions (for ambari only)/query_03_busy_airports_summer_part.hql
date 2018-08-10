--Find five most busy airports in US during Jun 01 - Aug 31. (Screenshot#3)

use aero;
set hive.auto.convert.join=true;

--using partitions month=6,7,8 from table flight_part
SELECT a.name, count(*) as flights_count
	FROM (SELECT name, code FROM airport WHERE country='USA') as a
	JOIN flight_part as f
	ON (a.code = f.origin and f.month>=6 AND f.month<=8)
	GROUP BY a.name
	ORDER BY flights_count DESC
	LIMIT 5;