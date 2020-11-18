-- Create Table for TOP_SALARIES
DROP TABLE TOP_SALARIES;
CREATE TABLE TOP_SALARIES (SALARY NUMBER(8,2));

-- Create Employees Table (For Domain)
-- DROP TABLE EMPLOYEES;
-- CREATE TABLE EMPLOYEES AS SELECT * FROM HR.EMPLOYEES;

-- Inser top n salaries to TOP_SALARIES
DEFINE p_num = 0;
ACCEPT p_num PROMPT 'Please enter top: ';

SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
    sal EMPLOYEES.SALARY%TYPE;
    num NUMBER := &p_num;
    CURSOR emp_cursor IS 
        SELECT DISTINCT SALARY 
        FROM EMPLOYEES 
        WHERE SALARY IS NOT NULL
        ORDER BY SALARY DESC;
BEGIN
    DELETE FROM TOP_SALARIES;
    COMMIT;
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO sal;
        EXIT WHEN (emp_cursor%ROWCOUNT > num) or (emp_cursor%NOTFOUND);
        INSERT INTO TOP_SALARIES(SALARY) VALUES (sal);
        COMMIT;
    END LOOP;
    CLOSE emp_cursor;
END;
/

-- View Top Salary
SELECT * FROM TOP_SALARIES;
