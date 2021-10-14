-- tip dont left join until the end with the employees table, dont take the info until it is 
--really needed

-- METHOD 1 TWO CTE
WITH TotalOrders AS(
	SELECT 
		EmployeeID,
		COUNT(*) AS AllOrders
	FROM 
		dbo.Orders
	GROUP BY EmployeeID
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
	LateOrders.EmployeeID,
    e.LastName,
    LateOrders.LateOrders,
    TotalOrders.AllOrders
FROM LateOrders
	INNER JOIN TotalOrders ON TotalOrders.EmployeeID = LateOrders.EmployeeID
	INNER JOIN dbo.Employees e ON e.EmployeeID = LateOrders.EmployeeID
ORDER BY LateOrders.LateOrders DESC


----METHOD 2 ONE CTE
--WITH TotalOrders AS(
--	SELECT 
--		EmployeeID,
--		COUNT(*) AS AllOrders
--	FROM 
--		dbo.Orders
--	GROUP BY EmployeeID
--)


--SELECT
--	e.EmployeeID,
--	e.LastName,
--	COUNT(*) AS LateOrders,
--	TotalOrders.AllOrders
--FROM 
--	dbo.Employees e
--		LEFT JOIN dbo.Orders o ON o.EmployeeID = e.EmployeeID
--		INNER JOIN TotalOrders ON TotalOrders.EmployeeID = e.EmployeeID
--WHERE
--	o.ShippedDate >= o.RequiredDate
--GROUP BY
--	e.EmployeeID, e.LastName, TotalOrders.AllOrders
--ORDER BY
--	LateOrders DESC