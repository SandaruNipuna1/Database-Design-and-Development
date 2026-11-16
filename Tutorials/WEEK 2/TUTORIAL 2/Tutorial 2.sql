--Tutorial 2

--1
create table Employee
(
eid varchar(10) primary key,
ename varchar(100) NOT NULL,
salary decimal(10,2) check (salary > 0),
dept int,
phone varchar(10),
)

create table Department
(
deptNo int primary key,
dname varchar(100),
location varchar(20) check (location in('colombo','kandy','galle')),
mgrID varchar(10),
)

--2
insert into Employee(eid, ename, salary, dept, phone)
values('E0001', 'Kumari', 45000, 3, '0112123456'),
('E0002', 'Anushka', 63000, 1, '0112123457'),
('E0003', 'Anura', 27000, 2, '0112123458'),
('E0004', 'Niranjala', 36000, 3, '0112123459'),
('E0005', 'Sampath', 50000, 1, '0112123450')

--3
insert into Department(deptNo, dname, location, mgrID)
values(1, 'Administration', 'Colombo', 'E0002'),
(2, 'Sales', 'Kandy', 'E0002'),
(3, 'Finance', 'Colombo', 'E0005')

--4
alter table Employee
add constraint fk_dept
foreign key(dept) references Department(deptNo)

alter table Department
add constraint fk_emp
foreign key(mgrID) references Employee(eid)

--5
alter table employee 
add bdate DATE

--6
update employee
set salary = 35000
where ename = 'Kumari'

--7
SELECT eid FROM Employee WHERE ename = 'Sampath';
UPDATE Department
SET mgrID = NULL
WHERE mgrID = 'E0005';
DELETE FROM Employee
WHERE ename = 'Sampath';

--8
select ename, salary
from Employee
ORDER BY ename ASC

--9
select ename
from Employee
where salary > 50000

--10
select e.ename AS EmployeeName, d.deptNo AS DepartmentID
from Employee e 
INNER JOIN Department d
ON e.eid = d.mgrID







