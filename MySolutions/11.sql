select
	FirstName,
	LastName,
	Title,
	Format(BirthDate, 'yyyy-mm-dd')
from
	dbo.Employees
order by
	BirthDate