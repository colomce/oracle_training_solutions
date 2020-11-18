SET SERVEROUTPUT ON;
DECLARE 
        CURSOR dept_cursor IS
        SELECT      DEPARTMENT_ID
                  , DEPARTMENT_NAME
        FROM	    DEPARTMENTS
        WHERE       DEPARTMENT_ID < 100
        ORDER BY    DEPARTMENT_ID;

        CURSOR emp_cursor(p_deptno NUMBER) IS
        SELECT    LAST_NAME
                , JOB_ID 
                , HIRE_DATE 
                , SALARY
        FROM	EMPLOYEES
        WHERE	DEPARTMENT_ID = p_deptno
        AND EMPLOYEE_ID < 120;

        v_department_id DEPARTMENTS.DEPARTMENT_ID%TYPE;
        v_department_name DEPARTMENTS.DEPARTMENT_NAME%TYPE;
        v_last_name EMPLOYEES.LAST_NAME%TYPE;
        v_job_id EMPLOYEES.JOB_ID%TYPE;
        v_hire_date EMPLOYEES.HIRE_DATE%TYPE;
        v_salary EMPLOYEES.SALARY%TYPE;
BEGIN
    OPEN dept_cursor;
    LOOP
        FETCH dept_cursor INTO v_department_id, v_department_name;
        EXIT WHEN dept_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('DEPARTMENT' 
        || ' ID: ' 
        || v_department_id 
        || ' NAME: ' 
        || v_department_name);

        OPEN emp_cursor(v_department_id);
        LOOP
            FETCH emp_cursor INTO v_last_name, v_job_id, v_hire_date, v_salary;
            EXIT WHEN emp_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(
                'EMPLOYEE' 
                || ' LASTNAME: ' 
                || v_last_name 
                || ' JOB_ID: ' 
                || v_hire_date 
                || ' SALARY: ' 
                || v_salary);
        END LOOP;
        CLOSE emp_cursor;

        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
        
    END LOOP;
    CLOSE dept_cursor;
END;