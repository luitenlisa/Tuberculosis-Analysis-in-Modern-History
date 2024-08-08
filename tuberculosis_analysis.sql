##Tuberculosis data set from Kaggle.
##https://www.kaggle.com/datasets/willianoliveiragibin/tuberculosis
##Using MySQLWorkBench v8.0.34 to explore/clean/analyze 

##Exploring data


SELECT Entity, Code
FROM incidence
WHERE Code = "0";

SELECT Entity, Code
FROM incidence
WHERE Code != "0";

SELECT * 
FROM incidence
WHERE Code != "0" AND Entity = "Algeria"
LIMIT 100;
#Countries have a code and continents/regions have a 0. Each location is also listed about 22 times, once for each year 

SELECT MIN(Year), MAX(Year), COUNT(DISTINCT(ENTITY))
FROM incidence;
#2000 to 2022, 228 unique locations in this data


SELECT Entity, MIN(Year) AS MIN, MAX(Year) as MAX
FROM incidence
GROUP BY Entity
HAVING MIN != 2000 OR MAX != 2022;
#'Netherlands Antilles' and 'Serbia and Montenegro' ended before 2022
#'East Timor', 'Montenegro', 'Serbia', 'Curacao', 'Sint Maarten (Dutch Part)', and 'South Sudan' started after 2000

CREATE TABLE countries
SELECT * 
FROM incidence
WHERE Code != '0';
#Creating new table of only countries to keep things simple later

SELECT *
FROM countries
WHERE Code = '0';
#Confirming only countries

ALTER TABLE countries
RENAME COLUMN `Estimated incidence of all forms of tuberculosis` to `estimated_cases`;
#Changing column name to be easiser to work with

CREATE TABLE regions
SELECT * 
FROM incidence
WHERE Code = '0';

ALTER TABLE regions
RENAME COLUMN `Estimated incidence of all forms of tuberculosis` to `estimated_cases`;


##Questions to answer
#Which countries/regions experienced most/least cases of tb overtime?
#Which years showed most/least cases?

SELECT Entity, SUM(estimated_cases) as Total_Cases, AVG(estimated_cases) as AVG_incidence_per_year
FROM countries
GROUP BY Entity
ORDER BY Total_Cases DESC;
#Top were Eswatini, South Africa, and Lesotho

SELECT Year, SUM(estimated_cases) as total
FROM countries
GROUP BY Year
ORDER BY total DESC;
#2003, 2004, 2005 showed top three highest years for TB. Overall the period of 2001-2010 is higher than the rest of the years
#Recent years of 2021, 2020, 2022 show the lowest numbers of suspected TB cases


SELECT Entity, SUM(estimated_cases) as Total_incidence, AVG(estimated_cases) as AVG_per_year
FROM regions
WHERE Entity != 'High-income countries' AND Entity != 'Upper-middle-income countries' AND Entity != 'Lower-middle-income countries' AND Entity != 'Low-income countries'
GROUP BY Entity
ORDER BY Total_Cases DESC;
#Excluded income related countries because that is probably duplicate data, double counting some countries. For ex- USA is a highincome country but would be counted in North America as well


#Added data from United States into new table named usa_tuberculosis
#data retrieved from data.gov under NNDS - Table III. Tuberculosis
#https://catalog.data.gov/dataset/nndss-table-iii-tuberculosis

#changed column names to remove spaces
ALTER TABLE `tuberculosis`.`usa_tuberculosis` 
CHANGE COLUMN `Reporting area` `reporting_area` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `MMWR Year` `MMWR_year` INT NULL DEFAULT NULL ,
CHANGE COLUMN `MMWR Quarter` `MMWR_Quarter` INT NULL DEFAULT NULL ,
CHANGE COLUMN `TB Current quarter` `TB_Current_quarter` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Previous 4 quarters Min` `Previous_4_quarters_Min` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Previous 4 quarters Max` `Previous_4_quarters_Max` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Cumulative 2017` `Cumulative_2017` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Cumulative 2016` `Cumulative_2016` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Location 2` `Location_2` TEXT NULL DEFAULT NULL ;


SELECT COUNT(DISTINCT(reporting_area))
FROM usa_tuberculosis;
#There are 66 locations reported but for this project I am only interested in the 50 states
#There is also a lot of overlap, since this table includes both regions and states 

DELETE FROM usa_tuberculosis
WHERE (reporting_area = 'UNITED STATES') OR
(reporting_area = 'NEW ENGLAND') OR 
(reporting_area = 'MID. ATLANTIC') OR 
(reporting_area = 'NEW YORK CITY') OR 
(reporting_area = 'E.N. CENTRAL') OR 
(reporting_area = 'W.N. CENTRAL') OR 
(reporting_area = 'S. ATLANTIC') OR 
(reporting_area = 'DIST. OF COL.') OR 
(reporting_area = 'E.S. CENTRAL') OR 
(reporting_area = 'W.S. CENTRAL') OR 
(reporting_area = 'MOUNTAIN') OR 
(reporting_area = 'PACIFIC') OR 
(reporting_area = 'C.N.M.I.') OR 
(reporting_area = 'PUERTO RICO') OR 
(reporting_area = 'GUAM') OR 
(reporting_area = 'AMER. SAMOA');

SELECT COUNT(DISTINCT(reporting_area))
FROM usa_tuberculosis;
#Confirmed that only 50 results/states remain


SELECT SUM(cumulative_2017) AS total_2017, SUM(cumulative_2016) AS total_2016
FROM usa_tuberculosis;

SELECT reporting_area, AVG(cumulative_2017) AS avg_2017, SUM(cumulative_2017) as sum_2017, AVG(cumulative_2016) AS avg_2016, SUM(cumulative_2016) AS sum_2016
FROM usa_tuberculosis
GROUP BY reporting_area
ORDER BY reporting_area;



#added data from United States into table called californoa
#data retrieved from data.gov 'tuberculosis case numbers and rates, california and local health jurisdictions'
#https://catalog.data.gov/dataset/tuberculosis-case-numbers-and-rates-california-and-local-health-jurisdictions-06ed4

#What demographics/groups is tb most prevalent in in recent years and why?
#What years had most cases

#compare trends in cases in california/USA to global ??

#There is a typo in the age groups. There is written "45426" where the 5-14 age group should be
UPDATE california
SET STRATA = "5-14"
WHERE STRATA = "45426";

SELECT STRATA AS age, YEAR, SUM(CASES) AS total_cases
FROM california
WHERE Category = "Age group"
GROUP BY year, strata
ORDER BY year;

SELECT Year, SUM(Cases) AS Total_Cases
FROM california
WHERE Category = "Total"
GROUP BY Year
ORDER BY SUM(Cases) DESC;
#2005, 2006, 2007 highest years 




SELECT STRATA AS race, Year, SUM(CASES) AS total_cases, SUM(population) AS population
FROM california
WHERE Category = "Race/ethnicity"
GROUP BY strata, year
ORDER BY Year, SUM(Cases) DESC;
#would like to compare these numbers to the populations in california per year 

SELECT STRATA AS origin, YEAR, SUM(CASES) AS total_cases
FROM california
WHERE Category = "Origin"
GROUP BY year, strata
ORDER BY year;

SELECT STRATA AS sex, YEAR, SUM(CASES) AS total_cases
FROM california
WHERE Category = "Sex"
GROUP BY year, strata
ORDER BY year;

