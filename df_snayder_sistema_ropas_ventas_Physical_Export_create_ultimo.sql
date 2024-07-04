CREATE DATABASE venta_ropa;
USE venta_ropa;
CREATE TABLE categoria (
    id int NOT NULL,
    nombre varchar(100) NOT NULL,
    descripcion varchar(255) NOT NULL,
    CONSTRAINT categoria_pk PRIMARY KEY (id)
) COMMENT 'En esta tabla se almacenará los datos de las categorías.';

-- Datos de ejemplo
INSERT INTO categoria (id, nombre, descripcion) VALUES
(1, 'Ropa Casual', 'Ropa para uso diario'),
(2, 'Ropa Deportiva', 'Ropa para actividades deportivas'),
(3, 'Ropa Formal', 'Ropa para eventos formales'),
(4, 'Accesorios', 'Accesorios de moda'),
(5, 'Calzado', 'Diversos tipos de calzado');


-- Table: clientes
CREATE TABLE clientes (
    id_cliente int NOT NULL,
    dni varchar(8) NOT NULL,
    nombre varchar(80) NOT NULL,
    apellidos varchar(90) NOT NULL,
    direccion varchar(100) NOT NULL,
    telefono varchar(9) NOT NULL,
    CONSTRAINT clientes_pk PRIMARY KEY (id_cliente)
) COMMENT 'En esta tabla se almacenará los datos de los clientes.';

-- Datos de ejemplo
INSERT INTO clientes (id_cliente, dni, nombre, apellidos, direccion, telefono) VALUES
(1, '12345678', 'Juan', 'Perez', 'Calle Falsa 123', '987654321'),
(2, '87654321', 'Maria', 'Lopez', 'Av. Siempre Viva 742', '912345678'),
(3, '11223344', 'Carlos', 'Gomez', 'Calle Luna 456', '923456789'),
(4, '44332211', 'Ana', 'Martinez', 'Calle Sol 789', '934567890'),
(5, '55667788', 'Luis', 'Rodriguez', 'Calle Estrella 321', '945678901');


-- Table: productos
CREATE TABLE productos (
    id_codigo int NOT NULL,
    nombre varchar(60) NOT NULL,
    precio_actual decimal(10,2) NOT NULL,
    stock int NOT NULL,
    venta_detalle_id_venta_detalle int NOT NULL,
    categoria_id int NOT NULL,
    CONSTRAINT productos_pk PRIMARY KEY (id_codigo)
);

-- Datos de ejemplo
INSERT INTO productos (id_codigo, nombre, precio_actual, stock, venta_detalle_id_venta_detalle, categoria_id) VALUES
(1, 'Camiseta', 19.99, 100, 1, 1),
(2, 'Pantalones', 29.99, 50, 2, 1),
(3, 'Zapatillas', 59.99, 30, 3, 2),
(4, 'Chaqueta', 99.99, 20, 4, 3),
(5, 'Gorra', 9.99, 200, 5, 4);

-- Table: proveedores
CREATE TABLE proveedores (
    id_proveedores int NOT NULL,
    nombre varchar(80) NOT NULL,
    ruc char(11) NOT NULL,
    direccion varchar(80) NOT NULL,
    telefono char(9) NOT NULL,
    pagina_web varchar(120) NOT NULL,
    productos_id_codigo int NOT NULL,
    CONSTRAINT proveedores_pk PRIMARY KEY (id_proveedores)
) COMMENT 'En esta tabla se almacenará los datos de los proveedores.';

-- Datos de ejemplo
INSERT INTO proveedores (id_proveedores, nombre, ruc, direccion, telefono, pagina_web, productos_id_codigo) VALUES
(1, 'Proveedor A', '12345678901', 'Calle Proveedor 123', '912345678', 'www.proveedorea.com', 1),
(2, 'Proveedor B', '10987654321', 'Av. Proveedor 456', '923456789', 'www.proveedorb.com', 2),
(3, 'Proveedor C', '11223344556', 'Calle Proveedor 789', '934567890', 'www.proveedorc.com', 3),
(4, 'Proveedor D', '66554433221', 'Av. Proveedor 321', '945678901', 'www.proveedord.com', 4),
(5, 'Proveedor E', '99887766554', 'Calle Proveedor 654', '956789012', 'www.proveedore.com', 5);


-- Table: venta_detalle
CREATE TABLE venta_detalle (
    id_venta_detalle int NOT NULL,
    nombre varchar(60) NOT NULL,
    precio_actual decimal(10,2) NOT NULL,
    cantidad_venta int NOT NULL,
    id_productos int NOT NULL,
    total decimal(10,2) NOT NULL,
    clientes_id_cliente int NOT NULL,
    CONSTRAINT venta_detalle_pk PRIMARY KEY (id_venta_detalle)
) COMMENT 'En esta tabla se almacenará los datos de las ventas_detalles.';

-- Datos de ejemplo
INSERT INTO venta_detalle (id_venta_detalle, nombre, precio_actual, cantidad_venta, id_productos, total, clientes_id_cliente) VALUES
(1, 'Camiseta', 19.99, 2, 1, 39.98, 1),
(2, 'Pantalones', 29.99, 1, 2, 29.99, 2),
(3, 'Zapatillas', 59.99, 1, 3, 59.99, 3),
(4, 'Chaqueta', 99.99, 1, 4, 99.99, 4),
(5, 'Gorra', 9.99, 5, 5, 49.95, 5);


-- foreign keys
-- Reference: productos_categoria (table: productos)
ALTER TABLE productos ADD CONSTRAINT productos_categoria FOREIGN KEY productos_categoria (categoria_id)
    REFERENCES categoria (id);

-- Reference: productos_ventas (table: productos)
ALTER TABLE productos ADD CONSTRAINT productos_ventas FOREIGN KEY productos_ventas (venta_detalle_id_venta_detalle)
    REFERENCES venta_detalle (id_venta_detalle);

-- Reference: proveedores_productos (table: proveedores)
ALTER TABLE proveedores ADD CONSTRAINT proveedores_productos FOREIGN KEY proveedores_productos (productos_id_codigo)
    REFERENCES productos (id_codigo);

-- Reference: venta_detalle_clientes (table: venta_detalle)
ALTER TABLE venta_detalle ADD CONSTRAINT venta_detalle_clientes FOREIGN KEY venta_detalle_clientes (clientes_id_cliente)
    REFERENCES clientes (id_cliente);

-- End of file.

