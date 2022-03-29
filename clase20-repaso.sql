# WHERE 
# 1

SELECT Name 
FROM product
WHERE Name LIKE '%mountain bike%';

# 2

SELECT FirstName 
FROM contact
WHERE FirstName LIKE "y%";

# ORDER BY
# 1

SELECT Name, ListPrice 
FROM product
ORDER BY ListPrice DESC, Name ASC
LIMIT 5;

# OPERADORES
# 1 

SELECT CONCAT( FirstName , ' ' , LastName ) AS 'Nombre Completo'
FROM contact
WHERE LastName = "johnson";

# 2

SELECT ListPrice, Color
FROM product
WHERE ( ListPrice < 150 AND Color = "Red" )
OR ( ListPrice > 500 AND Color = "Black");

# FUNCIONES DE AGREGACION 
# 1

SELECT MAX(OrderDate)
FROM salesorderheader;

# 2 

SELECT Name, MIN(ListPrice) AS Precio
FROM product;

# GROUP BY 
# 1 

SELECT productID, SUM(orderQty) AS 'Cantidad total vendida'
FROM salesorderdetail
GROUP BY productID;

# HAVING 
# 1 

SELECT SalesOrderID, SUM(OrderQty) AS 'Cantidad'
FROM salesorderdetail
GROUP BY SalesOrderID
HAVING Cantidad > 20;

# JOINS 
# 1 

SELECT LoginID, TerritoryID, Bonus
FROM employee
JOIN salesperson ON employee.EmployeeID = salesperson.SalesPersonID;

# 2 

SELECT product.name, productsubcategory.Name
FROM product
JOIN productsubcategory ON product.ProductSubcategoryID = productsubcategory.ProductSubcategoryID
WHERE productsubcategory.Name = 'Wheels';

# 3

SELECT product.name, productsubcategory.Name
FROM product
JOIN productsubcategory ON product.ProductSubcategoryID = productsubcategory.ProductSubcategoryID
WHERE productsubcategory.Name NOT LIKE '%Bike%';





