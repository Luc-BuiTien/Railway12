-- Ôn tập mở rộng: Tạo vào thao tác với DB: fresher --
DROP DATABASE IF EXISTS Fresher;
CREATE DATABASE Fresher;
USE Fresher;

DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee (
TraineeID MEDIUMINT AUTO_INCREMENT PRIMARY KEY,
Full_Name NVARCHAR(100) NOT NULL,
Birth_Date DATETIME DEFAULT NOW(),
Gender ENUM('MALE','FEMALE','UNKNOWN'),
ET_IQ MEDIUMINT UNSIGNED NOT NULL CHECK(ET_IQ <= 20),
ET_Gmath MEDIUMINT UNSIGNED NOT NULL CHECK(ET_Gmath <= 20),
ET_English MEDIUMINT UNSIGNED NOT NULL CHECK(ET_English <= 50),
Training_Class NVARCHAR(100) NOT NULL ,
Evaluation_Notes NVARCHAR(100) NOT NULL
);

INSERT INTO Trainee (	TraineeID,	full_Name,			Birth_Date,			Gender,			ET_IQ,			ET_Gmath,		ET_English,		Training_Class,		Evaluation_Notes )
VALUES 				(	1,			'bui tien luc',			'1996-02-02',		'UNKNOWN',		20,				20,					34,				'VTI001',		'THUC TAP'		),
					(	2,			'bui tien luc1',		'1995-03-02',		'MALE',			15,				14,					25,				'VTI002',		'THUC TAP'		),
					(	3,			'bui tien luc2AS',		'1997-10-01',		'UNKNOWN',		13,				6,					36,				'VTI003',		'THUC TAP'		),
					(	4,			'bui tien luc3',		'1998-04-02',		'FEMALE',		2,				8,					37,				'VTI001',		'THUC TAP'		),
					(	5,			'bui tien luc4',		'1987-11-02',		'UNKNOWN',		5,				11,					21,				'VTI002',		'THUC TAP'		),
					(	6,			'bui tien luc5',		'1995-12-10',		'FEMALE',		7,				14,					16,				'VTI003',		'THUC TAP'		),
					(	7,			'bui tien luc6',		'1992-01-08',		'MALE',			15,				17,					24,				'VTI001',		'THUC TAP'		),
					(	8,			'bui tien luc7',		'1999-12-23',		'UNKNOWN',		9,				5,					34,				'VTI002',		'THUC TAP'		),
					(	9,			'bui tien luc8',		'2000-03-12',		'MALE',			16,				2,					12,				'VTI003',		'THUC TAP'		),
					(	10,			'bui tien luc9',		'2001-04-25',		'UNKNOWN',		18,				1,					14,				'VTI001',		'THUC TAP'		);
             
             -- TINH TUOI --
             SELECT curdate();
             SELECT year(curdate());
             SELECT full_Name, year(curdate()) - year(Birth_Date) as tuoi FROM Trainee;
             
                 
                 
-- Question 3: Insert 1 bản ghi mà có điểm ET_IQ =30. Sau đó xem kết quả. --
INSERT INTO Trainee (ET_IQ)
VALUE (30);


-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
-- và sắp xếp theo ngày sinh. Điểm ET_IQ >=12, ET_Gmath>=12, ET_English>=20

SELECT * FROM Trainee WHERE ET_IQ >=12 AND  ET_Gmath>=12 AND ET_English>=20
ORDER BY Birth_Date ASC;

-- Question 5: Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ N và kết thúc
-- bằng chữ C

SELECT * FROM Trainee WHERE full_Name LIKE 'N%C';

-- Question 6: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có ký thự thứ 2 là chữ G --

SELECT * FROM Trainee WHERE full_Name LIKE '_G%';


-- Question 7: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có 10 ký tự và ký tự cuối cùng là C

SELECT * FROM Trainee WHERE full_Name LIKE '%c' AND length(full_Name) = 10;

-- Question 8: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, lọc bỏ các tên trùng nhau
SELECT DISTINCT full_Name FROM Trainee ;

-- Question 9: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, sắp xếp các tên này
-- theo thứ tự từ A-Z.
SELECT  full_Name FROM Trainee ORDER BY full_Name;


