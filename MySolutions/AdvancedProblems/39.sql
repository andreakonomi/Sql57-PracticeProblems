WITH PotentialDuplicates AS (		--CTE
	SELECT
		DISTINCT OrderID		--added DISTINCT as precaution for the duplicates OrderID x Quantity groups
	FROM dbo.OrderDetails
	WHERE Quantity >= 60
	GROUP BY OrderID, Quantity
	HAVING COUNT(*) > 1
)

SELECT 
	d.OrderID,
    d.ProductID,
    d.UnitPrice,
    d.Quantity,
    d.Discount
FROM 
	dbo.OrderDetails d
WHERE
	d.OrderID IN (SELECT OrderID FROM PotentialDuplicates)
ORDER BY
	d.OrderID, d.Quantity