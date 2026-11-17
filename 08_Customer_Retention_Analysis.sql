USE RetailNova_Analytics;
GO

-- 1. Customer Order Frequency
WITH Customer_Orders AS
(
    SELECT
        [Customer ID],
        COUNT(DISTINCT [Order ID]) AS Total_Orders
    FROM dbo.Retail_Sales
    GROUP BY [Customer ID]
)
SELECT
    CASE
        WHEN Total_Orders = 1 THEN 'One-Time'
        WHEN Total_Orders BETWEEN 2 AND 5 THEN 'Occasional'
        WHEN Total_Orders BETWEEN 6 AND 10 THEN 'Regular'
        ELSE 'Frequent'
    END AS Customer_Type,
    COUNT(*) AS Total_Customers,
    CAST(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()
        AS DECIMAL(10,2)
    ) AS Customer_Percentage
FROM Customer_Orders
GROUP BY
    CASE
        WHEN Total_Orders = 1 THEN 'One-Time'
        WHEN Total_Orders BETWEEN 2 AND 5 THEN 'Occasional'
        WHEN Total_Orders BETWEEN 6 AND 10 THEN 'Regular'
        ELSE 'Frequent'
    END
ORDER BY Total_Customers DESC;


-- 2. High-Value Inactive Customers
WITH Customer_Activity AS
(
    SELECT
        [Customer ID],
        MAX([Customer Name]) AS Customer_Name,
        MAX([Order Date]) AS Latest_Order_Date,
        SUM(Sales) AS Lifetime_Sales,
        SUM(Profit) AS Lifetime_Profit
    FROM dbo.Retail_Sales
    WHERE [Order Date] <= '2026-11-15'
    GROUP BY [Customer ID]
)
SELECT
    [Customer ID],
    Customer_Name,
    Latest_Order_Date,
    Lifetime_Sales,
    Lifetime_Profit,
    DATEDIFF(MONTH, Latest_Order_Date, '2026-11-15')
        AS Months_Inactive
FROM Customer_Activity
WHERE Latest_Order_Date < DATEADD(MONTH, -6, '2026-11-15')
  AND Lifetime_Profit >= 500
ORDER BY Lifetime_Profit DESC;
GO