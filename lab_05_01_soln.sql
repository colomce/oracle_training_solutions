-- Create MESSAGES table. 
DROP TABLE MESSAGES;
CREATE TABLE MESSAGES (results VARCHAR2(80));

-- Insert 1,2,3,4,5,7,9,10
BEGIN
    for ind in 1..10 loop
        if (ind != 6 and ind != 8) then
            INSERT INTO MESSAGES VALUES ( ind );
        end if;
    end loop;
END;
/

-- Output MESSAGES Table
SELECT * FROM MESSAGES;