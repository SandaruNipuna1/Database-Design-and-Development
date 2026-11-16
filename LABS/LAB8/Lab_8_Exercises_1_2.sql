--Exercise 1
-- a. List employees whose salary is greater than the salary of 'Lakmal'
SELECT eid,ename,salary
FROM emp
WHERE salary>
			(SELECT salary
			FROM emp
			WHERE ename='Lakmal')

-- b. Show the eid, ename, salary of employees whose salary equals the minimum salary
--    in the company.SELECT eid,ename,salaryFROM empWHERE salary =			(SELECT MIN(salary)			FROM emp)-- c. Display departments (did) whose budget is greater than the average salary of all
--    employeesSELECT * from deptSELECT * from empSELECT * from worksSELECT didFROM dept WHERE budget >			(SELECT AVG(salary)			FROM emp)-- d. List employees whose salary is not equal to the average salary of all employees.SELECT eid,enameFROM empWHERE salary<>			(SELECT AVG(salary)			FROM emp)-- e. Display employees whose salary is less than the salary of the manager of department
--   'ITSD'.
SELECT e.eid,e.ename
FROM emp e
WHERE e.salary<
			(SELECT e.salary
			FROM emp e, dept d
			WHERE d.managerid=e.eid AND d.did='ITSD')


-- Exercise 2

-- a. List employees who work in any department whose budget ≥ 1,000,000. (Hint: Use IN
--    Operator)

SELECT DISTINCT e.eid,e.ename,e.salary
FROM emp e,works w
WHERE w.eid=e.eid AND w.did IN 
							(SELECT did
							FROM dept
							WHERE budget >= 1000000)


-- b. Display employees who are not working in the ‘Academic’ or ‘Admin departments.

SELECT DISTINCT e.eid,e.ename,w.did
FROM emp e,works w
WHERE e.eid=w.eid AND
w.did NOT IN 
			(SELECT did
			FROM dept
			WHERE did IN ('Academic', 'Admin'));


-- c. List employees whose salary is greater than ALL employee salaries in 'Admin'

SELECT eid, ename, salary
FROM emp
WHERE salary > ALL (
    SELECT e.salary
    FROM emp e, works w
    WHERE e.eid = w.eid
      AND w.did = 'Admin'
);

-- d. List employees whose salary is greater than ANY salary of employees who work in
--    'Finance'.
SELECT eid, ename, salary
FROM emp
WHERE salary > ANY (
    SELECT e.salary
    FROM emp e,works w
    WHERE e.eid = w.eid AND w.did = 'Finance');

-- e. Show department IDs where ALL assigned employees have salary ≥ 30,000.


SELECT d.did
FROM dept d
WHERE EXISTS (SELECT 1 FROM works w WHERE w.did = d.did) 
  AND NOT EXISTS (
    SELECT 1
    FROM works w
    JOIN emp e ON w.eid = e.eid
    WHERE w.did = d.did
      AND e.salary < 30000
);









			
