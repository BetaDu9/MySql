#1.case语句
#作为独立语句，区间判断  输入成绩显示等级
DELIMITER $
CREATE PROCEDURE myp1(IN grade INT)
BEGIN
	CASE 
	WHEN grade>=90 AND grade<=100 THEN SELECT 'A';
	WHEN grade>=80 THEN SELECT 'B';
	WHEN grade>=60 THEN SELECT 'C';
	ELSE SELECT 'D';
	END CASE;
	
END $

#2.使用if结构
DELIMITER $
CREATE FUNCTION func2(score INT) RETURNS CHAR
BEGIN
IF score>=90 AND score<=100 THEN RETURN 'A';
ELSEIF score>=80 THEN RETURN 'B';
ELSEIF score>=60 THEN RETURN 'c';
ELSE RETURN 'D';
END IF;
END $

#循环结构
#1.while结构 根据次数批量插入
DROP TABLE admin;
CREATE TABLE admin(
username VARCHAR(20),
PASSWORD VARCHAR(20)

);

DELIMITER $
CREATE PROCEDURE myp8(IN num INT)
BEGIN
	DECLARE i INT DEFAULT 1;
	WHILE i<=num DO
	INSERT INTO admin(username,PASSWORD)
	VALUES(CONCAT('lily',i),'9999');
	SET i=i+1;
     END WHILE;

END $

#2.循环控制语句leave
DROP PROCEDURE myp9;
DELIMITER $
CREATE PROCEDURE myp9(IN num INT)
BEGIN
DECLARE i INT DEFAULT 1;
a:WHILE i<=num DO
	INSERT INTO admin(username,PASSWORD)
	VALUES(CONCAT('lily',i),'9999');
	IF i>num THEN LEAVE a;
	END IF;
	
	SET i=i+1;
    END WHILE;
END $

CALL myp9(20);

#3.iterate语句，相当于continue  只插入偶数次数据
DELIMITER $
CREATE PROCEDURE myp10(IN num INT)
BEGIN
DECLARE i INT DEFAULT 0;
a:WHILE i<=num  DO
	SET i=i+1;
	IF MOD(i,2)!=0
	THEN ITERATE a;
	END IF;
	INSERT INTO admin(username,PASSWORD)
	VALUES(CONCAT('lily',i),'9999');	
    END WHILE a;
END $

CALL myp10(10);

