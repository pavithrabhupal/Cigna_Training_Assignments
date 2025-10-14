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

--Insert




