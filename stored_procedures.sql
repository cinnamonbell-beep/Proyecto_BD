USE GroceryStore; 

-- Branches 
DELIMITER //
CREATE PROCEDURE sp_GetBranches()
BEGIN
    SELECT * FROM branches;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_GetBranchById(IN branchId INT)
BEGIN
    SELECT * FROM branches WHERE branch_id = branchId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_InsertBranch(IN branchName VARCHAR(100), IN branchAddress VARCHAR(255), IN branchPhone VARCHAR(20))
BEGIN
    INSERT INTO branches (name, address, phone) VALUES (branchName, branchAddress, branchPhone);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_UpdateBranch(IN branchId INT, IN branchName VARCHAR(100), IN branchAddress VARCHAR(255), IN branchPhone VARCHAR(20))
BEGIN   
    UPDATE branches SET name = branchName, address = branchAddress, phone = branchPhone WHERE branch_id = branchId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_DeleteBranch(IN branchId INT)
BEGIN
    DELETE FROM branches WHERE branch_id = branchId;
END //
DELIMITER ;


DELIMITER //
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
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_GetEmployeeById(IN employeeId INT)
BEGIN
    SELECT * FROM employees WHERE id_employee = employeeId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_InsertEmployee(IN firstName VARCHAR(100), IN lastName VARCHAR(50), IN employeePosition VARCHAR(50), IN employeePhone VARCHAR(20), IN branchId INT)
BEGIN
    INSERT INTO employees (first_name, last_name, position, phone, branch_id)
    VALUES (firstName, lastName, employeePosition, employeePhone, branchId);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_UpdateEmployee(IN employeeId INT, IN firstName VARCHAR(100), IN lastName VARCHAR(50), IN employeePosition VARCHAR(50), IN employeePhone VARCHAR(20), IN branchId INT)
BEGIN
    UPDATE employees
    SET first_name = firstName, last_name = lastName, position = employeePosition, phone = employeePhone, branch_id = branchId
    WHERE id_employee = employeeId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_DeleteEmployee(IN employeeId INT)
BEGIN
    DELETE FROM employees WHERE id_employee = employeeId;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_DeleteAllEmployees()
BEGIN
    DELETE FROM employees;
END //
DELIMITER ;


-- cash_registers
DELIMITER //
CREATE PROCEDURE sp_GetCashRegisters()
BEGIN
    SELECT * FROM cash_registers;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_GetCashRegisterById(IN registerId INT)
BEGIN
    SELECT * FROM cash_registers WHERE register_id = registerId;
END //
DELIMITER ;

DELIMITER//
CREATE PROCEDURE sp_InsertCashRegister(IN registerNumber INT, IN branchId INT)
BEGIN
    INSERT INTO cash_registers (register_number, branch_id) VALUES (registerNumber, branchId);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_UpdateCashRegister(IN registerId INT, IN registerNumber INT, IN branchId INT)
BEGIN
    UPDATE cash_registers SET register_number = registerNumber, branch_id = branchId WHERE register_id = registerId;
END //  
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_DeleteCashRegister(IN registerId INT)
BEGIN
    DELETE FROM cash_registers WHERE register_id = registerId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_DeleteAllCashRegisters()
BEGIN
    DELETE FROM cash_registers;
END //
DELIMITER ;



-- categories
DELIMITER //
CREATE PROCEDURE sp_GetCategories()
BEGIN
    SELECT * FROM categories;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE sp_GetCategoryById(IN categoryId INT)
BEGIN
    SELECT * FROM categories WHERE category_id = categoryId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_InsertCategory(IN categoryName VARCHAR(100))
BEGIN
    INSERT INTO categories (name) VALUES (categoryName);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_UpdateCategory(IN categoryId INT, IN categoryName VARCHAR(100))
BEGIN
    UPDATE categories SET name = categoryName WHERE category_id = categoryId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_DeleteCategory(IN categoryId INT)
BEGIN
    DELETE FROM categories WHERE category_id = categoryId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_DeleteAllCategories()
BEGIN 
    DELETE FROM categories;
END //
DELIMITER ;


-- brands
DELIMITER //
CREATE PROCEDURE sp_GetBrands()
BEGIN
    SELECT * FROM brands;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_GetBrandById(IN brandId INT)
BEGIN
    SELECT * FROM brands WHERE brand_id = brandId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_InsertBrand(IN brandName VARCHAR(100))
BEGIN
    INSERT INTO brands (name) VALUES (brandName);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_UpdateBrand(IN brandId INT, IN brandName VARCHAR(100))
BEGIN
    UPDATE brands SET name = brandName WHERE brand_id = brandId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_DeleteBrand(IN brandId INT)
BEGIN
    DELETE FROM brands WHERE brand_id = brandId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_DeleteAllBrands()   
BEGIN
    DELETE FROM brands;
END //
DELIMITER ;


-- suppliers
DELIMITER //
CREATE PROCEDURE sp_GetSuppliers()
BEGIN
    SELECT * FROM suppliers;
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE sp_GetSupplierById(IN supplierId INT)
BEGIN
    SELECT * FROM suppliers WHERE supplier_id = supplierId;
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE sp_InsertSupplier(IN supplierName VARCHAR(50), IN supplierPhone VARCHAR(20), IN supplierEmail VARCHAR(50))
BEGIN   
    INSERT INTO suppliers (name, phone, email) VALUES (supplierName, supplierPhone, supplierEmail);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_UpdateSupplier(IN supplierId INT, IN supplierName VARCHAR(50), IN supplierPhone VARCHAR(20), IN supplierEmail VARCHAR(50))
BEGIN   
    UPDATE suppliers SET name = supplierName, phone = supplierPhone, email = supplierEmail WHERE supplier_id = supplierId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_DeleteSupplier(IN supplierId INT)
BEGIN
    DELETE FROM suppliers WHERE supplier_id = supplierId;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_DeleteAllSuppliers()    
BEGIN
    DELETE FROM suppliers;
END //
DELIMITER ;