-- Question 10: Viết lệnh để lấy ra thông tin thực tập sinh có tên dài nhất
SELECT *  FROM Trainee WHERE length(full_name) = (SELECT max(length(full_name)) from Trainee);

-- Question 11: Viết lệnh để lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất --
SELECT TraineeID , full_Name ,Birth_Date FROM Trainee WHERE length(full_name) =(SELECT max(length(full_name)) FROM Trainee);


-- Question 12: Viết lệnh để lấy ra Tên, và điểm IQ, Gmath, English thực tập sinh có tên dài nhất
SELECT full_Name , ET_IQ, ET_Gmath, ET_English FROM Trainee WHERE length(full_name) =(SELECT max(length(full_name)) from Trainee);


-- Question 13 Lấy ra 5 thực tập sinh có tuổi nhỏ nhất --
SELECT TraineeID, Full_Name, (YEAR(curdate()) - YEAR(Birth_Date)) AS Age FROM Trainee 
ORDER BY Age ASC 
LIMIT 5;

-- Question 14: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
-- những người thỏa mãn số điểm như sau:
-- • ET_IQ + ET_Gmath>=20
-- • ET_IQ>=8
-- • ET_Gmath>=8
-- • ET_English>=18
 SELECT TraineeID, Full_Name, ET_IQ, ET_Gmath, ET_English FROM Trainee 
 WHERE ET_IQ +  ET_Gmath >= 20 
 AND ET_IQ>=8
 AND ET_Gmath>=8
 AND ET_English>=18;
 
 -- Question 15: Xóa thực tập sinh có TraineeID = 5 --
 DELETE FROM Trainee WHERE TraineeID = 5;
 
 
 -- Question 16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <=15 
 DELETE FROM Trainee WHERE ET_IQ + ET_Gmath <= 15;
 
-- Question 17: Xóa thực tập sinh quá 30 tuổi. --
DELETE FROM Trainee WHERE year(curdate()) - year(Birth_Date) > 30;

-- Question 18: Thực tập sinh có TraineeID = 3 được chuyển sang lớp " VTI003". Hãy cập nhật
-- thông tin vào database.

UPDATE Trainee
SET Training_Class = 'VTI003'
WHERE TraineeID = 3;

-- Question 19: Do có sự nhầm lẫn khi nhập liệu nên thông tin của học sinh số 10 đang bị sai,
-- hãy cập nhật lại tên thành “LeVanA”, điểm ET_IQ =10, điểm ET_Gmath =15, điểm
-- ET_English = 30.

UPDATE Trainee
SET full_name = 'LeVanA', ET_IQ = 10, ET_Gmath = 15, ET_English = 30
WHERE TraineeID = 10;

-- Question 20: Đếm xem trong lớp VTI001 có bao nhiêu thực tập sinh --
SELECT full_name, COUNT(*) FROM Trainee WHERE Training_Class = 'VTI001';

-- Question 22: Đếm tổng số thực tập sinh trong lớp VTI001 và VTI003 có bao nhiêu thực tập sinh --
SELECT full_name, COUNT(*) FROM  Trainee WHERE Training_Class = 'VTI001' OR Training_Class = 'VTI003';

-- Question 23: Lấy ra số lượng các thực tập sinh theo giới tính: Male, Female, Unknown --
SELECT full_name, COUNT(*) FROM  Trainee WHERE Gender = 'Male';
SELECT full_name, COUNT(*) FROM  Trainee WHERE Gender = 'Female';
SELECT full_name, COUNT(*) FROM  Trainee WHERE Gender = 'Unknown';

-- Question 24: Lấy ra lớp có lớn hơn 3 thực tập viên --
SELECT Training_Class, COUNT(Training_Class) as 'so luong hoc vien'  FROM Trainee GROUP BY Training_Class HAVING COUNT(Training_Class) > 3 ;


-- Question 26: Lấy ra lop có ít hơn 4 thực tập viên tham gia khóa học --
SELECT Training_Class, COUNT(Training_Class) as 'so luong hoc vien'  FROM Trainee GROUP BY Training_Class HAVING COUNT(Training_Class) < 4 ;



-- Question 27: Bước 1: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI001'
-- Bước 2: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI002'
-- Bước 3: Sử dụng UNION để nối 2 kết quả ở bước 1 và 2


