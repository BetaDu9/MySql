/*
1、创建视图 emp_v1,要求查询电话号码以‘011’开头的员工姓名和工资、邮箱
2、要求将视图 emp_v1 修改为查询电话号码以‘011’开头的并且邮箱中包含 e 字符的员工
姓名和邮箱、电话号码
3、向 emp_v1 插入一条记录，是否可以？
4、修改刚才记录中的电话号码为‘0119’
5、删除刚才记录
6、创建视图 emp_v2，要求查询部门的最高工资高于 12000 的部门信息
7、向 emp_v2 中插入一条记录，是否可以？
8、删除刚才的 emp_v2 和 emp_v1
*/

#1.
DROP VIEW emp_v1;
CREATE VIEW emp_v1 AS
SELECT last_name,salary,email
FROM employees
WHERE phone_number LIKE '011';

#2.
DROP VIEW IF EXISTS emp_v2;

CREATE VIEW emp_v2 AS
SELECT phone_number,email
FROM employees
WHERE phone_number LIKE '011' 
AND email LIKE '%e%';

#3.
INSERT INTO emp_v1 
VALUES ('ijni',14000,'111@163.com');

DELETE FROM emp_v1
WHERE email='111@163.com';

#4.
UPDATE emp_v2 SET phone_number=12094444;

#6.
DROP VIEW emp_v4;
CREATE OR REPLACE VIEW emp_v4
AS
SELECT MAX(salary) mx,department_id 
FROM employees 
GROUP BY department_id

SELECT * 
FROM departments d
JOIN emp_v4
ON d.department_id=emp_v4.department_id
WHERE emp_v4.mx >12000;

