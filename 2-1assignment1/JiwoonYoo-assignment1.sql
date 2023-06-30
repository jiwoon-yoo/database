USE HR
GO

--1.Find the salary of the employees whose first name is Amit or Nancy. (use employees table)  
SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Amit' OR FIRST_NAME = 'Nancy'	

--2.What are the country names in Country table that start with ¡®za¡¯(use Countries table)
SELECT COUNTRY_NAME FROM COUNTRIES WHERE COUNTRY_NAME LIKE 'za%'

--3.Display details whose first-name contain ¡®a¡¯ as a third character and fifth character. The number of letters in the firstname must be 5 letters.  (use Employees table)
SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '__a_a'

--4.Find all the details of the locations where state information is not provided in locations table?
SELECT * FROM LOCATIONS WHERE STATE_PROVINCE IS NULL 

--5. Display employee first name, salary, email and hiredate details from employee table. Also sort the data as per the ascending order of hire date and  in descending order of first name. (use employee table)
SELECT FIRST_NAME, SALARY, EMAIL, HIRE_DATE FROM EMPLOYEES ORDER BY HIRE_DATE, FIRST_NAME DESC

--6. Find all such job titles whose maximum salary is not between 2000 and 5000. (use jobs table)
SELECT JOB_TITLE FROM JOBS WHERE MAX_SALARY NOT BETWEEN 2000 AND 5000