USE GroceryStore; 

-- Branches 
DELIMITER //
CREATE PROCEDURE sp_GetBranches()
BEGIN
    SELECT * FROM branches;
END //

CREATE PROCEDURE sp_GetBranchById(IN branchId INT)
BEGIN
    SELECT * FROM branches WHERE branch_id = branchId;
END //

CREATE PROCEDURE sp_InsertBranch(IN branchName VARCHAR(100), IN branchAddress VARCHAR(255), IN branchPhone VARCHAR(20))
BEGIN
    INSERT INTO branches (name, address, phone) VALUES (branchName, branchAddress, branchPhone);
END //

CREATE PROCEDURE sp_UpdateBranch(IN branchId INT, IN branchName VARCHAR(100), IN branchAddress VARCHAR(255), IN branchPhone VARCHAR(20))
BEGIN   
    UPDATE branches SET name = branchName, address = branchAddress, phone = branchPhone WHERE branch_id = branchId;
END //

CREATE PROCEDURE sp_DeleteBranch(IN branchId INT)
BEGIN
    DELETE FROM branches WHERE branch_id = branchId;
END //

CREATE PROCEDURE sp_DeleteAllBranches()
BEGIN
    DELETE FROM branches;
END //
DELIMITER ;


-- Employees
DELIMITER //

CREATE PROCEDURE sp_GetEmployees()
BEGIN
    SELECT * FROM employees;
END //

CREATE PROCEDURE sp_GetEmployeeById(IN employeeId INT)
BEGIN
    SELECT * FROM employees WHERE id_employee = employeeId;
END //

CREATE PROCEDURE sp_InsertEmployee(IN firstName VARCHAR(100), IN lastName VARCHAR(50), IN employeePosition VARCHAR(50), IN employeePhone VARCHAR(20), IN branchId INT)
BEGIN
    INSERT INTO employees (first_name, last_name, position, phone, branch_id)
    VALUES (firstName, lastName, employeePosition, employeePhone, branchId);
END //

CREATE PROCEDURE sp_UpdateEmployee(IN employeeId INT, IN firstName VARCHAR(100), IN lastName VARCHAR(50), IN employeePosition VARCHAR(50), IN employeePhone VARCHAR(20), IN branchId INT)
BEGIN
    UPDATE employees
    SET first_name = firstName, last_name = lastName, position = employeePosition, phone = employeePhone, branch_id = branchId
    WHERE id_employee = employeeId;
END //

CREATE PROCEDURE sp_DeleteEmployee(IN employeeId INT)
BEGIN
    DELETE FROM employees WHERE id_employee = employeeId;
END //

CREATE PROCEDURE sp_DeleteAllEmployees()
BEGIN
    DELETE FROM employees;
END //

DELIMITER ;