# Covid Insights 
In this project, I explored covid data from ourworldindata.org. The data focused on deaths, infections, vaccinations, as well as other data. My exploratory data analysis was done in MySQL and visualized in Tableau. In the following descriptions, I explain the SQL queries and tableau settings for each tableau chart. 

You can view the visualizations here: https://public.tableau.com/app/profile/keely7601/viz/CovidAnalysisThroughSeptember2022/Deaths#1

### Deaths Dashboard
In this dashboard, there are four charts. Here are the corresponding SQL queries and visualizations. 
* Global Death Rates
#### SQL QUERY
SELECT MAX(total_cases) AS total_cases, MAX(total_deaths) AS total_deaths, MAX(total_deaths)/MAX(total_cases)*100 AS death_percentage
FROM covid_deaths
ORDER BY 1,2;
