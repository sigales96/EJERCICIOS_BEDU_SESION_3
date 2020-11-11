#Reto 1: Subconsultas
#Bryand Javier Garcia Sigales
USE tienda;

#¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
SELECT nombre, apellido_paterno, apellido_materno
FROM empleado
WHERE id_empleado IN
(SELECT id_puesto 
FROM puesto 
WHERE salario > 10000); 

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(total_ventas), max(total_ventas)
FROM 
(SELECT clave, id_empleado, count(*) total_ventas
FROM venta
GROUP BY clave, id_empleado) AS aj
GROUP BY id_empleado;

#¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT DISTINCT clave, id_articulo #DISTINCT SE USA PARA NO TOMAR CLAVES REPETIDAS SI SE PUDIERA DAR EL CASO
FROM venta
WHERE id_articulo IN 
(SELECT id_articulo FROM
articulo WHERE precio > 5000);