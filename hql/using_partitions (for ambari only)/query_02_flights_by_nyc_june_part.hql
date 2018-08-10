--The total number of flights served in Jun 2007 by NYC
--(all airports, use join with Airports)(Screenshot#2)

use aero;
set hive.auto.convert.join=true;

--using partition month=7 from table flight_part
SELECT count(*) as total_flights
	FROM (SELECT code FROM airport WHERE city='New York') as a
	JOIN (SELECT origin FROM flight_part WHERE month=7) as f
	ON (a.code = f.origin);