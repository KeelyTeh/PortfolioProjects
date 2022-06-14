# Database in SQL
* For this project, I created a fictitious food company, Squeaky Clean Foods, which manufactures and sales unique clean, natural food products to grocery chains. 
* I combined my training in SQL and database design to create a fully optimized database. This prevents repeating values, enhances data integrity, and overall makes
  things easier for those who use the database.
* I automated the database with triggers that updated available quantities when an order was made or canceled. I also set up warning messages when an order
  was attempted that fell below MOQ (minimum order quantity) or exceeded the available quantity. 
* Code for a realistic view and stored procedure is also included.

## Automated Tables in Database
This section showcases my ability to automate the database. I added the following features.
* Various foreign key constaints were added, such as cascade on delete in the ordereditems table, so when an order was canceled, the corresponding orderitems table records are deleted. The following bullet discusses how after this action, a trigger then updates available quantity in the products table. There are various other FK constaints on other tables to automate the database. 
* There are several triggers as mentioned above to update order quantities when an order was made or canceled and warning messages about available quantities in the product table when the ordereditems table indicated an order below MOQ or above current available quantity. 

## Other Queries
* A view and stored procedure were created. The view looks at the number of products being sold in each category and the products with the minimum and maximum 
  wholesale price in each category. The view allow someone to search the customer notes section with a text string.
