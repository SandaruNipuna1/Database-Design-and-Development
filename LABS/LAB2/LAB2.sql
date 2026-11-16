--LAB 2
--Exercise 1

--A
SELECT e.eid AS EmployeeID, e.ename AS EmployeeName, w.did AS DepartmentID
FROM emp e
JOIN works w ON e.eid = w.eid

--B
select distinct w.did AS DepartmentName, e.eid AS EmployeeID
from emp e 
INNER JOIN works w ON e.eid = w.eid

--C
SELECT e.ename AS EmployeeName, d.did AS DepartmentName
FROM emp e
INNER JOIN works w ON e.eid = w.eid
INNER JOIN dept d ON w.did = d.did;

--D
select DISTINCT e.ename AS EmployeeName, e.salary
from emp e
INNER JOIN dept d ON e.eid = d.managerID
where d.budget > 1000000

--E
select DISTINCT did  AS DepartmentName
from works w
where pct_time > 40


--Exercise 2

--A
select did AS DepartmentID, COUNT(eid) AS NumberOfEmployees
from works
group by did

--B
select did AS DepartmentID, COUNT(eid) AS NumberOfEmployees
from works
group by did

--C
select did AS DepartmentID
from works
GROUP BY did
HAVING COUNT(eid) > 2

--D
select did AS DepartmentName, COUNT(eid) AS NumberOfEmployees
from works
group by did
having COUNT(eid) > 2
order by NumberOfEmployees asc
