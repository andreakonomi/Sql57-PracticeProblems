SELECT
	d.OrderID		--should add DISTINCT here to avoid the duplicate record that comes back
FROM 
	dbo.OrderDetails d
WHERE
	d.Quantity >= 60
GROUP BY
	d.OrderID, d.Quantity
HAVING
	COUNT(*) > 1