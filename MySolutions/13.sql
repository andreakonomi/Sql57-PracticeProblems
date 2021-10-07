select
	OrderID,
	ProductID,
	UnitPrice,
	Quantity,
	UnitPrice * Quantity as TotalPrice
from
	dbo.OrderDetails