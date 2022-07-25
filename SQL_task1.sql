--create database about_employees

--use about_employees

--create table jobs (
--	job_id bigint IDENTITY(1,1) primary key,
--	job_title varchar(255),
--	min_salary numeric(20,2),
--	max_salary numeric(20,2)
--)

--insert into jobs(job_title,min_salary,max_salary)
--	values ('front_end_devloper',50000,500000),
--			('back_end_devloper',65000,750000),
--			('HR',20000,350000),
--			('manager',90000,950000),
--			('salesmen',30000,400000),
--			('qa',35000,450000)

--select * from jobs

--create table departments(
--	department_id bigint IDENTITY(1,1) primary key,
--	department_name varchar(255),
--	manager_id bigint,
--	location_id bigint
--)

--insert into departments(department_name,manager_id,location_id)
--		values ('front_end',10,1),
--				('back_end',5,2),
--				('HR',14,3),
--				('sales',18,4),
--				('QA',21,5)

--select * from departments


--create table employee(
--	employee_id bigint IDENTITY(1,1) primary key,
--	first_name varchar(255),
--	last_name varchar(255),
--	email varchar(255) unique,
--	phone_number numeric(10,0) unique,
--	hire_date date,
--	job_id bigint foreign key references jobs(job_id),
--	salary numeric(20,2),
--	commission_pct numeric(5,2),
--	manager_id bigint ,
--	department_id bigint
--)

--insert into 
--		employee 
--		(first_name,last_name,email,phone_number,
--		hire_date,job_id,salary,commission_pct
--		,manager_id,department_id)
--				values('Rishit','Kalyani','rk@gmail.com',9409249071,'2022-06-16',2,65000,1.5,5,2),
--						('Darshit','Kanani','dk@gmail.com',9409249077,'2021-06-16',2,70000,1.5,5,2),
--						('Achyut','Manvar','ac@gmail.com',9409249078,'2020-08-16',2,80000,1.5,5,2),
--						('Meet','Ardesna','am1@gmail.com',9409249081,'2022-07-06',2,65000,1.5,5,2),

--						('Ashok','Maru','am@gmail.com',9409249051,'2019-06-16',4,155000,2.5,null,2),

--						('Hardi','Govani','hg@gmail.com',9409249079,'2021-06-16',1,65000,1.2,10,1),
--						('Hemangi','Nirmal','hn@gmail.com',9409249080,'2022-06-16',1,50000,1.2,10,1),
--						('Nishita','kalyani','nk@gmail.com',9409249082,'2022-02-16',1,60000,1.2,10,1),
--						('Shivraj','Chavda','sr@gmail.com',9409249099,'2020-06-16',1,75000,1.2,10,1),

--						('Shery','Dadhaniya','sd@gmail.com',9409249098,'2019-06-16',4,125000,2.2,null,1),

--						('Jinal','patel','jk@gmail.com',9409249059,'2022-03-16',3,25000,null,14,3),
--						('Kushal','patel','pk@gmail.com',9409249060,'2022-05-16',3,28000,null,14,3),
--						('Janvi','Desai','jd@gmail.com',9409249049,'2021-03-16',3,35000,null,14,3),

--						('Darshan','Kagathra','dk5@gmail.com',9409249039,'2020-03-16',4,55000,null,null,3),

--						('Naman','Shukla','ns@gmail.com',9409249029,'2022-03-16',5,35000,2.0,18,4),
--						('Rohan','Dodia','rd@gmail.com',9409249030,'2021-09-15',5,37000,2.0,18,4),

--						('Meet','Vasoya','mv@gmail.com',9409249019,'2020-03-16',4,55000,2.5,null,4),

--						('Adasrh','Buecha','ab@gmail.com',9409249011,'2022-01-01',6,35000,null,21,5),
--						('Kevin','Kheraida','kk@gmail.com',9409249001,'2020-11-01',6,45000,null,21,5),

--						('Nikunj','Hudka','nh@gmail.com',9409249007,'2020-01-01',6,55000,null,null,5)

--select * from employee


-------------starting tasks------------------

--1.Given SQL query will execute successfully: TRUE/FALSE SELECT last_name, job_id, salary AS Sal FROM employee;:- TRUE

--2. Identity errors in the following statement: SELECT employee_id, last_name, sal*12 ANNUAL SALARY FROM employees; error:after sal*12 "as" should be return

--3. exec sp_help 'dbo.departments';

--4. select distinct job_id from employee;

--5. select employee_id , last_name,salary as old_salary,(salary+((salary*15.5)/100)) as new_salary,((salary+((salary*15.5)/100))-salary) as Increment from employee


-------6.--------
/*select employee.job_id,min(salary) as min_salary,max(salary) as max_salary,sum(salary) as total_salary,avg(salary)as avg_salary 
   from employee	
		inner join jobs on employee.job_id=jobs.job_id group by employee.job_id;*/


--------7---------
/*select concat(e.first_name,' ',e.last_name) as name ,e.hire_date ,concat(e1.first_name,' ',e1.last_name) as manager_name,e1.hire_date
	from employee e
		inner join employee e1 on e.manager_id = e1.employee_id where e.hire_date<e1.hire_date;*/

--------8----------

--create view employee_report as
--	select distinct concat(e.first_name,e.last_name) as emp_name,e.department_id,concat(e1.first_name,e1.last_name) as other_emp ,e1.department_id as same_dept
--		from employee e , employee e1 where e.department_id=e1.department_id and e.last_name <> e1.last_name

	
--		select * from employee_report 

-------9--------
/*select max(salary) as maximum ,min(salary) as minimum,sum(salary) as sum, avg(salary) as average 
		from employee*/

---------10---------

--create view sal_higher_than_3 as
--	select * from employee where salary>any(select salary from employee where department_id=3 and employee_id=12 )
--select * from sal_higher_than_3

----------11----------

----select e.last_name,e.salary 
--		from employee e  
--			where e.manager_id in (select employee_id from employee where first_name='Ashok')

--------12-----------

--select department_id	
--	from employee 
--		where job_id<>3 
--		union
--			select department_id 
--				from employee 
--					where job_id<>3

-------13------------

--select employee_id,job_id,department_id from employee	
--	where department_id=4
--		union
--			select employee_id,job_id,department_id from employee	
--				where department_id=5