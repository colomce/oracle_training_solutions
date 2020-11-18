-- Create EMP Table
DROP TABLE emp;
CREATE TABLE EMP AS SELECT * FROM HR.employees;
ALTER TABLE  EMP  ADD STARS	VARCHAR2(50);

-- Populate STARS Column
DEFINE v_empno = 176;
SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
    v_asterisk EMP.STARS%TYPE := null;
    v_sal EMP.SALARY%TYPE;
BEGIN
    SELECT SALARY 
    INTO  v_sal
    FROM EMP 
    WHERE EMPLOYEE_ID = &v_empno;

    FOR STARS in 1..ceil(v_sal / 1000) LOOP
        v_asterisk := v_asterisk || '*';
    END LOOP;

    UPDATE EMP 
    SET STARS = v_asterisk 
    WHERE EMPLOYEE_ID = &v_empno;
END;
 /
 
-- FOR VERIFICATION
SELECT EMPLOYEE_ID
        , SALARY
        , STARS
FROM EMP 
WHERE EMPLOYEE_ID = &v_empno;