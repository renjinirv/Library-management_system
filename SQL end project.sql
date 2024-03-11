##MYSQL MODULE END PROJECT###

###CREATING DATABASE LIBRARY###

create database LIBRARY;
show databases;
use LIBRARY;

###CREATING TABLES###

####CREATING TABLE BRANCH####

create table Branch(
branch_no int PRIMARY KEY,
manager_id int,
branch_address varchar(100),
contact_no int unique
);
insert into Branch values(1, 1023120, 'Vattiyoorkavu', 952414);
insert into Branch values(2, 1023121, 'Peroorkada', 985414);
insert into Branch values(3, 1023122, 'Perumathura', 972356);
insert into Branch values(4, 1023123, 'Nellimala', 921457);
insert into Branch values(5, 1023124, 'Nooranad', 851423);
insert into Branch values(6, 1023125, 'Kilimanoor', 852369);
insert into Branch values(7, 1023126, 'Varkala', 847569);
insert into Branch values(8, 1023127, 'Statue', 951423);

select * from Branch;

##CREATE EMPLOYEE TABLE#

create table employee(
emp_id int PRIMARY KEY,
emp_name varchar(50),
position varchar(50),
salary float,
branch_no int,
FOREIGN KEY (branch_no) REFERENCES Branch(branch_no));

insert into employee values (1023124, 'Seethalekshmi',  'Manager', 45000, 5);
insert into employee values (1023120, 'Mini', 'PRO', 40000, 1);
insert into employee values (1023122, 'Parvathy',  'clerk', 15000, 3);
insert into employee values (1023125, 'Naresh',  'Manager', 50000, 6);
insert into employee values (1023121, 'Vinod',  'Assistant librarian', 36000, 2);
insert into employee values (1023126, 'Anoop',  'Clerk', 20000,7 );
insert into employee values (1023123, 'James',  'PRO', 46000, 4);
insert into employee values (1023127, 'Jency',  'Peon', 12000, 8);

select * from employee;

###CREATING TABLE BOOKS##

create table Books(
ISBN varchar(20) primary key,
book_title varchar(255),
category varchar(100),
rental_price int,
status enum ('yes', 'no'),
author varchar(100),
publisher varchar(100)
);

insert into Books values('ISBN1', 'Quantitative Aptitude', 'Fun with Maths', 20, 'yes', 'Agarwal', 'DC books');
insert into Books values('ISBN5', 'Dastheviski', 'Novel', 30, 'yes', 'Perumbadavam', 'Figure publications');
insert into Books values('ISBN2', 'Alice in wonderland', 'Story books for kids', 25, 'yes', 'James Hook', 'DC books');
insert into Books values('ISBN6', 'Wings of fire', 'novel series', 30, 'No', 'Abdul kalam', 'Chitra publications');
insert into Books values('ISBN4', 'Ramayana', 'Itihasa', 50, 'yes', 'Rajagopal', 'Bvb publishers');
insert into Books values('ISBN3', 'Othello', 'Story', 20, 'no', 'Shakespeare', 'Simon and Schuster');
select * from Books;
update Books set status='yes' where ISBN='ISBN3';
update Books set category ='History' where ISBN='ISBN4';

###CREATE TABLE CUSTOMER###

create table Customer(
cust_id int PRIMARY KEY,
customer_name varchar(100),
cust_address varchar(255),
reg_date date
);

insert into Customer values (1, 'Riya', 'Sreenilayam', '2023-05-14');
insert into Customer values (2, 'Susan', 'Puthenveed', '2023-05-14');
insert into Customer values (3, 'Anulekha', 'Aramam', '2023-05-14');
insert into Customer values (4, 'Jeslin', 'Maliyekkal house', '2023-05-14');
insert into Customer values (5, 'Praseetha', 'Sreelakam', '2023-05-14');
insert into Customer values (6, 'Dyuthi', 'Sarovaram', '2023-05-14');
insert into Customer values (7, 'Dwani', 'Mahadevam', '2022-07-12');
select * from Customer;

