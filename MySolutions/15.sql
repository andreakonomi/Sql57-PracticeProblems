	-- my way
select
	Top(1) OrderDate
from
	dbo.Orders
order by
	OrderDate

	--book suggested way
select
	Min(OrderDate)
from
	dbo.Orders