Use GroceryStore;

CREATE ROLE 'administracion';
CREATE ROLE 'usuario';
CREATE ROLE 'analista';


CREATE TRIGGER Log_insert_Products
    AFTER INSERT ON products
    FOR EACH ROW
    INSERT INTO logs (entity, dates, actions, role_name)
    VALUES ('products', NOW(), 'INSERT', @role_name);

