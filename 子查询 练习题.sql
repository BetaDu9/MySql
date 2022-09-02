#子查询作业
/*1.  查询和 Zlotkey 相同部门的员工姓名和工资
2.  查询工资比公司平均工资高的员工的员工号，姓名和工资。
3.  查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资
4.  查询与姓名中包含字母 u 的员工在相同部门的员工的员工号和姓名
5. 查询在部门的 location_id 为 1700 的部门工作的员工的员工号
6. 查询管理者是 King 的员工姓名和工资
7. 查询工资最高的员工的姓名，要求 first_name 和 last_name 显示为一列，列名为 姓.名
*/

#1.
SELECT employee_id,last_name,salary,department_id
FROM employees
WHERE department_id=(
SELECT department_id
FROM employees
WHERE last_name='zlotkey'
);

#2.
SELECT employee_id,last_name,salary
FROM employees
WHERE salary>(
    SELECT AVG(salary)
    FROM employees

)

#3.
SELECT employee_id,last_name,salary
FROM employees e
INNER JOIN (
  SELECT AVG(salary) a,department_id
  FROM employees
  GROUP BY department_id
) av
ON e.`department_id`=av.department_id
WHERE e.`salary`>av.a

#4.
SELECT last_name,employee_id,department_id
FROM employees e
WHERE department_id IN(
SELECT department_id
FROM employees e
WHERE e.`last_name` LIKE '%u%'
)

#5.
SELECT employee_id
FROM employees e
WHERE e.`department_id`IN(

	SELECT department_id
	FROM departments d
	WHERE d.location_id=1700
);

#6.
SELECT last_name,salary,manager_id
FROM employees e
WHERE e.`manager_id` IN(
  SELECT employee_id
  FROM employees m
  WHERE m.`last_name`='k_ing'

)

#7.
SELECT CONCAT(first_name,' ',last_name) 姓名
FROM employees
WHERE salary=(
	SELECT MAX(salary)
	FROM employees
)