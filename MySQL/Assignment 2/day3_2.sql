USE TestingSystem3;

SELECT * FROM `Account` WHERE DepartmentID > 5 AND PositionID <= 2
ORDER BY DepartmentID ASC, FullName;
