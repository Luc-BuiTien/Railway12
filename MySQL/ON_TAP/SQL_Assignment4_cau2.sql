-- Question 2: Thêm ít nhất 10 bản ghi vào table
USE quanLyNhanVien1;
INSERT INTO Department (Department_Number, Department_Name )
	VALUES 				(1,'Engineering'),
						(2,'Product Management'),
						(3,'Business Development'),
						(4,'Legal'),
						(5,'Accounting'),
						(6,'Services'),
						(7,'Sale'),
						(8,'Training'),
						(9,'Human Resources'),
						(10,'Marketing');
-- NHAN VIEN --
INSERT INTO Employee_Table (Employee_Number,Employee_Name,Department_Number)
VALUE             			(1,'lgoodge0',2),
							(2,'dgeertz1',9),
                            (3,'qharwick2',9),
                            (4,'noriordan3',2),
                            (5,'ledmondson4',8),
                            (6,'cgerauld5',7),
                            (7,'thowgego6',7),
                            (8,'vkiernan7',8),
                            (9,'tgegg8',1),
                            (10,'iadamidesa',1);
INSERT INTO Employee_Skill_Table (Employee_Number,Skill_Number,CreateDate)                            
VALUE							(1,2,'2017-04-09'),
								(2,3,'2020-09-13'),
								(3,3,'2018-01-23'),
								(4,2,'2018-11-30'),
								(5,7,'2019-06-16'),
								(6,9,'2019-12-26'),
								(7,3,'2017-08-27'),
								(8,2,'2017-08-08'),
								(9,1,'2017-09-23'),
								(10,5,'2018-10-08');

INSERT INTO Skill_Table (Skill_Number,Skill_Name)
VALUE					(1,'JAVA'),
						(2,'JAVASCRIPT'),
						(3,'RUBY'),
						(4,'PHP'),
						(5,'VUAJS'),
						(6,'REACTJS'),
						(7,'HTML'),
						(8,'CSS'),
						(9,'.NET'),
						(10,'PYTHON');
								


