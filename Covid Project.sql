/*Select Data I'll be using*/

/* Look at Total Cases VS Total Deaths*/
/*Shows likelihood of death if contracted, per country*/
SELECT location, date, total_cases, total_deaths,ROUND(total_deaths/total_cases,3)*100
AS 'Death_Percentage'
FROM covid_project.coviddeaths
ORDER BY location ASC, date ASC;

/* Looking at Total Cases VS Population*/

SELECT location, date,population, total_cases,ROUND(total_cases/population,3)*100
AS 'Population Contracted'
FROM covid_project.coviddeaths
ORDER BY location ASC, date ASC;

/*Looking at Country's with Highest Infection Rate*/

SELECT *
FROM (
  SELECT
    location,
    population,
    MAX(total_cases) AS max_total_cases,
    MAX(ROUND(total_cases/population, 3)) * 100 AS 'Population Contracted'
  FROM
    covid_project.coviddeaths
  GROUP BY
    location, population
) AS subquery
ORDER BY
  `Population Contracted` DESC;
  
  /* Showing countries with the highest death count per Population*/
  
  
SELECT location, MAX(total_deaths) AS "Total_Death_Count"
FROM covid_project.coviddeaths
GROUP BY location
ORDER BY "Total_Death_Count";


