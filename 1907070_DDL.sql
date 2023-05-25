-- If table already exists
drop table Transaction;
drop table Reservation;
drop table Train_Ticket;
drop table Transaction_type;
drop table Users;
drop table Admin;

create table Admin(
id int,
first_name varchar(15),
last_name varchar(15),
gender char(1),
phone_no char(11),
email varchar(30),
address varchar(30),
picture blob,
primary key (id));

create table Users(
id int,
first_name varchar(15),
last_name varchar(15),
gender char(1),
phone_no char(11),
email varchar(30),
address varchar(30),
picture blob,
primary key (id));

create table Transaction_type(
id int,
trans_type varchar(20),
discount_percent int,
primary key (id));

create table Train_Ticket(
id int,
train_name varchar(20),
from_des varchar(20),
to_des varchar(20),
datetime_of_departure varchar(30),
issue_date date,
primary key (id));

create table Reservation(
id int,
ticket_id int,
admin_id int,
customer_id int,
reservation_date date,
seat char(4),
seat_type varchar(15),
primary key (id),
foreign key (ticket_id) references Train_Ticket,
foreign key (admin_id) references Admin,
foreign key (customer_id) references Users);

create table Transaction(
id int,
transaction_id int,
transaction_amount int,
reservation_id int,
admin_id int,
customer_id int,
transaction_date date,
primary key (id),
foreign key (transaction_id) references Transaction_type,
foreign key (reservation_id) references Reservation,
foreign key (admin_id) references Admin,
foreign key (customer_id) references Users);


INSERT INTO Admin  VALUES (1, 'John', 'Doe', 'M', '12345678901', 'john.doe@example.com', '123 Main Street', NULL);
INSERT INTO Admin  VALUES (2, 'Jane', 'Smith', 'F', '98765432109', 'jane.smith@example.com', '456 Elm Street', NULL);
INSERT INTO Admin  VALUES (3, 'Michael', 'Johnson', 'M', '55555555555', 'michael.johnson@example.com', '789 Oak Avenue', NULL);
INSERT INTO Admin  VALUES (4, 'Emily', 'Davis', 'F', '99999999999', 'emily.davis@example.com', '321 Maple Drive', NULL);
INSERT INTO Admin  VALUES (5, 'David', 'Wilson', 'M', '44444444444', 'david.wilson@example.com', '567 Pine Lane', NULL);

INSERT INTO Users  VALUES (1, 'Alex', 'Johnson', 'M', '12345678901', 'alex.johnson@example.com', '123 Main Street', NULL);
INSERT INTO Users  VALUES (2, 'Emma', 'Smith', 'F', '98765432109', 'emma.smith@example.com', '456 Elm Street', NULL);
INSERT INTO Users  VALUES (3, 'Michael', 'Davis', 'M', '55555555555', 'michael.davis@example.com', '789 Oak Avenue', NULL);
INSERT INTO Users  VALUES (4, 'Olivia', 'Brown', 'F', '99999999999', 'olivia.brown@example.com', '321 Maple Drive', NULL);
INSERT INTO Users  VALUES (5, 'James', 'Wilson', 'M', '44444444444', 'james.wilson@example.com', '567 Pine Lane', NULL);
INSERT INTO Users  VALUES (6, 'Sophia', 'Taylor', 'F', '22222222222', 'sophia.taylor@example.com', '890 Cedar Street', NULL);
INSERT INTO Users  VALUES (7, 'Ethan', 'Anderson', 'M', '88888888888', 'ethan.anderson@example.com', '654 Birch Road', NULL);

INSERT INTO Transaction_type VALUES (1, 'Cash', 10);
INSERT INTO Transaction_type VALUES (2, 'Bikash', 0);
INSERT INTO Transaction_type VALUES (3, 'Rocket', 5);

