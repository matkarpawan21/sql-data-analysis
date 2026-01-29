-- INNER JOIN: Customers and Orders
SELECT
c.CustomerId,
c.FirstName,
c.LastName,
i.InvoiceId,
i.InvoiceDate,
i.Total
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId;

-- LEFT JOIN: Customers with no orders
SELECT
c.CustomerId,
c.FirstName,
c.LastName
FROM Customer c
LEFT JOIN Invoice i
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

-- Revenue per Product
SELECT
t.Name AS Product_Name,
SUM(il.UnitPrice * il.Quantity) AS Total_Revenue
FROM InvoiceLine il
INNER JOIN Track t
ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY Total_Revenue DESC;

-- Category-wise Revenue
SELECT
g.Name AS Category,
SUM(il.UnitPrice * il.Quantity) AS Category_Revenue
FROM InvoiceLine il
INNER JOIN Track t ON il.TrackId = t.TrackId
INNER JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Category_Revenue DESC;
