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

--USE Weather_Observation_Station_2;
--SELECT SUM(LAT_N), SUM(LONG_N)
--	FROM STATION;

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

------------------------------12 12 2024--------------------------

--I have moved on from caring about the errors from the GROUP BY clause

--I want to try and solve the query.

----1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.

----2. The sum of all values in LONG_W rounded to a scale of 2 decimal places.

--I think that I will try and get "rounded to a scale of 2 decimal places"

--what does "scale" mean?

--I think it just means scale.  I don't think that it is a weird trick thing
--to look out for.

--ok, I am going

--ok, let me look at rounding functions
--which I should already be very acquainted with since the
--last problem I worked (the blunder) on was about that but w/e.

--ok, a quick Google.com search found that ol' trusty

----ROUND() function.

--this should be enough.
--at least for a first solid attempt at solving the query.

--USE Weather_Observation_Station_2;
--SELECT ROUND(SUM(LAT_N), 2) AS lat, ROUND(SUM(LONG_N), 2) AS lon
--	FROM STATION;

--very interesting.
--in MS SQL SERVER, I am getting better answers "42850.04" 
--where as in the HACKERRANK.COM screen I am getting
--"42850.040000000"

--so, always a trick.

--I wish it would show up on this screen.
--or on MS SQL SERVER.

--I do have the same data set, right?

--either way, 
--I now have to figure out
--(which I am pretty sure I know how)
--how to cut the trailing zeroes.

--ok!

--so, "scale" does indeed mean something to look into.

--Precision, scale, and length.
--Precision is the number of digits in a number.
--scale is the number of digits to the right of the decimale point in a number.
--length for a numeric data type is the number of bytes that are used to store the number.

--ok, so.
--the next time I work on this I need to see about scale.
--which is what I thought it meant?

--but I now see that when this problem states "scale"
--it already hints that there will be a problem accomplishing it.

---------------------------------12 15 2024------------------------------------

--ok,
--I think I have to CAST AS DECIMAL(7,2)?

--USE Weather_Observation_Station_2;
--SELECT ROUND(SUM(LAT_N), 2) AS lat, ROUND(SUM(LONG_N), 2) AS lon
--	FROM STATION;

--working on the solution on the HACKERRANK.COM screen
--I am seeing that on these problems I need to work on the order of operations.

--I keep getting the wrong answer but at least I am not getting an answer like "42850.040000000".

--I just have to play around with a few other things.

--I imagine that it is just like the previous problem, THE_BLUNDER.

--yeah, right now I am overwhelmed by all the nested functions.
--however, I am getting lots of practice breaking through 
--perceived limits.

--I now need to take a step back and slow down.

--ok, I have failed at getting the right answer but I am moving forward.

--SELECT	ROUND(SUM(CAST(LAT_N AS DECIMAL(7,2))),2) AS lat, 
--				ROUND(SUM(CAST(LONG_N AS DECIMAL(7,2))),2) AS lon
--					FROM STATION;

--ok,
--so there is a difference between the result set in 
--query from lines 224-226
--and query in lines 245 - 247.

--tells me all I need to know that there is a lot more work to do.

--------------------------------12 16 2024---------------------------------

--So, I think I need to re-read the problem better in order to approach the query 
--with more clarity.

--I think I generally have the right answer.

-- it is just about the order of operations in the
--nested functions in the SELECT statement.

--I am reading the problem again
--and it seems deceptively straight forward

--it makes me wonder if I am applying the scale in the wrong order
--which is giving the wrong answer?

--should the scale be applied last?
--I think it should.

--ok, the solution I am building up is now 

--SELECT	SUM(LAT_N) AS lat,
--					SUM(LONG_W) AS lon
--						FROM STATION;

--I need to then,
--I believe add the ROUND()

--SELECT	ROUND(SUM(LAT_N),2) AS lat,
--					ROUND(SUM(LONG_W),2) AS lon
--						FROM STATION;

--and like before, 
--I now need to cut off the trailing zeroes.
--or set the scale to two decimal places after the period.

SELECT	CAST(SUM(LAT_N) AS DECIMAL (7,2)) AS lat,
				CAST(SUM(LONG_N) AS DECIMAL (7,2)) AS lon
					FROM STATION;

--AMAZING!
--PROBLEM SOLVED.

--I feel like at this point there is no way that I could have
--approached this correctly right away.

--I needed to trial and error.

--I am so happy and relieved to have solved this issue.

--I definitely need work on the order of operations
--in the SELECT statement.

--this is such a good feeling

--so many doubts have been cleared up
--I definitely need to keep on going and do
--these "easy" problems for a long time
--before I can move on.
