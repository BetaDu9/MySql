/*
1.查询名字中包含a字符的员工名、部门名和工种信
息
2.查询各部门的平均工资级别
3.查询平均工资最低的部门信息
4.查询平均工资最低的部门名和工资
*/

#1.
CREATE VIEW myv1 AS
SELECT e.`last_name`,department_name,j.*
FROM employees e
JOIN departments d ON e.`department_id`=d.`department_id`
JOIN jobs j ON e.`job_id`=j.`job_id`

SELECT * FROM myv1 WHERE myv1.`last_name` LIKE '%a%';

#2.
DROP VIEW myv2;

CREATE VIEW myv2 AS
SELECT e.department_id,AVG(salary)
FROM employees e
GROUP BY department_id

SELECT myv2.`department_id`,g.grade_level 
FROM myv2
JOIN job_grades g
ON myv2.`avg(salary)` BETWEEN g.lowest_sal AND g.highest_sal;

#4.
DROP VIEW myv3;
CREATE VIEW myv3 AS
SELECT e.department_id,AVG(salary) ag
FROM employees e
GROUP BY department_id;

SELECT department_name,ag
FROM departments d
JOIN myv3
ON d.department_id=myv3.`department_id`
ORDER BY ag LIMIT 1;




