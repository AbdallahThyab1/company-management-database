Drop database if exists company_db;
CREATE DATABASE company_db;
USE company_db;
-- =========================
-- DEPARTMENT
-- =========================
CREATE TABLE DEPARTMENT (
  Dname VARCHAR(30),
  Dnumber INT,
  Mgr_ssn CHAR(9),
  Mgr_start_date DATE,
  PRIMARY KEY (Dnumber)
);

-- =========================
-- EMPLOYEE
-- =========================
CREATE TABLE EMPLOYEE (
  Fname VARCHAR(20),
  Minit CHAR(1),
  Lname VARCHAR(20),
  Ssn CHAR(9),
  Bdate DATE,
  Address VARCHAR(100),
  Sex CHAR(1),
  Salary DECIMAL(10,2),
  Super_ssn CHAR(9),
  Dno INT,
  PRIMARY KEY (Ssn),
  FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn),
  FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber)
);

-- =========================
-- ADD FK FOR MANAGER
-- =========================
ALTER TABLE DEPARTMENT
ADD CONSTRAINT fk_mgr
FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn);

-- =========================
-- DEPT_LOCATIONS
-- =========================
CREATE TABLE DEPT_LOCATIONS (
  Dnumber INT,
  Dlocation VARCHAR(30),
  PRIMARY KEY (Dnumber, Dlocation),
  FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber)
);

-- =========================
-- PROJECT
-- =========================
CREATE TABLE PROJECT (
  Pname VARCHAR(30),
  Pnumber INT,
  Plocation VARCHAR(30),
  Dnum INT,
  PRIMARY KEY (Pnumber),
  FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber)
);

-- =========================
-- WORKS_ON
-- =========================
CREATE TABLE WORKS_ON (
  Essn CHAR(9),
  Pno INT,
  Hours DECIMAL(4,1),
  PRIMARY KEY (Essn, Pno),
  FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn),
  FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber)
);

-- =========================
-- DEPENDENT
-- =========================
CREATE TABLE DEPENDENT (
  Essn CHAR(9),
  Dependent_name VARCHAR(20),
  Sex CHAR(1),
  Bdate DATE,
  Relationship VARCHAR(20),
  PRIMARY KEY (Essn, Dependent_name),
  FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn)
);

-- =========================
-- INSERT DEPARTMENT (Mgr_ssn NULL)
-- =========================
INSERT INTO DEPARTMENT VALUES
('Research',1,NULL,'2015-01-01'),
('Sales',2,NULL,'2016-02-01'),
('IT',3,NULL,'2017-03-01'),
('HR',4,NULL,'2018-04-01'),
('Finance',5,NULL,'2019-05-01'),
('Marketing',6,NULL,'2020-06-01'),
('Support',7,NULL,'2021-07-01'),
('Logistics',8,NULL,'2014-08-01'),
('Operations',9,NULL,'2013-09-01'),
('Management',10,NULL,'2012-10-01');

