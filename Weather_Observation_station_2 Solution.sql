--------------------------------12/08/2024--------------------------------
--I am finally getting started on writting the query!

--It took a really long time to set up the table.

--Querry the following two values from the STATION table:

----1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.

----2. The sum of all values in LONG_W rounded to a scale of 2 decimal places.

--ok,
--first I want to see that the table was loaded correctly by the import/export wizard.

--USE Weather_Observation_Station_2;
--SELECT *
--	FROM STATION;

--The result set looks good.

--ok, now for fun I want to see how many are in florida.

--USE Weather_Observation_Station_2;
--SELECT *
--	FROM STATION
--	WHERE STATE = 'fl';

--For some reason I also want to see if there are any duplicate IDs?

--How can I check for duplicate IDs?

--I found an example on atlassian.com 
--but I figured there would simply be a function for this.
--there doesn't seem to be.

--I would have to build one from scratch.

USE Weather_Observation_Station_2;
SELECT ID
	FROM STATION
	GROUP BY ID
	HAVING COUNT(*) >1;

--Nice, I ran into an error.
--it seems that I need to use GROUP BY in order to use COUNT().

--Ok, no duplicates.

--very weird the redundancy of GROUP BY when using COUNT
--select id from station group by id having count(*) >1;
--select id group by id.

--I need to clean up my understanding on this issue.
--for now this is it.
--I will try and continue tomorrow.

--it seems like GROUP BY is first and the count().
--not sure why.


