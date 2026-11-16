--IN-CLASS-ACTIVITY

--1
SELECT e.ename
FROM emp e
INNER JOIN dept d 
ON e.eid = d.managerId
WHERE d.did = 'Finance'

--2
SELECT ename, age 
FROM emp e
INNER JOIN works w
ON e.eid = w.eid
WHERE w.did LIKE 'A%'

--3
SELECT DISTINCT ename, salary  
FROM emp e
INNER JOIN works w
ON e.eid = w.eid
WHERE w.did LIKE 'A%'

--4
SELECT d.did AS DepartmentName, e.ename AS ManagerName
FROM emp e
INNER JOIN dept d
ON e.eid = d.managerId

--5
SELECT DISTINCT e.ename, d.managerId
FROM emp e
INNER JOIN works w
ON e.eid = w.eid
INNER JOIN dept d
ON w.did = d.did
WHERE e.salary > 75000 

--6
SELECT e.ename AS employeeName, SUM(w.pct_time) AS total_percentage
FROM emp e
INNER JOIN works w
ON e.eid = w.eid
GROUP BY e.ename;

--7
SELECT e.ename
FROM emp e
INNER JOIN works w
ON e.eid = w.eid
GROUP BY e.ename
HAVING SUM(w.pct_time) > 90

--8
SELECT d.did, COUNT(w.eid) AS numberOfEmployees
FROM dept d
LEFT OUTER JOIN works w
ON d.did = w.did
GROUP BY d.did

--9
SELECT d.did AS departmentName, e.ename AS nameOfEmpolyee
FROM dept d
LEFT OUTER JOIN works w
ON d.did = w.did
LEFT OUTER JOIN emp e
ON e.eid = w.eid
ORDER BY d.did, e.ename;

--10
SELECT d.did AS departmentName
FROM dept d
INNER JOIN works w
ON d.did = w.did
INNER JOIN emp e ON w.eid = e.eid
GROUP BY d.did
HAVING SUM(e.salary) > 100000
