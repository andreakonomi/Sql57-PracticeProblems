select
	ContactTitle,
	COUNT(ContactTitle) as TotalContactTitle
from
	dbo.Customers
group by
	ContactTitle