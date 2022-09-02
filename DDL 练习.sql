/*
1.  创建表 dept1
name  Null?  type
id           int(7)
name         varchar(25)
2.  将表 departments 中的数据插入新表 dept2 中
3.  创建表 emp5
name  Null?  type
id  int(7)
First_name  Varchar (25)
Last_name  Varchar(25)
Dept_id  int(7)
4.  将列 Last_name 的长度增加到 50
5.  根据表 employees 创建 employees2
6.  删除表 emp5
7.  将表 employees2 重命名为 emp5
8 在表 dept 和 emp5 中添加新列 test_column，并检查所作的操作
9.直接删除表 emp5 中的列 dept_id

*/
#创建表
USE test;
CREATE TABLE departments1(
id INT(7),
NAME VARCHAR(25)

)

CREATE TABLE departments2(
id INT(7),
first_name VARCHAR(25),
last_name VARCHAR(25),
dept_id INT(7)
)

#修改列类型
ALTER TABLE departments2 MODIFY COLUMN last_name VARCHAR(50);
#删除表
DROP TABLE departments2;


#部分复制表结构数据
CREATE TABLE dept_3
SELECT department_id,department_name 
FROM myemployees.`departments`;

#复制表的结构
CREATE TABLE emp_2 LIKE myemployees.employees;
#重命名
ALTER TABLE emp_2 RENAME TO emp_5;
#添加列
ALTER TABLE emp_5 ADD COLUMN test_column VARCHAR(20);
#删除列
ALTER TABLE emp_5 DROP COLUMN test_column ;
#显示表
SHOW TABLES;



