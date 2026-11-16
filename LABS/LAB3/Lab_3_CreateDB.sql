--create the tables
create table Course
(
CID int,
Cname varchar(100),
C_Description varchar(200),
C_fee decimal(10,2),
constraint pk_Course primary key(CID)
);

create table Module
(
Mcode int,
Mname varchar(100),
M_Description varchar(200),
NoOfCredits int,
constraint pk_Module primary key(Mcode)
);

create table Offers
(
CID int,
Mcode int,
Academic_year int,
Semester varchar(10),
constraint pk_offers primary key(CID,Mcode),
constraint fk_offers_Course foreign key(CID) references Course(CID),
constraint fk_offers_Module foreign key(Mcode) references Module(Mcode)
);

create table Student
(
SID int,
Sname varchar(100),
Address varchar(100),
dob date,
NIC varchar(10),
CID int,
constraint pk_Student primary key(SID),
constraint fk_Student foreign key(CID) references Course(CID)
);

--Using ALTER TABLE
alter table Student
add constraint chk_student_NIC check(NIC like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][Vv]');

alter table Module
add constraint chk_module_credit check(NoOfCredits in (1,2,3,4));
