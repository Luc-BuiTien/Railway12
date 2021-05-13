DROP DATABASE IF EXISTS Testing_System_Assignmen;
CREATE DATABASE Testing_System_Assignmen;
 
USE Testing_System_Assignmen;

CREATE TABLE Department (
DepartmentID INT,
DepartmentName VARCHAR(50)
);

CREATE TABLE Position (
PositionID INT,
PositionName VARCHAR(50)
);

CREATE TABLE `Account` (
AccountID INT,
Email VARCHAR(100),
Username VARCHAR(50),
FullName VARCHAR(50),
DepartmentID INT,
PositionID INT,
CreateDate DATE
);

CREATE TABLE `Group` (
GroupID INT,
GroupName VARCHAR(100),
CreatorID INT,
CreateDate DATE
);

CREATE TABLE `GroupAccoun` (
GroupID INT,
AccountID INT,
JoinDate DATE
);

CREATE TABLE `TypeQuestio` (
TypeID INT,
TypeName VARCHAR(100)
);

CREATE TABLE `CategoryQuestion` (
CategoryID INT,
CategoryName VARCHAR(100)
);

CREATE TABLE `Question` (
QuestionID INT,
Content VARCHAR(100),
CategoryID INT,
TypeID INT,
CreatorID INT,
CreateDate DATE
);

CREATE TABLE `Answer` (
AnswerID INT,
Content VARCHAR(100),
QuestionID INT,
isCorrec BOOLEAN
);

CREATE TABLE `Exam` (
ExamID INT,
Code INT,
Title VARCHAR(100),
CategoryID INT,
Duration DATE,
CreatorID INT,
CreateDate DATE
);

CREATE TABLE `ExamQuestion`(
ExamID INT,
QuestionID INT
);