INSERT INTO Train_Ticket VALUES (1, 'Suborno Express', 'Dhaka', 'Khulna', '2023-05-21 09:00:00', TO_DATE('2023-05-20', 'YYYY-MM-DD'));
INSERT INTO Train_Ticket VALUES (2, 'Tista Express', 'Khulna', 'Chittagong', '2023-05-22 12:30:00', TO_DATE('2023-05-20', 'YYYY-MM-DD'));
INSERT INTO Train_Ticket VALUES (3, 'Chitra Express', 'Chittagong', 'Sylhet', '2023-05-23 16:15:00', TO_DATE('2023-05-21', 'YYYY-MM-DD'));
INSERT INTO Train_Ticket VALUES (4, 'Suborno Express', 'Sylhet', 'Dhaka', '2023-05-24 08:45:00', TO_DATE('2023-05-22', 'YYYY-MM-DD'));
INSERT INTO Train_Ticket VALUES (5, 'Tista Express', 'Dhaka', 'Chittagong', '2023-05-25 11:30:00', TO_DATE('2023-05-23', 'YYYY-MM-DD'));
INSERT INTO Train_Ticket VALUES (6, 'Chitra Express', 'Chittagong', 'Sylhet', '2023-05-26 14:20:00', TO_DATE('2023-05-24', 'YYYY-MM-DD'));
INSERT INTO Train_Ticket VALUES (7, 'Suborno Express', 'Sylhet', 'Khulna', '2023-05-27 17:10:00', TO_DATE('2023-05-25', 'YYYY-MM-DD'));
INSERT INTO Train_Ticket VALUES (8, 'Tista Express', 'Khulna', 'Dhaka', '2023-05-28 09:45:00', TO_DATE('2023-05-26', 'YYYY-MM-DD'));
INSERT INTO Train_Ticket VALUES (9, 'Chitra Express', 'Dhaka', 'Chittagong', '2023-05-29 12:30:00', TO_DATE('2023-05-27', 'YYYY-MM-DD'));
INSERT INTO Train_Ticket VALUES (10, 'Suborno Express', 'Chittagong', 'Sylhet', '2023-05-30 15:15:00', TO_DATE('2023-05-28', 'YYYY-MM-DD'));

INSERT INTO Reservation VALUES (1, 5, 1, 1, TO_DATE('2023-05-20', 'YYYY-MM-DD'), 'A01', 'Economy');
INSERT INTO Reservation VALUES (2, 9, 2, 2, TO_DATE('2023-05-21', 'YYYY-MM-DD'), 'B02', 'First Class');
INSERT INTO Reservation VALUES (3, 1, 3, 3, TO_DATE('2023-05-22', 'YYYY-MM-DD'), 'C03', 'Economy');
INSERT INTO Reservation VALUES (4, 7, 4, 4, TO_DATE('2023-05-23', 'YYYY-MM-DD'), 'D04', 'Business');
INSERT INTO Reservation VALUES (5, 3, 5, 5, TO_DATE('2023-05-24', 'YYYY-MM-DD'), 'E05', 'Economy');
INSERT INTO Reservation VALUES (6, 10, 5, 6, TO_DATE('2023-05-25', 'YYYY-MM-DD'), 'F06', 'First Class');
INSERT INTO Reservation VALUES (7, 6, 3, 7, TO_DATE('2023-05-26', 'YYYY-MM-DD'), 'G07', 'Economy');
INSERT INTO Reservation VALUES (8, 2, 3, 5, TO_DATE('2023-05-27', 'YYYY-MM-DD'), 'H08', 'Business');
INSERT INTO Reservation VALUES (9, 4, 3, 7, TO_DATE('2023-05-28', 'YYYY-MM-DD'), 'I09', 'Economy');
INSERT INTO Reservation VALUES (10, 8, 2, 3, TO_DATE('2023-05-29', 'YYYY-MM-DD'), 'J10', 'First Class');

INSERT INTO Transaction VALUES (1, 1, 100, 2, 2, 2, TO_DATE('2023-04-20', 'YYYY-MM-DD'));
INSERT INTO Transaction VALUES (2, 2, 200, 6, 5, 6, TO_DATE('2023-04-21', 'YYYY-MM-DD'));
INSERT INTO Transaction VALUES (3, 3, 150, 9, 3, 7, TO_DATE('2023-04-22', 'YYYY-MM-DD'));
INSERT INTO Transaction VALUES (4, 3, 120, 4, 4, 4, TO_DATE('2023-04-23', 'YYYY-MM-DD'));
INSERT INTO Transaction VALUES (5, 2, 180, 8, 3, 5, TO_DATE('2023-04-24', 'YYYY-MM-DD'));
INSERT INTO Transaction VALUES (6, 1, 90, 1, 1, 1, TO_DATE('2023-04-25', 'YYYY-MM-DD'));
INSERT INTO Transaction VALUES (7, 1, 210, 7, 3, 7, TO_DATE('2023-04-26', 'YYYY-MM-DD'));
INSERT INTO Transaction VALUES (8, 2, 130, 10, 2, 3, TO_DATE('2023-04-27', 'YYYY-MM-DD'));
INSERT INTO Transaction VALUES (9, 3, 170, 5, 5, 5, TO_DATE('2023-04-28', 'YYYY-MM-DD'));
INSERT INTO Transaction VALUES (10, 3, 110, 3, 3, 3, TO_DATE('2023-04-29', 'YYYY-MM-DD'));

set pagesize 200
set linesize 200


