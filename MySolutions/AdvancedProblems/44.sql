WITH TotalOrders AS(
	SELECT 
		o.EmployeeID,
		COUNT(*) AS AllOrders
	FROM 
		dbo.Orders o
	GROUP BY o.EmployeeID
),

LateOrders AS(
	SELECT
	o.EmployeeID,
	COUNT(*) AS LateOrders
FROM 
		dbo.Orders o
WHERE
	o.ShippedDate >= o.RequiredDate
GROUP BY
	o.EmployeeID
)

SELECT
	e.EmployeeID,
    e.LastName,
    LateOrders.LateOrders,
    TotalOrders.AllOrders
FROM dbo.Employees e
	LEFT JOIN TotalOrders ON TotalOrders.EmployeeID = e.EmployeeID
	LEFT JOIN LateOrders ON LateOrders.EmployeeID = e.EmployeeID
ORDER BY LateOrders.LateOrders DESC

