SELECT
	o.OrderID,
	o.OrderDate,
	o.RequiredDate,
	o.ShippedDate
FROM 
	dbo.Orders o
WHERE
	o.ShippedDate >= o.RequiredDate