-- =========================
-- INSERT EMPLOYEE
-- =========================
INSERT INTO EMPLOYEE VALUES
('John','A','Smith','111111111','1985-01-01','Houston','M',5000,NULL,1),
('Sara','B','Johnson','222222222','1988-02-02','Dallas','F',5200,'111111111',2),
('Mike','C','Brown','333333333','1990-03-03','Austin','M',4800,'111111111',3),
('Lina','D','White','444444444','1992-04-04','Miami','F',4700,'222222222',4),
('Omar','E','Davis','555555555','1986-05-05','Chicago','M',5300,'222222222',5),
('Noor','F','Wilson','666666666','1991-06-06','Boston','F',4900,'333333333',6),
('Ali','G','Moore','777777777','1984-07-07','Seattle','M',5500,'333333333',7),
('Mona','H','Taylor','888888888','1993-08-08','Denver','F',4600,'444444444',8),
('Yousef','I','Anderson','999999999','1987-09-09','Phoenix','M',5100,'444444444',9),
('Huda','J','Thomas','101010101','1994-10-10','LA','F',4500,'555555555',10);
INSERT INTO company_db.employee
(Ssn, Fname, Lname, Sex, Salary, Dno) VALUES (999999, 'Test', 'HighSalary', 'M', 9000, 1);
DELETE FROM company_db.employee e WHERE e.Ssn = 999999;
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
-- =========================
-- UPDATE MANAGERS
-- =========================
UPDATE DEPARTMENT SET Mgr_ssn='111111111' WHERE Dnumber=1;
UPDATE DEPARTMENT SET Mgr_ssn='222222222' WHERE Dnumber=2;
UPDATE DEPARTMENT SET Mgr_ssn='333333333' WHERE Dnumber=3;
UPDATE DEPARTMENT SET Mgr_ssn='444444444' WHERE Dnumber=4;
UPDATE DEPARTMENT SET Mgr_ssn='555555555' WHERE Dnumber=5;
UPDATE DEPARTMENT SET Mgr_ssn='666666666' WHERE Dnumber=6;
UPDATE DEPARTMENT SET Mgr_ssn='777777777' WHERE Dnumber=7;
UPDATE DEPARTMENT SET Mgr_ssn='888888888' WHERE Dnumber=8;
UPDATE DEPARTMENT SET Mgr_ssn='999999999' WHERE Dnumber=9;
UPDATE DEPARTMENT SET Mgr_ssn='101010101' WHERE Dnumber=10;

-- =========================
-- INSERT DEPT_LOCATIONS
-- =========================
INSERT INTO DEPT_LOCATIONS VALUES
(1,'Houston'),(2,'Dallas'),(3,'Austin'),(4,'Miami'),(5,'Chicago'),
(6,'Boston'),(7,'Seattle'),(8,'Denver'),(9,'Phoenix'),(10,'LA');

-- =========================
-- INSERT PROJECT
-- =========================
INSERT INTO PROJECT VALUES
('AI System',1,'Houston',1),
('Sales App',2,'Dallas',2),
('ERP',3,'Austin',3),
('Recruitment',4,'Miami',4),
('Accounting',5,'Chicago',5),
('Ads Campaign',6,'Boston',6),
('Help Desk',7,'Seattle',7),
('Delivery System',8,'Denver',8),
('Workflow',9,'Phoenix',9),
('Strategy Plan',10,'LA',10);

-- =========================
-- INSERT WORKS_ON
-- =========================
INSERT INTO WORKS_ON VALUES
('111111111',1,20),('222222222',2,15),('333333333',3,25),
('444444444',4,10),('555555555',5,30),('666666666',6,18),
('777777777',7,22),('888888888',8,12),('999999999',9,28),
('101010101',10,16);

-- =========================
-- INSERT DEPENDENT
-- =========================
INSERT INTO DEPENDENT VALUES
('111111111','Anna','F','2010-01-01','Daughter'),
('222222222','Mark','M','2011-02-02','Son'),
('333333333','Lara','F','2012-03-03','Daughter'),
('444444444','Omar','M','2013-04-04','Son'),
('555555555','Nour','F','2014-05-05','Daughter'),
('666666666','Adam','M','2015-06-06','Son'),
('777777777','Sara','F','2016-07-07','Daughter'),
('888888888','Yara','F','2017-08-08','Daughter'),
('999999999','Ali','M','2018-09-09','Son'),
('101010101','Maya','F','2019-10-10','Daughter');



select * from company_db.employee;


select concat(e.Fname ,' ' , e.Lname) AS `Full Name` , e.Salary AS 'Salary' from company_db.employee e; 

select * from company_db.employee e where e.Salary > 5000; 

select concat(e.Fname ,' ' , e.Lname) AS `Full Name` , e.Salary AS 'Salary' from company_db.employee e
where e.Salary > 4800 And e.Sex = 'M'; 

select * from company_db.employee e where e.Dno in (1,3,5);

select concat(e.Fname ,' ' , e.Lname) AS `Full Name` , e.Salary AS `Salary` from company_db.employee e
where e.Salary between 4500 and 5200; 

select * from company_db.employee e where NOT (e.Fname like 'A%');

select concat(e.Fname ,' ' , e.Lname) AS `Full Name` , e.Salary AS `Salary` from company_db.employee e
order by e.Salary desc;

