use TestingSystem3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều 
 -- nhất
DROP VIEW IF EXISTS cte_q;




-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW account_sale AS
SELECT ac.*,de.departmentName FROM `account` ac JOIN 
department de ON ac.DepartmentID = de.DepartmentID 
WHERE de.departmentName = 'Sale';
SELECT * FROM account_sale;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW GR_AC AS
SELECT ac.AccountID,ac.FullName,ac.Username, count(*) as sl_acc
 FROM `account` ac JOIN groupaccount gr 
ON ac.AccountID = gr.AccountID GROUP BY ac.AccountID HAVING COUNT(ac.AccountID) = (
SELECT max(sl_account) FROM 
(SELECT count(*) as sl_account FROM groupaccount GROUP BY AccountID) as max_ac);



-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ 
 -- được coi là quá dài) và xóa nó đi

CREATE OR REPLACE VIEW QE AS
SELECT QuestionID,Content FROM question WHERE length(content) >22 ;
DROP VIEW IF EXISTS QE;
SELECT * from QE;


-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhấT
CREATE OR REPLACE VIEW SL_NHANVIEN AS
SELECT DE.DepartmentID,DE.DepartmentName, COUNT(*) as sl_nhanvien 
FROM department DE JOIN `account` AC 
ON DE.DepartmentID = AC.DepartmentID GROUP BY DE.DepartmentID
 HAVING COUNT(*) =(
					SELECT max(SL_NV) FROM (
					SELECT count(*) AS SL_NV FROM `account`
                    GROUP BY DepartmentID) AS MAX_NV);
SELECT * FROM SL_NHANVIEN;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
-- FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
CREATE OR REPLACE VIEW QU_AC AS
SELECT QU.QuestionID, QU.Content,AC.Email,AC.Username,AC.FullName
FROM question QU JOIN `account` AC 
ON QU.CreatorID = AC.AccountID WHERE AC.FullName like 'nguyen%';
SELECT * FROM QU_AC;




