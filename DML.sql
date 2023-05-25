select * from Admin;
select * from Users;
select * from Transaction_type;
select * from Train_Ticket;
select * from Reservation;
select * from Transaction;

--where command

select * from Users where Gender = 'F';

select seat_type from Reservation where customer_id=(select id from Users where first_name='Olivia');

--Update

update Reservation set seat ='J12' where id='10';

--Delete

INSERT INTO Train_Ticket VALUES (11, 'Suborno Express', 'Chittagong', 'Sylhet', '2023-05-30 15:15:00', TO_DATE('2023-05-28', 'YYYY-MM-DD'));
delete from Train_Ticket where id=11;

--union, intersect, and except

select first_name,last_name,address from Admin where last_name like 'D%' union select first_name,last_name,address from Admin where last_name like '%l%';

select first_name,last_name,address from Admin where last_name like 'D%' intersect select first_name,last_name,address from Admin where last_name like '%v%';

select first_name,last_name,address from Admin where last_name like 'D%' except select first_name,last_name,address from Admin where last_name like '%v%';

--With clause

with max_price(val) as (select max(transaction_amount) from Transaction) 
select id,val from Transaction,max_price where Transaction.transaction_amount = max_price.val;

--Aggregate function

select count(*) number_of_users from Users;

select count(distinct train_name) as number_of_tarins from Train_Ticket;

select avg(transaction_amount) from Transaction;

select sum(transaction_amount) from Transaction;

select max(transaction_amount) from Transaction;

--Group by and Having

select transaction_id,avg(transaction_amount) as avg_transaction from Transaction group by transaction_id;

select transaction_id,avg(transaction_amount) as avg_transaction from Transaction group by transaction_id having avg(transaction_amount)<140;

--Nested subquery

select trans_type from Transaction_type where id=(select transaction_id from Transaction where reservation_id = (select id from Reservation where seat='F06'));

--String operations

SELECT id,first_name,last_name,gender,email FROM Users WHERE last_name LIKE 'S%';
SELECT id,first_name,last_name,gender,email FROM Users WHERE last_name LIKE '%w%';
SELECT id,first_name,last_name,gender,email FROM Users WHERE last_name LIKE '%r';

--Join operation

select trans_type,transaction_amount from Transaction join Transaction_type on Transaction.transaction_id = Transaction_type.id;

--views

create view admin_details as select id,first_name,last_name,email from Admin;
select * from admin_details;
drop view admin_details;


