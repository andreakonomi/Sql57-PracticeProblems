SELECT
	o.OrderID,
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
	o.OrderID, c.CompanyName, c.CustomerID
HAVING
	SUM(d.Quantity * d.UnitPrice) >= 10000
ORDER BY 
	TotalOrderAmount DESC


-- BOOK ANSWER
--Select
--Customers.CustomerID
--,Customers.CompanyName
--,Orders.OrderID
--,TotalOrderAmount = SUM(Quantity * UnitPrice)
--From Customers
--Join Orders
--on Orders.CustomerID = Customers.CustomerID
--Join OrderDetails
--on Orders.OrderID = OrderDetails.OrderID
--Where
--OrderDate >= '20160101'
--and OrderDate < '20170101'
--Group by
--Customers.CustomerID
--,Customers.CompanyName
--,Orders.Orderid
--Having Sum(Quantity * UnitPrice) > 10000
--Order by TotalOrderAmount DESC