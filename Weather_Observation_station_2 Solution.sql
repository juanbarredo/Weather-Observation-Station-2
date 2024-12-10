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

--USE Weather_Observation_Station_2;
--SELECT ID
--	FROM STATION
--	GROUP BY ID
--	HAVING COUNT(*) >1;

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

--------------------------------------12 09 2024-------------------------------------

--I will now continue on solving the problem.
--I will check on why I have to use GROUP BY() when using aggregators like COUNT() later.

--I think for now I just have to learn that otherwise, it leads to an error.
--I am unsure why, at least in my elementary case.
--I have to use GROUP BY.

--I think I get it.
--SELECT doesn't do the math.  
--SELECT just displays.

--what SELECT displays is done further down the query 
--or earlier in the query.
--SELECT is 7th after all.

--it is a semantic difference.
--it may seem to me that SELECT /is/ what does the work.
--but it only displays.
--it doesn't calculate?

--but what about

--USE Weather_Observation_Station_2;
--SELECT *
--	FROM STATION;

--USE Weather_Observation_Station_2;
--SELECT SUM(LAT_N)
--	FROM STATION;

--USE Weather_Observation_Station_2;
--SELECT COUNT(LAT_N)
--	FROM STATION;

--so, then it seems that I need to work on my understanding.
--I can't quite grasp it at the moment.

--for now, I will move on.

--I now want to see if I can get

----1. the sum of all values in LAT_N
--first before doing the rounding.
--rounding which I practiced last problem.

--USE Weather_Observation_Station_2;
--SELECT SUM(LAT_N)
--	FROM STATION;

--Ok, I got the sum of LAT_N.

--Now I am lost if I should get the next sum 
--or try to get the rounding right.
--I think it will be easier to get the next sum.

----2. sum of LONG_W

--USE Weather_Observation_Station_2;
--SELECT SUM(LONG_N) --I will need to change the column name later to LONG_W.
--	FROM STATION;

--Now, let me try and get both sums in the same query.

USE Weather_Observation_Station_2;
SELECT SUM(LAT_N), SUM(LONG_N)
	FROM STATION;

--I want to try and get an error.
--isn't it that I can't use

--USE Weather_Observation_Station_2;
--SELECT SUM(LAT_N), LONG_N
--	FROM STATION;

--RIGHT.  I got the error I wanted.

--"Column 'STATION.LONG_N' is invalid
--in the select list 
--because it is not contained 
--in either an aggregate function 
--or the GROUP BY clause."

--I am not exactly sure why but I know it gives an error.
--there must be some database engine reason why.
--but I forget or I haven't learned it fully yet.

--I may want to explore this tomorrow if at all possible.
--It may help me with the GROUP BY()
--issue I am having.

