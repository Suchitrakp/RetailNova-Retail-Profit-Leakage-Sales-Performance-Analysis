USE RetailNova_Analytics;
GO

-- 1. Profitability by Discount Band
SELECT
    CASE
        WHEN Discount <= 0.10 THEN '0-10%'
        WHEN Discount <= 0.20 THEN 'Above 10-20%'
        WHEN Discount <= 0.30 THEN 'Above 20-30%'
        ELSE 'Above 30%'
    END AS Discount_Band,
    COUNT(*) AS Total_Order_Lines,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage,
    COUNT(CASE WHEN Profit < 0 THEN 1 END) AS Loss_Making_Lines
FROM dbo.Retail_Sales
GROUP BY
    CASE
        WHEN Discount <= 0.10 THEN '0-10%'
        WHEN Discount <= 0.20 THEN 'Above 10-20%'
        WHEN Discount <= 0.30 THEN 'Above 20-30%'
        ELSE 'Above 30%'
    END
ORDER BY MIN(Discount);


-- 2. Subcategory Profitability
SELECT
    Category,
    [Sub-Category],
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage,
    CAST(AVG(Discount) * 100 AS DECIMAL(10,2))
        AS Average_Discount_Percentage
FROM dbo.Retail_Sales
GROUP BY Category, [Sub-Category]
ORDER BY Total_Profit ASC;


-- 3. Loss-Making Products
SELECT
    [Sub-Category],
    [Product Name],
    SUM(Quantity) AS Total_Quantity_Sold,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage,
    CAST(AVG(Discount) * 100 AS DECIMAL(10,2))
        AS Average_Discount_Percentage
FROM dbo.Retail_Sales
GROUP BY [Sub-Category], [Product Name]
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;