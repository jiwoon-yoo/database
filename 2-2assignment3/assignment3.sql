--2. Write a PL/SQL script that prompts the user to enter a car serial number and displays:[USE SI.Car table 5 Marks]
SET SERVEROUTPUT ON; 
ACCEPT p_snum PROMPT 'Enter card seiral number : '
DECLARE 
    v_car_all si.car%ROWTYPE; 
    v_snum car.carserial%TYPE; 
    ownernotexist exception;
BEGIN
    v_snum := '&p_snum'; 
    SELECT * 
        INTO v_car_all
    FROM si.car WHERE carserial = v_snum;

    if v_car_all.custname is null then
        raise ownernotexist;
    end if;
    
    DBMS_OUTPUT.PUT_LINE('owner name : ' || v_car_all.custname);
    DBMS_OUTPUT.PUT_LINE('serial number: ' || v_car_all.carserial); 
EXCEPTION 
    WHEN NO_DATA_FOUND 
      THEN
         DBMS_OUTPUT.PUT_LINE ('There is no such car' ); 
    WHEN ownernotexist
       THEN
         DBMS_OUTPUT.PUT_LINE('there is no car owner'); 
END;

SELECT * FROM si.car
