--Find five most busy airports in US during Jun 01 - Aug 31. (Screenshot#3)

USE ${db};
set hive.auto.convert.join=true;

SELECT a.name, count(*) as flights_count
	FROM (SELECT name, code FROM airport WHERE country='USA') as a
	JOIN (SELECT origin as city FROM flight WHERE month>=6 AND month<=8
		UNION ALL
              SELECT dest as city FROM flight WHERE month>=6 AND month<=8) as f
	ON (a.code = f.city)
	GROUP BY a.name
	ORDER BY flights_count DESC
	LIMIT 5;