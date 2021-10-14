WITH TotalOrdersByCompany AS (
	SELECT
		c.CustomerID,
		c.CompanyName,
		SUM(d.Quantity * d.UnitPrice) AS TotalOrderAmount
	FROM 
		dbo.Orders o
		INNER JOIN 
			dbo.OrderDetails d ON d.OrderID = o.OrderID
		INNER JOIN 
			dbo.Customers c ON c.CustomerID = o.CustomerID
	WHERE
		YEAR(o.OrderDate) = 2016
	GROUP BY
		c.CompanyName, c.CustomerID
)

SELECT
	t.CustomerID,
	t.CompanyName,
	t.TotalOrderAmount,
	th.CustomerGroupName
FROM 
	TotalOrdersByCompany t
	LEFT JOIN dbo.CustomerGroupThresholds th ON t.TotalOrderAmount > th.RangeBottom
		AND t.TotalOrderAmount <= th.RangeTop
ORDER BY
	t.CustomerID

--Above, the book solution very simple and easy to understand
--you can join by using the <,> as well 
------------------------
--My initial solution, very complicated

--SELECT
--	t.CustomerID,
--	t.CompanyName,
--	t.TotalOrderAmount,
--	(
--		SELECT TOP(1)
--			th.CustomerGroupName
--		FROM dbo.CustomerGroupThresholds th 
--		WHERE 
--			t.TotalOrderAmount > th.RangeBottom
--			AND t.TotalOrderAmount <= th.RangeTop
--	) AS Category2
--FROM 
--	TotalOrdersByCompany t
--ORDER BY t.CustomerID