-- First Method : 
select concat(e.Fname ,' ' , e.Lname) AS `Full Name` , e.Salary AS `Salary` from company_db.employee e
where e.Salary = (select max(e2.Salary) from company_db.employee e2);
-- Second Mehod : 
select concat(e.Fname ,' ' , e.Lname) AS `Full Name` , e.Salary AS `Salary` from company_db.employee e
order by Salary desc
limit 1;

select count(e.Ssn) AS `Number Of Employee` from company_db.employee e;

select e.Dno AS `Department Number` , count(e.Ssn) AS `Number Of Employee`  from company_db.employee e
group by e.Dno;

select e.Dno AS `Department Number` , count(e.Ssn) AS `Number Of Employee`  from company_db.employee e
group by e.Dno
order by count(e.Ssn) desc;

select e.Dno AS `Department Number` from company_db.employee e
group by e.Dno
having count(e.Ssn) > 1 ;

select concat(e.Fname , ' ' , e.Lname) AS `Full Name` , d.Dname AS `Department Name` from company_db.employee e
join company_db.department d
on e.Dno = d.Dnumber;

select d.Dname AS `Department Name` , count(e.Ssn) AS `Number Of Employee` from company_db.employee e
join company_db.department d on e.Dno = d.Dnumber
group by d.Dnumber;


select d.Dname AS `Department Name` , count(e.Ssn) AS `Number Of Employee` from company_db.employee e
join company_db.department d on e.Dno = d.Dnumber
group by d.Dnumber
Having count(e.Ssn) > 1;

select concat(e.Fname,' ',e.Lname) AS `Full Name` , e.Salary AS `Salary` from company_db.employee e
where e.Salary > (
select avg(e2.Salary) from company_db.employee e2
where e2.Dno = e.Dno 
);
-- يعدة طرق
-- Q1
select de.Dependent_name from company_db.dependent de
join company_db.employee e on e.Ssn = de.Essn
where de.Essn = (select e2.Ssn from company_db.employee e2 order by e2.Salary asc limit 1);

-- Q1
select de.Dependent_name from company_db.dependent de
join company_db.employee e on e.Ssn = de.Essn
where de.Essn = 
(select  e2.Ssn from company_db.employee e2 where e2.Salary = 
 (select Min(e3.Salary) from company_db.employee e3));


-- يعدة طرق
-- Q2
select de.Dependent_name from company_db.dependent de
join company_db.employee e on e.Ssn = de.Essn
where de.Essn = (select e2.Ssn from company_db.employee e2 order by e2.Salary desc limit 1);

-- Q2
select de.Dependent_name from company_db.dependent de
join company_db.employee e on e.Ssn = de.Essn
where de.Essn = 
(select  e2.Ssn from company_db.employee e2 where e2.Salary = 
 (select Max(e3.Salary) from company_db.employee e3));
 
 
-- Q3
select de.Dependent_name from company_db.dependent de
join company_db.employee e on e.Ssn = de.Essn
where de.Essn = (select e2.Ssn from company_db.employee e2 order by e2.Salary desc limit 1) 
OR de.Essn = (select e2.Ssn from company_db.employee e2 order by e2.Salary asc limit 1) ;

-- Q3 
select 
(select de.Dependent_name from company_db.dependent de
join company_db.employee e on e.Ssn = de.Essn
where de.Essn = (select e2.Ssn from company_db.employee e2 order by e2.Salary asc limit 1)) as `Dependent_name_Max`  ,
(select de.Dependent_name from company_db.dependent de
join company_db.employee e on e.Ssn = de.Essn
where de.Essn = (select e2.Ssn from company_db.employee e2 order by e2.Salary desc limit 1)) AS `Dependent_name_Min` 
from company_db.dependent de
limit 1;

-- Q4  
select d.Dname as `Department Name` , 
	(select de.Dependent_name from company_db.dependent de where de.Essn = 
		(select e.Ssn from company_db.employee e where e.Dno = d.Dnumber and e.Salary = 
			(select max(e2.Salary) from company_db.employee e2 where e2.Dno = d.Dnumber))) 
as `Dependent_Name_Max`
from company_db.department d;



