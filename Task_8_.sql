
-- Create Sample Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Insert Sample Data
INSERT INTO employees VALUES
(1, 'Priya', 'IT', 55000),
(2, 'Aashu', 'HR', 40000),
(3, 'Ravi', 'IT', 65000),
(4, 'Neha', 'Finance', 70000);

-- Stored Procedure to Get Employees by Department
DELIMITER //

CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
    SELECT emp_id, name, salary
    FROM employees
    WHERE department = dept_name;
END //

DELIMITER ;

-- Usage Example:
-- CALL GetEmployeesByDept('IT');

-- Stored Function to Calculate Bonus
DELIMITER //

CREATE FUNCTION CalculateBonus(salary INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE bonus INT;
    IF salary >= 60000 THEN
        SET bonus = salary * 0.10; -- 10% bonus
    ELSE
        SET bonus = salary * 0.05; -- 5% bonus
    END IF;
    RETURN bonus;
END //

