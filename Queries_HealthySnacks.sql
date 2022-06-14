USE healthysnacks;

CREATE VIEW SPENDING_VIEW_1 AS
SELECT
Customers.CustomerID, Orders.OrderDate, Products.ProductID, Products.ProductName, OrderedItems.Quantity * Products.WholesalePrice AS 
'PerProductSpending'
FROM Customers INNER JOIN Orders ON
Customers.CustomerID=Orders.CustomerID
INNER JOIN OrderedItems ON
-- The following is a View that shows per product spending, allowing the user to filter products with below, equal to, or above 
-- certain spending threshholds. 

Orders.OrderID=OrderedItems.OrderID
INNER JOIN Products ON
OrderedItems.ProductID=Products.ProductID;

-- Test view above:

SELECT CustomerID, OrderDate, ProductID, ProductName, PerProductSpending
FROM SPENDING_VIEW_1
WHERE PerProductSpending > 250.00;

-- Aggregate function with having clause. Shows how many products are in each category and the lowest and highest products
-- in each of those categories. It shows this information for product categories that have greater than 2 products.

SELECT PC.CategoryName, PC.ProductCategoryID, COUNT(P.ProductID) AS 'Count of Products in Category', 
MIN(P.WholesalePrice) AS 'Lowest Priced Product in Category', MAX(P.WholesalePrice) AS 'Highest Priced Product in Category'
FROM Products P JOIN ProductCategory PC ON
P.ProductCategoryID=PC.ProductCategoryID
GROUP BY PC.CategoryName, ProductCategoryID
HAVING COUNT(P.ProductID) > 2
ORDER BY CategoryName;

-- The below is a stored procedure. Actual location is in stored procedure in healthysnacks database. 
-- It retrives customer notes mentioning typical order quantities. 
-- To test: CALL spFilterCustomerQuantity('quant') or spFilterCustomerQuantity('order')
-- Ignore any errors here. They don't exist in actual stored procedure.

CREATE DEFINER=`root`@`localhost` PROCEDURE `spFilterCustomerQuantity`(IN notestring VARCHAR(100))
BEGIN
SELECT C.CustomerID, C.CompanyName, C.Notes
FROM Customers C
WHERE C.Notes LIKE CONCAT('%', notestring, '%');
END
