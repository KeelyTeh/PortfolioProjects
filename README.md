# Sales Insights for Apliq, a Computer Hardware Manufacturer
I have created a report in MS PowerBI that examines the declining sales of Apliq, a computer hardware and peripheral manufacturer. I used a MySQL datatbase and Power BI for this project.

### View the Report
See the data and report by opening the pbix file above or view the report only by going to the link below:
[https://lnkd.in/gCt4UiGW](https://app.powerbi.com/view?r=eyJrIjoiZDA4YTE5NzgtZTk0YS00ZTcyLTgwODUtYWNmNmJjZjdhOTcyIiwidCI6Ijk5MjgxZmYwLWNmZjAtNGJkYS04NWQxLTA1YWM5YTRiMzQwMSIsImMiOjZ9)

## Key Highlights:
* The regions or markets bringing in the most revenue are not necessarily the ones with the highest profit margin %. For example,
  large metro areas such as Delhi, Mumbai, and Ahmedabad are often bringing in a lot of revenue, but this is likely because of high sales volumes. 
  To make them more of a success, strategies used in stores and regions with high profit margins, like Bhubaneshar, Hyderabad, and Chennai could be 
  explored and immplemented in Delhi, Mumbai, and Ahmedabad.
* Revenue had trended downward since 2018 while profit margin % for Apliq had decreased since since 2019. Because of this, markets, stores, and products
  bringing in lower revenue, having higher operatings costs, or unsuccessful management strategies should be explored and mitigated.
* On the third tab, Performance Insights, a filter was set up to set a specific profit margin target. This allows steakholders to view what markets, stores,
  customers, and products are not as profitable as hoped. The same can also be set up for other parameters such as profit contribution percentage.

## About the Data
This project included multiple tables from Apliq's SQL database, including sales transactions, products, customers, markets, and a date table. This included all transactions from 2017 to 2020, around 150,000 records.

## Data Cleaning
* Deleted records with negative tranaction values.
* Converted two records from USD or Indian INR currency. A currency conversion table could be used in Power BI, but we chose a simple conversion formula
  to convert USD to current INR values.

### Formulas 
* Total revenue, which could be filtered by zone, market, customer, product, year/month, or other parameter.
* Revenue LY (last year)
* Total profit
* Sales quantity
* Profit margin percentage
* Revenue contribution percentage, which calculates the amount of revenue for a specific market, customer, ect. by the entire amount of revenue 
  generated by Apliq.
* Profit contribution percentage, which calculates the amount of profit for a specific market, customer, ect. by the entire amount of profit
  generated by the company.

## Data Analysis
* In the first tab, Key Insights, total revenue by market was displayed in a bar chart. Top 5 customers by revenue and top 5 products by revenue were also   
  displayed on this page. Revenue can also be seen over the time period of choice using the year and month slicers.
* Profit Analysis, the second tab, shows a side-by-side comparison of various revenue and profit parameters by market or over time. A customer chart can 
  with all the paramters can be viewed and sorted by highest and lowest parameters.
* The third and final chart has a **useful tool**  that allows the steakholder to set a profit target with the slicer, and then drill down the hierarchy by  
  by zones, markets, customers, and products that do not meet a profit target. Those that fall below the profit target have red bars. This was created by
  creating a slicer with the new parameter tool in the modeling tab. Then, we set up a formula by rules in the data colors menu for the left chart where we 
  wanted the profit target applied. Here, a rule was set to show all categories in red that had a profit margin with a specified amount below the set profit 
  target. This allowed the steakholder to directly address business segements or regions that are falling short of profit targets.
  
  

