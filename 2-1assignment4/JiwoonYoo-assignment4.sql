DROP TABLE IF EXISTS Campus
CREATE TABLE Campus (
	Campus_ID INT PRIMARY KEY NOT NULL, 
	Campus_Name VARCHAR(24), 
	Campus_Address VARCHAR(24), 
	Campus_City VARCHAR(12)
)



DROP TABLE IF EXISTS Teacher
CREATE TABLE Teacher(
	Teacher_ID INT PRIMARY KEY NOT NULL, 
	Teacher_Name VARCHAR(24), 
	Teacher_Salary NUMERIC(3,2)
)


DROP TABLE IF EXISTS Program 
CREATE TABLE Program(
	Program_ID INT PRIMARY KEY NOT NULL, 
	Program_Name VARCHAR(24),
	Program_Description VARCHAR(2000), 
	Tuition_Fees NUMERIC(7,2),
	Program_Coordinator_ID INT FOREIGN KEY REFERENCES Teacher(Teacher_ID),
	Campus_ID INT FOREIGN KEY REFERENCES Campus(Campus_ID)


)

DROP TABLE IF EXISTS Course
CREATE TABLE Course(
	Course_ID INT PRIMARY KEY NOT NULL, 
	Course_Name VARCHAR(24),
	Course_Semester VARCHAR(24),
	Program_ID INT FOREIGN KEY REFERENCES Program(Program_ID),
	Teacher_ID INT FOREIGN KEY REFERENCES Teacher(Teacher_ID)
)


DROP TABLE IF EXISTS Student
CREATE TABLE Student(
	Student_ID INT PRIMARY KEY NOT NULL, 
	Student_Name VARCHAR(24), 
	Student_Type VARCHAR(24),
	Student_Admission_Date DATE,
	Student_GPA NUMERIC(3,2), 
	Program_ID INT FOREIGN KEY REFERENCES Program(Program_ID)
)



SELECT * FROM Campus
SELECT * FROM Course
SELECT * FROM Teacher
SELECT * FROM Program
SELECT * FROM Student