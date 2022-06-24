# Sales Insights for Apliq, a Computer Hardware Manufacturer
I have created a report in MS PowerBI that delves into the declining sales of Apliq, a computer hardware and peripheral manufacturer. I used a MySQL datatbase and Power BI for this project.

### View the Report
See the data and report by opening the pbix file above or view the report only by going to the link below:
[https://lnkd.in/gCt4UiGW](https://app.powerbi.com/view?r=eyJrIjoiZDA4YTE5NzgtZTk0YS00ZTcyLTgwODUtYWNmNmJjZjdhOTcyIiwidCI6Ijk5MjgxZmYwLWNmZjAtNGJkYS04NWQxLTA1YWM5YTRiMzQwMSIsImMiOjZ9)

## Key Highlights:
* Highlight 1
* Highlight 2
* Highlight 3

## About the Data
This project combined drought data from the U.S. Drought Monitor and crop production data from the County Agriculture Production Survey (CAPS) from the National Agriculture Statistics Service (NASS).
### Drought Data
* Drought levels: Acres of dry to moderate drought & severe to exceptional drought
* Years, took one fall drought monitor recording each year
* State
* County
### Crop Data
* Year
* State
* County
* Crop production per acre, such a bu/acre (unit depends on crop)
* Total units produced (unit depends on crop)

## Data Cleaning
### Drought Data
* Kept data from one annual testing time, in the fall, to match timing of collecting crop data
* Combined state and country FIP numbers from both datasets to create state and county IDs
* Combined 2-3 drought levels to reduced number of levels from 6+ levels to 3: none, dry to moderate, and severe to exceptional
* Deleted unmatched counties between the two datasets
### Crop Data
* Combined state and country FIP numbers from both datasets to create state and county IDs
* Deleted unnecessary columns
* Kept only two most relevant production measures
* Significant cleaning in crop production measures and units
* Deleted unmatched counties between the two datasets

## Data Analysis
* In the first chart, the acres of various drought levels and crop product in total units were displayed together with slicers
  that filter by state, county, and commodity/crop.
* In the second chart, the total crop production and crop production per acre per commodity is shown in a table with slicers
  that filter by state (which shows all the data for all the counties in the selected state) and year.
 * The third and final chart shows the states with the largest percentage of total land area labeled as severe drought conditions.

## Please Note
For the first report tab, make sure you select a commodity, as that will ensure units displayed are the same, such as bu for corn, tons for hay, 
and so on. If you only select commodity, it will show drought and crop information for the whole Midwest for your selected commodity; commodity 
and state will show drought and commodity information for just that one state you select; while commodity, state, and county will focus on 
drought and crop production for your commodity in your chosen state and county.

