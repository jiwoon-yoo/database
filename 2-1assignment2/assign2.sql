USE ADVENTUREWORKS2019
GO

--1.How many employees¡¯ marital status is Single?  (MaritalStatus 'S' means single)
SELECT COUNT(*) FROM HUMANRESOURCES.EMPLOYEE WHERE MARITALSTATUS = 'S'


--2.Find the number of employees working in Night Shift.
SELECT COUNT(*) FROM HUMANRESOURCES.SHIFT WHERE NAME = 'Night'


--3.Find the firstname and lastname of the employees who are hourly working employees. (Use SalariedFlag column of HumanResources.Employee table, 0 means Hourly working, 1 means salaried)
SELECT FIRSTNAME, LASTNAME FROM PERSON.PERSON WHERE BUSINESSENTITYID IN(SELECT BUSINESSENTITYID FROM HUMANRESOURCES.EMPLOYEE WHERE SALARIEDFLAG = '0')


--4.How many employees are working in ¡®Engineering¡¯ Department?
SELECT COUNT(*) FROM HUMANRESOURCES.DEPARTMENT WHERE NAME = 'Engineering'


--5.Find the name of the employees (firstname, last name) who are working in ¡®Finance¡¯ Department and show the result in descending order of the firstname.
SELECT FIRSTNAME, LASTNAME FROM PERSON.PERSON WHERE BUSINESSENTITYID IN(SELECT BUSINESSENTITYID FROM HUMANRESOURCES.EMPLOYEEDEPARTMENTHISTORY WHERE DEPARTMENTID IN(SELECT DEPARTMENTID FROM HUMANRESOURCES.DEPARTMENT WHERE NAME = 'Finance')) ORDER BY FIRSTNAME DESC


--6.Show the number of employees working in each department with Department Name.
SELECT NAME, COUNT(*) AS 'NUMBER OF EMPLOYEES' FROM HUMANRESOURCES.DEPARTMENT GROUP BY NAME 


--7.Find the Firstname , Department name and email of the employees whose email address contain letters ¡®mar¡¯ together anywhere.
SELECT P.FIRSTNAME, D.NAME, E.EMAILADDRESS FROM PERSON.PERSON P INNER JOIN PERSON.EMAILADDRESS E ON P.BUSINESSENTITYID = E.BUSINESSENTITYID INNER JOIN HUMANRESOURCES.EMPLOYEEDEPARTMENTHISTORY H ON E.BUSINESSENTITYID = H.BUSINESSENTITYID INNER JOIN HUMANRESOURCES.DEPARTMENT D ON H.DEPARTMENTID = D.DEPARTMENTID WHERE E.EMAILADDRESS LIKE '%mar%'


--8.Find the name of the StateProvince of CountryRegion Germany.
SELECT NAME FROM PERSON.STATEPROVINCE WHERE COUNTRYREGIONCODE IN(SELECT COUNTRYREGIONCODE FROM PERSON.COUNTRYREGION WHERE NAME = 'Germany')


--9.List unique the last four digits of the phone number of employees who have provided home phone number.
SELECT DISTINCT(SUBSTRING(PHONENUMBER, 9, 4)) AS 'LAST FOUR DIGIT OF THE PHONE NUMBERS' FROM PERSON.PERSONPHONE 


--10.Find Id of the employee (BusinessEntityID) staying at ¡®2487 Riverside Drive¡¯ address. Use AddressLine1 of Person.Address table)
SELECT BUSINESSENTITYID FROM PERSON.BUSINESSENTITYADDRESS WHERE ADDRESSID IN(SELECT ADDRESSID FROM PERSON.ADDRESS WHERE ADDRESSLINE1 = '2487 Riverside Drive')




