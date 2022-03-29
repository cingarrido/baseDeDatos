use emarket;
/*
a) Crear un SP que muestre apellidos, nombres y edad de cada empleado, debe
calcular la edad de los empleados a partir de la fecha de nacimiento y que
tengan entre n y n años de edad.
b) Ejecutar el SP indicando un rango de edad entre 50 y 60 años de edad.
*/
# a.
DELIMITER $$
CREATE PROCEDURE sp_calculo_edad ()
BEGIN
	select Apellido, Nombre, year(curdate()) - year(FechaNacimiento) as Edad from emarket.empleados;  
END $$
call sp_calculo_edad();

#b.
drop procedure sp_edad;
DELIMITER $$
CREATE PROCEDURE sp_edad (in edadInicial tinyint, in edadFinal tinyint)
begin
	select Apellido, Nombre, year(curdate()) - year(FechaNacimiento) as Edad from emarket.empleados 
    having Edad between edadInicial  and edadFinal ; 
end $$
call sp_edad(50, 60);

/*
2) Actualización de productos
a) Crear un SP que reciba un porcentaje y un nombre de categoría y actualice los
productos pertenecientes a esa categoría, incrementando las unidades pedidas
según el porcentaje indicado. Por ejemplo: si un producto de la categoría
Seafood tiene 30 unidades pedidas, al invocar el SP con categoría Seafood y
porcentaje 10%, el SP actualizará el valor de unidades pedidas con el nuevo valor
33.
b) Listar los productos de la categoría Beverages para ver cuántas unidades
pedidas hay de cada uno de ellos.
c) Invocar al SP con los valores Beverages como categoría y 15 como porcentaje.
d) Volver a listar los productos como en (a), y validar los resultados.
*/
DELIMITER $$
CREATE PROCEDURE sp_actualizar_producto(in porcentaje float(1,2), in categoria varchar(20))
begin
	
end $$
call 
