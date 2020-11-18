-- Create Departments Table
-- DROP TABLE DEPARTMENTS;
-- CREATE TABLE DEPARTMENTS AS SELECT * FROM HR.DEPARTMENTS;

-- Create Employees Table 
-- DROP TABLE EMPLOYEES;
-- CREATE TABLE EMPLOYEES AS SELECT * FROM HR.EMPLOYEES;

-- Output Employee Raise
SET SERVEROUTPUT ON;
SET VERIFY OFF;
DEFINE p_deptno = 10;
DECLARE 
    v_deptno NUMBER := &p_deptno;
    CURSOR emp_cursor IS 
        SELECT E.LAST_NAME
            , E.SALARY
            , D.MANAGER_ID 
        FROM EMPLOYEES E, DEPARTMENTS D
        WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
        AND D.DEPARTMENT_ID = v_deptno;
BEGIN
    FOR employee IN emp_cursor
    LOOP
        IF employee.SALARY < 5000 
            OR employee.MANAGER_ID IN (101, 124) 
        THEN
            DBMS_OUTPUT.PUT_LINE(employee.LAST_NAME || ' Due for a raise');
        ELSE 
            DBMS_OUTPUT.PUT_LINE(employee.LAST_NAME || ' Not Due for a raise');
        END IF;
    END LOOP;
END;
/