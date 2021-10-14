SELECT
	--o.OrderID,
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
	--o.OrderID, 
	c.CompanyName, c.CustomerID
HAVING
	SUM(d.Quantity * d.UnitPrice) >= 15000
ORDER BY 
	TotalOrderAmount DESC