
;With SupplierCountries as
	(Select 
		Country, 
		COUNT(*) AS SuppliersCount 
		FROM dbo.Suppliers 
		GROUP BY Country)

,CustomerCountries as
	(SELECT
		Country,
		COUNT(*) AS CustomersCount
	FROM dbo.Customers
	GROUP BY Country)

SELECT
	ISNULL(s.Country, c.Country) AS Country,
	ISNULL(s.SuppliersCount, 0) AS SuppliersCount,
	ISNULL(c.CustomersCount, 0) AS CustomersCount
FROM SupplierCountries s
FULL Outer Join CustomerCountries c
	ON c.Country = s.Country

	