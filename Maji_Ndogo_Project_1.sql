#a query to show all the table in the database.
SHOW TABLES;

#reteieve all data from the location table.
SELECT *
FROM location;

#reteieve all data from the visits table.
SELECT *
FROM visits;

#extract all data from the water_source table.
SELECT *
FROM water_source;

#a query to find all types of water_source.
SELECT DISTINCT type_of_water_source
FROM water_source;

#find record where time_in_queue is more than 500 mins.
SELECT *
FROM visits
WHERE time_in_queue >500;

#find records for source_ids from the water_source table.
SELECT source_id, 
type_of_water_source,
number_of_people_served
FROM water_source;

#find records where the subjective_quality_score is 10 for home taps which was visited a second time.
SELECT *
FROM water_quality
WHERE subjective_quality_score =10 
AND visit_count =2;

#retrieve the few rows from the well_pollution table.
SELECT *
FROM well_pollution
LIMIT 5;

#retrieve data where result is clean and biological column is greater than 0.01
SELECT *
FROM well_pollution
WHERE results = "Clean"
AND biological > 0.01;

SELECT *
FROM well_pollution;

SET sql_safe_updates=0;

#update the description from Clean Bacteria: E. coli to Bacteria: E. coli.
UPDATE 
well_pollution
SET 
description = "Bacteria: E. coli"
WHERE 
description = "Clean Bacteria: E. coli";

#update the description Clean Bacteria: Giardia Lamblia to Bacteria: Giardia Lamblia.
UPDATE 
well_pollution
SET 
description = "Bacteria: Giardia Lamblia"
WHERE 
description = "Clean Bacteria: Giardia Lamblia";

#update clean results to contaminated: biological where biological is greater than 0.01
UPDATE
well_pollution
SET 
results = "Contaminated: Biological"
WHERE 
results = "Clean" AND biological >0.01;

#to get a copy of the well_pollution table called well_pollution_copy
CREATE TABLE
md_water_services.well_pollution_copy AS (SELECT *
											FROM md_water_services.well_pollution);

#update the well_pollution_copy table.
UPDATE
well_pollution_copy
SET
description = 'Bacteria: E. coli'
WHERE
description = 'Clean Bacteria: E. coli';
UPDATE
well_pollution_copy
SET
description = 'Bacteria: Giardia Lamblia'
WHERE
description = 'Clean Bacteria: Giardia Lamblia';
UPDATE
well_pollution_copy
SET
results = 'Contaminated: Biological'
WHERE
biological > 0.01 AND results = 'Clean';        

#to check if the errors are fixed in well_pollution_copy table.
SELECT *
FROM
well_pollution_copy
WHERE
description LIKE "Clean_%"
OR (results = "Clean" AND biological > 0.01);

#to change the table back to well_pollution and delete well_pollution_copy
DROP table 
	well_pollution_copy; 

#to effect the changes in the well_pollution table
UPDATE
well_pollution
SET 
description = "Bacteria: E. coli"
WHERE 
description = "Clean Bacteria: E. coli"; 
UPDATE 
well_pollution
SET 
description = "Bacteria: Giardia Lamblia"
WHERE 
description ="Clean Bacteria: Giardia Lamblia";
UPDATE 
well_pollution
SET 
results = "Contaminated: Biological"
WHERE 
results ="Clean" AND biological >0.01;


