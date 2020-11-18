SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT emp_id PROMPT 'Please enter your employee number';
ACCEPT emp_deptid PROMPT 'Please enter the department number for which salary revision is being done';

DECLARE
    emp_authorization NUMBER(5);
    emp_id NUMBER(5):=&emp_id;
    emp_deptid NUMBER(6):=&emp_deptid;
    no_such_employee EXCEPTION;
-- INCLUDE EXECUTABLE SECTION OF OUTER BLOCK HERE
BEGIN

    
    SELECT  EMPLOYEE_ID INTO emp_authorization 
    FROM    EMPLOYEE_DETAILS ED, DEPARTMENTS D
    WHERE   ED.DEPARTMENT_ID = D.DEPARTMENT_ID 
    AND     D.DEPARTMENT_NAME = 'Human Resources';
    
    -- RAISE EXCEPTION HERE
    -- INCLUDE SIMPLE IF STATEMENT HERE
    -- Temporary condition to make it compile
    IF  1 = 1 THEN
     DECLARE
          emp_sal employee_details.salary%TYPE;
          emp_fname  employee_details.first_name%TYPE;
          emp_lname  employee_details.last_name%TYPE;
          i NUMBER:=1;

        -- DECLARE AN INDEX BY TABLE OF TYPE VARCHAR2(50). CALL 
        -- IT ename_table_type 
        
        -- DECLARE A VARIABLE ename_table OF TYPE ename_table_type

          c_hike1 constant real :=.20;
          c_hike2 constant real :=.15;
          c_hike3 constant real :=.08;
          c_hike4 constant real :=.03;

          c_range1 constant number :=6500;
          c_range2 constant number :=9500;
          c_range3 constant number :=12000;

        -- DECLARE A CURSOR CALLED emp_records TO HOLD salary, 
        -- first_name, and last_name of employees
        
        -- INCLUDE EXECUTABLE SECTION OF INNER BLOCK HERE
         BEGIN
             -- Temporary Output since BEGIN and END should have atleast 1 statement. 
             DBMS_OUTPUT.PUT_LINE ('INNER BLOCK SECTION');
        -- CLOSE THE INNER BLOCK
         END;
    ELSE
         DBMS_OUTPUT.PUT_LINE ('SORRY YOU ARE NOT AUTHORIZED TO USE THIS APPLICATION');
    END IF;

-- INCLUDE EXCEPTION SECTION FOR OUTER BLOCK
EXCEPTION
    WHEN OTHERS THEN
        null;
-- CLOSE THE OUTER BLOCK
END;
