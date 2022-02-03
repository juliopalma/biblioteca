--Crear base de datos
CREATE DATABASE biblioteca;

-- Tabla de Comunas
CREATE TABLE comunas(
	id INTEGER NOT NULL,
	comuna_nombre VARCHAR(255) NOT NULL,
	PRIMARY KEY(id)
);

-- Tabla de direcciones
CREATE TABLE direcciones(
	direccion_id INTEGER,
	pais VARCHAR(255),
	ciudad VARCHAR(255),
	calle VARCHAR(255),
	numero VARCHAR(25),
	depto VARCHAR(255),
	comuna_id INTEGER,
	PRIMARY KEY(direccion_id),
	FOREIGN KEY (comuna_id) REFERENCES comunas(id)
);

-- Tabla de socios
CREATE TABLE socios(
	rut VARCHAR(25) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	apellido VARCHAR(255) NOT NULL,
	telefono VARCHAR(255),
	direccion_id INTEGER,
	PRIMARY KEY (rut),
	FOREIGN KEY (direccion_id) REFERENCES direcciones(direccion_id)
);

-- Tabla de Autores
CREATE TABLE autores(
	autor_codigo VARCHAR(255) NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	apellido VARCHAR(255),
	fecha_nacimiento VARCHAR(255) NOT NULL,
	fecha_muerte VARCHAR(255),
	PRIMARY KEY (autor_codigo)
);

-- Tabla de Libros
CREATE TABLE libros(
	isbn VARCHAR(255) NOT NULL,
	titulo VARCHAR(255) NOT NULL,
	numero_paginas INTEGER,
	dias_prestamo INTEGER,
	codigo_autor VARCHAR(255),
	PRIMARY KEY (isbn),
	FOREIGN KEY(codigo_autor) REFERENCES autores(autor_codigo)
);

-- Tabla de historial de Prestamos
CREATE TABLE historialPrestamos(
	prestamo_id INTEGER,
	libro VARCHAR(255),
	fecha_inicio_prestamo TIMESTAMP,
	fecha_esperada_devolucion TIMESTAMP,
	fecha_real_devolucion TIMESTAMP,
	rut VARCHAR(25) NOT NULL,
	isbn VARCHAR(255) NOT NULL,
	PRIMARY KEY (prestamo_id),
	FOREIGN KEY(rut) REFERENCES socios(rut),
	FOREIGN KEY (isbn) REFERENCES libros(isbn)
);

-- Tabla de libro con sus autores
CREATE TABLE librosAutores(
	tipo_autor VARCHAR(255) NOT NULL,
	autor_codigo VARCHAR(255) NOT NULL,
	libro_isbn VARCHAR(255) NOT NULL,
	PRIMARY KEY(autor_codigo, libro_isbn),
	FOREIGN KEY (autor_codigo) REFERENCES autores(autor_codigo),
	FOREIGN KEY (libro_isbn) REFERENCES libros(isbn)
);