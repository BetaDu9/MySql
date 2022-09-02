/*
一、查询每个专业的学生人数
二、查询参加考试的学生中，每个学生的平均分、最高分
三、查询姓张的每个学生的最低分大于60的学号、姓名
四、查询专业生日在“1988-1-1”后的学生姓名、专业名称
五、查询每个专业的男生人数和女生人数分别是多少
六、查询专业和张翠山一样的学生的最低分
七、查询大于60分的学生的姓名、密码、专业名
八、按邮箱位数分组，查询每组的学生个数
九、查询学生名、专业名、分数
十、查询哪个专业没有学生，分别用左连接和右连接实现
十一、查询没有成绩的学生人数

*/

#1.查询每个专业的学生人数
SELECT COUNT(*),major_id
 FROM students 
 GROUP BY major_id;
 
#2. 查询参加考试的学生中，每个学生的平均分、最高分
 SELECT student_name,MAX(score),AVG(score)
 FROM scores
 GROUP BY student_id
 
 #3.查询姓张的每个学生的最低分大于60的学号、姓名
 SELECT student_id,student_name,MIN(60)
 FROM scores s
 JOIN students st ON st.id=s.student_id
 GROUP BY s.student_id
 HAVING MIN(score)>60
 
 #4.查询生日在“1988-1-1”后的学生姓名、专业名称
 SELECT student_name,major_name
 FROM students s
 JOIN majors m ON m.id=s.major_id
 WHERE DATEDIFF('1988-1-1',birthday)>0
 
  #5.查询每个专业的男生人数和女生人数分别是多少
  SELECT COUNT(*),sex,major_id
  FROM students
  GROUP BY major_id,sex

  #6.查询专业和张翠山一样的学生的最低分
  SELECT MIN(score),student_name,major_name
  FROM students s 
  LEFT JOIN majors m ON s.major_id=m.id
  WHERE s.major_id=
  (
	SELECT major_id
	FROM students
	WHERE student_name='张翠山'
  )
 
  #7.查询大于60分的学生的姓名、密码、专业名
  SELECT student_name,PASSWORD,major_name
  FROM students s
  LEFT JOIN majors m ON s.major_id=m.id
  LEFT JOIN scores sc ON s.id=sc.student_id
  WHERE sc.score>60
 

  #8.按邮箱位数分组，查询每组的学生个数
  SELECT COUNT(*),LENGTH(email) 
  FROM students s
  GROUP BY LENGTH(email)  
   
 
 #9.查询学生名、专业名、分数
  SELECT s.student_name,sc.score,m.major_name
  FROM students s
  LEFT JOIN majors m ON s.major_id=m.id
  LEFT JOIN scores sc ON s.id=sc.student_id

 #10.查询哪个专业没有学生，分别用左连接和右连接实现
 SELECT major_name,major_id,studentno
 FROM majors m
 LEFT JOIN students s
 WHERE s.studentno IS NULL
 
 SELECT major_name,major_id,studentno
 FROM students s
 LEFT JOIN majors m
 WHERE s.studentno IS NULL
 
 
 #11.查询没有成绩的学生人数
 SELECT COUNT(*)
 FROM students s
 LEFT JOIN scores sc ON s.studentno=sc.studentno
 WHERE sc.studentno IS NULL
 
 
 
 
 
 
 
 
