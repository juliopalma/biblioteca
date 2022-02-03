-----------------------------------------------CONSULTAS------------------------------------------------------
-- Tabla comunas
BEGIN TRANSACTION;

INSERT INTO comunas(id,comuna_nombre)
VALUES(1, 'carahue');

INSERT INTO comunas(id,comuna_nombre)
VALUES(2, 'gorbea');

INSERT INTO comunas(id,comuna_nombre)
VALUES(3, 'loncoche');

INSERT INTO comunas(id,comuna_nombre)
VALUES(4, 'pitrufquen');

INSERT INTO comunas(id,comuna_nombre)
VALUES(5, 'victoria');


-- Tabla direcciones
INSERT INTO direcciones(direccion_id, pais, ciudad, calle,numero,depto,comuna_id)
VALUES(1, 'chile', 'temuco', 'los alamos', 10, NULL, 1);

INSERT INTO direcciones(direccion_id, pais, ciudad, calle,numero,depto,comuna_id)
VALUES(2, 'chile', 'constitucion', 'los raulies', 613, NULL, 2);

INSERT INTO direcciones(direccion_id, pais, ciudad, calle,numero,depto,comuna_id)
VALUES(3, 'chile', 'concepcion', 'gabriela mistral', 354, NULL, 3);

INSERT INTO direcciones(direccion_id, pais, ciudad, calle,numero,depto,comuna_id)
VALUES(4, 'chile', 'parral', 'rodriguez', 5645, NULL, 4);

INSERT INTO direcciones(direccion_id, pais, ciudad, calle,numero,depto,comuna_id)
VALUES(5, 'chile', 'mehuin', 'portales', 521, NULL, 5);


-- Tabla socios
INSERT INTO socios(rut, nombre, apellido, telefono, direccion_id)
VALUES ('1111111-1', 'juan', 'soto', '911111111', 1);

INSERT INTO socios(rut, nombre, apellido, telefono, direccion_id)
VALUES ('2222222-2', 'ana', 'perez', '922222222', 2);

--se repite
INSERT INTO socios(rut, nombre, apellido, telefono, direccion_id)
VALUES ('3333333-3', 'sandra', 'aguilar', '933333333', 3);

--nuevos socios
INSERT INTO socios(rut, nombre, apellido, telefono, direccion_id)
VALUES ('4444444-4', 'esteban', 'jerez', '944444444', 4);

INSERT INTO socios(rut, nombre, apellido, telefono, direccion_id)
VALUES ('5555555-5', 'silvana', 'muñoz', '955555555', 5);


-- Tabla autores
INSERT INTO autores(autor_codigo, nombre, apellido, fecha_nacimiento, fecha_muerte)
VALUES(1, 'jose', 'salgado', 1968, 2020);

INSERT INTO autores(autor_codigo, nombre, apellido, fecha_nacimiento, fecha_muerte)
VALUES(2, 'ana', 'salgado', 1972, NULL);

INSERT INTO autores(autor_codigo, nombre, apellido, fecha_nacimiento, fecha_muerte)
VALUES(3, 'andres', 'ulloa', 1982, NULL);

INSERT INTO autores(autor_codigo, nombre, apellido, fecha_nacimiento, fecha_muerte)
VALUES(4, 'sergio', 'mardones', 1950, 2012);

INSERT INTO autores(autor_codigo, nombre, apellido, fecha_nacimiento, fecha_muerte)
VALUES(5, 'martin', 'porta', 1976, NULL);


-- Tabla libros
INSERT INTO libros(isbn, titulo, numero_paginas, dias_prestamo, codigo_autor)
VALUES('111-1111111-111', 'cuentos de terror', 344, 7, 1);

INSERT INTO libros(isbn, titulo, numero_paginas, dias_prestamo, codigo_autor)
VALUES('222-2222222-222', 'poesias contemporaneas', 167, 7, 2);

INSERT INTO libros(isbn, titulo, numero_paginas, dias_prestamo, codigo_autor)
VALUES('333-3333333-333', 'historia de asia', 511, 14, 3);

--Nuevo libro
INSERT INTO libros(isbn, titulo, numero_paginas, dias_prestamo, codigo_autor)
VALUES('444-4444444-444', 'manual de mecanica', 298, 14, 3);


--Tabla historial de prestamos
INSERT INTO historialPrestamos(prestamo_id, libro, fecha_inicio_prestamo, fecha_esperada_devolucion, fecha_real_devolucion, rut, isbn)
VALUES(1, 'cuentos de terror', '2020-01-20', '2020-01-27', NULL, '1111111-1', '111-1111111-111');

INSERT INTO historialPrestamos(prestamo_id, libro, fecha_inicio_prestamo, fecha_esperada_devolucion, fecha_real_devolucion, rut, isbn)
VALUES(2, 'poesias contemporaneas', '2020-01-20', '2020-01-30', NULL, '5555555-5', '222-2222222-222');

INSERT INTO historialPrestamos(prestamo_id, libro, fecha_inicio_prestamo, fecha_esperada_devolucion, fecha_real_devolucion, rut, isbn)
VALUES(3, 'historia de asia', '2020-01-22', '2020-01-30', NULL, '3333333-3', '333-3333333-333');

--nuevos prestamos
INSERT INTO historialPrestamos(prestamo_id, libro, fecha_inicio_prestamo, fecha_esperada_devolucion, fecha_real_devolucion, rut, isbn)
VALUES(4, 'manual de mecanica', '2020-01-23', '2020-01-30', NULL, '4444444-4', '444-4444444-444');

INSERT INTO historialPrestamos(prestamo_id, libro, fecha_inicio_prestamo, fecha_esperada_devolucion, fecha_real_devolucion, rut, isbn)
VALUES(5, 'cuentos de terror', '2020-01-27', '2020-02-04', NULL, '2222222-2', '111-1111111-111');

INSERT INTO historialPrestamos(prestamo_id, libro, fecha_inicio_prestamo, fecha_esperada_devolucion, fecha_real_devolucion, rut, isbn)
VALUES(6, 'manual de mecanica', '2020-01-31', '2020-02-12', NULL, '1111111-1', '444-4444444-444');

INSERT INTO historialPrestamos(prestamo_id, libro, fecha_inicio_prestamo, fecha_esperada_devolucion, fecha_real_devolucion, rut, isbn)
VALUES(7, 'poesias contemporaneas', '2020-01-31', '2020-02-12', NULL, '3333333-3', '222-2222222-222');


-- Tabla libro_autores
INSERT INTO librosAutores(tipo_autor, autor_codigo, libro_isbn)
values('principal', 1, '111-1111111-111');

INSERT INTO librosAutores(tipo_autor, autor_codigo, libro_isbn)
values('principal', 2, '222-2222222-222');

INSERT INTO librosAutores(tipo_autor, autor_codigo, libro_isbn)
values('principal', 3, '333-3333333-333');

INSERT INTO librosAutores(tipo_autor, autor_codigo, libro_isbn)
values('coautor', 4, '111-1111111-111');

COMMIT;
END TRANSACTION;