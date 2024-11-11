-- (i) A Procedure called PROC_LAB5
DELIMITER //

CREATE PROCEDURE PROC_LAB5()
BEGIN
    SELECT 
        employeeNumber,
        employees_salary_amount,
        CASE
            WHEN employees_salary_amount < 20000 THEN 'Lower Class'
            WHEN employees_salary_amount BETWEEN 20000 AND 50000 THEN 'Middle Class'
            ELSE 'Upper Class'
        END AS social_class
    FROM employees_salary;
END //

DELIMITER ;
DELIMITER //


-- (ii) A Function called FUNC_LAB5
DELIMITER //

CREATE FUNCTION FUNC_LAB5(employeeSalary DECIMAL(10, 2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE social_class VARCHAR(20);

    IF employeeSalary < 20000 THEN
        SET social_class = 'Lower Class';
    ELSEIF employeeSalary BETWEEN 20000 AND 50000 THEN
        SET social_class = 'Middle Class';
    ELSE
        SET social_class = 'Upper Class';
    END IF;

    RETURN social_class;
END //

DELIMITER ;


-- (iii) A View called VIEW_LAB5
CREATE VIEW VIEW_LAB5 AS
SELECT 
    employeeNumber, 
    employees_salary_amount,
    CASE
        WHEN employees_salary_amount < 20000 THEN 'Lower Class'
        WHEN employees_salary_amount BETWEEN 20000 AND 50000 THEN 'Middle Class'
        ELSE 'Upper Class'
    END AS social_class
FROM employees_salary;
