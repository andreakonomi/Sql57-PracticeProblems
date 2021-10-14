SELECT
	InitialOrder.CustomerID,
	InitialOrder.OrderID InitialOrderID,
	InitialOrder.OrderDate InitialOrderDate,
	NextOrder.OrderID NextOrderID,
	NextOrder.OrderDate NextOrderDate,
	DATEDIFF(DAY, InitialOrder.OrderDate, NextOrder.OrderDate) DaysBetween
FROM dbo.Orders InitialOrder
	INNER JOIN dbo.Orders NextOrder ON InitialOrder.CustomerID = NextOrder.CustomerID
WHERE NextOrder.OrderID > InitialOrder.OrderID --ID of the next order cant be smaller than of the initial id
		AND DATEDIFF(DAY, InitialOrder.OrderDate, NextOrder.OrderDate) <= 5
		--AND DATEDIFF(HOUR, InitialOrder.OrderDate, NextOrder.OrderDate) >= 0 --this filters and additional row, that isnt caught by the book
ORDER BY InitialOrder.CustomerID


-- suspect : Id LACOR ID 10972 - 10973 that gets the additional filter