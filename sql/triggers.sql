USE GroceryStore;

--Branches
DELIMITER //
CREATE TRIGGER Log_insert_branches
AFTER INSERT ON branches
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name) VALUES ('branches', 'INSERT', USER());
END;

CREATE TRIGGER Log_update_branches
AFTER UPDATE ON branches
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name)
    VALUES ('branches', 'UPDATE', USER());
END//

CREATE TRIGGER Log_delete_branches
AFTER DELETE ON branches
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name)
    VALUES ('branches', 'DELETE', USER());
END//

-- employees
CREATE TRIGGER Log_insert_employees
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name) VALUES ('employees', 'INSERT', USER());
END;

CREATE TRIGGER Log_update_employees
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name)
    VALUES ('employees', 'UPDATE', USER());
END//

CREATE TRIGGER Log_delete_employees
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name)
    VALUES ('employees', 'DELETE', USER());
END//

-- products
CREATE TRIGGER Log_insert_products
AFTER INSERT ON products
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name) VALUES ('products', 'INSERT', USER());
END;

CREATE TRIGGER Log_update_products
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name)
    VALUES ('products', 'UPDATE', USER());
END//

CREATE TRIGGER Log_delete_products
AFTER DELETE ON products
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name)
    VALUES ('products', 'DELETE', USER());
END//

-- Customers
CREATE TRIGGER Log_insert_customers
AFTER INSERT ON customers
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name) VALUES ('customers', 'INSERT', USER());
END;    

CREATE TRIGGER Log_update_customers
AFTER UPDATE ON customers
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name)
    VALUES ('customers', 'UPDATE', USER());
END//

CREATE TRIGGER Log_delete_customers
AFTER DELETE ON customers   
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name)
    VALUES ('customers', 'DELETE', USER());
END//

-- sales
CREATE TRIGGER Log_insert_sales
AFTER INSERT ON sales
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name) VALUES ('sales', 'INSERT', USER());
END;

CREATE TRIGGER Log_update_sales
AFTER UPDATE ON sales
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name)
    VALUES ('sales', 'UPDATE', USER());
END//

CREATE TRIGGER Log_delete_sales
AFTER DELETE ON sales   
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name)
    VALUES ('sales', 'DELETE', USER());
END//


