--The total number of flights served in Jun 2007 by NYC
--(all airports, use join with Airports)(Screenshot#2)

USE ${db};
set hive.auto.convert.join=true;

SELECT count(*) as total_flights
	FROM (SELECT code FROM airport WHERE city='New York') as a
	JOIN (SELECT origin as city FROM flight WHERE month=7
		UNION ALL
	      SELECT dest as city FROM flight WHERE month=7) as f
	ON (a.code = f.city);