SET SERVEROUTPUT ON;

-- VARIABLE v_basic_percent NUMBER;
-- VARIABLE v_pf_percent NUMBER;
accept v_empno PROMPT "Please enter your employee number."

DECLARE
    -- v_today DATE := SYSDATE;
    -- v_tomorrow v_today%TYPE;
     v_fname VARCHAR2(15);
     v_emp_sal NUMBER(10);
     v_contribution_pf HR.employees.SALARY%TYPE;
BEGIN
    /*
    :v_basic_percent := 45;
    :v_pf_percent := 12;
    v_tomorrow := v_today + 1;
    */

    SELECT first_name,  salary
    INTO   v_fname,     v_emp_sal 
    FROM  HR.employees
    WHERE employee_id = &v_empno;

    v_contribution_pf := .12 * (.45 * v_emp_sal);

    DBMS_OUTPUT.PUT_LINE('Hello ' || v_fname);
    DBMS_OUTPUT.PUT_LINE('YOUR SALARY IS: ' || v_emp_sal);
    DBMS_OUTPUT.PUT_LINE('YOUR CONTRIBUTION TOWARDS PF: ' || v_contribution_pf);
    -- DBMS_OUTPUT.PUT_LINE('TODAY IS: ' || TO_CHAR(v_today));
    -- DBMS_OUTPUT.PUT_LINE('TOMORROW IS: ' || TO_CHAR(v_tomorrow));
END;
/
-- PRINT v_basic_percent;
-- PRINT v_pf_percent;