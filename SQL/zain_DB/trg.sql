CREATE TRIGGER trg_maxbooks
BEFORE INSERT ON Issue
FOR EACH ROW

DECLARE
    temp1 number;
    temp2 number;

BEGIN
SELECT COUNT(Issue.book_id) into temp1
FROM Issue, Borrower
WHERE Issue.borrower_id =:NEW.borrower_id AND Borrower.borrower_id = Issue.borrower_id AND Borrower.status = 'student';

SELECT COUNT(Issue.book_id) into temp2
FROM Issue, Borrower
WHERE Issue.borrower_id =:NEW.borrower_id AND Borrower.borrower_id = Issue.borrower_id AND Borrower.status = 'faculty';

IF temp1 >= 2 THEN
raise_application_error(-20101, 'student cannot have more than 3 books issued against his/her name');
ELSIF temp2 >= 3 THEN
raise_application_error(-20101, 'faculty cannot have more than 3 books issued against his/her name');
END IF;
END trg_maxbooks;
/


CREATE TRIGGER trg_issue
AFTER INSERT ON Issue
FOR EACH ROW

DECLARE
    temp1 number;
    temp2 number;

BEGIN
UPDATE Books
SET status = 'issued'
WHERE Books.Book_id = :NEW.Book_id;

END trg_issue;
/

CREATE TRIGGER trg_notissue
AFTER DELETE ON Issue
FOR EACH ROW

DECLARE
    temp1 number;
    temp2 number;

BEGIN
UPDATE Books
SET status = 'not_issued'
WHERE Books.Book_id = :OLD.Book_id;

END trg_notissue;
/
