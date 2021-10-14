SELECT 
	d.OrderID,
	d.ProductID,
	d.UnitPrice,
	d.Quantity,
	d.Discount
FROM dbo.OrderDetails d
	JOIN (
		SELECT
			DISTINCT OrderID	--DISTINCT was the fix
		FROM
			dbo.OrderDetails
		WHERE Quantity >= 60
		GROUP BY OrderID, Quantity
		HAVING COUNT(*) > 1
	) PotentialProblemOrders
		ON PotentialProblemOrders.OrderID = d.OrderID
ORDER BY d.OrderID, d.ProductID