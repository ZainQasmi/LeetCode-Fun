DECLARE
  ans number := 0;
BEGIN
  ans := fun_issue_book(7, 7,to_date('21/7/2016','DD/MM/YYYY'));    
  ans := fun_issue_book(7, 8,to_date('22/2/2016','DD/MM/YYYY'));    

  ans := fun_issue_book(2, 9,to_date('3/2/2016','DD/MM/YYYY'));   
  ans := fun_issue_book(2, 7,to_date('5/2/2016','DD/MM/YYYY'));     
  ans := fun_issue_book(3, 8,to_date('3/12/2016','DD/MM/YYYY'));     
  --ans := fun_issue_book(7, 3,to_date('3/12/2016','DD/MM/YYYY'));   cant issue more than 2
  ans := fun_issue_anyedition(2, 'DATA MANAGEMENT', 'C.J. DATES',to_date('3/3/2016','DD/MM/YYYY'));
  ans := fun_issue_anyedition(3, 'CALCULUS', 'H. ANTON',to_date('3/3/2016','DD/MM/YYYY'));
  ans := fun_issue_anyedition(5, 'ORACLE', 'ORACLE PRESS',to_date('3/3/2016','DD/MM/YYYY'));
  ans := fun_issue_anyedition(12, 'IEEE MULTIMEDIA', 'IEEE',to_date('27/2/2016','DD/MM/YYYY'));
  ans := fun_issue_anyedition(3, 'CALCULUS II', 'H. ANTON',to_date('3/3/2016','DD/MM/YYYY'));
  ans := fun_issue_anyedition(12, 'ORACLE', 'ORACLE PRESS',to_date('3/3/2016','DD/MM/YYYY'));
  ans := fun_issue_anyedition(5, 'IEEE MULTIMEDIA', 'IEEE',to_date('26/2/2016','DD/MM/YYYY'));
  ans := fun_issue_anyedition(2, 'DATA STRUCTURE', 'W. GATES',to_date('3/3/2016','DD/MM/YYYY'));
  ans := fun_issue_anyedition(3, 'CALCULUS III', 'H. ANTON',to_date('3/3/2016','DD/MM/YYYY'));
  ans := fun_issue_anyedition(11, 'ORACLE', 'ORACLE PRESS',to_date('8/3/2016','DD/MM/YYYY'));
  ans := fun_issue_anyedition(6, 'IEEE MULTIMEDIA', 'IEEE',to_date('17/2/2016','DD/MM/YYYY'));

END;
/
  EXECUTE pro_print_fine(to_date('3/5/2016','DD/MM/YY'));
  EXECUTE pro_print_borrower;


DECLARE
   ans number := 0;
BEGIN
  dbms_output.put_line('check return');
  ans := fun_return_book(7,to_date('7/12/2016','DD/MM/YYYY'));
  ans := fun_return_book(2,to_date('7/12/2016','DD/MM/YYYY'));
  ans := fun_return_book(3,to_date('24/2/2016','DD/MM/YYYY'));
  ans := fun_return_book(12,to_date('7/12/2016','DD/MM/YYYY'));
END;
/

select * from issue;
select * from Pending_request;

EXECUTE pro_listborr_mon(2,2,2016);
EXECUTE pro_listborr_mon(3,3,2016);
EXECUTE pro_listborr;
EXECUTE pro_list_popular(2016);


