SELECT TOP 2 PERCENT
	OrderID
FROM 
	dbo.Orders
ORDER BY
	NEWID()