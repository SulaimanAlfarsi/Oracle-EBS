-- Sulaiman Factorial Calculation
DECLARE
    SULAIMAN_NUM  NUMBER;
    SULAIMAN_FACT NUMBER := 1;
BEGIN
    SULAIMAN_NUM := TO_NUMBER('&NUM');

    IF SULAIMAN_NUM < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Factorial is not allowed for negative numbers');
    ELSE
        FOR SULAIMAN_I IN 1..SULAIMAN_NUM LOOP
            SULAIMAN_FACT := SULAIMAN_FACT * SULAIMAN_I;
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('Factorial = ' || SULAIMAN_FACT);
    END IF;

EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Please enter a number!');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Check Your Program!');
END;
/