CREATE DATABASE PRACTICE_TASK_DB;

/*  DDL - Data definition language
	DQL - Data query language
	DML - Data Manipulation langauge
	DCL - Data control langauge
	TCL - Transaction control langauge
*/

USE PRACTICE_TASK_DB;

--create Person table
CREATE TABLE Person
(
	ID INT PRIMARY KEY,
	[PersonName] VARCHAR(50),
	[DOB] DATETIME,
	[Gender] CHAR,
	[Address] VARCHAR(200),
	[City] NVARCHAR(100),
)


--Forgot to add count of characters in CHAR DATATYPE so alter column
ALTER TABLE Person 
ALTER COLUMN Gender CHAR(40);

--INSERT DATA IN Person table after changing datatype char to CHAR(40)
INSERT INTO  Person(ID, PersonName, DOB, Gender, Address, City)
VALUES (1, 'Hemil', '2000-01-01', 'MALE', 'MEMNAGAR', 'Ahmedbad');

SELECT * FROM Person;

--Chnage behaviour of primary key to autoincremnet by adding IDENTITY to PK
/*ALTER TABLE Person
ALTER COLUMN ID 
INT IDENTITY(1, 1)
PRIMARY KEY;
this is not possible as when table is created and then primary key is altered
to become primary key then it is not possible so create table again.
*/

--Drop table before defining it again
DROP TABLE Person;

--USE '[]' TO DENOTE it as a column name as it might happen when MSSQL identify some column as reserved keyword
CREATE TABLE Person
(
	ID INT PRIMARY KEY IDENTITY,
	[PersonName] VARCHAR(50),
	[DOB] DATETIME,
	[Gender] CHAR,
	[Address] VARCHAR(200),
	[City] NVARCHAR(100),
)

--Forgot to add count of characters in CHAR DATATYPE so alter column
ALTER TABLE Person 
ALTER COLUMN Gender CHAR(40);


--insert to Person's table after changing table's primary key to IDENTITY
INSERT INTO  Person(PersonName, DOB, Gender, Address, City)
VALUES ('Hemil', '2000-01-01', 'MALE', 'MEMNAGAR', 'Ahmedbad');

SELECT * FROM Person;

--add state column


--add country column


--change name of column DOB to DATEOFBIRTH



