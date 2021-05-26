use sinhvien_DH;





-- thong ke moi truong dai hoc, moi chuyen nganh co bao nhieu nhan vien
SELECT un.universityID,un.universityName,ma.majorName,
COUNT(*) as SL_sinhvien FROM `student` st 
INNER JOIN `university` un
ON un.universityID = st.universityID 
INNER JOIN `major` ma 
ON st.majorID = ma.majorID
GROUP BY un.universityName,ma.majorName;

-- lay ra thong tin truong co nhieu nhan vien nhat
SELECT un.universityID,un.universityName, COUNT(*) as SL_student FROM `university` un 
INNER JOIN `student` st
ON un.universityID = st.universityID 
GROUP BY un.universityID 
HAVING COUNT(st.universityID) =
								(SELECT max(SL_stu) FROM 
                                (SELECT count(*) as SL_stu 
								FROM `student` GROUP BY universityID ) as maxstu);
                                
-- lay ra thong tin nganh co it nhan vien nhat
SELECT ma.majorID,ma.majorName, count(*) as sl_student 
FROM major ma INNER JOIN student st
ON ma.majorID = st.majorID GROUP BY ma.majorID 
HAVING COUNT(st.majorID) = 
							(SELECT min(sl_nhanvien) FROM
							(SELECT count(*) as sl_nhanvien FROM student
							 GROUP BY majorID)as minstu);
-- -------------------------------------------
 