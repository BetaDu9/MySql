/*
1. 查询工资最低的员工信息: last_name, salary
2. 查询平均工资最低的部门信息
3. 查询平均工资最低的部门信息和该部门的平均工资
4. 查询平均工资最高的 job 信息
5. 查询平均工资高于公司平均工资的部门有哪些?
6. 查询出公司中所有 manager 的详细信息.
7. 各个部门中 最高工资中最低的那个部门的 最低工资是多少
8. 查询平均工资最高的部门的 manager 的详细信息: last_name, department_id, email,
salary
*/

#1.
SELECT last_name,salary
FROM employees
WHERE salary=(
	SELECT MIN(salary)
	FROM employees
)

#3.表子查询，连接查询
 SELECT d.*,ag
 FROM departments d
 JOIN(
	 SELECT department_id,AVG(salary) ag
	 FROM employees
	 GROUP BY department_id
	 ORDER BY AVG(salary)
	 LIMIT 1 

 ) ag_dep
 ON ag_dep.department_id= d.department_id;
 
 #4.
 SELECT j.*
 FROM jobs j
 WHERE j.job_id=(
	 SELECT job_id
	 FROM employees
	 GROUP BY job_id
	 ORDER BY AVG(salary) DESC
	 LIMIT 1
 )
 
 #5.
 
 SELECT department_id,AVG(salary) ag
 FROM employees e
 GROUP BY department_id
 HAVING ag>(
	 SELECT AVG(salary)
	 FROM employees
 
 )

#6. 查询出公司中所有 manager 的详细信息.
  SELECT e.*
  FROM employees e
  WHERE e.employee_id IN(
	  SELECT DISTINCT manager_id
	  FROM employees
 
  )
 
 #7. 各个部门中最高工资中最低的那个部门的 最低工资是多少

 
 SELECT MIN(salary)
 FROM employees 
 WHERE department_id=(
	 SELECT department_id
	 FROM employees
	 GROUP BY department_id
	 ORDER BY MAX(salary)
	 LIMIT 1
 ) 
 
#8. 查询平均工资最高的部门的 manager 的详细信息: last_name, department_id, email,salary
 
SELECT last_name, department_id, email,salary
FROM employees
WHERE employee_id=(
	SELECT manager_id
	FROM departments d
	WHERE d.department_id=(
		SELECT department_id
		FROM employees
		GROUP BY department_id
		ORDER BY MAX(salary) DESC
		LIMIT 1
	)
)
