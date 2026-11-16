--IN CLASS ACTIVITY
--1
CREATE TABLE Emp
(
eid INT PRIMARY KEY,
ename VARCHAR(100) NOT NULL,
age INT,
salary DECIMAL(10,2) CHECK (salary > 0)
);

--2
CREATE TABLE Dept
(
did VARCHAR(10) PRIMARY KEY,
budget DECIMAL(10,2),
managerId INT,
FOREIGN KEY (managerId) REFERENCES Emp(eid)
);

--3
CREATE TABLE WORKS
(
eid INT,
did VARCHAR(10),
pct_time INT,
PRIMARY KEY (eid, did),
FOREIGN KEY (eid) REFERENCES Emp(eid),
FOREIGN KEY (did) REFERENCES Dept(did),
);

--4
INSERT INTO Emp (eid, ename, age, salary)
VALUES (100, 'Ruwan', 33, 40000);

--5
ALTER TABLE Emp 
ADD hireDate DATE 
DEFAULT GETDATE();

--6
UPDATE Emp
SET hireDate = '2010-01-01'
WHERE eid = 100;

--7
DELETE FROM Emp
WHERE eid = 100

--8
ALTER TABLE Emp
DROP COLUMN hireDate;

--9
DROP TABLE Emp

--10
SELECT ename, salary
FROM Emp

--11
SELECT ename, salary
FROM Emp
ORDER BY salary DESC

--12
SELECT ename, salary
FROM Emp
WHERE (salary > 50000)

--13
SELECT ename,salary
FROM Emp
WHERE ename LIKE 'S%'

--14
SELECT MAX(salary) AS maximum_salary, MIN(salary) AS minimum_salary 
FROM Emp

--15
SELECT eid, pct_time
FROM Works

--16
SELECT did AS Department, COUNT(eid) AS number_of_employees
FROM Works
GROUP BY did;

--17
SELECT eid
FROM Works
WHERE pct_time > 90





