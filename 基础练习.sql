#领导编号>102的领导的手下员工最低工资
SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id>102
GROUP BY manager_id
HAVING MIN(salary)>5000;

SELECT MAX(salary)-MIN(salary) difference
FROM employees

SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary)>6000;

SELECT department_id, COUNT(*),AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC;

SELECT COUNT(*) 员工个数,job_id
FROM employees
GROUP BY job_id;

SELECT COUNT(*),department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*)>2;

SELECT MAX(salary),job_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary)>12000;


#查询员工的员工名，部门名和所在城市
SELECT last_name,department_name,city
FROM employees e,departments d,locations l
WHERE e.department_id=d.department_id
AND d.location_id=l.location_id;

SELECT employee_id,job_id,last_name
FROM employees
ORDER BY department_id DESC,salary ASC;

SELECT job_id
FROM employees
WHERE job_id LIKE '%a%e%';


SELECT s.name,g.name,score
FROM student s,grade g,result r
WHERE s.gradeId=g.id
AND s.id=r.studentNo;

SELECT city,COUNT(department_id)
FROM departments d
INNER JOIN locations l
ON d.location_id=l.location_id
GROUP BY city
HAVING COUNT(*)>=3;

SELECT department_name,COUNT(*)
FROM departments d
INNER JOIN employees e
ON d.department_id=e.department_id
GROUP BY department_name
HAVING COUNT(*)>3
ORDER BY COUNT(*) DESC;

#三表连接
SELECT last_name,department_name,job_title
FROM employees e
INNER JOIN departments d ON d.department_id=e.department_id
INNER JOIN jobs j ON e.job_id=j.job_id;
ORDER BY department_name;

#外连接
SELECT d.*,e.employee_id
FROM department d
OUTER JOIN employees e
ON d.department_id=e.department_id
WHERE e.employee_id IS NULL;

SELECT city,department_name
FROM locations l 
OUTER JOIN departments d
ON l.location_id=d.location_id
WHERE l.department_id IS NULL;

SELECT b.name,bo.*
FROM beauty b
OUTER JOIN boys bo
ON b.boyfriend_name=bo.name
WHERE b.id>3;

SELECT d.department_name,e.*
FROM departments d
LEFT JOIN employees e
ON d.department_id=e.employee_id
WHERE d.department_name LIKE 'SAL%' 
OR d.department_name LIKE 'IT%';

#where与having后标量子查询
SELECT last_name, salary,job_id
FROM employees
WHERE salary=(
 SELECT MIN(salary)
 FROM employees
);


#列子查询
SELECT last_name
FROM employees
WHERE department_id IN(
  SELECT DISTINCT department_id
  FROM departments
  WHERE location_id IN(1400,1700)

);

#行子查询
SELECT d.*,(
 SELECT COUNT(*)
 FROM employees e
 WHERE e.department_id=d.department_id
) 员工个数
FROM departments d;

#from 后面子查询


#复习
#查询所有是领导的员工姓名
SELECT last_name
FROM employees
WHERE employee_id IN(
SELECT manager_id
FROM employees
)


