USE tienda;

-- 1. List the names of all the products in the product table.
    SELECT nombre FROM producto;

-- 2. List the names and prices of all the products in the product table.
    SELECT nombre, precio FROM producto;

-- 3. List all the columns in the product table.
    SELECT * FROM producto;

-- 4. List the names of the products, the price in euros, and the price in US dollars (USD)
    SELECT nombre, precio AS precio_euros, ROUND(precio * 1.15, 2) AS precio_dolares FROM producto;

-- 5. List the names of the products, the price in euros, and the price in US dollars (USD). Use the following aliases for the columns: product name, euros, dollars.
    SELECT nombre AS 'nom de producto', precio AS euros, ROUND(precio * 1.15, 2) AS dòlars FROM producto;

-- 6. List the names and prices of all the products in the product table, converting the names to uppercase.
    SELECT UPPER(nombre) AS nombre, precio FROM producto;

-- 7. List the names and prices of all the products in the product table, converting the names to lowercase.
    SELECT LOWER(nombre) AS nombre, precio FROM producto;

-- 8. List the names of all the manufacturers in one column, and in another column, capitalize the first two characters of the manufacturer's name.
    SELECT nombre, UPPER(LEFT(nombre, 2)) AS inicials FROM fabricante;
    SELECT nombre, upper(substring(nombre, 1, 2)) AS fabricante FROM tienda.fabricante;

-- 9. List the names and prices of all the products in the product table, rounding the price value.
    SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto;

-- 10. Lists the names and prices of all products in the product table, truncating the price value to display it without any decimal places.
    SELECT nombre, TRUNCATE(precio, 0) AS price FROM producto;

-- 11. List the code of the manufacturers that have products in the product table.
    SELECT codigo_fabricante FROM producto;

-- 12. List the code of the manufacturers that have products in the product table, eliminating codes that appear repeatedly.
    SELECT DISTINCT codigo_fabricante FROM producto;

-- 13. List the names of the manufacturers in ascending order.
    SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. List the names of the manufacturers in descending order.
    SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. Lists the names of the products sorted, first, by name in ascending order and, second, by price in descending order.
    SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Returns a list with the first 5 rows of the manufacturer table.
    SELECT * FROM fabricante LIMIT 5;

-- 17. Returns a list with 2 rows starting from the fourth row of the manufacturer table. The fourth row must also be included in the response.
    SELECT * FROM fabricante LIMIT 3, 2;
    SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18. List the name and price of the cheapest product. (Use only ORDER BY and LIMIT clauses.) NOTE: You couldn't use MIN(price) here, you would need GROUP BY.
    SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;

-- 19. List the name and price of the most expensive product. (Use only ORDER BY and LIMIT clauses.) NOTE: You couldn't use MAX(price) here, you would need GROUP BY.
    SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. Lists the name of all products from the manufacturer whose manufacturer code is equal to 2.
    SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21. Returns a list with the product name, price and manufacturer name of all products in the database.
    SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo

-- 22. Returns a list with the product name, price, and manufacturer name of all products in the database. Sorts the result by manufacturer name, in alphabetical order.
    SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;

-- 23. Returns a list with the product code, product name, manufacturer code and manufacturer name of all the products in the database.
    SELECT p.codigo, p.nombre, f.codigo, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 24. Returns the product name, its price and the name of its manufacturer, of the cheapest product.
    SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio LIMIT 1;

-- 25. Returns the product name, its price and the name of its manufacturer, of the most expensive product.
    SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1;

-- 26. Returns a list of all products from the manufacturer Lenovo.
    SELECT p.* FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

-- 27. Returns a list of all products from the manufacturer Crucial that have a price greater than €200.
    SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- 28. Returns a list with all products from manufacturers Asus, Hewlett-Packard, and Seagate. Without using the IN operator.
    SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- 29. Returns a list with all products from manufacturers Asus, Hewlett-Packard, and Seagate. Using the IN operator.
    SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ( 'Asus', 'Hewlett-Packard', 'Seagate');

