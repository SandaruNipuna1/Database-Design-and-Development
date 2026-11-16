create table Employees
(
EmployeeID int,
FirstName varchar(100),
LastName varchar(100),
Place varchar(50),
Country varchar(50),
PhoneNo int
constraint pk_Employee primary key(EmployeeID)
)

create table Rooms
(
RoomID int,
RoomName varchar(100),
Capacity int,
constraint pk_Rooms primary key(RoomID)
)

create table Meetings
(
MeetingID int,
TimeFrom time,
TimeTo time,
RoomID int,
MeetingTitle varchar(100),
MeetingDate date
constraint pk_Meetings primary key(MeetingID)
constraint fk_Meetings foreign key(RoomID) references Rooms(RoomID)
)

create table EmployeesMeetings
(
EmployeeID int,
MeetingID int,
constraint pk_EmployeeMeetings primary key(EmployeeID,MeetingID),
constraint fk_EmployeeMeetings_Employees foreign key(EmployeeID) references Employees(EmployeeID),
constraint fk_EmployeeMeetings_Meetings foreign key(MeetingID) references Meetings(MeetingID)
)

--1
select m.MeetingID, m.MeetingTitle
from Meetings m
inner join Rooms r on m.RoomID = r.RoomID
where r.Capacity > 50

--2
select e.FirstName, e.LastName
from Employees e
inner join EmployeesMeetings em on e.EmployeeID = em.EmployeeID
inner join Meetings m on m.MeetingID = em.MeetingID
where m.MeetingTitle = 'Appraisal' and m.MeetingDate = '2016-08-18'

--3
select e.EmployeeID, m.MeetingTitle
from Employees e
inner join EmployeesMeetings em on e.EmployeeID = em.EmployeeID
inner join Meetings m on m.MeetingID = em.MeetingID
order by e.EmployeeID

--4
select m.MeetingTitle, count(distinct em.EmployeeID) as Total_Participants
from Meetings m
inner join EmployeesMeetings em on m.MeetingID = em.MeetingID
group by m.MeetingTitle
order by Total_Participants desc, m.MeetingTitle

--5
select r.RoomName, count(m.MeetingID) as NumberOfMeetings
from Rooms r 
left join Meetings m on r.RoomID = m.RoomID
and m.MeetingDate between '2016-08-01' and '2016-08-31'
group by r.RoomName
order by NumberOfMeetings desc

--6
select m.MeetingID, m.MeetingTitle, count(em.EmployeeID) as AttendeeCount
from Meetings m
inner join EmployeesMeetings em on m.MeetingID = em.MeetingID
group by m.MeetingID, m.MeetingTitle
having count(em.EmployeeID) > 5
order by AttendeeCount desc