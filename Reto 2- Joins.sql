#Reto 2: Joins
#Bryand Javier Garcia Sigales
USE tienda;

SELECT * FROM empleado;
SELECT * FROM venta;

SHOW KEYS FROM venta; 
#¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT DISTINCT clave, nombre, apellido_paterno, apellido_materno
FROM empleado as a
JOIN venta as b
ON a.id_empleado = b.id_empleado 
ORDER BY clave;

#¿Cuál es el nombre de los artículos que se han vendido?
SELECT clave, nombre
FROM articulo as a
JOIN venta as b
ON a.id_articulo = b.id_articulo
ORDER BY clave;

#¿Cuál es el total de cada venta?
SELECT clave, sum(precio) AS total 
FROM venta as a
JOIN articulo as b
ON a.id_articulo = b.id_articulo
GROUP BY clave
ORDER BY clave;