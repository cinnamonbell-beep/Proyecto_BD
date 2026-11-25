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

CREATE TABLE logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    entity VARCHAR(100) NOT NULL,
    dates DATETIME DEFAULT CURRENT_TIMESTAMP,
    actions VARCHAR(100),
    role_name VARCHAR(50)
);


INSERT INTO branches (name, address, phone)
VALUES 
('Centro branch', 'Av. Revolución 1317, Zona Centro, 22000 Tijuana, B.C.', '6641234567'),
('Playas branch', 'P.º Ensenada 1162, Playas de Tijuana, Sección Jardines, 22500 Tijuana, B.C.', '6645051122'),
('Otay branch', 'Calz del Tecnológico 15300-101, Altabrisa, 22420 Tijuana, B.C.', '6643402233');

INSERT INTO employees (first_name, last_name, position, phone, branch_id) VALUES
('María', 'López', 'Senior Cashier', '6643330001', 1),
('Pedro', 'Ruiz', 'Cashier', '6643330002', 1),
('Andrea', 'Cortés', 'Senior Cashier', '6643330003', 2),
('Luis', 'Herrera', 'Cashier',  '6643330004', 2),
('Camila', 'Vega', 'Senior Cashier', '6643330005', 3),
('Daniel', 'Rojas',  'Cashier',  '6643330006', 3);

INSERT INTO cash_registers (register_number, branch_id) VALUES
(1, 1), (2, 1),
(1, 2), (2, 2),
(1, 3), (2, 3);

INSERT INTO categories (name) VALUES
('Beverages'), ('Snacks'), ('Dairy'), ('Bakery'), ('Cleaning'), ('Groceries'), ('Personal Care');

INSERT INTO brands (name) VALUES
('Coca-Cola'), ('Sabritas'), ('Lala'), ('Bimbo'), ('Ariel'),
('Gamesa'), ('Nestlé'), ('Colgate'), ('Zote'), ('Pantene');

INSERT INTO suppliers (name, phone, email) VALUES
('Coca-Cola Distributor', '6641111111', 'sales@cocacola.com'),
('Sabritas Distributor', '6641112222', 'sales@sabritas.com'),
('Lala Distributor', '6641113333', 'sales@lala.com'),
('Bimbo Distributor', '6641114444', 'sales@bimbo.com'),
('Ariel Distributor', '6641115555', 'sales@ariel.com'),
('Gamesa Distributor', '6641116666', 'sales@gamesa.com'),
('Nestlé Distributor', '6641117777', 'sales@nestle.com'),
('Colgate Distributor', '6641118888', 'sales@colgate.com'),
('Zote Distributor', '6641119999', 'sales@zote.com'),
('Pantene Distributor', '6641110010', 'sales@pantene.com');

INSERT INTO products (name, price, stock, category_id, brand_id, supplier_id) VALUES
('Soda 600 ml', 18.00, 120, 1,  1,  1),
('Bottled water 1 L', 12.00, 200, 1,  1,  1),
('Potato chips 45 g', 16.00,  80, 2,  2,  2),
('Corn snack 60 g', 14.00,  90, 2,  2,  2),
('Whole milk 1 L', 26.00,  60, 3,  3,  3),
('Yogurt 1 L', 38.00,  40, 3,  3,  3),
('Large white bread', 42.00,  40, 4,  4,  4),
('Sweet roll pack', 35.00,  35, 4,  4,  4),
('Laundry detergent 1 kg', 55.00,  30, 5,  5,  5),
('Bar soap', 15.00,  70, 5,  9,  9),
('Maria cookies', 20.00,  90, 6,  6,  6),
('Instant coffee 100 g', 68.00,  25, 6,  7,  7),
('Cookies family pack', 48.00,  50, 6,  6,  6),
('Toothpaste 75 ml', 32.00,  45, 7,  8,  8),
('Pantene shampoo', 70.00,  60, 7, 10, 10);

INSERT INTO customers (first_name, last_name, phone, email) VALUES
('Laura', 'Gómez', '6644441111', 'laura.gomez@gmail.com'),
('Carlos', 'Pérez', '6644442222', 'carlos.perez@gmail.com'),
('Marta', 'Sánchez', '6644443333', 'marta.sanchez@gmail.com'),
('Jorge', 'Ramírez', '6644444444', 'jorge.ramirez@gmail.com'),
('Sofía', 'Medina',  '6644445555', 'sofia.medina@gmail.com'),
('Diego', 'Torres', '6644446666', 'diego.torres@gmail.com'),
('Valeria', 'Núñez', '6644447777', 'valeria.nunez@gmail.com'),
('Ricardo', 'Flores', '6644448888', 'ricardo.flores@gmail.com');

INSERT INTO sales (customer_id, employee_id, register_id, product_id, quantity, total, sale_date) VALUES
(1, 1, 1,  1, 3,  54.00, '2026-09-03 10:15:00'),
(2, 1, 1,  3, 2,  32.00, '2026-09-05 11:30:00'),
(3, 2, 2,  5, 4, 104.00, '2026-09-08 09:45:00'),
(4, 3, 3,  7, 1,  42.00, '2026-09-12 17:20:00'),
(5, 3, 3,  9, 2, 110.00, '2026-09-15 13:05:00'),
(6, 4, 4, 13, 1,  48.00, '2026-09-19 08:50:00'),
(1, 5, 5,  2, 6,  72.00, '2026-09-22 19:10:00'),
(7, 6, 6, 11, 5, 100.00, '2026-09-27 12:40:00'),
(2, 2, 2,  6, 2,  76.00, '2026-10-02 10:05:00'),
(8, 1, 1, 12, 1,  68.00, '2026-10-06 16:25:00'),
(3, 3, 3,  4, 4,  56.00, '2026-10-10 14:00:00'),
(4, 4, 4, 10, 3,  45.00, '2026-10-14 11:15:00'),
(5, 5, 5, 15, 2,  56.00, '2026-10-18 09:30:00'),
(6, 6, 6, 14, 1,  32.00, '2026-10-21 18:45:00'),
(1, 1, 1,  1, 4,  72.00, '2026-10-25 13:20:00'),
(7, 2, 2,  8, 2,  70.00, '2026-10-29 10:50:00'),
(2, 3, 3, 13, 2,  96.00, '2026-11-03 12:10:00'),
(8, 4, 4,  5, 3,  78.00, '2026-11-07 15:35:00'),
(3, 5, 5,  9, 1,  55.00, '2026-11-11 09:00:00'),
(5, 6, 6,  3, 5,  80.00, '2026-11-15 17:55:00');


