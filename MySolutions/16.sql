-- my
select distinct
	Country
from
	dbo.Customers

-- book

select 
	Country
from
	dbo.Customers
group by
	Country