select concat(e.Fname,' ',e.Lname) AS `Full Name` , e.Bdate AS 'BithDate' from company_db.employee e;

select * from company_db.employee e
where e.Bdate > '1990-01-01';

select * from company_db.employee e
where year(e.Bdate) = 1990;

select * from company_db.employee e
where Month(e.Bdate) = 5;

select * from company_db.employee e
where e.Bdate < (current_date) - interval 30 year;

select * from company_db.employee e
where e.Bdate > (current_date) - interval 30 year;

select * from company_db.employee e
where Month(e.Bdate) = Month(current_date) AND Day(e.Bdate) = Day(current_date);

select * from company_db.employee e
where Month(e.Bdate) = Month(current_date) AND Day(e.Bdate) > Day (current_date);

select * from company_db.employee e
where ( Month(e.Bdate) = Month(current_date) And Day(e.Bdate) > Day(current_date)) or 
Month(e.Bdate) = Month(current_date + interval 1 month);

select concat(e.Fname ,' ',e.Lname) AS `Full Name` , d.Dname AS `Department Name` , e.Bdate AS `Birth Date` from company_db.employee e
inner join company_db.department d
on d.Dnumber = e.Dno;

select concat(e.Fname ,' ',e.Lname) AS `Full Name` , d.Dname AS `Department Name` , e.Bdate AS `Birth Date` from company_db.employee e
inner join company_db.department d
on d.Dnumber = e.Dno
where Month(e.Bdate) = Month(current_date); 

select d.Dname as `Department Name` , count(e.Ssn) From company_db.department d
inner join company_db.employee e
on d.Dnumber = e.Dno
where Month(e.Bdate) = Month(current_date)
group by d.Dnumber,d.Dname
having count(e.Ssn) >= 1;

select concat(e.Fname ,' ',e.Lname) AS `Full Name` , d.Dname AS `Department Name` , e.Bdate AS `Birth Date` from company_db.employee e
inner join company_db.department d
on d.Dnumber = e.Dno
where Month(e.Bdate) = Month(current_date) and e.Salary > (
	select AVG(e2.Salary) from company_db.employee e2
	where e2.Dno = e.Dno
); 

select *  from company_db.employee e
inner join company_db.department d
on e.Dno = d.Dnumber
where e.Salary = (
select Max(e2.Salary) from company_db.employee e2
where e.Dno = e2.Dno
);

select d.Dname AS `Department Name` from company_db.department d
inner join company_db.employee e
on e.Dno = d.Dnumber
group by d.Dnumber
having avg(e.Salary) > (
select avg(e2.Salary) from company_db.employee e2
);
 

select concat(e.Fname ,' ', e.Lname) AS `Full Name` , d.Dname AS `Department Name` , concat(e2.Fname ,' ', e2.Lname) AS `Manegar Name`  from company_db.department d
inner join company_db.employee e 
on e.Dno = d.Dnumber
inner join company_db.employee e2
on d.Mgr_ssn = e2.Ssn;


select concat(e.Fname ,' ', e.Lname) AS `Full Name` , d.Dname AS `Department Name` from company_db.department d
inner join company_db.employee e 
on e.Dno = d.Dnumber
where e.Ssn <> d.Mgr_ssn and
e.Salary > (
select Avg(e2.Salary) from company_db.employee e2
where e2.Dno = e.Dno);

select d.Dname AS `Department Name` from company_db.department d
inner Join company_db.employee e 
on e.Dno = d.Dnumber
where e.Ssn <> d.Mgr_ssn and e.Salary > (
	select avg(e2.Salary) from company_db.employee e2)
group by d.Dname , d.Dnumber
having count(e.Ssn) >= 1;


select concat(e.Fname,' ',e.Lname) AS `Full Name` , d.Dname AS `Department Name` , concat(e2.Fname,' ',e2.Lname) AS `Manegar Name` , count(de.Dependent_name) AS `Number of Dependent` from company_db.department d
inner join company_db.employee e
on e.Dno = d.Dnumber
inner join company_db.dependent de
on e.Ssn = de.Essn
inner join company_db.employee e2
on e2.Ssn = d.Mgr_ssn
where e.Ssn <> d.Mgr_ssn and e.Salary > (
select avg(e3.Salary) from company_db.employee e3
	where e3.Dno = d.Dnumber)
