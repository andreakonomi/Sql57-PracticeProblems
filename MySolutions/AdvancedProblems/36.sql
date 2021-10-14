SELECT TOP(10) WITH TIES
	d.OrderID,
	COUNT(*) AS LineItemsNumber
FROM 
	dbo.OrderDetails d
GROUP BY
	d.OrderID
ORDER BY
	LineItemsNumber DESC