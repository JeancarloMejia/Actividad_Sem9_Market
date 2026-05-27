-- CATEGORIAS
INSERT INTO categorias (descripcion, estado) VALUES ('Lácteos', true);
INSERT INTO categorias (descripcion, estado) VALUES ('Panadería', true);
INSERT INTO categorias (descripcion, estado) VALUES ('Bebidas', true);
INSERT INTO categorias (descripcion, estado) VALUES ('Limpieza', true);
INSERT INTO categorias (descripcion, estado) VALUES ('Snacks', true);

-- PRODUCTOS
INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Leche Gloria 1L', 1, '7501000001', 4.50, 100, true);

INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Yogurt Fresa 200g', 1, '7501000002', 2.80, 60, true);

INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Pan de Molde', 2, '7501000003', 6.00, 40, true);

INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Agua San Luis 625ml', 3, '7501000004', 1.50, 200, true);

INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Inca Kola 500ml', 3, '7501000005', 3.00, 150, true);

INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Detergente Ariel 500g', 4, '7501000006', 8.90, 5, true);

INSERT INTO productos (nombre, id_categoria, codigo_barras, precio_venta, cantidad_stock, estado)
VALUES ('Papas Lays 40g', 5, '7501000007', 2.00, 3, true);

-- CLIENTES
INSERT INTO clientes (id, nombre, apellidos, celular, direccion, correo_electronico)
VALUES ('12345678', 'Carlos', 'Ramirez Torres', 987654321, 'Av. Lima 123', 'carlos@gmail.com');

INSERT INTO clientes (id, nombre, apellidos, celular, direccion, correo_electronico)
VALUES ('87654321', 'Maria', 'Lopez Sanchez', 998877665, 'Jr. Cusco 456', 'maria@gmail.com');

-- COMPRAS
INSERT INTO compras (id_cliente, fecha, medio_pago, comentario, estado)
VALUES ('12345678', NOW(), 'T', 'Compra de prueba 1', 'A');

INSERT INTO compras (id_cliente, fecha, medio_pago, comentario, estado)
VALUES ('87654321', NOW(), 'E', 'Compra de prueba 2', 'A');

-- COMPRAS_PRODUCTOS
INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado)
VALUES (1, 1, 3, 13.50, true);

INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado)
VALUES (1, 4, 5, 7.50, true);

INSERT INTO compras_productos (id_compra, id_producto, cantidad, total, estado)
VALUES (2, 5, 2, 6.00, true);