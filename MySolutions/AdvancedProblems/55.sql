WITH ShipCountryGroups AS (
SELECT
	o.ShipCountry,
	o.CustomerID,
	o.OrderID,
	CAST(o.OrderDate AS DATE) AS OrderDate,
	ROW_NUMBER() OVER (PARTITION BY o.ShipCountry ORDER BY o.ShipCountry, o.OrderDate) AS RowNumber
FROM dbo.Orders o			--is shipcountry order really needed? it seems like it has already been done, 
	)						-- result is correct even without it

SELECT
	s.ShipCountry,
	s.CustomerID,
	s.OrderID,
	s.OrderDate
FROM ShipCountryGroups s
WHERE s.RowNumber = 1

--MySolution, works but doesnt anticipate if a OrderDate has been edited and so the
-- ID field doesnt show the correct order as a result. 
-- Surprise it is mentioned in the soltuions notes this method
WITH CountryIDs AS (
	SELECT
		MIN(o.OrderID) AS OrderID
	FROM dbo.Orders o
	GROUP BY o.ShipCountry
)

SELECT
	o.ShipCountry,
	o.CustomerID,
	c.OrderID,
	o.OrderDate
FROM CountryIDs c
	INNER JOIN dbo.Orders o ON o.OrderID = c.OrderID
ORDER BY c.OrderID