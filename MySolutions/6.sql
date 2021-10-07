select
	SupplierID,
	ContactName,
	ContactTitle
from
	dbo.Suppliers
where
	ContactTitle <> 'Marketing Manager'