# Covid Insights 
In this project, I explored covid data from ourworldindata.org. The data focused on deaths, infections, vaccinations, as well as other data. My exploratory data analysis was done in MySQL and visualized in Tableau. In the following descriptions, I explain the SQL queries and tableau settings for each tableau chart. This data helped identify possible geographical areas where a more targeted response to covid could be implemented and identified potential areas in need of further explanation and analysis.

You can view the visualizations here: https://public.tableau.com/app/profile/keely7601/viz/CovidAnalysisThroughSeptember2022/Deaths#1

### Deaths Dashboard
In this dashboard, there are four charts. Here are the corresponding SQL queries and visualizations. 
### 1. Global Death Rates
* SQL QUERY
SELECT MAX(total_cases) AS total_cases, MAX(total_deaths) AS total_deaths, MAX(total_deaths)/MAX(total_cases)*100 AS death_percentage
FROM covid_deaths
ORDER BY 1,2;

* Tableau Chart Explained
I selected a table for this data in tableau. I then placed the total cases, total deaths, and column death_percentage we calculated in SQL as columns in Tableau. I then formatted the table.

### 2. Total Deaths by Continent
* SQL QUERY
SELECT location, MAX(total_deaths) as total_death_count
FROM covid_deaths
WHERE continent = '0'
AND location NOT IN ('World', 'European Union', 'International','High income','Upper middle income','Lower middle income','Low income')
GROUP BY location
ORDER BY total_death_count DESC;

* Tableau Chart Explained
I placed continent as the columns and the sum of the total death count in the rows. The SQL query above already filtered out non-essential categories such as World, European Union, and income levels. I used WHERE continent = '0' to filter out countries; for this line of code you may have to look at the data to understand why this was used. 

It is important to realize that differences in reporting can lead to a variety of results. However, it is interesting to note that Asia has the same or slightly less covid death rate than North America, even with a much greater population. Could this be due to underreporting, better mitigation strategies, something else, or a combination of factors? Only further exploration of additional data might reveal the answer to this.

### 3. Top 10 Highest Death Rates by Country as Percentage of Population
* SQL QUERY
SELECT location, record_date, total_deaths, population, MAX((total_deaths/population)) * 100 AS death_rate_cntry
FROM covid_deaths
WHERE continent != '0'
GROUP BY location, record_date
ORDER BY 1,2;

* Tableau Chart Explained
For this chart, I placed death_rate_ctry that was calculated above, set it as MAX in Tableau (which should show the numbers toward the end of September 2022) in the columns and location as the rows. I then sorted the location by the max death rate and chose the top 10. Then I formatted the chart in colors in descending intensity of teal. 

This data reveals regions with astronically high death rates. In Peru, for example, 1 in 150 people died of Covid-19. This could be due to a number of potential factors, including but not limited to age or underlying health conditions or even erroneous cause of death reporting. Further exploration of the data set in regards to percentage of people in these countries above certain age thresholds or underlying conditions such as diabetes, heart disease or smoking, might paint a clearer picture of what is occuring. However, analysis of the health records of the actual victims could paint a clearer and provide a more conclusive picture of the death rates; however, that would require anaysis outside this data set.  

### 4. Top 10 Highest Death Rates by Country as Percentage of Infections
* SQL QUERY
SELECT location, MAX(total_cases), MAX(total_deaths), MAX(total_deaths)/MAX(total_cases) * 100 AS death_percentage
FROM covid_deaths
GROUP BY 1
ORDER BY 4 DESC;

* Tableau Chart Explained
I text chart was made in Tableau with death_percentage calculated in SQL above, along with location. Location was sorted in descending order by max death_percentage and included the top 10 countries. 

This analysis differed somewhat from the previous. For example, this data might reveal issues is late diagnoses or those seeking treatment when they are severely ill, or a number of other issues. This EDA is a good starting point in what regions to dig deeper into medical responses to Covid-19.

