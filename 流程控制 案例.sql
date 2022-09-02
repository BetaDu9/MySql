/*
1、已知表 stringcontent
其中字段：
id 自增长
content varchar(20)
向该表插入指定个数的，随机的字符串
*/

CREATE TABLE stringcontent(
id INT PRIMARY KEY AUTO_INCREMENT,
content VARCHAR(20)
);

DROP PROCEDURE IF EXISTS myp7$
DELIMITER $
CREATE PROCEDURE myp7(IN num INT)
BEGIN 
    DECLARE i INT DEFAULT 1;
    DECLARE str VARCHAR(26) DEFAULT 'abcdefghijklmnopqrstuvwxyz';
    DECLARE start_index INT DEFAULT 1;
    
    WHILE i<=num DO 
	    SET start_index= FLOOR(RAND()*26+1);
	    INSERT INTO stringcontent(content)
	    VALUES(SUBSTR(str,start_index,1));
	    SET i=i+1;
    END WHILE;
END $

