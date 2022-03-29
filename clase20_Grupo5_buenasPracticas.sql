use adventureworks;
/*1. Mostrar los nombre de los productos que tengan cualquier combinación de
‘mountain bike’
Tablas: Product
Campos: Name*/
select name from product
where name like "%mountain bike%";

/*2. Mostrar las personas cuyo nombre empiece con la letra “y”
Tablas: Contact
Campos: FirstName*/
select FirstName 
from Contact 
where FirstName like "Y%";

/*Mostrar cinco productos más caros y su nombre ordenado en forma alfabética
Tablas: Product
Campos: Name, ListPrice*/
select name, ListPrice
from Product
order by listPrice desc, name
limit 5;

-- Operadores & joins
/*Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea
johnson
Tablas: Contact
Campos: FirstName, LastName*/

select concat_ws(" ", FirstName, LastName)
from Contact 
where LastName like "johnson";

/*2. Mostrar todos los productos cuyo precio sea inferior a 150$ de color rojo o cuyo
precio sea mayor a 500$ de color negro
Tablas: Product
Campos: ListPrice, Color*/

select ListPrice , Color from product
where (color = "red" and listPrice <150)
or (color = "black" and listPrice >500);

-- Funciones de agregación
/*1. Mostrar la fecha más reciente de venta
Tablas: SalesOrderHeader
Campos: OrderDate*/
select max(orderdate) from salesOrderHeader;

/*2. Mostrar el precio más barato de todas las bicicletas
Tablas: Product
Campos: ListPrice, Name*/
select min(ListPrice), p.Name from product p
inner join productsubcategory psc on psc.ProductsubCategoryID = p.ProductSubcategoryID
where psc.productCategoryID = 1
group by psc.productCategoryID
having min(ListPrice) != 0;

-- Group by
/*1. Mostrar los productos y la cantidad total vendida de cada uno de ellos
Tablas: SalesOrderDetail
Campos: ProductID, OrderQty*/
select ProductID , sum(OrderQty) as cantVendidaTotal from SalesOrderDetail
group by productID;

-- Having
/*Mostrar la cantidad de facturas que vendieron más de 20 unidades.
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, OrderQty*/

select SalesOrderID, OrderQty from SalesOrderDetail
group by salesOrderID
having orderQty > 20;

-- Joins
/*Mostrar el código de logueo, número de territorio y sueldo básico de los
vendedores
Tablas: Employee, SalesPerson
Campos: LoginID, TerritoryID, Bonus, BusinessEntityID*/
/*2. Mostrar los productos que sean ruedas
Tablas: Product, ProductSubcategory
Campos: Name, ProductSubcategoryID*/
SELECT p.Name, psc.productsubcategoryID FROM product p
INNER JOIN productsubcategory psc
ON p.ProductSubcategoryID = psc.productSubcategoryID
WHERE psc.Name = 'Wheels';
/*3. Mostrar los nombres de los productos que no son bicicletas
Tablas: Product, ProductSubcategory
Campos: Name, ProductSubcategoryID*/
SELECT p.Name, psc.productsubcategoryID FROM product p
INNER JOIN productsubcategory psc
ON p.ProductSubcategoryID = psc.productSubcategoryID
WHERE psc.Name not like '%Bike%' OR '%Bikes%';