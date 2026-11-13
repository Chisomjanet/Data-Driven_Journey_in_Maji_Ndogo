#replacing the space between the employees in the employee table with full stop.
SELECT
	REPLACE(employee_name, ' ','.') AS Employee_names
FROM
employee;

#changing the employee names to lower case.
SELECT
	LOWER(REPLACE(employee_name, ' ','.')) AS Lower_employee_names
FROM
employee;

#to change the employee email address from upper case to lower case in the employee table.
SELECT
	CONCAT(
    LOWER(REPLACE(employee_name, ' ', '.')), '@ndogowater.gov') AS New_email_address
FROM
employee;

#to update the the email in the employee table.
UPDATE employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),
'@ndogowater.gov');

#remove extra spce from empolyee phone number.
SELECT
	trim(phone_number) AS employee_phone_number
FROM employee;

#update the change in employee phone number
UPDATE employee
SET phone_number = trim(phone_number);

#to check if the the phon number was fixed.
SELECT length(phone_number)
FROM employee;

#count the number of employee that lives in each town.
SELECT
	town_name, 
    count(*) AS Number_of_employee
FROM employee
GROUP BY town_name;

#to retrieve employee_ids of the three field surveyors with the most location visits.
SELECT 
	assigned_employee_id, count(*) AS Number_of_visits
FROM visits
GROUP BY assigned_employee_id
ORDER BY Number_of_visits DESC
LIMIT 3;

#to get employee info of the top 3 field surveyors.
SELECT
	employee_name,
    phone_number,
    email
FROM employee
WHERE assigned_employee_id IN (1,30,34);

#count the number of records per town.
SELECT
	town_name,
    count(*) AS Records_per_town
FROM location
GROUP BY town_name
ORDER BY Records_per_town DESC;

#count the records per province.
SELECT
	province_name,
    count(*) AS Records_per_province
FROM location
GROUP BY province_name
ORDER BY Records_per_province DESC;

#count the records for each town for every province and sort by province.
SELECT
	province_name,
    town_name,
    count(*) AS Record_per_town
FROM location
GROUP BY province_name, town_name
ORDER BY Record_per_town DESC;

#count the number of records for each location type'
SELECT
	location_type,
    count(*) AS number_of_sources
FROM location
GROUP BY location_type;

#calculate the percentage of water sources in rural areas.
SELECT 23740 / (15910 + 23740) * 100;

#round the percentage of water source in rural areas.
SELECT round(23740 / (15910 + 23740) * 100) AS percentage_source_rural;

#total number of people did we surveyed
SELECT 
	sum(number_of_people_served) AS total_people_surveyed
FROM water_source;

#count number of types of water source.
SELECT
	type_of_water_source,
    count(*) AS number_of_water_source
FROM water_source
GROUP BY type_of_water_source;

#count average number of people who share particular types of water sources.
SELECT
	type_of_water_source,
    round(avg(number_of_people_served)) AS avg_people_served
FROM water_source
GROUP BY type_of_water_source;

#calculate total number of people are getting water from each type of source.
SELECT
	type_of_water_source,
    sum(number_of_people_served) AS total_people_served
FROM water_source
GROUP BY type_of_water_source
ORDER BY total_people_served DESC;

#to get the total number of people served
SELECT
    sum(number_of_people_served) AS total_people_served
FROM water_source;

#to get the percentage of the total number of people served
	SELECT 
    type_of_water_source,
	round(sum(number_of_people_served) / 27628140 * 100) AS percentage_total_served
FROM water_source
GROUP BY type_of_water_source
ORDER BY percentage_total_served DESC;

#to rank the total number of people served by the type of water source excluding tap in home.
SELECT
	type_of_water_source,
    sum(number_of_people_served) AS total_people_served,
RANK() OVER(
ORDER BY sum(number_of_people_served) DESC) AS rank_total
FROM water_source
WHERE type_of_water_source != "tap_in_home"
GROUP BY type_of_water_source;

#rank the sources within each type excluding tap in home.
SELECT
	source_id,
    type_of_water_source,
    number_of_people_served,
DENSE_RANK() OVER(
PARTITION BY type_of_water_source
ORDER BY number_of_people_served DESC) AS priority_rank
FROM water_source
WHERE type_of_water_source != "tap_in_home"
LIMIT 10;

#to calculate number of days the survey took from time_of_record.
SELECT
    DATEDIFF(max(time_of_record), min(time_of_record)) AS data_diff_record
FROM visits;

#to calculate the average total queue time for water excluding 0s.
SELECT
	round(avg(time_in_queue)) AS avg_queue_time
FROM visits
WHERE time_in_queue != 0;

#calculate the average queue time on different days.
SELECT
	DAYNAME(time_of_record) AS day_of_week,
    round(avg(time_in_queue)) AS avg_queue_time
FROM visits
GROUP BY day_of_week;

#to find at what time during the day people collect water.
SELECT
	HOUR(time_of_record) AS hour_of_day,
    round(avg(time_in_queue)) AS avg_queue_time
FROM visits
GROUP BY hour_of_day
ORDER BY hour_of_day;
#to change time format.
SELECT
	TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
	round(avg(time_in_queue)) AS avg_queue_time
FROM visits
GROUP BY hour_of_day
ORDER BY hour_of_day;

#to know the queue time of only sunday per hour excluding 0s.
SELECT
	TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
	DAYNAME(time_of_record),
CASE
WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
ELSE NULL
END AS Sunday
FROM visits
WHERE time_in_queue != 0;

#to know the queue time of all the days of the week per hour excluding 0s.
SELECT
	TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
	ROUND(AVG(CASE
WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
ELSE NULL
END),0) AS Sunday,
	ROUND(AVG(CASE
WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
ELSE NULL
END),0) AS Monday,
	ROUND(AVG(CASE
WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue
ELSE NULL
END),0) AS Tuesday,
	ROUND(AVG(CASE
WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue
ELSE NULL
END),0) AS Wednesday,
	ROUND(AVG(CASE
WHEN DAYNAME(time_of_record) = 'Thursday' THEN time_in_queue
ELSE NULL
END),0) AS Thursday,
	ROUND(AVG(CASE
WHEN DAYNAME(time_of_record) = 'Friday' THEN time_in_queue
ELSE NULL
END),0) AS Friday,
	ROUND(AVG(CASE
WHEN DAYNAME(time_of_record) = 'Saturday' THEN time_in_queue
ELSE NULL
END),0) AS Saturday
FROM visits
WHERE time_in_queue != 0 
GROUP BY hour_of_day
ORDER BY hour_of_day;