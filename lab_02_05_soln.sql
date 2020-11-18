SET SERVEROUTPUT ON;

VARIABLE v_basic_percent NUMBER;
VARIABLE v_pf_percent NUMBER;

DECLARE
    v_today DATE := SYSDATE;
    v_tomorrow v_today%TYPE;
BEGIN
    :v_basic_percent := 45;
    :v_pf_percent := 12;
    v_tomorrow := v_today + 1;
    DBMS_OUTPUT.PUT_LINE('Hello World');
    DBMS_OUTPUT.PUT_LINE('TODAY IS: ' || TO_CHAR(v_today));
    DBMS_OUTPUT.PUT_LINE('TOMORROW IS: ' || TO_CHAR(v_tomorrow));
END;
/
PRINT v_basic_percent;
PRINT v_pf_percent;