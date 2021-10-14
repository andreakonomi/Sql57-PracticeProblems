SELECT
	e.EmployeeID,
	e.LastName,
	COUNT(*) AS TotalLateOrders
FROM 
	dbo.Employees e
		LEFT JOIN dbo.Orders o ON o.EmployeeID = e.EmployeeID
WHERE
	o.ShippedDate >= o.RequiredDate
GROUP BY
	e.EmployeeID, e.LastName
ORDER BY
	TotalLateOrders DESC