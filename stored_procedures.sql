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