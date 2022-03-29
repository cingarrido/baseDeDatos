/*
Jacobo Gaitan, Claudivit Matheuz, Karen Oviedo, Berni Perez Centeno
*/

USE EMarket;
/*1) Empleados
a) Crear un SP que liste los apellidos y nombres de los empleados ordenados
alfabéticamente.
b) Invocar el SP para verificar el resultado.
*/

delimiter $$
create procedure sp_empleados()
begin
	select apellido, nombre from Empleados
    order by Apellido;
end $$

call sp_empleados;

/*2) Empleados por ciudad
a) Crear un SP que reciba el nombre de una ciudad y liste los empleados de esa
ciudad.
b) Invocar al SP para listar los empleados de Seattle.
*/

delimiter $$
create procedure sp_empleadosxciudad(in city varchar(20))
begin
	select apellido, nombre, ciudad from Empleados
    where ciudad = city;    
end $$

call sp_empleadosxciudad ('Seattle');
call sp_empleadosxciudad ('london');

/*3) Clientes por país
a) Crear un SP que reciba el nombre de un país y devuelva la cantidad de clientes
en ese país.
b) Invocar el SP para consultar la cantidad de clientes en Portugal.
*/

delimiter $$
create procedure sp_clientesxpais(in country varchar(20))
begin
	select count(ClienteID), Pais from Clientes
    where pais = country
    group by Pais;
end $$

call sp_clientesxpais('Portugal');

/*4) Productos sin stock
a) Crear un SP que reciba un número y liste los productos cuyo stock está por
debajo de ese número. El resultado debe mostrar el nombre del producto, el
stock actual y el nombre de la categoría a la que pertenece el producto.
b) Listar los productos con menos de 10 unidades en stock.
c) Listar los productos sin stock.
*/

delimiter $$
create procedure sp_productos(in stock int)
begin
	select p.ProductoNombre, p.UnidadesStock, c.CategoriaNombre
    from Productos p
    inner join Categorias c on p.CategoriaID = c.CategoriaID
    where p.UnidadesStock <= stock;
end $$

call sp_productos(10);
drop procedure sp_productos;


/*
5) Ventas con descuento
a) Crear un SP que reciba un porcentaje y liste los nombres de los productos que
hayan sido vendidos con un descuento igual o superior al valor indicado,
indicando además el nombre del cliente al que se lo vendió.
b) Listar la información de los productos que hayan sido vendidos con un
descuento mayor al 10%.*/



