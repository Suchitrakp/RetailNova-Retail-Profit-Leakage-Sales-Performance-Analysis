USE RetailNova_Analytics;
GO

-- 1. Return Status Analysis
SELECT
    Returned,
    COUNT(*) AS Total_Order_Lines,
    COUNT(DISTINCT [Order ID]) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    CAST(
        SUM(Profit) * 100.0 / NULLIF(SUM(Sales), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percentage
FROM dbo.Retail_Sales
GROUP BY Returned;


-- 2. Validate Return Records
SELECT
    COUNT(DISTINCT R.[Order ID]) AS Total_Return_Records,
    COUNT(DISTINCT S.[Order ID]) AS Matched_Return_Orders
FROM dbo.Returns_Data AS R
LEFT JOIN dbo.Retail_Sales AS S
    ON R.[Order ID] = S.[Order ID];
GO