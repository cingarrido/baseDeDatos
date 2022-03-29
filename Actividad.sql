DROP PROCEDURE SP_INFO_EMPLEADOS;
DELIMITER $$
CREATE PROCEDURE SP_INFO_EMPLEADOS(IN edadInicial INT, IN edadMaxima INT)
BEGIN
	SELECT Apellido, Nombre, timestampdiff(YEAR, FechaNacimiento, CURDATE()) as edad FROM empleados
    WHERE timestampdiff(YEAR, FechaNacimiento, CURDATE()) > edadInicial AND timestampdiff(YEAR, FechaNacimiento, CURDATE()) < edadMaxima;
END $$

CALL SP_INFO_EMPLEADOS(58,63);
CALL SP_INFO_EMPLEADOS(50,60);

/*a) Crear un SP que reciba un porcentaje y un nombre de categoría y actualice los
productos pertenecientes a esa categoría, incrementando las unidades pedidas
según el porcentaje indicado. Por ejemplo: si un producto de la categoría
Seafood tiene 30 unidades pedidas, al invocar el SP con categoría Seafood y
porcentaje 10%, el SP actualizará el valor de unidades pedidas con el nuevo valor
33.*/

DROP PROCEDURE SP_ACTUALIZAR_CATEGORIA();
DELIMITER $$
CREATE PROCEDURE SP_ACTUALIZAR_CATEGORIA(IN porcentaje INT, IN nombreCategoria NVARCHAR(50))
BEGIN
	SELECT * FROM categorias;
    SELECT * FROM productos;
END $$