/*
1、创建存储过程或函数实现传入用户名和密码，插入到 admin 表中
2、创建存储过程或函数实现传入女神编号，返回女神名称和女神电话
3、创建存储存储过程或函数实现传入两个女神生日，返回大小
4、创建存储过程或函数实现传入一个日期，格式化成 xx 年 xx 月 xx 日并返回
5、创建存储过程或函数实现传入女神名称，返回：女神 and 男神 格式的字符串
如 传入 ：小昭
返回： 小昭 and 张无忌
6、创建存储过程或函数，根据传入的条目数和起始索引，查询 beauty 表的记录
*/

#1.
CREATE TABLE admin(
  NAME VARCHAR(20),
  PASSWORD INT

);

DROP TABLE admin;


DELIMITER $
CREATE PROCEDURE myp1(IN username VARCHAR(20),IN PASSWORD VARCHAR(20))
BEGIN
	INSERT INTO admin(admin.name,admin.password)
	VALUES(username,PASSWORD);
END $

DROP PROCEDURE myp1;
DROP PROCEDURE myp2;

#2.
DELIMITER $
CREATE PROCEDURE myp2(IN beautyid INT, OUT beautyname VARCHAR(20),OUT beautyphone VARCHAR(20))
BEGIN
  SELECT b.name,b.phone INTO beautyname,beautyphone
  FROM beauty b
  WHERE b.id=beautyid;

END $


#3.
DROP PROCEDURE beauty_birth;
DELIMITER $
CREATE PROCEDURE beauty_birth(IN name1 VARCHAR(20),IN name2 VARCHAR(20),OUT result VARCHAR(20))
BEGIN
  DECLARE birth1 DATETIME ;
  DECLARE birth2 DATETIME ;
  DECLARE diff INT DEFAULT 0 ;
  
  SELECT borndate INTO birth1
  FROM beauty b
  WHERE b.name=name1;
  
   SELECT borndate INTO birth2
  FROM beauty b
  WHERE b.name=name2;
  
  SELECT DATEDIFF(birth1,birth2) INTO result; 
  
END $

CALL beauty_birth('小昭','柳岩',@m);
SELECT @m;


DELIMITER $
CREATE PROCEDURE myp3(IN birthday1 DATETIME,IN birthday2 DATETIME,OUT result INT)
BEGIN
  SELECT DATEDIFF(birthday1,birthday2) INTO result;
END $


#4.创建存储过程或函数实现传入一个日期，格式化成 xx 年 xx 月 xx 日并返回
DELIMITER $
CREATE PROCEDURE date_trans(IN mydate DATETIME,OUT str VARCHAR(20))
BEGIN
  SELECT DATE_FORMAT(mydate,'%y年%m月%d日') INTO str;
END $

CALL date_trans(NOW(),@str)
SELECT @str
CALL date_trans('1997-10-4',@str);
SELECT @str

#5.创建存储过程或函数实现传入女神名称，返回：女神 and 男神 格式的字符串

DELIMITER $
DROP PROCEDURE beau_boy$
CREATE PROCEDURE beau_boy(IN name1 VARCHAR(20),OUT str VARCHAR(50))
BEGIN
  SELECT CONCAT(name1,'and',IFNULL(boyName,'null')) INTO str
  FROM boys bo
  RIGHT JOIN beauty b ON b.boyfriend_id=bo.id
  WHERE b.name=name1;
END $

CALL beau_boy('柳岩',@str)
SELECT @str

#6.创建存储过程或函数，根据传入的条目数和起始索引，查询 beauty 表的记录
DROP PROCEDURE beauty_search;
DELIMITER $
CREATE PROCEDURE beauty_search(IN startIndex INT,IN num INT)
BEGIN
  SELECT * FROM beauty LIMIT startIndex,num;
END $

CALL beauty_search(1,3);


