SELECT
	o.OrderID,
	e.EmployeeID,
	o.OrderDate
FROM 
	dbo.Orders o
	INNER JOIN
		dbo.Employees e ON e.EmployeeID = o.EmployeeID
WHERE
	o.OrderDate = EOMONTH(o.OrderDate)
ORDER BY
	e.EmployeeID, o.OrderID