update Customer set reg_date ='2017-08-23' where cust_id=2;
update Customer set reg_date ='2020-07-09' where cust_id=3;
update Customer set reg_date ='2021-04-21' where cust_id=4;
update Customer set reg_date ='2022-11-03' where cust_id=5;
update Customer set reg_date ='2016-08-25' where cust_id=6;

###CREATE TABLE ISSUESTATUS###

create table Issuestatus(
issue_id int PRIMARY KEY,
issued_cust int,
issued_bookname varchar(255),
issue_date date,
ISBN_book varchar(20),
FOREIGN KEY (issued_cust) REFERENCES  Customer(cust_id),
FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN)
);

insert into Issuestatus values (1120,5,'Quantitative aptitude', '2023-04-04', 'ISBN1');
insert into Issuestatus values (1121,7,'Dastheviski', '2023-06-05', 'ISBN5');
insert into Issuestatus values (1122,4,'Othello','2023-04-21' ,'ISBN3');
insert into Issuestatus values (1123,1,'Alice in wonderland', '2023-10-17', 'ISBN2');
insert into Issuestatus values (1124,6,'Ramayana', '2023-11-11', 'ISBN4');

select * from Issuestatus;

###CREATE TABLE RETURNSTATUS###

CREATE TABLE Returnstatus(
Return_id int PRIMARY KEY,
Return_cust int,
return_bookname varchar(255),
return_date date,
ISBN_book2 varchar(20),
FOREIGN KEY (ISBN_book2) REFERENCES Books(ISBN)
);

insert into Returnstatus values (1141, 5, 'Quantitative aptitude', '2023-30-04', 'ISBN1');
insert into Returnstatus values (1142, 7, ' Dastheviski', '2023-07-20', 'ISBN5');
insert into Returnstatus values (1143, 4, 'Othello', '2023-06-02', 'ISBN3');
insert into Returnstatus values (1144, 1, ' Alice in wonderland', '2023-11-20', 'ISBN2');
insert into Returnstatus values (1145, 6, 'Ramayana', '2023-12-12', 'ISBN4');

select * from Returnstatus;

##1.Retrieve the book title, category, and rental price of all available books.

select book_title, category, rental_price from Books where STATUS = 'yes';


##2.List the employee names and their respective salaries in descending order of salary.

select emp_name, salary from employee order by salary desc;

###Retrieve the book titles and the corresponding customers who have issued those books.

select * from Books;
use LIBRARY;

SELECT b.book_title, c.customer_name
FROM Books b
JOIN Issuestatus i ON b.ISBN = i.ISBN_book
JOIN Customer c ON i.issued_cust = c.cust_id;

##4.Display the total count of books in each category.

select category, count(*) as totalcountofbooks  from Books group by category;

###5.Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

select * from employee;
update employee set salary=60000 where emp_id=1023125;

select emp_name, position from employee where salary>50000;

##6.List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT c.customer_name
FROM Customer c
LEFT JOIN IssueStatus i ON c.cust_Id = i.issued_cust
WHERE c.reg_date < '2022-01-01' AND i.issue_id IS NULL;

##7.Display the branch numbers and the total count of employees in each branch.

select b.branch_no, count(*) as total_employees 
from Branch b
LEFT JOIN Employee e ON b.manager_id = e.emp_id
group by b.branch_no;


###8.Display the names of customers who have issued books in the month of June 2023.

SELECT c.Customer_name
FROM Customer c
JOIN Issuestatus i ON c.cust_id = i.issued_cust
WHERE YEAR(i.issue_date) = 2023 AND MONTH(i.issue_date) = 6;


###9.Retrieve book_title from book table containing history.

select book_title from Books where category='History';

###10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT b.branch_no, COUNT(e.emp_id) AS Employee_Count
FROM Branch b
LEFT JOIN Employee e ON b.Manager_Id = e.Emp_Id
GROUP BY b.branch_no
HAVING Employee_Count > 5;

