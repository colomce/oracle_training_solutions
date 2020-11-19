SET SERVEROUTPUT ON;

-- VARIABLE v_basic_percent NUMBER;
-- VARIABLE v_pf_percent NUMBER;

DECLARE
    -- v_today DATE := SYSDATE;
    -- v_tomorrow v_today%TYPE;
     v_fname VARCHAR2(15);
     v_emp_sal NUMBER(10);
     v_contribution_pf HR.employees.SALARY%TYPE;
     c_provident_fund_percent constant real :=.12;
     c_basic_salary_percent constant real :=.45;
BEGIN
    /*
    :v_basic_percent := 45;
    :v_pf_percent := 12;
    v_tomorrow := v_today + 1;
    */
    SELECT first_name,  salary
    INTO   v_fname,     v_emp_sal 
    FROM  HR.employees
    WHERE employee_id = 110;

    v_contribution_pf := c_provident_fund_percent * (c_basic_salary_percent * v_emp_sal);

    DBMS_OUTPUT.PUT_LINE('Hello ' || v_fname);
    DBMS_OUTPUT.PUT_LINE('YOUR SALARY IS: ' || v_emp_sal);
    DBMS_OUTPUT.PUT_LINE('YOUR CONTRIBUTION TOWARDS PF: ' || v_contribution_pf);
    -- DBMS_OUTPUT.PUT_LINE('TODAY IS: ' || TO_CHAR(v_today));
    -- DBMS_OUTPUT.PUT_LINE('TOMORROW IS: ' || TO_CHAR(v_tomorrow));
END;
/
-- PRINT v_basic_percent;
-- PRINT v_pf_percent;