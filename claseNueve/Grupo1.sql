-- INTEGRANTES GRUPO 1
-- Cinthia Garrido
-- Claudivit Matheuz
-- Maureen Parra
-- Johan Galvis
-- Joseph Jimenez
-- Jacobo Gaitan


-- CATEGORIA Y PRODUCTOS
 Select * From categorias;
 Select CategoriaNombre, Descripcion From emarket.categorias;
Select * From emarket.productos;
Select Discontinuado From emarket.productos Where Discontinuado = 1;
Select proveedorID, productoNombre From emarket.productos Where ProveedorID=8;
Select PrecioUnitario,productoNombre  From emarket.productos Where PrecioUnitario Between 10 and 22;
Select NivelReorden, UnidadesStock, ProductoNombre, ProveedorID From emarket.productos Where UnidadesStock < NivelReorden
Select NivelReorden, UnidadesStock, ProductoNombre, ProveedorID, UnidadesPedidas From emarket.productos Where UnidadesStock < NivelReorden AND UnidadesPedidas=0

-- CLIENTES
select ClienteID, Contacto, Compania, Titulo, Pais from emarket.clientes ORDER BY Pais
select ClienteID, Titulo from emarket.clientes where Titulo = "Owner";
select ClienteID, Contacto from emarket.clientes where Contacto like "C%" ;

-- FACTURAS
SELECT * FROM Facturas ORDER BY FechaFactura;
SELECT * FROM Facturas WHERE PaisEnvio = 'USA' AND EnvioVia != 3;
SELECT * FROM Facturas WHERE ClienteID = 'GOURL';
SELECT * FROM Facturas WHERE EmpleadoID IN (2,3,5,8,9) ORDER BY EmpleadoID;

-- PRODUCTOS
SELECT ProductoNombre, PrecioUnitario FROM emarket.Productos ORDER BY PrecioUnitario;
SELECT ProductoNombre, PrecioUnitario FROM emarket.Productos ORDER BY PrecioUnitario  DESC LIMIT 5;
SELECT ProductoNombre, UnidadesStock FROM emarket.Productos  ORDER BY UnidadesStock DESC LIMIT 10;

-- FACTURADETALLE
SELECT FacturaID, ProductoID, Cantidad FROM emarket.facturadetalle
SELECT FacturaID, ProductoID, Cantidad FROM emarket.facturadetalle ORDER BY Cantidad DESC
SELECT FacturaID, ProductoID, Cantidad FROM emarket.facturadetalle WHERE Cantidad BETWEEN 50 AND 100
SELECT FacturaID AS NroFactura, ProductoID AS producto, PrecioUnitario * Cantidad AS Total FROM emarket.facturadetalle

-- EXTRA
SELECT * FROM Clientes WHERE Pais = 'Brazil' OR Pais = 'Mexico' OR Titulo LIKE 'Sales%';
SELECT * FROM Clientes WHERE Compania LIKE 'A%';
SELECT Ciudad, Contacto as 'Apellido y Nombre', Titulo as Puesto FROM Clientes WHERE Ciudad = 'Madrid';
SELECT * FROM Facturas WHERE FacturaID BETWEEN 10000 AND 10500;
SELECT * FROM Facturas WHERE FacturaID BETWEEN 10000 AND 10500 OR ClienteID LIKE 'B%';
SELECT * FROM Facturas WHERE CiudadEnvio = 'Vancouver' OR EnvioVia = 3;
SELECT * FROM Empleados WHERE Apellido = 'Buchanan';
SELECT * FROM Facturas WHERE EmpleadoID = 5;