GROUP BY e.Ssn, d.Dname, e2.Ssn
Having count(de.Dependent_name) >=1;

select  p.Pname AS `Project Name` , d.Dname AS `Department Name` , concat(e.Fname,' ',e.Lname) AS `Full Name` , sum(w.Hours) AS `Total Hours` from company_db.project p
inner join company_db.department d on p.Dnum = d.Dnumber
inner join company_db.employee e on e.Ssn = d.Mgr_ssn
inner join company_db.works_on w on w.Pno = p.Pnumber
where e.Salary > (
select avg(e2.Salary) from company_db.employee e2)
group by p.Pnumber, p.Pname, d.Dname, e.Ssn
having sum(w.Hours) > (
select avg(`Sum1`) from (
select sum(w2.Hours) as `Sum1` from company_db.works_on w2 
group by w2.Pno
) );

select 
concat(e.Fname ,' ', e.Lname) AS `Full Name`,
d.Dname AS `Department Name`,
concat(e2.Fname ,' ', e2.Lname) AS `Manager Name`,
count(de.Dependent_name) AS `Number Dependent`,
sum(w.Hours) AS `Total Hours`
from company_db.employee e
inner join company_db.department d
on e.Dno = d.Dnumber
inner join company_db.employee e2
on e2.Ssn = d.Mgr_ssn
inner join company_db.dependent de
on de.Essn = e.Ssn
inner join company_db.works_on w
on w.Essn = e.Ssn
where 
e.Ssn <> d.Mgr_ssn and e.Salary > (
select avg(e3.Salary) from company_db.employee e3
where e3.Dno = e.Dno) 
group by e.Ssn , d.Dname , e2.Ssn
Having count(de.Dependent_name) >= 1 and
sum(w.Hours) > (
select avg(TotalSUM) from(
select sum(w2.Hours) as TotalSUM from company_db.works_on w2
join company_db.employee e4
on e4.Ssn = w2.Essn
WHERE e4.Dno = e.Dno
group by e4.Ssn
) t 
);


select 
concat(e1.Fname ,' ',e1.Lname) AS `Full Name`,
d1.Dname AS `Department Name`,
concat(e2.Fname ,' ',e2.Lname) AS `Manager Name`,
count(de1.Dependent_name) AS `Number Dependent`,
sum(w1.Hours) AS `Total Hours`,
e1.Bdate AS `Birth Date`
from company_db.employee e1
inner join company_db.department d1 on d1.Dnumber = e1.Dno
inner join company_db.employee e2 on e2.Ssn = d1.Mgr_ssn
inner join company_db.dependent de1 on e1.Ssn = de1.Essn
inner join company_db.works_on w1 on w1.Essn = e1.Ssn
inner join company_db.project p1 on p1.Pnumber = w1.Pno
where
e1.Ssn <> d1.Mgr_ssn 
and 
( year(current_date) - year(e1.Bdate) ) > (
select avg(year(current_date) - year(e2.Bdate)) from company_db.employee e2
where e2.Dno = e1.Dno)
and 
p1.Pnumber in (
select w2.Pno from company_db.works_on w2 where w2.Essn = e1.Ssn)
group by e1.Ssn, d1.Dname, e2.Ssn
having count(de1.Dependent_name) = 2 and
sum(w1.Hours) > (
select sum(sum_avg) from (
select avg(w3.Hours) as sum_avg from company_db.works_on w3
join company_db.employee e4 on e4.Ssn = w3.Ssn
where e4.Dno = e1.Dno
group by e4.Ssn
)t
);



select concat(e1.Fname ,' ',e1.Lname) as `Full Name`,
		d1.Dname as `Department Name`,
        concat(e2.Fname ,' ',e2.Lname) as `Manager Name`,
        count(de1.Dependent_name) as `Count Dependents`,
        SUM(w1.Hours) as `Total Hours`
