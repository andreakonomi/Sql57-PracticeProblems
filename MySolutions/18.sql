select
	p.ProductID,
	p.ProductName,
	s.CompanyName
from
	dbo.Products as p
left join
	dbo.Suppliers as s on p.SupplierID = s.SupplierID
order by 
	p.ProductID