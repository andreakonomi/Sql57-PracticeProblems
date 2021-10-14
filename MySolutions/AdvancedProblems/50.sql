WITH TotalOrdersByCompany AS (
	SELECT
		c.CustomerID,
		c.CompanyName,
		SUM(d.Quantity * d.UnitPrice) AS TotalOrderAmount
	FROM 
		dbo.Orders o
		INNER JOIN 
			dbo.OrderDetails d ON d.OrderID = o.OrderID
		INNER JOIN 
			dbo.Customers c ON c.CustomerID = o.CustomerID
	WHERE
		YEAR(o.OrderDate) = 2016
	GROUP BY
		c.CompanyName, c.CustomerID
),

OrdersCategorized AS (
	SELECT
		t.CustomerID,
		t.CompanyName,
		t.TotalOrderAmount,
		CASE
			WHEN t.TotalOrderAmount <= 1000 THEN 'LOW'
			WHEN t.TotalOrderAmount <= 5000 THEN 'MEDIUM'
			WHEN t.TotalOrderAmount <= 10000 THEN 'HIGH'
			ELSE 'VERY HIGH'
		END AS Category
	FROM 
		TotalOrdersByCompany t
),

TotalOrders(TotalAmount) AS(
	SELECT SUM(TotalOrdersByCompany.TotalOrderAmount) AS TotalAmount
	FROM TotalOrdersByCompany
)


SELECT 
	oc.Category,
	COUNT(*) AS TotalInCategory,
	COUNT(*) * 1.00 / (SELECT COUNT(*) FROM OrdersCategorized) AS PercentageInCategory
FROM OrdersCategorized oc
GROUP BY 
	oc.Category
ORDER BY
	TotalInCategory DESC

	