from company_db.employee e1
inner join company_db.department d1  
on e1.Dno = d1.Dnumber
inner join company_db.employee e2
on e2.Ssn = d1.Mgr_ssn
inner join company_db.dependent de1
on de1.Essn = e1.Ssn
inner join company_db.works_on w1
on w1.Essn = e1.Ssn
where e1.Ssn <> d1.Mgr_ssn and
w1.Pno not in (
select w2.Pno from company_db.works_on w2
where w2.Essn = d1.Mgr_ssn
)
group by e1.Ssn, d1.Dname, e2.Ssn
having count(de1.Dependent_name) <> 0 and
sum(w1.Hours) > (
select avg(sum_Hours) from (
select sum(w2.Hours) as sum_Hours from company_db.works_on w2
inner join company_db.employee e3 on e3.Ssn = w2.Essn
where e3.Dno = d1.Dnumber
group by e3.Ssn)t);





select concat(e1.Fname,' ',e1.Lname) AS `Full Name` ,
	d1.Dname AS `Department Name`,
    e1.Bdate AS `Birth Date`
from company_db.employee e1
inner join company_db.department d1 on d1.Dnumber = e1.Dno
where Month(e1.Bdate) = Month(current_date) and
e1.Ssn <> d1.Mgr_ssn and
e1.Salary > (
select avg(e2.Salary) from company_db.employee e2
where e2.Dno = e1.Dno
);

select d1.Dname AS `Department Name` from company_db.department d1
inner join company_db.employee e1 on e1.Dno = d1.Dnumber
group by d1.Dnumber
having count(e1.Ssn) > (
select avg(`emp_count`) from (
select count(e2.Ssn) AS `emp_count` from company_db.employee e2 
group by e2.Dno
)t
);


select concat(e1.Fname ,' ',e1.Lname) , sum(w1.Hours) as `Total Hours` from company_db.employee e1
inner join company_db.works_on w1 on w1.Essn = e1.Ssn
group by e1.Ssn
having sum(w1.Hours) > (
select avg(`Total`) from (
select e2.Dno , sum(w2.Hours) as `Total` from company_db.works_on w2
inner join company_db.employee e2 on e2.Ssn = w2.Essn
group by e2.Ssn,e2.Dno 
) t1
where t1.Dno = e1.Dno
);

select * from company_db.employee e1
where Bdate < (current_date) - interval 30 year;


select concat(e1.Fname , ' ' ,e1.Lname) AS `Full Name`,
		d1.Dname AS `Department Name`,
        concat(e2.Fname , ' ' ,e2.Lname) AS `Maneger Name`,
        sum(w1.Hours) AS `Total`
from company_db.employee e1
inner join company_db.department d1 on e1.Dno = d1.Dnumber
inner join company_db.employee e2 on e2.Ssn = d1.Mgr_ssn
inner join company_db.works_on w1 on w1.Essn = e1.Ssn
where e1.Ssn <> d1.Mgr_ssn and
w1.Pno not in (
select w2.Pno from company_db.works_on w2
inner join company_db.employee e2 on e2.Ssn = w2.Essn
group by w2.Pno
having count(distinct e2.Dno) = 1
)
group by e1.Ssn,d1.Dnumber
having sum(w1.Hours) > (
select avg(`Total`) from (
select sum(w2.Hours) from company_db.employee e3
inner join company_db.works_on w2 on w2.Essn = e3.Ssn
where e3.Dno = e1.Dno
group by e3.Ssn
)t
);

select d1.Dname AS `Department Name` , count(e1.SSN) AS `Count Employeee` from
company_db.department d1
inner join company_db.employee e1 on e1.Dno = d1.Dnumber
inner join company_db.works_on w3 on w3.Essn = e1.Ssn
where e1.Ssn not in (
select e2.Ssn from company_db.employee e2
where e2.Ssn not in (
select w1.Essn from company_db.works_on w1)) and
d1.Mgr_ssn not in (
select de.Essn from company_db.dependent de
) And
w3.Pno not in (
    select w2.Pno
    from works_on w2
    inner join employee e2 on e2.Ssn = w2.Essn
    inner join project p2 on p2.Pnumber = w2.Pno
    where e2.Dno <> p2.Dnum
)
group by d1.Dnumber
having count(e1.Ssn) >=2 





