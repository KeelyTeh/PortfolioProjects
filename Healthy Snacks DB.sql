CREATE DATABASE healthysnacks;

USE healthysnacks;

CREATE TABLE ProductCategory
(
	ProductCategoryID SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(50) UNIQUE NOT NULL,
    Notes VARCHAR (200) NULL
);

ALTER TABLE ProductCategory
AUTO_INCREMENT = 1000;

INSERT INTO ProductCategory
(
	ProductCategoryID,
    CategoryName,
    Notes
)
VALUES
(1000,'Easy Meals','Fast to prepare entrees for lunch and dinner.'),
(1001,'Baking','Organic, allergen-friendly clean ingredients for baking.'),
(1002,'Seasonings','Healthy, big-8 allergen-free seasonings.'),
(1003,'Desserts','Tasty desserts without the guilt.'),
(1004,'Purees','Organic purees that are the best in the industry.'),
(1005,'Snacks','Chips, cookies, and more with flavor and texture beyond compare.'),
(1006,'Beverages','Natural, no sugar-added drinks.');

Drop table if exists products;

CREATE TABLE Products
(
	ProductID MEDIUMINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    ProductCategoryID SMALLINT UNSIGNED NOT NULL, 
    SiteID TINYINT UNSIGNED NOT NULL,
    ProductName VARCHAR(50) NOT NULL,
    AvailableQuantity INT NOT NULL, 
    NetRetailPrice DECIMAL(6,2) NOT NULL,
    ProductCost DECIMAL(6,2) NOT NULL,  
    UnitKGWeight DECIMAL(6,2) NULL,
    MOQUnits MEDIUMINT UNSIGNED NULL,
    ProductDescription VARCHAR(200),
    INDEX `idx_product_category` (ProductCategoryID),
	CONSTRAINT fk_ProductCategoryID
    FOREIGN KEY(ProductCategoryID) REFERENCES ProductCategory(ProductCategoryID)
    ON DELETE RESTRICT,
	INDEX `site` (SiteID),
	CONSTRAINT fk_SiteID
    FOREIGN KEY(SiteID) REFERENCES ManufactureSite(SiteID)
    ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE Products
AUTO_INCREMENT = 100000;

ALTER TABLE Products
RENAME COLUMN NetRetailPrice TO WholesalePrice;

INSERT INTO Products
(
	ProductCategoryID,
    SiteID,
    ProductName,
    AvailableQuantity,
    NetRetailPrice,
    ProductCost,
    UnitKGWeight,
    MOQUnits,
    ProductDescription
)
VALUES
(1002,3,'Rice Miso',100000,1.00,0.40,0.25,500,'Great seasoning without soy.'),
(1000,1,'Instant Tom Yum',50000,0.90,0.25,0.10,500,'Healthy, easy dinner or lunch.'),
(1001,2,'GF Keto Flour',200000,2.50,1.20,0.50,1000,'Baking without the guilt.'),
(1003,1,'Dairy-Free Pistachio Pudding Mix',25000,0.90,0.50,0.10,250,'Natural, no-sugar deliciousness.'),
(1004,2,'Organic Pumpkin Puree',15000,1.00,0.65,0.70,250,'Professional tasting organic pumpkin pie.'),
(1005,3,'Paleo Cassava Torilla Chips',20000,2.00,1.00,0.10,500,'You won\'t miss corn chips.'),
(1005,1,'Pico de Gallo Salsa',100000,2.50,1.50,0.50,500,'Authentic Mexican salsa.'),
(1006,2,'Keto Cafe Mocha',20000,1.50,0.80,0.30,250,'Cafe style coffee at your convenience.'),
(1001,3,'Gluten-Free Biscuit Dough',200000,1.50,0.40,0.25,1000,'GF, vegan, soy-free biscuits from the oven.'),
(1006,3,'Sugar-Free Barista Oat Milk',150000,2.00,1.00,1.00,1000,'Rich, creamy sugar-free oat milk.'),
(1000,2,'Lentil Mapo Tofu',50000,2.50,1.50,0.40,500,'Soy-free version of classic Chinese dish.'),
(1000,2,'Lentil Thai Tofu',50000,2.50,1.50,0.40,500,'Soy-free version of popular Thai dish.'),
(1003,3,'Chantilly Cake Mix',10000,1.50,0.80,0.20,250,'GF version of delicate southern dish.'),
(1003,1,'Vegan Peach Cobler Frozen Dessert',10000,1.80,1.10,0.30,250,'GF vegan dessert with real pie crust pieces.'),
(1003,1,'Madagascar Vanilla Frozen Dessert',20000,1.50,1.00,0.30,250,'GF, vegan dessert.'),
(1004,2,'Organic Frozen Strawberry Puree',10000,1.00,0.65,0.50,250,'Ripe strawberry flavor for food & drinks.'),
(1004,2,'Organic Frozen Raspberry Puree',10000,1.20,0.70,0.50,250,'Ripe red raspberry flavor for food & drinks.'),
(1004,2,'Organic Frozen Mango Puree',10000,1.00,0.65,0.50,250,'Ripe Ataulfo mango puree for food & drinks.');

CREATE TABLE Customers
(
	CustomerID INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CompanyName NVARCHAR(50) NOT NULL,
    StreetAddress VARCHAR(100) NULL,
    City VARCHAR(50) NULL,
    State_Province VARCHAR(50) NULL,
    Nation VARCHAR(100) NOT NULL,
    Zipcode MEDIUMINT UNSIGNED NULL, 
    PhoneNumber VARCHAR(50) NULL,
    PhoneExt VARCHAR(8) NULL, 
    Email NVARCHAR(255) NULL,
    Notes VARCHAR(200) NULL
);


ALTER TABLE Customers
AUTO_INCREMENT = 1000;

ALTER TABLE Customers
CHANGE COLUMN Zipcode Zipcode NVARCHAR(50) NULL;

INSERT INTO Customers
(
	CompanyName,
    StreetAddress,
    City,
    State_Province,
    Nation,
    Zipcode,
    PhoneNumber,
    PhoneExt,
    Email,
    Notes
)
VALUES
('Wholesome Foods','123 Alamo St.', 'Austin','Texas','United States','75801','5555551234','8001','purchasingmanager@wholesomefoods.com',
'Typically larger order quantities'),
('Eli\'s Trading Post','8000 Happy Camper Way','Whistler','British Columbia','Canada','V0N 1B0','6045557000','230','purchasingboss@elistrading.com',
'Prefers overstocks and discounts. High MOQs okay.'),
('Natural Groceries','3000 Sleepytime Dr.','Boulder','Colorado','United States','80301','3034732222','140','purchasingtribe@naturalgroceries.com',
'Likes bottom dollar. Be strong & persuasive.'),
('Highland\'s Health Nuts','9-10 Andew Square','Edinburgh',NULL,'United Kingdom','EH2 2AF','441315554646','9002','purchasing@scottishhighlands.com',
'Great customer. Pays top dollar, but find lower cost shipping.'),
('Luxe Foods','8245 Aspen Dr.','Aspen','Colorado','United States','83201','3035559898','0001','bigboss@luxfoods.com','Pays top dollar, high MOQs
but demanding lead times.');

UPDATE Customers
SET
	StreetAddress='9-10 Andrew Square'
    WHERE CustomerID=1003;


CREATE TABLE Orders
(
    OrderID INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    CustomerID INT UNSIGNED NOT NULL,
    OrderDate DATETIME NOT NULL,
    ShimpmentDate DATETIME NULL,
    Discount DECIMAL(8,2) NULL,
    OrderTotal DECIMAL(8,2) NOT NULL,
    Notes VARCHAR(300) NULL,
	INDEX `customerid_for_orders` (CustomerID),
	CONSTRAINT fk_CustomerID
    FOREIGN KEY(CustomerID) REFERENCES Customers (CustomerID)
    ON DELETE RESTRICT
);

ALTER TABLE Orders
AUTO_INCREMENT = 1000;

ALTER TABLE Orders
RENAME COLUMN ShimpmentDate TO ShipmentDate;


CREATE TABLE OrderedItems
(
	OrderedItemsID INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    OrderID INT UNSIGNED NOT NULL, 
    ProductID MEDIUMINT UNSIGNED NOT NULL,
    Quantity MEDIUMINT UNSIGNED NOT NULL,
	INDEX `orderid_for_ordereditems` (OrderID),
	CONSTRAINT fk_OrderIDforOrderItems
    FOREIGN KEY(OrderID) REFERENCES Orders (OrderID)
    ON DELETE CASCADE
);

ALTER TABLE OrderedItems
ADD INDEX `idx_productid_OI` (ProductID), 
ADD CONSTRAINT fk_productid_for_OI
FOREIGN KEY(ProductID) REFERENCES Products (ProductID)
ON DELETE RESTRICT;

ALTER TABLE OrderedItems
ADD COLUMN Notes VARCHAR(250) NULL AFTER Quantity;

ALTER TABLE OrderedItems
AUTO_INCREMENT = 1000;

CREATE TABLE Payments
(
	PaymentID INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    OrderID INT UNSIGNED NOT NULL,
    PaymentDate DATETIME NOT NULL,
    PaymentType VARCHAR(50) NOT NULL,
    Amount DECIMAL(8, 2) NOT NULL,
    Notes VARCHAR(250) NULL,
	INDEX `orderid_for_payments` (OrderID),
	CONSTRAINT fk_OrderIDforPayments
    FOREIGN KEY(OrderID) REFERENCES Orders (OrderID)
    ON DELETE RESTRICT
);

ALTER TABLE Payments
AUTO_INCREMENT = 1000;

CREATE TABLE ManufactureSite
(
	SiteID TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    ManagerFirstName VARCHAR(50) NOT NULL,
    ManagerLastName VARCHAR(50) NOT NULL,
    ManagerEmail NVARCHAR(255) NOT NULL,
    ManagerPhone VARCHAR(10) NOT NULL, 
    ManagerPhoneExt CHAR(3) NULL
);

INSERT INTO ManufactureSite
(
	City,
    State,
    ManagerFirstName,
    ManagerLastName,
    ManagerEmail,
    ManagerPhone,
    ManagerPhoneExt
)
VALUES 
('Cherry Hill','New Jersey','Ina','Garden Variety','igardenvariety@squeakycleanfoods.com','5555551400','100'),
('Charlotte','North Carolina','Martha','Stewed Tomatoes','mstewedtomatoes@squeakycleanfoods.com','5555551500','100'),
('Eau Claire','Wisconsin','Rachel','Ramen Noodles','rramennoodles@squeakycleanfoods.com','5555551600','100');
    

    