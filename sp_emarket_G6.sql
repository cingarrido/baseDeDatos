CREATE USER 'SABRINA'@'SABRINA' IDENTIFIED BY 'SABRINA';
GRANT CREATE ROUTINE, ALTER ROUTINE ON *.* TO 'SABRINA'@'SABRINA';

-- 1) Empleados
DELIMITER $$
CREATE PROCEDURE sp_Empleados()
BEGIN
SELECT Apellido, Nombre FROM empleados 
ORDER BY Apellido;
END $$ 

CALL sp_Empleados();

-- 2) Empleados por ciudad
DELIMITER $$
CREATE PROCEDURE sp_Empleados_ciudad(IN ciudad_sp VARCHAR(15))
BEGIN
SELECT Apellido, Nombre FROM empleados 
WHERE ciudad = ciudad_sp;
END $$ 

CALL sp_Empleados_ciudad('Seattle');

-- 3) Clientes por país
DELIMITER $$
CREATE PROCEDURE sp_clientes_x_pais(IN pais_sp VARCHAR(15))
BEGIN
SELECT COUNT(*) FROM clientes 
WHERE Pais = pais_sp;
END $$ 

CALL sp_clientes_x_pais('Portugal');

-- 4) Productos sin stock
DROP PROCEDURE sp_productos_sin_stock;
DELIMITER $$
CREATE PROCEDURE sp_productos_sin_stock(IN stock_max INT)
BEGIN
SELECT productos.ProductoNombre, productos.UnidadesStock, categorias.CategoriaNombre 
FROM productos
INNER JOIN categorias ON productos.CategoriaID = categorias.CategoriaID 
WHERE productos.UnidadesStock <= stock_max;
END $$ 

CALL sp_productos_sin_stock(10);
CALL sp_productos_sin_stock(0);

-- 5) Ventas con descuento
DELIMITER $$
CREATE PROCEDURE ventas_con_descuento(IN descuento DOUBLE)
BEGIN
SELECT productos.ProductoNombre, clientes.Contacto Cliente, facturadetalle.Descuento
FROM productos
INNER JOIN facturadetalle ON productos.ProductoID = facturadetalle.ProductoID
INNER JOIN facturas ON facturadetalle.FacturaID = facturas.FacturaID
INNER JOIN clientes ON facturas.ClienteID = clientes.ClienteID
WHERE facturadetalle.Descuento >= descuento;
END $$

CALL ventas_con_descuento(0.1);