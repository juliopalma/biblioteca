--a Mostrar todos los libros que posean menos de 300 páginas
select * from libros where numero_paginas > 300;

--b Mostrar todos los autores que hayan nacido después del 01-01-1970
select * from autores where fecha_nacimiento > '1970-01-01';

--c ¿Cuál es el libro más solicitado?
SELECT libro, isbn, count(isbn) as cantidad_libro FROM historialprestamos GROUP BY libro, isbn
HAVING count(isbn) >= (select count(isbn) from historialprestamos group by isbn order by count desc limit 1);

 
--d Si se cobrara una multa de $100 por cada día de atraso, 
--mostrar cuánto debería pagar cada usuario que entregue el préstamo después de 7 días.

select socios.nombre, libros.titulo, (extract(days from (fecha_esperada_devolucion - fecha_inicio_prestamo)) - 7)*100 as multa
from socios join historialprestamos on socios.rut = historialprestamos.rut
join libros on historialprestamos.isbn = libros.isbn 
where extract(days from (fecha_esperada_devolucion - fecha_inicio_prestamo))>7 and libros.cantidad_dias = 7

union 

select socios.nombre, libros.titulo, (extract(days from (fecha_esperada_devolucion - fecha_inicio_prestamo)) - 14)*100 as multa
from socios join historialprestamos on socios.rut = historialprestamos.rut
join libros on historialprestamos.isbn = libros.isbn 
where extract(days from (fecha_esperada_devolucion - fecha_inicio_prestamo))>14 and libros.cantidad_dias = 14