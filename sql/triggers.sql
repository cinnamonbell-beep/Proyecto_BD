USE GroceryStore;

DELIMITER //
CREATE TRIGGER Log_insert_branches
AFTER INSERT ON branches
FOR EACH ROW
BEGIN
    INSERT INTO logs (entity, actions, role_name) VALUES ('branches', 'INSERT', USER());
END;




