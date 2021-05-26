
USE quanLyNhanVien1;

-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill RUBY
-- Hướng dẫn: sử dụng UNION
SELECT ET.Employee_Name,ST.Skill_Name 
FROM  employee_skill_table EST
JOIN employee_table ET ON ET.Employee_Number = EST.Employee_Number  
JOIN skill_table ST ON ST.Skill_Number = EST.Skill_Number
 WHERE ST.Skill_Name = 'RUBY';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >1 nhân viên
SELECT Department_Name, COUNT(*) AS SL_NV FROM department DE JOIN employee_table EM
ON DE.Department_Number = EM.Department_Number 
GROUP BY DE.Department_Number HAVING count(Employee_Number) >1;


-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban. 
-- Hướng dẫn: sử dụng GROUP BY
SELECT DE.Department_Name,EM.Employee_Name
FROM department DE LEFT JOIN employee_table EM
ON DE.Department_Number = EM.Department_Number 
GROUP BY DE.Department_Number,EM.Employee_Number
ORDER BY DE.Department_Name ASC;


-- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
-- Hướng dẫn: sử dụng DISTINCT
SELECT ET.Employee_Name, ST.Skill_Name, COUNT(*) AS SL_SKILL
FROM  employee_skill_table EST
JOIN employee_table ET ON ET.Employee_Number = EST.Employee_Number  
JOIN skill_table ST ON ST.Skill_Number = EST.Skill_Number
 GROUP BY ST.Skill_Name HAVING COUNT(ST.Skill_Name) >1;
