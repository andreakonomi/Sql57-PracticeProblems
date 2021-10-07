select
	o.OrderID,
	Format(o.OrderDate, 'yyyy-mm-dd'),
	sh.CompanyName
from
	dbo.Orders as o
left join dbo.Shippers as sh 
	on o.ShipVia = sh.ShipperID
where
	o.OrderID < 10300