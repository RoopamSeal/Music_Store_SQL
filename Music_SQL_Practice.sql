-- QUESTION 1
SELECT c.FirstName, c.LastName, i.InvoiceID, i.InvoiceDate, i.BillingCountry
FROM customer c
JOIN invoice i
WHERE c.CustomerId = i.CustomerId
AND c.Country = "FRANCE";


-- QUESTION 2
SELECT FirstName, LastName, CustomerId, Country
FROM customer
WHERE Country <> "USA";


-- QUESTION 3
SELECT DISTINCT Composer
FROM track
WHERE Composer IS NOT NULL;


-- QUESTION 4
SELECT EmployeeId, LastName, FirstName, Title
FROM employee
WHERE Title = "Sales Support Agent";


-- QUESTION 5
CREATE TABLE track_archived AS
SELECT *
FROM track;

DELETE FROM track_archived
WHERE
    Composer IS NULL;
    
-- QUESTION 6
INSERT INTO Track (
					TrackId, Name, AlbumId, MediaTypeId, 
                    GenreId, Composer, Milliseconds, 
                    Bytes, UnitPrice)
VALUES (3504, 'New Horizons', 270, 1, 1, 'Jane Doe', 250000, 5000000, 0.99);

-- QUESTION 7
SELECT * 
FROM employee
WHERE ReportsTo = (SELECT EmployeeId from employee WHERE Title = "Sales Manager")
AND LastName NOT LIKE "P%";

-- Question 8
SELECT *
FROM employee
WHERE ReportsTo = (SELECT EmployeeId FROM employee WHERE Title = "General Manager")
AND Title NOT LIKE "Sales Manager";

-- Question 9
UPDATE customer
SET Phone = '+351 123456'
WHERE Country = 'Portugal' 
AND State IS NULL;

-- QUESTION 10
UPDATE Customer
SET Phone = '+91 9876543210'
WHERE Country = 'India' AND LastName = 'Pareek';

-- QUESTION 11
UPDATE Employee
SET Email = 'it.manager@company.org'
WHERE City = 'Calgary' AND Title = 'IT Manager';

-- QUESTION 12
SELECT e.FirstName, e.Lastname, i.InvoiceId,
	   i.InvoiceDate, i.Total
FROM employee e
JOIN customer c
ON e.EmployeeId = c.SupportRepId
JOIN invoice i
ON c.CustomerId = i.CustomerId
WHERE e.Title = "Sales Support Agent";

-- Question 13
SELECT c.FirstName AS Customer_Last_Name, c.LastName AS Customer_First_Name,
	   i.Total, c.Country, 
       e.LastName AS Employee_Last_Name, e.FirstName AS Employee_First_Name
FROM customer c
JOIN invoice i 
ON c.CustomerId = i.CustomerId
JOIN employee e
ON c.SupportRepId = e.EmployeeId;

-- QUESTION 14
SELECT t.Name, t.TrackId, il.InvoiceLineId, il.InvoiceId,
	   il.UnitPrice, il.Quantity
FROM invoiceline il
JOIN track t
WHERE il.TrackId = t.TrackId;

-- QUESTION 15
SELECT il.TrackId, il.InvoiceLineId, il.InvoiceId, 
	   ar.Name as Artist, t.Name as track_name
FROM track t
JOIN invoiceline il
ON t.TrackId = il.TrackId
JOIN album al
ON t.AlbumId = al.AlbumId
JOIN artist ar
ON al.ArtistId = ar.ArtistId;

-- QUESTION 16
SELECT tr.Name AS Track, al.Title AS Album, mt.Name AS Media, g.Name AS Genre
FROM track tr
JOIN album al
ON tr.AlbumId = al.AlbumId
JOIN mediatype mt
ON tr.MediaTypeId = mt.MediaTypeId
JOIN genre g
ON tr.GenreId = g.GenreId;


