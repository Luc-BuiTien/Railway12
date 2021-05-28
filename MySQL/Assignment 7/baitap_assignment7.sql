-- Exercise 1: Tiếp tục với Database Testing System
USE TestingSystem3;

-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo 
--  trước 1 năm trước
-- SELECT date_sub(now(), interval 1 year);
DROP TRIGGER IF EXISTS check_create_group;
DELIMITER $$
CREATE TRIGGER check_create_group
BEFORE INSERT ON `group`
FOR EACH ROW 
			BEGIN
				DECLARE DATE_GROUP DATETIME;
                SET DATE_GROUP = date_sub(now(), interval 1 year);
				IF NEW.`CreateDate` < DATE_GROUP THEN
				SIGNAL SQLSTATE '12345'
                SET MESSAGE_TEXT= 'ngay nhap khong hop le';
                END IF;
			END $$
DELIMITER ;


INSERT INTO `group`(GroupID,GroupName,CreatorID,CreateDate)
VALUES				('12','group 12','11','2020-05-25 19:40:04')

;
-- Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào 
--  department "Sale" nữa, khi thêm thì hiện ra thông báo "Department
 -- "Sale" cannot add more user"
 DROP TRIGGER IF EXISTS check_create_group;
DELIMITER $$
CREATE TRIGGER check_create_group
BEFORE INSERT ON `account`
FOR EACH ROW 
			BEGIN
				DECLARE V_DEPARMENT MEDIUMINT;
               SELECT departmentID into V_DEPARMENT FROM department WHERE DepartmentName = 'Sale';
				IF NEW.DepartmentID = V_DEPARMENT THEN
				SIGNAL SQLSTATE '12345'
                SET MESSAGE_TEXT= 'Department "Sale" cannot add more user';
                END IF;
			END $$
DELIMITER ;

 
-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS check_create_groupACC;
DELIMITER $$
CREATE TRIGGER check_create_groupACC
BEFORE INSERT ON groupaccount
FOR EACH ROW 
			BEGIN
				DECLARE V_GROUPACC MEDIUMINT;
               SELECT COUNT(accountID) INTO V_GROUPACC 
               FROM groupaccount GROUP BY GroupID HAVING GroupID = NEW.GroupID;
				IF V_GROUPACC >= 18 THEN
				SIGNAL SQLSTATE '12345'
                SET MESSAGE_TEXT= 'NHOM NAY DA DU 18 ACC, KHONG THE THEM VAO';
                END IF;
			END $$
DELIMITER ;

INSERT INTO `testingsystem3`.`groupaccount` (`GroupID`, `AccountID`, `JoinDate`) 
VALUES ('1', '7', '2020-05-11 00:00:00');

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 26 Question
DROP TRIGGER IF EXISTS check_create_question;
DELIMITER $$
CREATE TRIGGER check_create_question
BEFORE INSERT ON examquestion
FOR EACH ROW 
			BEGIN
				DECLARE v_exemques MEDIUMINT;
               SELECT COUNT(QuestionID) INTO v_exemques 
               FROM examquestion GROUP BY ExamID HAVING ExamID = NEW.ExamID;
				IF v_exemques >= 26 THEN
				SIGNAL SQLSTATE '12345'
                SET MESSAGE_TEXT= 'bai thi khong the co tren 26 cau hoi';
                END IF;
			END $$
DELIMITER ;

SELECT * from examquestion GROUP BY ExamID;
INSERT INTO `testingsystem3`.`examquestion` (`ExamID`, `QuestionID`)
VALUES 											('4', '253');


-- Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là 
 -- admin@gmail.com (đây là tài khoản admin, không cho phép user xóa), 
 -- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông 
 -- tin liên quan tới user đó
 DROP TRIGGER IF EXISTS DELETE_ACC;
DELIMITER $$
CREATE TRIGGER DELETE_ACC
BEFORE DELETE ON `account`
FOR EACH ROW 
			BEGIN
				IF OLD.Email = 'admin@gmail.com' THEN
				SIGNAL SQLSTATE '12345'
                SET MESSAGE_TEXT= 'khong the xoa tai khoan cua admin';
                END IF;
			END $$
DELIMITER ;


 DELETE FROM `account` WHERE AccountID = 8;
 
