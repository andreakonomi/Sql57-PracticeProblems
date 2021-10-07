select
	OrderID,
	CustomerID,
	ShipCountry
from
	dbo.Orders
where
	ShipCountry In ('Brazil', 'Mexico', 'Argentina', 'Venezuela')