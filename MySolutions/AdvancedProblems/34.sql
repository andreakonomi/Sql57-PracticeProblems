SELECT
	c.CustomerID,
	c.CompanyName,
	SUM(d.Quantity * d.UnitPrice) AS TotalsWithoutDiscount,
	SUM(d.Quantity * d.UnitPrice * (1 - d.Discount)) AS TotalsWithDiscount
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
HAVING
	SUM(d.Quantity * d.UnitPrice * (1 - d.Discount)) >= 10000
ORDER BY 
	TotalsWithDiscount DESC