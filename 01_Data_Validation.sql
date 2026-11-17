USE RetailNova_Analytics;
GO

-- 1. Check total records
SELECT COUNT(*) AS Total_Rows
FROM dbo.Retail_Sales;

-- 2. Check duplicate Row IDs
SELECT [Row ID], COUNT(*) AS Duplicate_Count
FROM dbo.Retail_Sales
GROUP BY [Row ID]
HAVING COUNT(*) > 1;

-- 3. Check missing values in important columns
SELECT
    COUNT(CASE WHEN [Order ID] IS NULL THEN 1 END) AS Missing_Order_ID,
    COUNT(CASE WHEN [Customer ID] IS NULL THEN 1 END) AS Missing_Customer_ID,
    COUNT(CASE WHEN Sales IS NULL THEN 1 END) AS Missing_Sales,
    COUNT(CASE WHEN Profit IS NULL THEN 1 END) AS Missing_Profit
FROM dbo.Retail_Sales;

-- 4. Check return status
SELECT Returned, COUNT(*) AS Total_Rows
FROM dbo.Retail_Sales
GROUP BY Returned;