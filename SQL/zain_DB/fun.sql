-- FUNCTION 1
CREATE OR REPLACE FUNCTION fun_issue_book
(borrowerid IN number, bookid IN number, current_date IN date)
RETURN number 
IS
isIssued number;
myStatus varchar2(20);
myDate date;
BEGIN
SELECT Books.status into myStatus
FROM Books
WHERE bookid = Books.book_id;

IF myStatus='not charged' THEN
INSERT INTO Issue
VALUES (bookid, borrowerid, current_date, NULL);
isIssued := 1;
ELSE
INSERT INTO Pending_request
VALUES (bookid, borrowerid, current_date, NULL);
isIssued := 0;
END IF; 

RETURN isIssued;
END;
/




-- FUNCTION 4
CREATE OR REPLACE FUNCTION fun_return_book
(bookid IN number, current_date in date)
RETURN number
IS
isReturned number := 0;
pendingBookID number := 0;
pendingPersonID number := 0;
minDate date;

BEGIN



SELECT MIN(Pending_request.request_date) into minDate
FROM Pending_request
WHERE Pending_request.book_id = bookid AND Pending_request.issue_date IS NULL;

SELECT Pending_request.book_id, Pending_request.requester_id into pendingBookID, pendingPersonID
FROM Pending_request
WHERE Pending_request.book_id = bookid AND Pending_request.request_date = minDate;

IF pendingBookID != 0 THEN
UPDATE Issue
SET Issue.return_date = current_date
WHERE Issue.book_id = bookid AND Issue.return_date IS NULL;

DELETE FROM Pending_request
WHERE Pending_request.book_id = pendingBookID;

isReturned := 1;

ELSIF pendingBookID = 0 THEN
isReturned := 0;

END IF;

UPDATE Pending_request
SET Pending_request.issue_date = current_date
WHERE Pending_request.requester_id = pendingPersonID AND Pending_request.book_id=bookid;
INSERT INTO Issue 
VALUES(bookid,pendingPersonID,current_date,NULL);

EXCEPTION 
WHEN NO_DATA_FOUND THEN
RETURN isReturned;


RETURN isReturned;
END;
/


-- FUNCTION 2


CREATE OR REPLACE FUNCTION fun_issue_anyedition
(borrowerid IN number, booktitle IN varchar2, authorname IN varchar2, current_date IN date)
RETURN number 
IS
isIssued number := 0;
myStatus varchar2(20);
myDate date;
myEdition number := 0;
myBookID number;
myBookID2 number;
myAuthorID number;
BEGIN
SELECT MAX(Books.edition) into myEdition
FROM Books
WHERE booktitle = Books.book_title AND Books.status = 'not charged';

--SELECT author_id into myAuthorID
--FROM Author
--WHERE Author.name = authorname;

SELECT book_id into myBookID
FROM Books
WHERE booktitle = Books.book_title AND Books.edition = myEdition;

IF myEdition = 0 THEN
SELECT Issue.book_id into myBookID2
FROM Issue, Books
WHERE Books.book_title = bookTitle AND Issue.book_id = Books.book_id AND rownum <= 1
ORDER BY Issue.issue_date ASC;

INSERT INTO Pending_request
VALUES (myBookID2, borrowerid, current_date, NULL);
isIssued := 0;
ELSE
INSERT INTO Issue
VALUES (myBookID, borrowerid, current_date, NULL);
isIssued := 1;

END IF; 

RETURN isIssued;

EXCEPTION 
WHEN no_data_found THEN
RETURN isIssued;
END;
/


-- FUNCTION 5


CREATE OR REPLACE FUNCTION fun_renew_book
(borrower_id IN number, book_id IN number, current_date in date)
RETURN number
IS
isRenewed number := 0;
alreadyIssued number := 0;
alreadyPending number := 0;

BEGIN

SELECT COUNT(*) into alreadyPending
FROM Pending_request
WHERE Pending_request.book_id = book_id;

SELECT COUNT(*) into alreadyIssued
FROM Issue
WHERE Issue.book_id = book_id AND Issue.borrower_id = borrower_id;

IF alreadyIssued != 0 AND alreadyPending != 0 THEN
UPDATE Issue
SET issue_date = current_date, return_date = NULL
WHERE Issue.borrower_id = borrower_id AND Issue.book_id = book_id;

isRenewed := 1;

END IF; 

RETURN isRenewed;
END;
/


-- FUNCTION 3

CREATE function fun_most_popular(month in number, year in number)
RETURN varchar2 
IS 
c_IDS varchar2(500) := '';
counter number := 0;
bk_ID Books.book_id%type;
BEGIN
DECLARE

CURSOR myCursor IS
SELECT Issue.book_id
FROM Issue
WHERE EXTRACT (year FROM Issue.issue_date) = year AND EXTRACT(month FROM Issue.issue_date) = month 
GROUP BY Issue.book_id
HAVING COUNT(*) =(SELECT MAX(COUNT(*))
FROM Issue
WHERE EXTRACT(year from Issue.issue_date) = year AND EXTRACT(month FROM Issue.issue_date) = month 
GROUP BY Issue.book_id);
BEGIN
OPEN myCursor;
LOOP
FETCH myCursor INTO bk_ID;
EXIT WHEN myCursor%NOTFOUND;
IF (counter != 0) THEN
SELECT CONCAT(c_IDS, CONCAT(', ',bk_ID)) INTO c_IDS FROM DUAL;
ELSE
c_IDS := bk_ID;
END IF;
counter := counter + 1;
END LOOP;
CLOSE myCursor;
END;
RETURN c_IDS;
END;
/

