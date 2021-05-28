use TestingSystem3;


DROP TRIGGER IF EXISTS check_create_Date;
DELIMITER $$
CREATE TRIGGER check_create_Date
BEFORE INSERT ON `question`
FOR EACH ROW 
			BEGIN
            IF NEW.`CreateDate` > now() THEN
            SET NEW.`CreateDate` = now();
            END IF;
			END $$
DELIMITER ;


INSERT INTO `question`(QuestionID,Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUES				('254','VTI 254','9','2','53','2030-12-02 19:40:04')

;

-- ---------------------

DROP TRIGGER IF EXISTS check_create_Date;
DELIMITER $$
CREATE TRIGGER check_create_Date
BEFORE INSERT ON `question`
FOR EACH ROW 
			BEGIN
            IF NEW.`CreateDate` > now() THEN
				SIGNAL SQLSTATE '12345'
                SET MESSAGE_TEXT= 'field create_time must be less than now';
            END IF;
			END $$
DELIMITER ;

-- ------------------


DROP TRIGGER IF EXISTS check_create_Date;
DELIMITER $$
CREATE TRIGGER check_create_Date
BEFORE DELETE ON `question`
FOR EACH ROW 
			BEGIN
				DELETE
				FROM `answer`
				WHERE QuestionID = OLD.QuestionID;
			END $$
DELIMITER ;
DELETE FROM `question` WHERE QuestionID = 9;


