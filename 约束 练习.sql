/*
1.  向表 emp2 的 id 列中添加 PRIMARY KEY 约束（my_emp_id_pk）
2.  向表 dept2 的 id 列中添加 PRIMARY KEY 约束（my_dept_id_pk）
3.  向表 emp2 中添加列 dept_id，并在其中定义 FOREIGN KEY 约束，与之相关联的列是
dept2 表中的 id 列。

*/

DROP TABLE departments1;

CREATE TABLE departments1(
id INT PRIMARY KEY,
NAME VARCHAR(20)
)


INSERT INTO departments1(id,NAME)
VALUES (1,'lily'),(2,'lisa');

#改变表时添加约束
ALTER TABLE emp_5 MODIFY COLUMN employee_id INT PRIMARY KEY;
ALTER TABLE dept_3 MODIFY COLUMN department_id INT PRIMARY KEY;

#创建表时添加约束
DROP TABLE test2;
CREATE TABLE test2(
 id INT PRIMARY KEY,
 stuName VARCHAR(20) NOT NULL,
 seat INT UNIQUE,
 age INT DEFAULT 17,
 major_id INT,
 
 CONSTRAINT fk_test_major FOREIGN KEY(major_id) REFERENCES departments1(id)
)

#3.
#添加列
ALTER TABLE emp_5 ADD COLUMN dept_id INT ;

#外键添加只能通过表级约束
ALTER TABLE emp_5 ADD CONSTRAINT fk_test_dept_1 
FOREIGN KEY(dept_id) REFERENCES departments1(id); 


