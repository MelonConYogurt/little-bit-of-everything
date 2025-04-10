CREATE DATABASE TiendaElectronicaDB;
USE TiendaElectronicaDB;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100),
    direccion TEXT
);

CREATE TABLE Proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100),
    direccion TEXT
);

CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE Productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_categoria INT,
    precio DECIMAL(10,2),
    stock INT,
    id_proveedor INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATETIME,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE DetallesVentas (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_venta) REFERENCES Ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

CREATE TABLE Inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    fecha_actualizacion DATETIME,
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);