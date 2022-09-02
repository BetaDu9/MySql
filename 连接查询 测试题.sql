#1.学员email用户名
SELECT SUBSTR(email,1,INSTR(email,'@')-1)
FROM stuinfo

#2.查询男女生个数
SELECT COUNT(*)
FROM stuinfo
GROUP BY sex

#3.年龄大于18
SELECT stuName,grade_name
FROM stuinfo
JOIN grade
ON stuinfo.grade_id=grade.id
WHERE age>18

#4.
SELECT MIN(age),gradeId
FROM stuinfo
GROUP BY gradeiId
HAVING MIN(age)>20




