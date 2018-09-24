drop procedure if exists p111;

delimiter //
CREATE PROCEDURE p111(IN id INT UNSIGNED,IN name VARCHAR(11))
BEGIN
SET @SqlCmd = 'SELECT * FROM newsal ';
IF id IS NOT NULL THEN
SET @SqlCmd = CONCAT(@SqlCmd , 'WHERE emp_no=?');
PREPARE stmt FROM @SqlCmd;
SET @a = id;
EXECUTE stmt USING @a;
END IF;
END;
//

CALL p111(10001,'ww');

