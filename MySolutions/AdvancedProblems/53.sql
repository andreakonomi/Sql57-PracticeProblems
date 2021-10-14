-- MySolution
WITH ListOfCountries AS(		--this extra was added to achieve the order result wanted from the book 
	SELECT DISTINCT				--not great but I like the way I solved the ordering, new field coalesce function
		s.Country AS SupplierCountry,
		c.Country AS CustomerCountry,
		COALESCE(s.Country+c.Country, s.Country, c.Country) AS AuxField --when either field is null + operator gave null, coal solves this
	FROM dbo.Suppliers s
		FULL OUTER JOIN dbo.Customers c
			ON c.Country = s.Country
)

SELECT
	ListOfCountries.SupplierCountry,
	ListOfCountries.CustomerCountry
FROM ListOfCountries
ORDER BY
	ListOfCountries.AuxField

--Book Solution
;With SupplierCountries as
(Select Distinct Country from Suppliers)
,CustomerCountries as
(Select Distinct Country from Customers)

Select
	SupplierCountry = SupplierCountries .Country
	,CustomerCountry = CustomerCountries .Country
From SupplierCountries
Full Outer Join CustomerCountries
	ON CustomerCountries.Country = SupplierCountries.Country