-- 30. Returns a list with the name and price of all products from manufacturers whose names end with the vowel e.
    SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';

-- 31. Returns a list with the name and price of all products whose manufacturer name contains the character w in their name.
    SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';

-- 32. Returns a list with the product name, price and manufacturer name, of all products that have a price greater than or equal to €180. Sorts the result, first, by price (in descending order) and, second, by name (in ascending order).
    SELECT p.nombre, p.precio, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

-- 33. Returns a list with the manufacturer code and name, only of those manufacturers that have associated products in the database.
    SELECT DISTINCT f.codigo, f.nombre FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo;

-- 34. Returns a list of all manufacturers that exist in the database, along with the products that each of them has. The list should also show those manufacturers that do not have associated products.
    SELECT f.nombre, p.nombre AS producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 35. Returns a list where only those manufacturers that do not have any associated products appear.
    SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;

-- 36. Returns all products from the manufacturer Lenovo. (Without using INNER JOIN).
    SELECT p.nombre, f.nombre FROM producto p LEFT JOIN fabricante f ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo';

-- 37. Returns all data for products that have the same price as the most expensive product from the manufacturer Lenovo. (Without using INNER JOIN).
    SELECT * FROM producto pp WHERE pp.precio=(SELECT p.precio FROM fabricante f, producto p WHERE f.nombre='Lenovo' AND f.codigo=p.codigo_fabricante ORDER BY p.precio DESC LIMIT 1) 

SELECT *
FROM producto
WHERE precio = (
SELECT MAX(p.precio)
  FROM producto p
  JOIN fabricante f ON p.codigo_fabricante = f.codigo
  WHERE f.nombre = 'Lenovo'
);

-- 38. List the name of the most expensive product from the manufacturer Lenovo.
    SELECT p.nombre,p.precio FROM fabricante f, producto p WHERE f.nombre='Lenovo' AND f.codigo=p.codigo_fabricante ORDER BY p.precio DESC LIMIT 1

SELECT p.nombre, MAX(p.precio) AS precio, f.nombre
FROM tienda.producto as p
left join tienda.fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo'
GROUP BY 3,1
ORDER BY 2 desc
LIMIT 1;

-- 39. List the name of the cheapest product from the manufacturer Hewlett-Packard.
    SELECT p.nombre,p.precio FROM fabricante f, producto p WHERE f.nombre='Hewlett-Packard' AND f.codigo=p.codigo_fabricante ORDER BY p.precio ASC LIMIT 1

SELECT p.nombre, MIN(p.precio) AS precio, f.nombre
FROM tienda.producto as p
LEFT JOIN tienda.fabricante as f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Hewlett-Packard'
GROUP BY 3,1
ORDER BY 2
LIMIT 1;

-- 40. Returns all products in the database that have a price greater than or equal to the most expensive product from the manufacturer Lenovo.
    SELECT * FROM producto pp WHERE pp.precio>=(SELECT p.precio FROM fabricante f, producto p WHERE f.nombre='Lenovo' AND f.codigo=p.codigo_fabricante ORDER BY p.precio DESC LIMIT 1) 

SELECT *
FROM producto
WHERE precio >= (SELECT MAX(precio)
                 FROM producto p
                          INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
                 WHERE f.nombre = 'Lenovo');

-- 41. List all products from the manufacturer Asus that are priced higher than the average price of all their products.
    SELECT pp.* FROM producto pp JOIN fabricante ff ON pp.codigo_fabricante = ff.codigo WHERE ff.nombre = 'Asus' AND pp.precio >= (SELECT AVG(p.precio) AS preu_mig FROM producto p WHERE p.codigo_fabricante IN (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));

SELECT *
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus')
  AND precio > (SELECT AVG(precio)
                FROM producto p
                         INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo
                WHERE f.nombre = 'Asus');