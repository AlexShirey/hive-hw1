use aero;

--create a working table flight_part with partitions by month, orc format
CREATE TABLE IF NOT EXISTS flight_part
	(Year SMALLINT, DayofMonth TINYINT, DayOfWeek TINYINT, DepTime SMALLINT, CRSDepTime SMALLINT, rrTime SMALLINT, CRSArrTime SMALLINT,
	UniqueCarrier STRING, FlightNum INT, TailNum STRING, ActualElapsedTime SMALLINT,CRSElapsedTime SMALLINT,AirTime SMALLINT,ArrDelay SMALLINT,
	DepDelay SMALLINT, Origin CHAR(3), Dest CHAR(3), Distance SMALLINT, TaxiIn SMALLINT, TaxiOut SMALLINT, Cancelled CHAR(1), CancellationCode CHAR(1),
	Diverted CHAR(1), CarrierDelay SMALLINT, WeatherDelay SMALLINT, NASDelay SMALLINT, SecurityDelay SMALLINT, LateAircraftDelay SMALLINT) 
	PARTITIONED BY (Month TINYINT)
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ','
	STORED AS ORC 
	TBLPROPERTIES ('creator'='alexander shirey', 'date'='01.08.2018');

--filling the table with data, dynamic partitioning
FROM flight_ext
INSERT OVERWRITE TABLE flight_part PARTITION (Month)
	SELECT year, DayofMonth, DayOfWeek, DepTime, CRSDepTime, rrTime, CRSArrTime,
	UniqueCarrier, FlightNum, TailNum, ActualElapsedTime, CRSElapsedTime, AirTime, ArrDelay,
	DepDelay, Origin, Dest, Distance, TaxiIn, TaxiOut, Cancelled, CancellationCode,
	Diverted, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay, LateAircraftDelay,
	Month;