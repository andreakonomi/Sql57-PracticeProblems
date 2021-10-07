select
	FirstName,
	LastName,
	HireDate
from
	dbo.Employees
where
	Title = 'Sales Representative'
	and Country = 'USA'
