USE TestingSystem3;

SELECT * 
FROM `Account` a INNER JOIN Department b ON 
a.DepartmentID = b.DepartmentID
;


SELECT * FROM Department WHERE DepartmentID=3
UNION ALL
SELECT * FROM Department WHERE DepartmentID=3;



-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ --
SELECT * 
FROM `Account` a INNER JOIN Department b ON 
a.DepartmentID = b.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2018 --
SELECT * 
FROM `Account` a LEFT JOIN Department b ON 
a.DepartmentID = b.DepartmentID
WHERE a.CreateDate < '2018-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer --
SELECT * FROM `Position` p INNER JOIN `Account` a ON 
p.PositionID = a.PositionID
WHERE p.PositionName = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >20 nhân viên --
SELECT DepartmentName,COUNT(*) 
FROM `Account` a INNER JOIN Department b ON 
a.DepartmentID = b.DepartmentID
GROUP BY a.DepartmentID HAVING COUNT(a.DepartmentID) >20;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều 
 -- nhất
SELECT q.QuestionID, q.Content FROM examquestion e
	INNER JOIN question q ON e.QuestionID = q.QuestionID
	GROUP BY e.QuestionID 
	HAVING count(e.QuestionID) = 
	(SELECT max(countQuestion) FROM 
	(SELECT count(*) as countQuestion 
	FROM examquestion 
	GROUP BY QuestionID) as maxCount);-
    

-- Question 6: Thông kê mỗi chủ đề CategoryQuestion  được sử dụng trong bao nhiêu Question
-- bao nhieu Question duoc su dung trong 1 CategoryQuestion
--  CategoryQuestion : chủ đề câu hỏi
--  Question : câu hỏi
-- liên kết : CategoryID (id của chủ đề câu hỏi)
SELECT c.CategoryName,q.Content,COUNT(q.QuestionID) as SL FROM `CategoryQuestion` c INNER JOIN `Question` q
on c.CategoryID = q.CategoryID GROUP BY c.CategoryName;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam --
-- BAO NHIEU EXEM DUOC SU DUNG TRONG 1 Question
-- Question : cau hoi
-- Exam : de thi
-- lien ket :  CategoryID:  định danh của chủ đề câu hỏi
SELECT Q.Content,E.Title, count(E.ExamID)  as SL_Exam FROM `Question` Q INNER JOIN `Exam` E
ON Q.CategoryID = E.CategoryID GROUP BY E.Title;


-- Question 8: Lấy ra Question có nhiều câu trả lời nhất --
-- Question : cau hoi
-- Answer : CAU TRA LOI
-- LIEN KET  QuestionID : id cau hoi
SELECT Q.Content FROM `Question` Q INNER JOIN `Answer` A ON Q.QuestionID = A.QuestionID GROUP BY A.QuestionID 
HAVING COUNT(*) =
(SELECT MAX(COUNTAccount) FROM (
SELECT count(*) AS COUNTAccount FROM `Answer` GROUP BY QuestionID) AS MAX);

-- Question 9: Thống kê số lượng account trong mỗi group
-- bao nhieu account trong 1 group
-- Account : ten nguoi dung
-- group : nhom -- lien ket : FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
SELECT GR.GroupName,AC.FullName, COUNT(AC.AccountID) AS SL_AC FROM `Account` AC INNER JOIN `Group` GR
GROUP BY GR.GroupName;


-- Question 10: Tìm Position có ít Account nhất --
SELECT P.PositionName FROM `Account` A INNER JOIN `Position` P 
ON A.PositionID = P.PositionID 
GROUP BY A.PositionID 
HAVING COUNT(*)=(SELECT MIN(COUNTTEST) FROM 
				( SELECT count(*) AS COUNTTEST FROM
				`Account` GROUP BY PositionID) AS MIN);
                
 -- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
 SELECT D.DepartmentID, D.DepartmentName ,P.PositionName, COUNT(P.PositionID) AS SL
 FROM `Account` A INNER JOIN Department D ON A.DepartmentID = D.DepartmentID
				  INNER JOIN `Position` P ON A.PositionID = P.PositionID
				  GROUP BY   A.DepartmentID,A.PositionID;
 
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của 
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
-- FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID), định danh của loại câu hỏi
-- FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),định danh của loại câu hỏi
-- FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)định danh của NG TAO CAU HOI

SELECT * FROM `Question` Q INNER JOIN CategoryQuestion CA ON Q.CategoryID = CA.CategoryID
							INNER JOIN TypeQuestion TY ON 	Q.TypeID = TY.TypeID
                            INNER JOIN `Account` AC ON Q.CreatorID = AC.AccountId;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
-- Question 14:Lấy ra group không có account nào 
-- FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
SELECT *  FROM `Group` G LEFT JOIN `Account` A
ON G.CreatorID = A.AccountId WHERE A.AccountId IS NULL ;

-- Question 16: Lấy ra question không có answer nàO
 -- FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
SELECT * FROM `Question` Q LEFT JOIN `answer` A 
ON Q.QuestionID = A.QuestionID WHERE A.QuestionID IS NULL ;
 
 -- Exercise 2: Union
-- Question 17: 
-- a) Lấy các account thuộc nhóm thứ 1
-- b) Lấy các account thuộc nhóm thứ 2
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT * FROM `Group` G INNER JOIN `Account` A
ON G.CreatorID = A.AccountId GROUP BY GroupName HAVING GroupID = 1
UNION
SELECT * FROM `Group` G INNER JOIN `Account` A
ON G.CreatorID = A.AccountId GROUP BY GroupName HAVING GroupID = 2;

-- Question 18: 
-- a) Lấy các group có lớn hơn 5 thành viên
-- b) Lấy các group có nhỏ hơn 30 thành viên
-- c) Ghép 2 kết quả từ câu a) và câu b) FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID)
SELECT G.GroupName, COUNT(GR.GroupID) AS SL_THANHVIEN FROM `Group` G INNER JOIN `GroupAccount` GR 
ON G.GroupID = GR.GroupID GROUP BY GR.GroupID HAVING  COUNT(GR.GroupID) > 5
UNION
SELECT G.GroupName, COUNT(GR.GroupID) AS SL_THANHVIEN FROM `Group` G INNER JOIN `GroupAccount` GR 
ON G.GroupID = GR.GroupID GROUP BY GR.GroupID  HAVING COUNT(GR.GroupID) < 30;
 














