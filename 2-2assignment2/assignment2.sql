--1. the script's file name : assignment2.sql 
--2. your name : Jiwoon Yoo 
--3. your Oracle user name : s10_yoojiw
--4. the question/problem that you are solving
--Q1) Write a PL/SQL code to display employee details along with region and country name of 5 lowest paid employees.[5 Marks] [Use HR Schema]
SET SERVEROUTPUT ON
DECLARE 
    TYPE record_employee_salary IS RECORD 
    (
        r_first_name hr.employees.first_name%TYPE,   
        r_last_name hr.employees.last_name%TYPE, 
        r_salary hr.employees.salary%TYPE, 
        r_region_name hr.regions.region_name%TYPE, 
        r_country_name hr.countries.country_name%TYPE 
    ); 

    TYPE table_employee_salary IS TABLE OF record_employee_salary; 

    v_employee_salary table_employee_salary; 

    CURSOR cur_employee_salary IS 
        SELECT e.first_name, e.last_name, e.salary, r.region_name, c.country_name  
        FROM hr.employees e 
        INNER JOIN hr.departments d ON e.department_id = d.department_id 
        INNER JOIN hr.locations l ON d.location_id = l.location_id 
        INNER JOIN hr.countries c ON l.country_id = c.country_id 
        INNER JOIN hr.regions r ON c.region_id = r.region_id 
        ORDER BY salary;  
BEGIN 
    OPEN cur_employee_salary; 
    FETCH cur_employee_salary BULK COLLECT INTO v_employee_salary; 
    CLOSE cur_employee_salary; 
    
    FOR i IN 1..5
    LOOP 
        DBMS_OUTPUT.PUT_LINE(v_employee_salary(i).r_first_name || ' ' || v_employee_salary(i).r_last_name || ' ' || v_employee_salary(i).r_salary || ' ' || v_employee_salary(i).r_region_name || ' ' || v_employee_salary(i).r_country_name ); 
    END LOOP; 
END; 





--1. the script's file name : assignment2.sql
--2. your name : Jiwoon Yoo
--3. your Oracle user name : s10_yoojiw
--4. the question/problem that you are solving
--Q2) Write a PL/SQL block of code to generate Fibonacci series between 1 to 100 [5 Marks]
SET SERVEROUTPUT ON 
DECLARE 
    v_num1 NUMBER := 1; 
    v_num2 NUMBER := 1;
BEGIN 
    LOOP 
        IF v_num1 <= 100  THEN
              DBMS_OUTPUT.PUT_LINE(v_num1 || ' ' );       
        END IF;  
      
        IF v_num2 <= 100  THEN
              DBMS_OUTPUT.PUT_LINE(v_num2 || ' ' );       
        END IF; 
        
        v_num1 := v_num1 + v_num2;
        v_num2 := v_num2 + v_num1; 
        
        EXIT WHEN v_num1 > 100 AND v_num2 > 100; 
    
    END LOOP; 
END; 




--1. the script's file name : assignment2.sql
--2. your name : Jiwoon Yoo
--3. your Oracle user name : s10_yoojiw
--4. the question/problem that you are solving
--Q3) Create PL/SQL block of code to display all records of employee table using explicit cursors. [Use HR Schema]
DECLARE 
    TYPE record_employee IS RECORD 
    (
        r_employee_id hr.employees.employee_id%TYPE, 
        r_first_name hr.employees.first_name%TYPE,   
        r_last_name hr.employees.last_name%TYPE,
        r_email hr.employees.email%TYPE,
        r_phone_number hr.employees.phone_number%TYPE,
        r_hire_date hr.employees.hire_date%TYPE,
        r_job_id hr.employees.job_id%TYPE,
        r_salary hr.employees.salary%TYPE,
        r_commission_pct hr.employees.commission_pct%TYPE,
        r_manager_id hr.employees.manager_id%TYPE,
        r_department_id hr.employees.department_id%TYPE
    ); 

    TYPE table_employee IS TABLE OF record_employee; 

    v_employee table_employee; 

    CURSOR cur_employee IS 
        SELECT * 
        FROM hr.employees; 
        
BEGIN 
    OPEN cur_employee; 
    FETCH cur_employee BULK COLLECT INTO v_employee; 
    CLOSE cur_employee; 
    
    FOR i IN 1..v_employee.LAST 
    LOOP 
        DBMS_OUTPUT.PUT_LINE(v_employee(i).r_employee_id ||' '||  v_employee(i).r_first_name || ' ' || v_employee(i).r_last_name || ' ' || v_employee(i).r_email || ' ' || v_employee(i).r_phone_number || ' ' || v_employee(i).r_hire_date || ' ' || v_employee(i).r_job_id || ' ' || v_employee(i).r_salary || ' ' || v_employee(i).r_commission_pct || ' ' || v_employee(i).r_manager_id || ' ' || v_employee(i).r_department_id); 
    END LOOP; 
END; 