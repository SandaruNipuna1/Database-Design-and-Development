--SECTION 1
--A

SELECT * 
FROM emp

--B
SELECT ename,salary
FROM emp
WHERE salary > 50000

--C
SELECT *
FROM emp
WHERE ename LIKE 'A%'

--D
SELECT ename,age
FROM emp
WHERE age < 30

--E
SELECT *
FROM emp
WHERE salary BETWEEN 20000 AND 60000

--F
SELECT ename
FROM emp
WHERE ename LIKE '%a%'

--G
SELECT ename,eid
FROM emp
WHERE age IN (24, 28)

--H
SELECT *
FROM emp
WHERE age NOT BETWEEN 25 AND 35

--I
SELECT *
FROM emp
WHERE salary IS NOT NULL

--SECTION 2 
--A
SELECT *
FROM emp
ORDER BY ename

--B
SELECT *
FROM emp
ORDER BY salary DESC

--C
SELECT *
FROM emp
ORDER BY age,salary DESC

--D
SELECT *
FROM dept
ORDER BY budget DESC

--E
SELECT * 
FROM works
ORDER BY pct_time

--SECTION 3
--A
SELECT COUNT(eid) AS number_of_employees
FROM emp

--B
SELECT SUM(salary) AS total_salary
FROM emp

--C
SELECT MAX(salary) AS maximum_salary
FROM emp

SELECT MIN(salary) AS minumum_salary
FROM emp

--D
SELECT AVG(salary) AS average_salary
FROM emp

--E
SELECT COUNT(*) AS num_employees_below_30 
FROM emp
WHERE age<30

--F
SELECT COUNT(did) AS number_of_departments
FROM dept

--G
SELECT MAX(budget) AS maximum_budget
FROM dept

SELECT MIN(budget) AS minimum_budget
FROM dept

--H
SELECT SUM(pct_time) AS total_percentage
FROM works

--I
SELECT AVG(pct_time) AS average_work_time
FROM works

--SECTION 4
--A
SELECT age,SUM(salary) AS total_salary
FROM emp
GROUP BY age
ORDER BY age

--B
SELECT COUNT(eid) AS 'Number of Employees'
FROM emp

--C
SELECT COUNT(salary) AS 'Num of Emps Salary Greater than 50000'
FROM emp
WHERE salary > 50000

--D
SELECT *
FROM emp
WHERE salary > 50000
ORDER BY salary ASC

--SECTION 5
--A
SELECT did, COUNT(eid) AS 'Number of Employees'
FROM works
GROUP BY did
HAVING COUNT(eid) < 3

--B
SELECT managerid, COUNT(did) AS 'No of Dept'
FROM dept
GROUP BY managerid
HAVING COUNT(did)>1

--C
SELECT age, AVG(salary) AS avg_salary
FROM emp
GROUP BY age
HAVING AVG(salary) > 40000

--D
SELECT eid,COUNT(pct_time) AS more_than_two_assignments
FROM works
GROUP BY eid
HAVING COUNT(pct_time)>2

--E
SELECT did, SUM(budget) AS total_budget
FROM dept
GROUP BY did
HAVING SUM(budget)>1000000











