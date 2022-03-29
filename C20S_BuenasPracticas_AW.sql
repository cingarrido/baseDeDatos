USE adventureworks;

#WHERE
/*
1. Mostrar los nombre de los productos que tengan cualquier combinación de
‘mountain bike’
Tablas: Product
Campos: Name

2. Mostrar las personas cuyo nombre empiece con la letra “y”
Tablas: Contact
Campos: FirstName
*/
SELECT Name FROM product
WHERE Name LIKE '%mountain_bike%';

SELECT FirstName FROM contact
WHERE FirstName LIKE 'y%';


#Order by
/*
1. Mostrar cinco productos más caros y su nombre ordenado en forma alfabética
Tablas: Product
Campos: Name, ListPrice
*/
SELECT Name, ListPrice FROM product
ORDER BY ListPrice DESC, Name ASC
LIMIT 5;

#Operadores & joins
/*
1. Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea
johnson
Tablas: Contact
Campos: FirstName, LastName

2. Mostrar todos los productos cuyo precio sea inferior a 150$ de color rojo o cuyo
precio sea mayor a 500$ de color negro
Tablas: Product
Campos: ListPrice, Color
*/
SELECT concat(FirstName, ' ', LastName) AS 'Nombre' FROM contact
WHERE LastName = 'johnson';

SELECT ListPrice, Color FROM product
WHERE ListPrice < 150 AND Color = 'Red' OR ListPrice > 500 AND Color = 'Black';


# Funciones de agregación
/*
1. Mostrar la fecha más reciente de venta
Tablas: SalesOrderHeader
Campos: OrderDate

2. Mostrar el precio más barato de todas las bicicletas
Tablas: Product
Campos: ListPrice, Name
*/
SELECT min(OrderDate) FROM salesorderheader;

SELECT min(p.ListPrice), p.Name FROM product AS p
INNER JOIN productsubcategory AS psb ON p.ProductSubcategoryID = psb.ProductCategoryID
INNER JOIN productcategory AS pc ON psb.ProductCategoryID = pc.ProductCategoryID
WHERE pc.ProductCategoryID = 1;


# Group by
/*
1. Mostrar los productos y la cantidad total vendida de cada uno de ellos
Tablas: SalesOrderDetail
Campos: ProductID, OrderQty
*/
SELECT ProductID, count(OrderQty) AS 'Cantidad' FROM salesorderdetail
GROUP BY ProductID;


# Having
/*
1. Mostrar la cantidad de facturas que vendieron más de 20 unidades.
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, OrderQty
*/
SELECT ProductID, count(OrderQty) AS 'Cantidad' FROM salesorderdetail
GROUP BY ProductID
HAVING `Cantidad` > 20;


# Joins
/*
1. Mostrar el código de logueo, número de territorio y sueldo básico de los
vendedores
Tablas: Employee, SalesPerson
Campos: LoginID, TerritoryID, Bonus, BusinessEntityID

2. Mostrar los productos que sean ruedas
Tablas: Product, ProductSubcategory
Campos: Name, ProductSubcategoryID

3. Mostrar los nombres de los productos que no son bicicletas
Tablas: Product, ProductSubcategory
Campos: Name, ProductSubcategoryID
*/
SELECT e.LoginID, sp.TerritoryID, sp.Bonus FROM employee AS e
INNER JOIN salesperson AS sp ON e.EmployeeID = sp.SalesPersonID;

SELECT p.Name AS 'Producto', psc.Name AS 'Categoria' FROM product AS P
INNER JOIN productsubcategory AS psc ON p.ProductSubcategoryID = psc.ProductCategoryID
WHERE psc.Name LIKE '%Road%';

SELECT p.Name AS 'Producto', psc.Name AS 'Categoria' FROM product AS P
INNER JOIN productsubcategory AS psc ON p.ProductSubcategoryID = psc.ProductCategoryID
WHERE psc.ProductCategoryID <> 1;









