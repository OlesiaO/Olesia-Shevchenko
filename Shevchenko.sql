-- Creating of DB

CREATE DATABASE Shop
ON PRIMARY (NAME=Shop, FILENAME='c:\db\Shop.mdf', SIZE=100MB, MAXSIZE=UNLIMITED ,FILEGROWTH=20)
LOG ON
(NAME=ShopLog, FILENAME='c:\db\ShopLog.ldf', SIZE=100MB, MAXSIZE=UNLIMITED, FILEGROWTH=20);


-- Creating of tables

CREATE TABLE Product
(	IDProduct		VARCHAR(50)		CONSTRAINT IDProductPrimary PRIMARY KEY,
	ProductName		VARCHAR(50)		NOT NULL,
	Kind			VARCHAR(50)		NOT NULL,
	Price			MONEY			NOT NULL)

CREATE TABLE Client
(	IDClient	VARCHAR(50)		CONSTRAINT IDClientPrimary PRIMARY KEY,
    Surname		VARCHAR(50)		NOT NULL,
    Name		VARCHAR(50)		NOT NULL,
    City		VARCHAR(50),
    Phone		VARCHAR(10)		NOT NULL)

CREATE TABLE Deal
(	IDDeal		VARCHAR(50)		CONSTRAINT IDDealPrimary PRIMARY KEY,
    Amount		INT				NOT NULL,
    DateOfDeal	Date			NOT NULL,
    IDProduct	VARCHAR(50)		CONSTRAINT IDProductForeign FOREIGN KEY REFERENCES Product,
    IDClient	VARCHAR(50)		CONSTRAINT IDClientForeign FOREIGN KEY REFERENCES Client)



-- Filling these tables

INSERT INTO Product (IDProduct, ProductName, Kind, Price)
VALUES('001', 'Samsung', 'Laptop', 1000);

INSERT INTO Product (IDProduct, ProductName, Kind, Price)
VALUES('002', 'HP', 'Printer', 500);

INSERT INTO Product (IDProduct, ProductName, Kind, Price)
VALUES('003', 'Nokia', 'Smartphone', 400);


INSERT INTO Client (IDClient, Surname, Name, City, Phone)
VALUES('001', 'Shevchenko', 'Olesya', 'Kiev', '0631234567');

INSERT INTO Client (IDClient, Surname, Name, City, Phone)
VALUES('002', 'Ivanov', 'Ivan', 'Kiev', '0631234568');

INSERT INTO Client (IDClient, Surname, Name, City, Phone)
VALUES('003', 'Petrov', 'Peter', 'Kiev', '0631234569');


INSERT INTO Deal (IDDeal, Amount, DateOfDeal, IDProduct, IDClient)
VALUES('00001', 1, '2014-01-01', '001', '001');

INSERT INTO Deal (IDDeal, Amount, DateOfDeal, IDProduct, IDClient)
VALUES('00002', 1, '2014-01-02', '001', '002');

INSERT INTO Deal (IDDeal, Amount, DateOfDeal, IDProduct, IDClient)
VALUES('00003', 2, '2014-02-10', '003', '003');


-- Queries:

-- Select from one table

SELECT * FROM Product;

SELECT ProductName FROM Product;

SELECT ProductName, Price
FROM Product
WHERE Price BETWEEN 500 and 1000;


-- Select from few tables

SELECT DISTINCT Client.Surname, Client.Name, Product.ProductName
FROM Client
JOIN Deal ON Client.IDClient = Deal.IDClient
JOIN Product ON Product.IDProduct = Deal.IDProduct;


-- Count rows for table "Product"

SELECT COUNT(*) FROM Product;