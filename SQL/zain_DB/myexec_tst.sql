
rem PORJECT 2
rem CS 340

SET 	SERVEROUTPUT ON 
rem SET 	Linesize 700
rem SET 	Pagesize 60
ALTER SESSION SET nls_date_format = 'dd-mon-yy';
----------------------------------------------
----------------CREATE TABLE------------------
----------------------------------------------
EXEC DBMS_OUTPUT.PUT_LINE('#####CREATING TABLES#####');
@createtable;
----------------------------------------------
----------------POPULATE----------------------
----------------------------------------------
EXEC DBMS_OUTPUT.PUT_LINE('#####POPULATING#####');

@tgr;
@fun;
@pro;

@populate;

----------------------------------------------
---EXECUTE TRIGGER, FUNCTION and PROCEDURE----
----------------------------------------------

----------------------------------------------
--------------fun_issue_book------------------
----------------------------------------------


EXEC DBMS_OUTPUT.PUT_LINE('#####ISSUING BOOKS#####');
Declare
ret_val NUMBER;
Begin
ret_val:=fun_issue_book(21,21,'3/3/16');
ret_val:=fun_issue_book(22,22,'3/3/16');
ret_val:=fun_issue_book(23,23,'3/3/16');
ret_val:=fun_issue_book(24,24,'3/3/16');
ret_val:=fun_issue_book(25,25,'3/3/16');
ret_val:=fun_issue_book(26,21,'3/4/16');
ret_val:=fun_issue_book(27,22,'3/4/16');
ret_val:=fun_issue_book(28,23,'3/4/16');
ret_val:=fun_issue_book(29,24,'3/4/16');
ret_val:=fun_issue_book(30,25,'3/4/16');
End;
.
/
show error;


----------------------------------------------
--------------fun_issue_anyedition------------
----------------------------------------------
ALTER SESSION SET nls_date_format = 'MM/DD/YY';

EXEC DBMS_OUTPUT.PUT_LINE('#####ISSUING BOOKS OF ANY EDITIONS#####');
Declare
ret_val NUMBER;
Begin
ret_val:=fun_issue_anyedition(2,'DATA MANAGEMENT','C.J.DATES','3/3/16');
ret_val:=fun_issue_anyedition(4,'CALCULUS','H.ANTON','3/4/16');
ret_val:=fun_issue_anyedition(5,'ORACLE','ORACLE PRESS','3/4/16');
ret_val:=fun_issue_anyedition(10,'IEEE MULTIMEDIA','IEEE','2/27/16');
ret_val:=fun_issue_anyedition(2,'MISS MANAGEMENT','C.J.DATES','5/3/16');
ret_val:=fun_issue_anyedition(4,'CALCULUS','H.ANTON','3/4/16');
ret_val:=fun_issue_anyedition(10,'ORACLE','ORACLE PRESS','3/4/16');
ret_val:=fun_issue_anyedition(5,'IEEE MULTIMEDIA','IEEE','2/26/16');
ret_val:=fun_issue_anyedition(2,'DATA STRUCTURES','W.GATES','3/3/16');
ret_val:=fun_issue_anyedition(4,'CALCULUS','H.ANTON','4/4/16');
ret_val:=fun_issue_anyedition(11,'ORACLE','ORACLE PRESS','3/8/16');
ret_val:=fun_issue_anyedition(6,'IEEE MULTIMEDIA','IEEE','2/17/16');
End;
.
/
show error;

select * from issue;
select * from pending_request;

-----------------------------------------------
----------print_borrower-----------------------
-----------------------------------------------
EXEC DBMS_OUTPUT.PUT_LINE('#####PRINTING BORROWER TILL 02/28/16 ONLY #####');
EXEC pro_print_borrower();
EXEC DBMS_OUTPUT.PUT_LINE('#####PRINTING BORROWER TILL 12/04/16 ONLY #####');
EXEC pro_print_borrower();

----------------------------------------------
----------print_file--------------------------
----------------------------------------------
EXEC DBMS_OUTPUT.PUT_LINE('#####PRINTING FINES TILL 05/16/16#####');
EXEC pro_print_fine('05/16/16');

----------------------------------------------
----------Returning Books---------------------
----------------------------------------------
EXEC DBMS_OUTPUT.PUT_LINE('#####RETURNING BOOKS 1 2 4 21 22 23 24#####');
Declare
ret_val NUMBER;
Begin
ret_val:=fun_return_book(1,'04/04/16');
ret_val:=fun_return_book(2,'04/04/16');
ret_val:=fun_return_book(4,'04/04/16');
ret_val:=fun_return_book(10,'04/04/16');
ret_val:=fun_return_book(21,'04/04/16');
ret_val:=fun_return_book(22,'04/04/16');
ret_val:=fun_return_book(23,'04/04/16');
ret_val:=fun_return_book(24,'04/04/16');
End;
.
/

---------------------------------------------
-----Printing the Pending_request Issue------
---------------------------------------------
EXEC DBMS_OUTPUT.PUT_LINE('#####DISPLAYING PENDING BOOKS and ISSUED BOOKS#####');
SELECT * FROM Pending_request;
SELECT * FROM Issue;

---------------------------------------------
------------Displaying for user 10-----------
---------------------------------------------
EXEC DBMS_OUTPUT.PUT_LINE('#####DISPLAYING BOOKS ISSUED by USER 10 for 2/3 and 3/3#####');
EXEC pro_listborr_mon(10,'2','3');
EXEC pro_listborr_mon(10,'3','3');

---------------------------------------------
------------Printing borrower's list---------
---------------------------------------------
EXEC DBMS_OUTPUT.PUT_LINE('#####DISPLAYING BORROWER LIST#####');
EXEC pro_listborr;

---------------------------------------------
-----------Printing popular list-------------
---------------------------------------------
EXEC DBMS_OUTPUT.PUT_LINE('#####DISPLAYING POPULAR BOOKS#####');
EXEC pro_list_popular(17);


---------------------------------------------
----------DROPPING ALL ----------------------
---------------------------------------------
EXEC DBMS_OUTPUT.PUT_LINE('#####DROPPING ALL#####');
@dropall;
