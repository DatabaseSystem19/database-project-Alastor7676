set serveroutput on
declare 
id Transaction.id%type;
trans_id Transaction.transaction_id%type;
price number;
begin
select id,transaction_id,transaction_amount into id,trans_id,price from Transaction where customer_id=1;
dbms_output.put_line('ID: '||id );
dbms_output.put_line('Transaction ID: '||trans_id);
dbms_output.put_line('Transaction Amount: '||price);
end;
/

--Insert and set default value
set serveroutput on
declare 
id Transaction_type.id%type:=4;
trans_name Transaction_type.trans_type%type:='Nogod';
discount number:=15;
begin
insert into Transaction_type values(id,trans_name,discount);
end;
/

--Row type
set serveroutput on
declare 
train_row Train_Ticket%rowtype;
begin
select id,train_name,to_des into train_row.id,train_row.train_name,train_row.to_des from Train_Ticket where id=5;
dbms_output.put_line('ID: '||train_row.id );
dbms_output.put_line('Train Name: '||train_row.train_name);
dbms_output.put_line('Train Destination: '||train_row.to_des);
end;
/

--Cursor and row count
set serveroutput on
declare 
cursor admin_cursor is select * from Admin;
admin_row Admin%rowtype;
begin
open admin_cursor;
fetch admin_cursor into admin_row.id,admin_row.first_name,admin_row.last_name,admin_row.gender,admin_row.phone_no,admin_row.email, admin_row.address, admin_row.picture;
while admin_cursor%found loop
dbms_output.put_line('ID: '||admin_row.id|| ' Name: '||admin_row.first_name || ' ' ||admin_row.last_name);
dbms_output.put_line('Gender: '||admin_row.gender);
dbms_output.put_line('Row count: '|| admin_cursor%rowcount);
fetch admin_cursor into admin_row.id,admin_row.first_name,admin_row.last_name,admin_row.gender,admin_row.phone_no,admin_row.email, admin_row.address, admin_row.picture;
end loop;
close admin_cursor;
end;
/

--FOR LOOP/WHILE LOOP/ARRAY with extend() function
set serveroutput on
declare 
  counter number;
  user_name Users.first_name%type;
  TYPE NAMEARRAY IS VARRAY(10) OF Users.first_name%type; 
  A_NAME NAMEARRAY:=NAMEARRAY();
begin
  counter:=1;
  for x in 1..7  
  loop
    select first_name into user_name from Users where id=x;
    A_NAME.EXTEND();
    A_NAME(counter):=user_name;
    counter:=counter+1;
  end loop;
  counter:=1;
  WHILE counter<=A_NAME.COUNT 
    LOOP 
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter:=counter+1;
  END LOOP;
end;
/

--ARRAY without extend() function
DECLARE 
   counter NUMBER := 1;
   user_name Users.first_name%type;
   family_name Users.last_name%type;
   TYPE NAMEARRAY IS VARRAY(7) OF Users.first_name%type; 
   A_NAME NAMEARRAY:=NAMEARRAY('user 1', 'user 2', 'user 3', 'user 4', 'user 5', 'user 6', 'user 7'); 
BEGIN
   counter := 1;
   FOR x IN 1..7  
   LOOP
      SELECT first_name,last_name INTO user_name,family_name FROM Users WHERE id=x;
	 
      A_NAME(counter) := concat(concat(user_name,' '),family_name);
      counter := counter + 1;
   END LOOP;
   counter := 1;
   WHILE counter <= A_NAME.COUNT 
   LOOP 
      DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
      counter := counter + 1;
   END LOOP;
END;
/

--IF /ELSEIF /ELSE
DECLARE 
   counter NUMBER := 1;
   --ID Transaction.id%type;
   Price Transaction.transaction_amount%type;
   TYPE NAMEARRAY IS VARRAY(10) OF Transaction.transaction_amount%type; 
   A_NAME NAMEARRAY:=NAMEARRAY('1', '2', '3', '4', '5', '6', '7', '8', '9', '10'); 
BEGIN
   counter := 1;
   FOR x IN 1..10  
   LOOP
      SELECT transaction_amount INTO price FROM Transaction WHERE id=x;
      if price < 121 
        then
        dbms_output.put_line(price ||' is of low range');
      elsif price > 179 
        then
        dbms_output.put_line(price ||' is of high range');
      else 
        dbms_output.put_line(price ||' is of middle range');
        end if;
   END LOOP;
END;
/

--Procedure
CREATE OR REPLACE PROCEDURE proc2(
  var1 IN NUMBER,
  var2 OUT VARCHAR2
)
AS
  t_show CHAR(37);
BEGIN
  t_show := 'Name of the user with reservation no ';
  SELECT first_name INTO var2 FROM Users WHERE id IN (SELECT customer_id FROM Reservation WHERE id = var1); 
  DBMS_OUTPUT.PUT_LINE(t_show || var1 || ' is ' || var2);
END;
/

set serveroutput on
declare 
res_no Reservation.id%type:=6;
user_name Users.first_name%type;
extra number;
begin
proc2(res_no,user_name);
end;
/

drop procedure proc2;

--Function
set serveroutput on
create or replace function fun(var1 in varchar) return varchar AS
value Train_Ticket.train_name%type;
begin
  select train_name into value from Train_Ticket where id=var1; 
   return value;
end;
/

set serveroutput on
declare 
value varchar(20);
begin
value:=fun(5);
DBMS_OUTPUT.PUT_LINE('Train Name is: ' || value);
end;
/

drop function fun;


------------------------------------------------------xxxxxxxxx------------------------------------------------------------


SET SERVEROUTPUT ON;
BEGIN

dbms_output.put_line('---------------------------------------------------------------------');
dbms_output.put_line('---------------------------------------------------------------------');
dbms_output.put_line('---------------------------------------------------------------------');
dbms_output.put_line('---------------------------------------------------------------------');
dbms_output.put_line('---------------------------------------------------------------------');
dbms_output.put_line('---------------------------------------------------------------------');
dbms_output.put_line('---------------------------------------------------------------------');
dbms_output.put_line('---------------------------------------------------------------------');
dbms_output.put_line('NAME OF THE PROJECT : Railway Reservation System Database');
dbms_output.put_line('FOR THE COURSE : CSE-3110-DATABASE SYSTEMS LABORATORY');
dbms_output.put_line('DEVELOPED BY : Asifur Rahman');
dbms_output.put_line('Roll:1907070');
dbms_output.put_line('YEAR : 3rd');
dbms_output.put_line('SEMESTER : 1st');
dbms_output.put_line('Khulna University of Engineering and Technology(KUET)');
END;
/


------------------------------------------------------xxxxxxxxx------------------------------------------------------------
