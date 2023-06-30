--1.CREATE TABLE Departments in Section11 AS table available in HR. Departments;
CREATE TABLE DEPARTMENTS(
	Department_ID NUMERIC(4, 0) NOT NULL,   
	Department_Name	VARCHAR(30) NOT NULL, 
	Manager_ID NUMERIC(6,0), 
	Location_ID NUMERIC(4,0)
)
SELECT * FROM DEPARTMENTS

--2.Insert all the rows of HR.Departments to S11UX.Departments. (Here, S11UX is whatever your Username is in SSMS)
INSERT INTO DEPARTMENTS SELECT * FROM HR.dbo.DEPARTMENTS
SELECT * FROM DEPARTMENTS 


--3.Insert a  row in the Departments
INSERT INTO DEPARTMENTS(Department_ID, Department_Name, Location_ID) VALUES(1000, 'Gamming', 1800)
SELECT * FROM DEPARTMENTS 

--4. Update that row in which Department_id is 1000 and Department_name from ¡®Gamming¡¯ to ¡®Gamming Turbocharged¡¯.
UPDATE DEPARTMENTS SET Department_Name = 'Gamming Turbocharged' WHERE Department_ID = 1000 AND Department_Name = 'Gamming'
SELECT * FROM DEPARTMENTS 


--5.Delete the row from Departments where Department_id is 1000
DELETE FROM Departments WHERE Department_ID = 1000 
SELECT * FROM DEPARTMENTS 


--6.Modify the data type of manager_id from numeric(6,0) to INT and also add NOT NULL Constraints
DELETE FROM DEPARTMENTS WHERE Manager_ID IS NULL 
ALTER TABLE DEPARTMENTS 
ALTER COLUMN Manager_ID INT NOT NULL 
SELECT * FROM DEPARTMENTS 


--7.Drop the location_id column from the Departments table.
ALTER TABLE DEPARTMENTS		
DROP COLUMN Location_ID 
SELECT * FROM DEPARTMENTS