-- Question 6: Không sử dụng cấu hình default cho field DepartmentID của table 
 -- Account, hãy tạo trigger cho phép người dùng khi tạo account không điền 
 -- vào departmentID thì sẽ được phân vào phòng ban "waiting Department"
  DROP TRIGGER IF EXISTS V_DepartmentID;
DELIMITER $$
CREATE TRIGGER V_DepartmentID
BEFORE INSERT ON `account`
FOR EACH ROW 
			BEGIN
            DECLARE waiting_DepartmentID MIDDLEINT;
            SELECT departmentID INTO waiting_DepartmentID FROM `account` 
            WHERE DepartmenName = 'PHONG CHO';
				IF NEW.departmentID IS NULL THEN
                SET NEW.departmentID = waiting_DepartmentID;
                END IF;
			END $$
DELIMITER ;
 
 
-- Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi 
 -- question, trong đó có tối đa 2 đáp án đúng.
 
 
-- Question 8: Viết trigger sửa lại dữ liệu cho đúng: 
 -- Nếu người dùng nhập vào gender của account là nam, nữ, chưa xác định 
 -- Thì sẽ đổi lại thành M, F, U cho giống với cấu hình ở database
 
DROP TRIGGER IF EXISTS Auto_Gender_Update;
DELIMITER $$
CREATE TRIGGER Auto_Gender_Update
BEFORE INSERT ON `Account`
FOR EACH ROW
BEGIN
      IF NEW.GENDER = 'NAM' THEN
      SET NEW.GENDER = 'M';
      ELSEIF NEW.GENDER = 'NU' THEN
      SET NEW.GENDER = 'F';
      ELSEIF NEW.GENDER = 'CHUA XAC DINH' THEN
      SET NEW.GENDER = 'U';
      END IF;
	 
END $$
DELIMITER ;
-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày
DROP TRIGGER IF EXISTS Delete_Exam;
DELIMITER $$
CREATE TRIGGER Delete_Exam
BEFORE DELETE ON exam
FOR EACH ROW
BEGIN
    IF NEW.CreateDate =  (date_sub(now(), interval 2 day)) THEN
    SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT= 'khong the xoa bai thi moi tao 2 ngay';
	END IF;
	 
END $$
DELIMITER ;

-- Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các 
 -- question khi question đó chưa nằm trong exam nào
 DROP TRIGGER IF EXISTS Delete_Update;
DELIMITER $$
CREATE TRIGGER Delete_Update
BEFORE UPDATE ON question
FOR EACH ROW
BEGIN
     DECLARE null_question INT;
     SELECT Q.QuestionID INTO null_question FROM question Q LEFT JOIN examquestion E
     ON Q.QuestionID = E.QuestionID WHERE E.ExamID IS NULL;
    IF NEW.QuestionID != null_question THEN
    SIGNAL SQLSTATE '12345'
	SET MESSAGE_TEXT= 'khong the UPDATE va DELETE';
	END IF;
	 
END $$
DELIMITER ;
 
 
-- Question 12: Lấy ra thông tin exam trong đó:
-- Duration <= 30 thì sẽ đổi thành giá trị "Short time"
-- 30 < Duration <= 60 thì sẽ đổi thành giá trị "Medium time"
-- Duration > 60 thì sẽ đổi thành giá trị "Long time"
 
SELECT examID,
  CASE
  WHEN Duration <= 30 THEN "Short time"
  WHEN Duration <= 60 AND Duration > 30 THEN "Medium time"
  ELSE "Long time"
END AS examID_Duration
FROM exam;

-- Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên 
 -- là the_number_user_amount và mang giá trị được quy định như sau:2
-- Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
-- Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
-- Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher
SELECT groupID,
CASE 
	WHEN  count(accountID) <= 5 THEN 'few'
    WHEN  COUNT(accountID) >5 AND COUNT(accountID) <= 20 THEN 'normal'
    ELSE 'higher'
    END AS USER_
 FROM groupaccount GROUP BY GroupID;

-- Question 14: Thống kê số mỗi phòng ban có bao nhiêu user, nếu phòng ban nào 
 -- không có user thì sẽ thay đổi giá trị 0 thành "Không có User"
 SELECT D.DepartmentName,
 CASE 
		WHEN COUNT(A.accountID) = 0 then "Không có User"
        else count(A.accountID)
  END AS account_NUMBER
 
 FROM department D 
 JOIN `account` A ON D.DepartmentID = A.DepartmentID 
 GROUP BY D.DepartmentName;

