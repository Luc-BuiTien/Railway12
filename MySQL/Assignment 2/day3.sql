-- create database
DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

-- create table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 			NVARCHAR(30) NOT NULL UNIQUE KEY
);

-- create table 2: Posittion
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
	PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName			ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

-- create table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email					VARCHAR(50) NOT NULL UNIQUE KEY,
    Username				VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName				NVARCHAR(50) NOT NULL,
    DepartmentID 			TINYINT UNSIGNED NOT NULL,
    PositionID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table 4: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName				NVARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW()
);

-- create table 5: GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID					TINYINT UNSIGNED NOT NULL,
    AccountID				TINYINT UNSIGNED NOT NULL,
    JoinDate				DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID)
);

-- create table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName 		ENUM('Esay','Multiple-Choice') NOT NULL UNIQUE KEY
);

-- create table 7: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName			NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    TypeID					TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL UNIQUE KEY,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId)
);

-- create table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    Answers					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    QuestionID				TINYINT UNSIGNED NOT NULL,
    isCorrect				BIT DEFAULT 1,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`					CHAR(10) NOT NULL,
    Title					NVARCHAR(50) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    Duration				TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID				TINYINT UNSIGNED NOT NULL,
	QuestionID			TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    PRIMARY KEY (ExamID,QuestionID)
);

INSERT INTO ExamQuestion (	ExamID,			QuestionID )
VALUES 					 ( 'asca',				'asv' );



INSERT INTO Department (DepartmentName)
VALUES ('DEV'),
       ('SALE'),
       ('MKT'),
       ('TEST'),
       ('PM'),
       ('QA'),
       ('QC'),
       ('COMTOR'),
       ('BRSE'),
       ('SENIOR');
       
INSERT INTO `Position` (PositionName)
VALUES ('DEV'),
       ('Test'),
       ('Scrum Master'),
       ('PM');
       
INSERT INTO `Account` ( Email,					Username,			FullName,			DepartmentID,			PositionID)
VALUE 			('tienluc2202@gmail.com',		'luc-buitien',		'bui tien luc',				1,					1		),
				('tienluc1512@gmail.com',		'buitien',			'tien luc',					2,					2		),
				('tienluc1996@gmail.com',		'luc',				'lucAitryy',				3,					3		),
				('tienluc48513@gmail.com',		'luc-buitien2',		'bui tien luc 1',			4,					4		),
				('tienluc8485@gmail.com',		'luc-buitien3',		'bui tien luc 2',			5,					1		),
				('tienluc724@gmail.com',		'luc-buitien4',		'bui tien luc 3',			6,					2		),
				('tienluc528@gmail.com',		'luc-buitien5',		'bui tien luc 4',			7,					3		),
				('tienluc272@gmail.com',		'luc-buitien6',		'bui tien luc 5',			8,					4		),
				('thanhvc@vnext.com', 			'thanhvc', 			'Vu Cong Thanh', 			9, 					1		),
				('thanhvc3si@gmail.com', 		'thanhvc2', 		'kafka', 					10, 				2		);

       UPDATE Department 
       SET DepartmentName = 'MKT999'
       WHERE DepartmentName = 'SALE';
       
       DELETE FROM `Account`
       WHERE Email = 'tienluc8485@gmail.com';
       
       SELECT *
       FROM `Account`;
       
       -- Lay ra tat ca du lieu --
	SELECT * FROM `Account`;
    
    
    -- lay ra theo tung cot --
       
    SELECT FullName,Email FROM `Account`;
       
       
       -- them dieu kien where --
       SELECT * FROM `Account` WHERE DepartmentID < 7 AND PositionID <= 2;
       
       -- lay trong khoang giua -- not between : lay ra gia tri khong nam trong khoang nay
       SELECT * FROM `Account` WHERE DepartmentID BETWEEN 4 AND 10;
       
       -- lay ra truc tiep -- not in : khong lay ra cac gia tri nay
       SELECT * FROM `Account` WHERE DepartmentID IN (3,4,5);
       
       -- lay ra theo chu  , not like : lay ra nhung cai khong co chu do -- 
       SELECT * FROM `Account` WHERE Username like  '%luc%';
       
       -- xap xep theo thu tu tang dan hoac nguoc lai, dung order by -- ASC : DESC 
       SELECT * from `Account` ORDER BY DepartmentID DESC;
       
       