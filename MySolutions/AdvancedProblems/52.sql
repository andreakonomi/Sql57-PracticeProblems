SELECT Country FROM dbo.Customers
UNION
SELECT Country FROM dbo.Suppliers
ORDER BY Country
--Union removes duplicates