/*
DML 数据操纵语言
增删改
1.  运行以下脚本创建表 my_employees
Create table my_employees(
Id int(10),
First_name varchar(10),
Last_name varchar(10),
Userid varchar(10),
Salary double(10,2)
)
create table users(
id int,
userid varchar(10),
department_id int
)
2.  显示表 my_employees 的结构
3.  向 my_employees 表中插入下列数据
4.  向 users 表中插入数据
*/

CREATE TABLE my_employees(
Id INT(10),
First_name VARCHAR(10),
Last_name VARCHAR(10),
Userid VARCHAR(10),
Salary DOUBLE(10,2)
);

CREATE TABLE users(
id INT,
userid VARCHAR(10),
department_id INT
)

#3.
DESC my_employees;

TRUNCATE TABLE my_employees;

INSERT INTO my_employees(ID,FIRST_NAME,LAST_NAME,USERID,SALARY)
VALUES(1,'patel','ralph','rpatel',895);

INSERT INTO my_employees
SELECT 2,'Dancs','Betty','Bdancs',860 UNION
SELECT 3,'biri','Ben','Bbiri',1100;

#4.
INSERT INTO users
VALUES(1,'Rpatel',10),
      (2,'Bdancs',10),
      (3,'Bbiri',20)
#5.
/*5.  将 3 号员工的 last_name 修改为“drelxer”
6.  将所有工资少于 900 的员工的工资修改为 1000
7.  将 userid 为 Bbiri 的 user 表和 my_employees 表的记录全部删除
8.  删除所有数据
9.  检查所作的修正
10. 清空表 my_employees
*/

UPDATE my_employees
SET last_name='alexandar' WHERE ID=3;

#6.
UPDATE my_employees
SET salary=1000 WHERE salary<900;

#7.
DELETE e,u
FROM my_employees e
JOIN users u ON e.userid=u.`userid`
WHERE u.userid='Bbiri';

#8.
DELETE FROM users;
DELETE FROM my_employees;

SELECT * FROM my_employees;


