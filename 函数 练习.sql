#返回两个float之和
DELIMITER $
CREATE FUNCTION func1(f1 FLOAT,f2 FLOAT) RETURNS FLOAT
BEGIN 
   DECLARE SUM FLOAT DEFAULT 0;
   SET SUM= f1+f2;
   RETURN SUM;
END $

SHOW CREATE FUNCTION func1 $

#1.无参有返 返回公司员工个数
DELIMITER $
CREATE FUNCTION func2() RETURNS INT
BEGIN 
   DECLARE num INT DEFAULT 0;
   SELECT COUNT(*) INTO num
   FROM employees;
   RETURN num;
END $

#2.有参有返
#返回某个部门的平均工资
DELIMITER $
CREATE FUNCTION func3(deptID INT) RETURNS DOUBLE
BEGIN 
   DECLARE num DOUBLE DEFAULT 0;
   SELECT AVG(salary) INTO num
   FROM employees e
   JOIN departments d ON d.department_id=e.department_id
   WHERE d.department_id=deptID;
   RETURN num;
END $
