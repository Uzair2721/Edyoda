create database assignment;

use assignment;

create table SalesPeople(
Snum int(10) primary key,
Sname varchar(20) unique,
City varchar(20),
Comm int
);

insert into SalesPeople values(1001,'Peel','London',12);
insert into SalesPeople values(1002,'Serres','Sanjose',13);
insert into SalesPeople values(1004,'Motika','London',11);
insert into SalesPeople values(1007,'Rifkin','Barcelona',15);
insert into SalesPeople values(1003,'Axelrod','Newyork',10);

select * from SalesPeople;

create table Customers(
Cnum int(10) primary key,
Cname varchar(20),
City varchar(20) not null,
Snum int(10),
foreign key(Snum) references SalesPeople(Snum)
);

insert into Customers values(2001,'Hoffman','London',1001);
insert into Customers values(2002,'Giovanni','Rome',1003);
insert into Customers values(2003,'Liu','Sanjose',1002);
insert into Customers values(2004,'Grass','Berlin',1002);
insert into Customers values(2006,'Clemens','London',1001);
insert into Customers values(2008,'Cisneros','Sanjose',1007);
insert into Customers values(2007,'Pereira','Rome',1004);

select * from Customers;

create table Orders(
Onum int(10) primary key,
Amt numeric(8,2),
Odate varchar(20),
Cnum int(10),
Snum int(10),
foreign key(Cnum) references Customers(Cnum),
foreign key(Snum) references SalesPeople(Snum)  
);

insert into Orders values(3001,18.69,'3-10-1990',2008,1007);
insert into Orders values(3003,767.19,'3-10-1990',2001,1001);
insert into Orders values(3002,1900.10,'3-10-1990',2007,1004);
insert into Orders values(3005,5160.45,'3-10-1990',2003,1002);
insert into Orders values(3006,1098.16,'3-10-1990',2008,1007);
insert into Orders values(3009,1713.23,'4-10-1990',2002,1003);
insert into Orders values(3007,75.75,'4-10-1990',2004,1002);
insert into Orders values(3008,4273.00,'5-10-1990',2006,1001);
insert into Orders values(3010,1309.95,'6-10-1990',2004,1002);
insert into Orders values(3011,9891.88,'6-10-1990',2006,1001);

select * from Orders;

-- 1. Count the number of Salesperson whose name begin with ‘a’/’A’.
select count(Sname)
from SalesPeople
where Sname like 'a%';

-- 2. Display all the Salesperson whose all orders worth is more than Rs. 2000.
select SP.Snum,SP.Sname
from SalesPeople as SP inner join Orders as O
on SP.Snum = O.Snum
where Amt > 2000
group by SP.Snum,SP.Sname;

-- 3. Count the number of Salesperson belonging to Newyork.
select City,count(City)
from SalesPeople
where City = 'Newyork'
group by City;

-- 4. Display the number of Salespeople belonging to London and belonging to Paris.
select City,count(City) as SP
from SalesPeople
where City in ('London','Paris')
group by City;

-- 5. Display the number of orders taken by each Salesperson and their date of orders.
select O.Snum,SP.Sname,count(Onum) as Num_orders,O.Odate
from Orders as O inner join SalesPeople as SP
on O.Snum = SP.Snum
group by O.Snum,SP.Sname,O.Odate;

