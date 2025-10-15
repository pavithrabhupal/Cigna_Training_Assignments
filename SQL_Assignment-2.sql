-----------------------------------------------------------------------------ONLINE STORE INVENTORY-----------------------------------------------------------------------------------------------

--Create Database
CREATE DATABASE Online_Store_Inventory;

--Create Table Product
CREATE TABLE Product (
  Product_ID NUMBER PRIMARY KEY,
  Product_Name VARCHAR2(15) NOT NULL,
  Category VARCHAR2(15) NOT NULL,
  Price FLOAT CHECK(Price > 0),
  Stock NUMBER DEFAULT 0
);

--Create Table Customer
CREATE TABLE Customer (
  Customer_ID NUMBER PRIMARY KEY,
  First_Name VARCHAR2(15) NOT NULL,
  Last_Name VARCHAR2(15) NOT NULL,
  E_mail VARCHAR2(25) UNIQUE,
  Phone VARCHAR2(15)
);

--Create Table Order
CREATE TABLE Orders (
  Order_ID NUMBER PRIMARY KEY,
  Customer_ID NUMBER NOT NULL,
  Order_Date DATE DEFAULT SYSDATE,
  Total_Amount FLOAT,
  CONSTRAINT FK_customer FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID)
);

--Create Table Order Details
CREATE TABLE Order_Details (
  ODetail_ID NUMBER PRIMARY KEY,
  Quantities NUMBER CHECK(Quantities > 0),
  Order_ID NUMBER NOT NULL,
  Product_ID NUMBER NOT NULL,
  CONSTRAINT FK_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
  CONSTRAINT FK_product FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

--Insert into product
INSERT INTO Product(Product_ID, Product_Name, Category, Price, Stock) VALUES
(101, 'Laptop', 'Electronic',123897.03, 10),
(305, 'Headphone','Accessory', 899, 20);

-- Inserting customers
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, E_mail, Phone) VALUES
(1, 'Bob', 'Stew', 'bob@example.com', '+918675544329'),
(2, 'Alia', 'Mark', 'alia@gmail.com', '+918234545674');

-- Inserting orders
INSERT INTO Orders (Order_ID, Customer_ID, Total_Amount) VALUES
(1098, 1, 5000),
(2876, 2, 20000);

-- Inserting order details
INSERT INTO Order_Details (ODeatil_ID, Quantity, Order_ID, Product_ID) VALUES
(1, 1, 1098, 101),
(2, 2, 2876, 305);

--Retrive products with low stock (Ex: less than 20 units)
SELECT * 
FROM Product 
WHERE Stock <20;

--Calculate the total amount spent by each customer
SELECT SUM(O.Total_amount)
FROM Customer C
INNER JOIN Orders O ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID;

--Update product stock quantities after orders are placed to refelect purchased items
UPDATE Product P
SET P.Stock = P.Stock - (
    SELECT OD.Quantities
    FROM Order_Details OD
    WHERE OD.Product_ID = P.Product_ID
)
WHERE P.Product_ID IN (SELECT DISTINCT Product_ID FROM Order_Details);
