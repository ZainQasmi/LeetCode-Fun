-- Procedure 1

CREATE OR REPLACE PROCEDURE pro_print_borrower
IS
BEGIN
DECLARE
no_days int := 0;
b_name Borrower.name%type;
bk_title Books.book_title%type;
i_date Issue.issue_date%type;
CURSOR myCursor IS
SELECT Borrower.name, Books.book_title, Issue.issue_date
FROM Borrower, Books, Issue
WHERE Issue.return_date is NULL AND  Borrower.borrower_id = Issue.borrower_id AND Borrower.borrower_id = Books.book_id;
BEGIN
OPEN myCursor;
dbms_output.put_line('Borrower Name' || 'Book Title'  || '<= 5 days' || '<= 10 days' || '<= 15 days' || '>15 days');
LOOP
FETCH myCursor into b_name, bk_title, i_date;
EXIT WHEN myCursor%notfound;
SELECT (current_date - i_date) into no_days FROM DUAL;
no_days := trunc(no_days);
IF no_days <= 5 THEN
dbms_output.put_line( b_name || bk_title  || no_days || '______' || '______' || '______');
ELSIF no_days <= 10 THEN
dbms_output.put_line( b_name || bk_title  || '______' || no_days || '______' || '______');
ELSIF no_days <= 15 THEN
dbms_output.put_line( b_name || bk_title  || '______' || '______' || no_days || '______');
ELSIF no_days > 15 THEN
dbms_output.put_line( b_name || bk_title  || '______' || '______' || '______' || no_days );
END IF;
END LOOP;
CLOSE myCursor;
END;
END;
/

-- PROCEDURE 2

CREATE PROCEDURE pro_print_fine (current_date in date) 
IS    
BEGIN 
DECLARE
no_days int := 0;
fine int := 0;
b_name Borrower.name%type;
bk_id Books.book_id%type;
i_date Issue.issue_date%type;
r_date Issue.return_date%type;


CURSOR myCursor IS
SELECT Borrower.name, Issue.book_id, Issue.issue_date, Issue.return_date
FROM Borrower, Issue
WHERE Borrower.borrower_id = Issue.borrower_id;

BEGIN
OPEN myCursor;
dbms_output.put_line('Borrower Name' || 'Book ID'  || 'ISSUE DATE');

LOOP
FETCH myCursor into b_name, bk_id, i_date, r_date;
EXIT WHEN myCursor%notfound;

IF (r_date - i_date) > 5 THEN
SELECT (r_date - i_date) into no_days FROM DUAL;
no_days := no_days+5;
IF no_days > 0 THEN
fine := no_days*5;
END IF;
dbms_output.put_line(b_name || bk_id  || i_date || fine );
END IF;

IF r_date IS NULL THEN
SELECT (current_date - i_date) into no_days FROM DUAL;
no_days := no_days+5;
IF no_days > 0 THEN
fine := no_days*5;
END IF;
dbms_output.put_line(b_name || bk_id  || i_date || fine );
END IF;
END LOOP;
CLOSE myCursor;
END;
END;
/


-- PROCEDURE 3

CREATE PROCEDURE pro_listborr_mon (borrowe_id in number, month in number, year in number)
IS
BEGIN
DECLARE
b_id Borrower.borrower_id%type;
b_name Borrower.name%type;
bk_id Books.book_id%type;
bk_title Books.book_title%type;
i_date Issue.issue_date%type;
r_date Issue.return_date%type;

CURSOR myCursor IS
SELECT  Borrower.borrower_id, Borrower.name, Books.book_id, Books.book_title, Issue.issue_date, Issue.return_date
FROM  Issue, Borrower,Books
WHERE Issue.borrower_id = borrowe_id 
AND Issue.book_id = Books.book_id
AND Borrower.borrower_id = borrowe_id;

BEGIN
OPEN myCursor;
dbms_output.put_line('Borrower ID' ||'Borrower Name' ||'Book ID' ||'Book Title' || 'Issue DATE'  || 'Return Date');

LOOP
FETCH myCursor into b_id, b_name, bk_id, bk_title, i_date, r_date;
EXIT WHEN myCursor%notfound;

IF extract(month from i_date) = month AND extract(year from i_date) = year THEN
dbms_output.put_line(b_id || b_name || bk_id || bk_title || i_date || r_date);
END IF;

END LOOP;
CLOSE myCursor;
END;
END;
/


-- PROCEDURE 4

CREATE PROCEDURE pro_listborr
IS
BEGIN
DECLARE
b_id Borrower.borrower_id%type;
b_name Borrower.name%type;
bk_id Books.book_id%type;
bk_title Books.book_title%type;
i_date Issue.issue_date%type;
r_date Issue.return_date%type;

CURSOR myCursor IS
SELECT Borrower.name, Issue.book_id, Issue.issue_date
FROM Borrower, Issue
WHERE Borrower.borrower_id = Issue.borrower_id;

BEGIN
OPEN myCursor;
dbms_output.put_line('Borrower Name' ||'Book ID' || 'Issue DATE');

LOOP
FETCH myCursor into b_name, bk_id, i_date;
EXIT WHEN myCursor%notfound;

dbms_output.put_line(b_name || bk_id || i_date);

END LOOP;

CLOSE myCursor;
END;
END;
/


-- PROCEDURE 5
CREATE OR REPLACE procedure pro_list_popular (year NUMBER) IS
       answers varchar2(500);
BEGIN
DECLARE
name1 varchar2(100);
BEGIN
dbms_output.put_line('MONTH'||'YEAR');

dbms_output.put_line('JANUARY, '||year);
answers := fun_most_popular(1, year);
dbms_output.put_line('FEBURARY, '||year);
answers := fun_most_popular(2, year);
dbms_output.put_line('MARCH, '||year);
answers := fun_most_popular(3, year);
dbms_output.put_line('APRIL, '||year);
answers := fun_most_popular(4, year);
dbms_output.put_line('MAY, '||year);
answers := fun_most_popular(5, year);
dbms_output.put_line('JUNE, '||year);
answers := fun_most_popular(6, year);
dbms_output.put_line('JULY, '||year);
answers := fun_most_popular(7, year);
dbms_output.put_line('AUGUST, '||year);
answers := fun_most_popular(8, year);
dbms_output.put_line('SEPTEMBER, '||year);
answers := fun_most_popular(9, year);
dbms_output.put_line('OCTOBER, '||year);
answers := fun_most_popular(10, year);
dbms_output.put_line('NOVEMBER, '||year);
answers := fun_most_popular(11, year);
dbms_output.put_line('DECEMBER, '||year);
answers := fun_most_popular(12, year);
END;
END;
/
