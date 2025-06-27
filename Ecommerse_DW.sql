CREATE DATABASE  EcommerceDW;
USE EcommerceDW;

--1.Dimension Tables
--Create DimCustomer Table

CREATE TABLE DimCustomer (
    Customer_ID VARCHAR(50) PRIMARY KEY,
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Email VARCHAR(255) UNIQUE NOT NULL,
    Country VARCHAR(200)
);
SELECT *FROM [dbo].[DimCustomers]

--Create DimCategory Table 

CREATE TABLE DimCategory (
    Category_ID VARCHAR(100) PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL
);

SELECT *FROM [dbo].[DimCategories]

--Create DimSubcategory Table

CREATE TABLE DimSubcategory(
    Subcategory_ID  VARCHAR(100) PRIMARY KEY,
    Subcategory_Name VARCHAR(100) NOT NULL,
    Category_ID VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Subcategory_Category FOREIGN KEY (Category_ID)
        REFERENCES DimCategory(Category_ID)
);
SELECT *FROM [dbo].[DimSubcategories]
SELECT *FROM [dbo].[DimSubCat]
select *from [dbo].[OLE DB Destination40]
select *from [dbo].[Dim_Sub_Category]

--Create DimProduct Table
CREATE TABLE DimProduct (
    Product_ID VARCHAR(100) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) CHECK (Price >= 0),
    Description VARCHAR(4000),
    Subcategory_ID VARCHAR(100),
    CONSTRAINT FK_Product_Subcategory FOREIGN KEY (Subcategory_ID)
        REFERENCES DimSubcategory(Subcategory_ID)
);
SELECT *FROM [dbo].[DimAffortableProduct]

SELECT *FROM [dbo].[DimExpensiveProduct]

--Create DimSupplier Table
CREATE TABLE DimSupplier (
    Supplier_ID VARCHAR(100) PRIMARY KEY,
    Supplier_Name VARCHAR(100),
    Email VARCHAR(255)
);
SELECT *FROM [dbo].[Suppiler .com Table]
SELECT *FROM [dbo].[Suppiler .org Table]
SELECT *FROM [dbo].[DimSuppiler]

--Create DimPaymentMethod
CREATE TABLE [Dim_Payment_Method] (
    [payment_method_id] varchar(50) PRIMARY KEY,
    [payment_method] varchar(50),
    [Copy of payment_method] varchar(50),
    [IsOnline] nvarchar(7),
    [IsCardPayment] nvarchar(3)
)
select *from [Dim_Payment_Method]

--Create DimMarketingCampaigns  Table
CREATE TABLE Dim_Marketing_Campaigns (
    Campaign_ID VARCHAR(100) PRIMARY KEY,
    Campaign_Name VARCHAR(100)NOT NULL,
    Offer_Week INT CHECK(Offer_Week > 0 )
);
SELECT *FROM [dbo].[DimMarketingCampaigns]


--Fact Tables
--Create FactOrders Table
CREATE TABLE FactOrders (
    Order_ID_Surrogate INT PRIMARY KEY,
    Order_ID VARCHAR(100),
    Customer_ID VARCHAR(50),
    Order_Date DATE,
    Campaign_ID VARCHAR(100),
    Amount DECIMAL(18,2) CHECK (Amount > 0),
    Payment_method_id VARCHAR(50),
    CONSTRAINT FK_FactOrders_Customer FOREIGN KEY (Customer_ID)
        REFERENCES DimCustomer(Customer_ID),
    CONSTRAINT FK_FactOrders_Campaign FOREIGN KEY (Campaign_ID)
        REFERENCES Dim_Marketing_Campaigns(Campaign_ID),
    CONSTRAINT FK_FactOrders_Payment FOREIGN KEY (Payment_method_id)
        REFERENCES [Dim_Payment_Method](payment_method_id)
);

select *from [dbo].[FactOrdersTable]

--Create FactOrderItem Table
CREATE TABLE FactOrderItems (
    OrderItem_ID INT PRIMARY KEY,
    Order_ID INT, -- FK assumes Order_ID is UNIQUE in FactOrders
    Product_ID INT,
    Quantity INT,
    Supplier_ID INT,
    SubTotal DECIMAL(10,2),
    Discount DECIMAL(10,2),
    CONSTRAINT FK_FactOrderItems_Order FOREIGN KEY (Order_ID)
        REFERENCES FactOrders(Order_ID),
    CONSTRAINT FK_FactOrderItems_Product FOREIGN KEY (Product_ID)
        REFERENCES DimProduct(Product_ID),
    CONSTRAINT FK_FactOrderItems_Supplier FOREIGN KEY (Supplier_ID)
        REFERENCES DimSupplier(Supplier_ID)
);

select * from [dbo].[FactOrderItemTable]

--Craete FactReturnsTable
CREATE TABLE FactReturns (
    Return_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Return_DATE DATE,
    Reason VARCHAR(300),
    Amount_Refunded DECIMAL(10,2),
    CONSTRAINT FK_FactReturns_Order FOREIGN KEY (Order_ID)
        REFERENCES FactOrders(Order_ID),
    CONSTRAINT FK_FactReturns_Product FOREIGN KEY (Product_ID)
        REFERENCES DimProduct(Product_ID)
);
select *from [dbo].[FactReturnTable]

--Create FactCustomerProductRating Table
CREATE TABLE FactCustomer_Product_Rating (
    CustomerProductRating_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Ratings DECIMAL(10,2),
    Review VARCHAR(300),
    Sentiment VARCHAR(50),
    CONSTRAINT FK_FactRatings_Customer FOREIGN KEY (Customer_ID)
        REFERENCES DimCustomer(Customer_ID),
    CONSTRAINT FK_FactRatings_Product FOREIGN KEY (Product_ID)
        REFERENCES DimProduct(Product_ID)
);

select *from [dbo].[FactBadRatingProduct]
select *from [dbo].[FactGoodRatingProduct]
