-- Create Departments Table
DROP TABLE DEPARTMENTS;
CREATE TABLE DEPARTMENTS AS SELECT * FROM HR.DEPARTMENTS;

-- Practice 4 Number 2
SET SERVEROUTPUT ON;
DECLARE
    v_dept_name DEPARTMENTS.DEPARTMENT_NAME%TYPE := 'Education';
    v_dept_id NUMBER;
    v_max_deptno NUMBER;
BEGIN
    SELECT  MAX(DEPARTMENT_ID) 
    INTO    v_max_deptno 
    FROM    DEPARTMENTS;
    
    DBMS_OUTPUT.PUT_LINE('The maximum department_id is: ' || TO_CHAR(v_max_deptno));
    v_dept_id := v_max_deptno + 10;

    INSERT INTO DEPARTMENTS (
          DEPARTMENT_ID
        , DEPARTMENT_NAME
        , MANAGER_ID
        , LOCATION_ID
        ) 
    VALUES (
          v_dept_id
        , v_dept_name 
        , null 
        , null );
    
    DBMS_OUTPUT.PUT_LINE('SQL%ROWCOUNT gives ' || SQL%ROWCOUNT);

END;
/

-- Select Statement to get the Last Department Inserted
SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = (SELECT MAX(DEPARTMENT_ID) FROM DEPARTMENTS);