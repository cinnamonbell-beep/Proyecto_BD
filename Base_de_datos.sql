CREATE DATABASE GroceryStore;
Use GroceryStore;


CREATE TABLE branches (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

CREATE TABLE employees (
    id_employee INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    branch_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE cash_registers (
    register_id INT PRIMARY KEY AUTO_INCREMENT,
    register_number INT NOT NULL,
    branch_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE brands (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category_id INT NOT NULL,
    brand_id INT NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    register_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(id_employee),
    FOREIGN KEY (register_id) REFERENCES cash_registers(register_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


CREATE TABLE IF NOT EXISTS roles (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO roles (name)
VALUES ('administracion'), ('usuario'), ('analista');

INSERT INTO branches (name, address, phone)
VALUES 
('Sucursal Centro', 'Av. Revolución 1317, Zona Centro, 22000 Tijuana, B.C.', '664-123-45-67'),
('Sucursal Playas', 'P.º Ensenada 1162, Playas de Tijuana, Sección Jardines, 22500 Tijuana, B.C.', '664-505-11-22'),
('Sucursal Otay', 'Calz del Tecnológico 15300-101, Altabrisa, 22420 Tijuana, B.C.', '664-340-22-33');