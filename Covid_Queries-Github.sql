USE portfolioproject;

SELECT * 
FROM covid_deaths
ORDER BY 3,4;

SELECT * 
FROM covid_vaccinations
ORDER BY 3,4;

/* Select the data that we are going to be using. */

SELECT location, record_date, total_cases, new_cases, total_deaths, population
FROM covid_deaths
ORDER BY 1,2;

-- Tableau: Top 10 Deaths by Country as Percentage of Infections on Deaths dashboard
/* Looking at total deaths as a percentage of infections.
Shows chance of dying if you contract covid in your country.*/
SELECT location, MAX(total_cases), MAX(total_deaths), MAX(total_deaths)/MAX(total_cases) * 100 AS death_percentage
FROM covid_deaths
GROUP BY 1
ORDER BY 4 DESC;

-- Tableau: Top 10 Death Rate as Percentage of Population on Deaths dashboard
/* Looking at covid deaths as a percentage of the entire location's population */
SELECT location, record_date, total_deaths, population, MAX((total_deaths/population)) * 100 AS death_rate_cntry
FROM covid_deaths
WHERE continent != '0'
GROUP BY location, record_date
ORDER BY 1,2;

/* Death percentage in the United States */

SELECT location, record_date, total_cases, total_deaths, (total_deaths/total_cases) * 100 AS death_percentage
FROM covid_deaths
WHERE location LIKE '%states%'
ORDER BY 1,2;

/* Looking at total cases vs. population 
Shows what percentage of population has confirmed cases of covid infection. */
SELECT location, record_date, population, total_cases, (total_cases/population) * 100 AS infection_rate
FROM covid_deaths
WHERE location LIKE '%states%'
ORDER BY 1,2;

-- Tableau: National Covid Infection Rates (Map) & Cumulative Infection Rate, both on Infections dashboard 
/* Looking at countries with highest infection rate. Modified with and without dates for charts mentioned above.*/
SELECT location, population, record_date, MAX(total_cases) AS highest_infection_count, MAX((total_cases/population))*100 AS infection_rate
FROM covid_deaths
-- WHERE location LIKE '%states%'
-- WHERE continent != '0'
GROUP BY location, population, record_date
ORDER BY infection_rate DESC;


/* Looking at countries with highest death rate */
SELECT location, MAX(total_deaths) as total_death_count
FROM covid_deaths
-- WHERE location LIKE '%states%'
WHERE continent != '0'
GROUP BY location
ORDER BY total_death_count DESC;

/* Breaking down death rate by continent. */
SELECT location, MAX(total_deaths) as total_death_count
FROM covid_deaths
-- WHERE location LIKE '%states%'
WHERE continent = '0'
GROUP BY location
ORDER BY total_death_count DESC;

-- Tableau: Total Deaths by Continent in Deaths dashboard
/* Breaking down death rate by continent and eliminating unnecessary categories that are not continents. */
SELECT location, MAX(total_deaths) as total_death_count
FROM covid_deaths
-- WHERE location LIKE '%states%'
WHERE continent = '0'
AND location NOT IN ('World', 'European Union', 'International','High income','Upper middle income','Lower middle income','Low income')
GROUP BY location
ORDER BY total_death_count DESC;

/* GLOBAL NUMBERS */
/* Death rate across the world, groups by date, total_cases and total_deaths as cumulative*/
SELECT record_date, MAX(total_cases) AS total_cases, MAX(total_deaths) AS total_deaths, MAX(total_deaths)/MAX(total_cases)*100 AS death_percentage
FROM covid_deaths
GROUP BY record_date
ORDER BY 1,2;

-- Tableau: Global Death Rates in Deaths dashboard
/* Death rate across the world, total calculation */
SELECT MAX(total_cases) AS total_cases, MAX(total_deaths) AS total_deaths, MAX(total_deaths)/MAX(total_cases)*100 AS death_percentage
FROM covid_deaths
ORDER BY 1,2;

/* Looking at total vaccination percentage */

SELECT dth.continent, dth.location, dth.record_date, dth.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION BY vac.location ORDER BY vac.location, vac.record_date) AS RollingVacTotal
FROM covid_deaths dth 
JOIN covid_vaccinations vac ON
dth.location = vac.location
AND dth.record_date = vac.record_date
WHERE dth.continent != '0'
ORDER BY 2,3;

-- USE CTE
WITH PercentPopVac (continent, location, record_date, population, new_vaccinations, RollingVacTotal)
AS
(SELECT dth.continent, dth.location, dth.record_date, dth.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION BY vac.location ORDER BY vac.location, vac.record_date) AS RollingVacTotal
FROM covid_deaths dth 
JOIN covid_vaccinations vac ON
dth.location = vac.location
AND dth.record_date = vac.record_date
WHERE dth.continent != '0'
-- ORDER BY 2,3
)
SELECT *, (RollingVacTotal/Population)*100 AS PercentVaccinated
FROM PercentPopVac;

-- TEMP TABLE 

DROP TABLE IF EXISTS temp_PercentPopVaccinated;

CREATE TEMPORARY TABLE temp_PercentPopVaccinated
(
	Continent nvarchar(255),
    Location nvarchar(255),
    Record_Date datetime,
    Population NUMERIC,
    New_Vaccinations NUMERIC,
    RollingVacTotal NUMERIC
);
INSERT INTO temp_PercentPopVaccinated
SELECT dth.continent, dth.location, dth.record_date, dth.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION BY vac.location ORDER BY vac.location, vac.record_date) AS RollingVacTotal
FROM covid_deaths dth 
JOIN covid_vaccinations vac ON
dth.location = vac.location
AND dth.record_date = vac.record_date
WHERE dth.continent != '0';
-- ORDER BY 2,3

SELECT *, (RollingVacTotal/Population)*100
FROM temp_PercentPopVaccinated;

/* VIEW 
Creating view to store data for later visualizations 
See the view setup under views. This is what the view code looks like: */
CREATE VIEW `PercentPopVaccinated` AS 
SELECT dth.continent, dth.location, dth.record_date, dth.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (PARTITION BY vac.location ORDER BY vac.location, vac.record_date) AS RollingVacTotal
FROM covid_deaths dth 
JOIN covid_vaccinations vac ON
dth.location = vac.location
AND dth.record_date = vac.record_date
WHERE dth.continent != '0';
-- ORDER BY 2,3

-- Tableau: Used for looking at vaccinated vs fully vaccinated percentage data, all on Vaccinations dashboard.
SELECT continent, location, record_date, people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred
FROM covid_vaccinations
GROUP BY location, record_date
ORDER BY 2,3;


    












