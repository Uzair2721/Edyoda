create database class2;

use class2;                                  # <database name>.<table name> , alternative for "use"

create table dept(
deptid int(10),
dname varchar(20),
location varchar(30)
);

desc dept;                                   -- to get description/structure of the table

insert into dept values (1,'account','mumbai');
insert into dept values (2,'HR','bangalore');
insert into dept values (3,'sales','hyderabad');
insert into dept values (4,'operations','delhi');
insert into dept values (1,'account','berlin');

select * from dept;                          -- * means all

select deptid as id,dname as department_name from dept;

select distinct deptid from dept;            -- distinct shows repeated value only once

select distinct location from dept;

create table emp(
empid varchar(10) primary key,
ename varchar(40) not null,
job varchar(15) not null,
salary numeric(8,2), 
deptid varchar(10)  
);

insert into emp values('1','jay','Accountant',50000.90,'1');
insert into emp values('2','sushil','data engg',60000,'2');
insert into emp values('11','sushil','data engg',60000,'2');
insert into emp values('3','vaishali','sales man',40000.90,'3');
insert into emp values('4','gowri','ceo',67000.90,'4');
insert into emp values('5','parsad','data scientist',70000.90,'2');
insert into emp values('6','vjay','data analyst',53000.90,'1');
insert into emp values('7','ajay','cto',45000.90,'4');
insert into emp values('10','ajay','cto',45000.90,'4');
insert into emp values('8','suraj','ca',null,'3');
insert into emp values('9','suraj','ca',null,'3');

select * from emp;

select empid 
from emp
where ename = 'sushil';

select empid,ename
from emp
where ename != 'sushil'; 

select empid,ename
from emp
where salary > 50000;

select empid,ename
from emp
where salary >= 50000;

select empid,ename
from emp
where salary < 50000;

select empid,ename
from emp
where salary <= 50000;

select *
from emp
where ename in ('jay','sushil');            -- better for more than 2 data

select *
from emp
where ename = 'jay' or ename = 'sushil';

select *
from emp
where ename = 'sushil' and salary > 50000;

select empid 
from emp
where not ename = 'sushil';

select *
from emp
where salary between 50000 and 60000;

select * from emp;

select *
from emp
where ename like 'j%'; 

select *
from emp
where ename like '%y'; 

select *
from emp
where ename like '__ay'; 

select *
from emp
where job like '%data%';

select min(salary) as min_sal from emp;
select max(salary) as max_sal from emp;
select count(salary) from emp;
select sum(salary) from emp;
select avg(salary) from emp;
select sum(salary)/count(salary) from emp;
select empid,ename,salary,salary+((10*salary)/100) as bonus from emp;

delete from emp where ename = 'suraj';
-- set sql_safe_updates = 0                 -- to restore safe mode put = 1
drop table emp;                                -- deletes the entire table
select * from emp;
truncate table emp;                          -- deletes all rows

select *
from emp
order by salary;

select *
from emp
order by ename desc;

select *
from emp
where salary > 50000
order by deptid,ename
limit 5;                                   -- gives first 5 rows

select salary from emp order by salary desc limit 1 offset 2;

select deptid,count(empid) as count from emp group by deptid;

select deptid,max(salary) from emp group by deptid;
select deptid,min(salary) from emp group by deptid;
select deptid,sum(salary) from emp group by deptid;

select deptid,salary,count(salary)
from emp
where salary in (45000.90,60000)
group by deptid,salary;

show index from dept;
create index deptidind on dept(deptid);
drop index deptidind on dept;

show index from emp;

select * from emp;

update emp
set job = 'accountant'
where empid = 8;

update emp
set salary = 50000
where empid = 8;

alter table emp
add location varchar(20);

alter table emp
rename column location to city;

alter table emp
modify column city char(20);

desc emp;

alter table emp
drop city;

select count(*),salary from emp group by salary;