-- Cho table sau:
-- Department (Department_Number, Department_Name)
-- Employee_Table (Employee_Number, Employee_Name, Department_Number)
-- Employee_Skill_Table (Employee_Number, Skill_number, Date Registered)
-- Skill_Table (Skill_Number, Skill_Name)



-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu 
DROP DATABASE IF EXISTS quanLyNhanVien1;
CREATE DATABASE quanLyNhanVien1;
USE quanLyNhanVien1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
Department_Number MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Department_Name NVARCHAR(100) NOT NULL UNIQUE KEY
);


 DROP TABLE IF EXISTS Employee_Table;
 CREATE TABLE Employee_Table (
							 Employee_Number MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
							 Employee_Name NVARCHAR(100) NOT NULL UNIQUE KEY,
							 Department_Number MIDDLEINT UNSIGNED NOT NULL ,
				FOREIGN KEY (Department_Number) REFERENCES Department(Department_Number)
 );

DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table (
								Employee_Number  MEDIUMINT UNSIGNED NOT NULL ,
								Skill_ID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
                                Skill_Number MEDIUMINT UNSIGNED NOT NULL,
								CreateDate DATETIME DEFAULT NOW(),
								FOREIGN KEY (Employee_Number) REFERENCES Employee_Table(Employee_Number),
                                FOREIGN KEY (Skill_Number) REFERENCES Skill_Table(Skill_Number)
						
);

CREATE TABLE Skill_Table (
								Skill_Number MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
								Skill_Name NVARCHAR(100) NOT NULL UNIQUE KEY
								
);
