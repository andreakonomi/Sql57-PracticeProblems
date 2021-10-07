select
	OrderID,
	CustomerID,
	ShipCountry
from
	dbo.Orders
where
	ShipCountry In ('France', 'Belgium')