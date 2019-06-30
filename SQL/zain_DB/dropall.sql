DROP TRIGGER trg_maxbooks;
DROP TRIGGER trg_issue;
DROP TRIGGER trg_notissue;

DROP FUNCTION fun_issue_book;
DROP FUNCTION fun_issue_anyedition;
DROP FUNCTION fun_most_popular;
DROP FUNCTION fun_return_book;
DROP FUNCTION fun_renew_book;

DROP TABLE Issue;
DROP TABLE Pending_request;
DROP TABLE Borrower;
DROP TABLE Books;
DROP TABLE Author;

DROP PROCEDURE pro_print_borrower;
DROP PROCEDURE pro_print_fine;
DROP PROCEDURE pro_listborr_mon;
DROP PROCEDURE pro_listborr;
DROP PROCEDURE pro_list_popular;
