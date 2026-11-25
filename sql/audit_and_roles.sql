Use GroceryStore;
-- Roles
CREATE ROLE 'administracion';
CREATE ROLE 'usuario';
CREATE ROLE 'analista';

-- Permisos 
GRANT ALL ON GroceryStore.* TO 'administracion';
GRANT ALL ON GroceryStore.* TO 'usuario';
GRANT ALL ON GroceryStore.* TO 'analista';

-- Usuarios
CREATE USER 'karla_rodriguez'@'localhost' IDENTIFIED BY 'karla123';
CREATE USER 'isabella_ruelas'@'localhost' IDENTIFIED BY 'isa123';

-- Asignación de roles a usuarios
GRANT 'administracion' TO 'karla_rodriguez'@'localhost';
GRANT 'usuario' TO 'isabella_ruelas'@'localhost';


