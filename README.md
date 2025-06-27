📦 E-commerce ETL Pipeline with SSIS
This project builds an end-to-end ETL pipeline and data warehouse for an e-commerce business using SQL Server Integration Services (SSIS).

🚀 Project Goals
Improve data quality and availability for business analytics

Automate loading of structured data into a star schema warehouse

Enable future dashboarding (Power BI/Tableau)

🛠️ Tech Stack
Tools Used: SSIS, SQL Server, Flat Files (CSV), ADO.NET, OLEDB

Data Sources: Product, Customer, Orders, Order Items, Supplier, Payment Methods, Campaigns, Returns, Ratings
📊 Key Features
Built dimension tables (e.g., DimCustomer, DimProduct, DimSupplier) and fact tables (e.g., FactOrders, FactOrderItems, FactReturns)

Used Derived Columns for standardization (e.g., price with GST, order value flags)

Applied Conditional Splits to route valid/invalid and category-based records (e.g., expensive vs affordable products, good vs bad sentiment)

Implemented data conversions and lookup transformations for referential integrity

Enabled incremental loading, logging, and error handling for reliable execution

✅ Outcome
Successfully created a reusable and scalable ETL framework

Final output: Cleaned and structured data ready for BI tools

Supports sales tracking, customer behavior analysis, product insights, and returns analysis

