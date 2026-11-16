--TUTORIAL 1

--1
SELECT FirstName
FROM Employees
WHERE Country = 'India'
AND LastName LIKE 'K%';

--2
SELECT RoomName
FROM Rooms
WHERE Capacity > 50

--3
SELECT MeetingID
FROM Meetings
WHERE DATEDIFF(HOUR, TimeFrom, TimeTo) > 3;

--4
SELECT RoomID
FROM Rooms
WHERE Capacity > 50;

--5
SELECT MAX(Capacity) AS higest_capacity, MIN(Capacity) AS lowest_capacity
FROM Rooms;

--6
SELECT COUNT(EmployeeID) AS number_of_employees_from_india
FROM Employees
WHERE Country = 'india';

--7
SELECT COUNT(EmployeeID) AS number_of_employees
FROM Employees
GROUP BY Country;

--8
SELECT Country
FROM Employees
GROUP BY Country
HAVING COUNT(EmployeeID) > 20;

--9
SELECT MeetingTitle, COUNT(DISTINCT RoomID) AS number_of_rooms
FROM Meetings
GROUP BY MeetingTitle;

--10
SELECT MeetingTitle
FROM Meetings
GROUP BY MeetingTitle
HAVING COUNT(DISTINCT RoomID) > 1;