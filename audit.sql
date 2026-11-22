USE GroceryStore;

-- Elegir un rol: administrator, user, analyst
SET @role_name = 'analyst';


CREATE TRIGGER Log_insert_Products
    AFTER INSERT ON products
    FOR EACH ROW
    INSERT INTO logs (entity, dates, actions, role_name)
    VALUES ('products', NOW(), 'INSERT', @role_name);



