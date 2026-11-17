USE RetailNova_Analytics;
GO

-- 1. Regional Performance
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage
FROM dbo.Retail_Sales
GROUP BY Region
ORDER BY Total_Profit DESC;


-- 2. Customer Segment Performance
SELECT
    Segment,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage,
    CAST(AVG(Discount) * 100 AS DECIMAL(10,2))
        AS Average_Discount_Percentage
FROM dbo.Retail_Sales
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- 3. Category Performance
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage,
    SUM(Quantity) AS Total_Quantity
FROM dbo.Retail_Sales
GROUP BY Category
ORDER BY Total_Profit DESC;