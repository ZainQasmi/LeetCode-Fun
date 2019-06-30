-- in summary 
-- seasonsd pyton deve sql dev
-- using scripting pipelininign 

-- ============================================================================================================
-- Q1) Write a query to get the following
-- How many projects in each of the above states at its current final state.

-- New
-- Submitted
-- Prospect
-- Approved
-- Rejected

-- Pick the item with latest StateEntryTime for each ProjectID
SELECT State,COUNT(T1.ProjectID) as StateCount
FROM MOCK_DATA T1
INNER JOIN (
  SELECT ProjectID, MAX(StateEntryTime) as MaxDate
  FROM MOCK_DATA
  GROUP BY ProjectID
) T2 ON T1.StateEntryTime = T2.MaxDate
GROUP BY State   	

-- Can further add this ORDER BY with CASE clauses to produce State in order
ORDER BY
  CASE when State='Rejected' Then 5 END,
  CASE when State='Approved' Then 4 END,
  CASE when State='Prospect' Then 3 END,
  CASE when State='Submitted'  Then 2 END,
  CASE when State='New' Then 1 END
;



SELECT State, COUNT(T1.ProjectID) as StateCount
FROM (SELECT 
  ProjectID,
  State, 
  RANK() OVER(PARTITION BY ProjectID ORDER BY StateEntryTime DESC) Latest
  FROM MOCK_DATA
  ) as T1
WHERE Latest=1
GROUP BY State;

-- Hacky Solution. Deprecated
SELECT 
  COUNT(CASE when StateCount=1 Then "New" ELSE NULL END) as "New",
  COUNT(CASE when StateCount=2 Then "Submitted" ELSE NULL END) as "Submitted",
  COUNT(CASE when StateCount=3 Then "Prospect" ELSE NULL END) as "Prospect"
FROM (
  SELECT COUNT(*) as StateCount
  FROM MOCK_DATA
  GROUP BY ProjectName) as S_Count
;


-- ============================================================================================================
-- Q2) How would you simplify the query if only Approved and Rejected are needed ?
-- Approved -- ??
-- Rejected -- ??

SELECT State, COUNT(ProjectID) as Count
FROM MOCK_DATA
WHERE State="Approved" OR State="Rejected"
GROUP BY State

-- What if there were 10 distinct types? Use IN clause
SELECT State, COUNT(ProjectID) as Count
FROM MOCK_DATA
WHERE State IN ("Rejected", "Approved")
GROUP BY State
;


-- ============================================================================================================
-- Q3) Write a query to get the following result
-- ID   New         Submitted   Prospect    Approved    Rejected
-- 1    2019-01-01  2019-01-11  2019-01-21  2019-01-31
-- 2    2019-03-03  2019-04-05  2019-04-06              2019-04-10
-- 3    2019-04-04  2019-04-04  2019-04-05
-- 4    2019-05-18  2019-05-20
-- 5    2019-05-21

-- Using PIVOT function from SQL Server
SELECT
  ProjectID as ID,
  isnull(CAST([New] AS varchar),'') as 'New', -- Replaces null values with empty string.
  isnull(CAST([Submitted] AS varchar),'') as 'Submitted',
  isnull(CAST([Prospect] AS varchar),'') as 'Prospect',
  isnull(CAST([Approved] AS varchar),'') as 'Approved',
  isnull(CAST([Rejected] AS varchar),'') as 'Rejected'
FROM MOCK_DATA
PIVOT (
  MAX (StateEntryTime)
  FOR State
  IN (New, Submitted, Prospect, Approved, Rejected)
)
AS PIVOTTABLE
ORDER BY ProjectID
;

-- Using CASE statements from MySQL
SELECT  
 ProjectID as ID,
 MAX(CASE when State='New' Then StateEntryTime ELSE '' END) as New,
 MAX(CASE when State='Submitted' Then StateEntryTime ELSE '' END) as Submitted,
 MAX(CASE when State='Prospect' Then StateEntryTime ELSE '' END) as Prospect,
 MAX(CASE when State='Approved' Then StateEntryTime ELSE '' END) as Approved,
 MAX(CASE when State='Rejected' Then StateEntryTime ELSE '' END) as Rejected
FROM MOCK_DATA
GROUP BY ID
;




-- ============================================================================================================
-- Q4) Given a table with 4 cols (Emp_id, emp_name, date_of_joining, dept_id)
-- a) write a query to show the number of employees in each department that have more than
-- 50 employees sorted desc on biggest size of employees.

SELECT dept_id, COUNT(*) AS "Employee Count"
FROM table_name 
GROUP BY dept_id 
HAVING COUNT(dept_id) > 50
ORDER BY COUNT(dept_id) DESC;



-- ============================================================================================================
-- b) Generate a serial number for this result set as part of the query

-- Using mySQL
SET @row_number = 0;
SELECT
  (@row_number:=@row_number + 1) AS 'Serial_No',
  dept_id AS 'Department ID',
  EmployeeCount
FROM (
  SELECT dept_id, COUNT(Emp_id) AS 'EmployeeCount'
  FROM MOCK_DATA_2
  GROUP BY dept_id
  HAVING COUNT(dept_id) > 5
  ORDER BY COUNT(dept_id) DESC
  ) as R
;


-- Using SQL Server
SELECT
  ROW_NUMBER() OVER(ORDER BY dept_id DESC) AS Serial_No,
  dept_id AS DepartmentID,
  EmployeeCount
FROM (
  SELECT dept_id, COUNT(Emp_id) AS EmployeeCount
  FROM MOCK_DATA_2 
  GROUP BY dept_id 
  HAVING COUNT(dept_id) > 2 
  ) as R
ORDER BY EmployeeCount DESC
;



-- ============================================================================================================
-- c) The records now have a repeated field called Project, Role where both are enums.
-- Enhance the query to find only those departments where number of managers is more
-- than 10.

-- For example, Employee Yvonne, ITdept, SalesProject:Developer, OrderProject:Analyst, QuotingProject:Manager. 

-- Table Emp:
-- Emp_id, 
-- name, 
-- date_of_joining, 
-- Dept_id,
-- ProjectRoleEnum
-- Project,
-- Role

-- Look into: BigQuery Repeated Fields for solution. (nested and repeated columns)
-- https://cloud.google.com/bigquery/docs/legacy-nested-repeated

-- Given Table:
Row	Emp_id	name	date_of_joining	Dept_id	ProjectRoleEnum.Project	ProjectRoleEnum.Role
1	1	    Yvonne	2000-12-01	    123	    Sales	                Develepor
					                        Order	                Analyst
                                            Quoting	                Manager

-- After Unnesting:
Row	Emp_id	name	date_of_joining	Dept_id	ProjectRoleEnum.Project	ProjectRoleEnum.Role
1	1	    Yvonne	2000-12-01	    123	    Sales	                Develepor
2	1	    Yvonne	2000-12-01	    123	    Order	                Analyst
3	1	    Yvonne	2000-12-01	    123	    Quoting	                Manager


SELECT Dept_id, Count(*) AS ManagerCount
FROM (
    SELECT Dept_id, Role
    FROM MOCK_DATA_4C
    CROSS JOIN UNNEST(ProjectRoleEnum) as ProjectRoleEnum
    WHERE Role = "Manager"
)
GROUP BY Dept_id
Having Count(*) > 10
;

SELECT Dept_id, COUNT(*) AS ManagerCount
FROM
(
  SELECT Dept_id, ProjectRoleEnum.Role
  FROM (FLATTEN(MOCK_DATA_4C, ProjectRoleEnum)
  WHERE ProjectRoleEnum.Role = "Manager"
)
GROUP BY Dept_id
HAVING COUNT(*) > 10;




-- ============================================================================================================
-- Q5) Given two tables:
-- Table 1: Projects (Project_ID, Manager, Project_Name, Status)
-- Table 2: ProjectsRisks (Project_ID, Risk_Name, Date)

-- Write a query that lists each manager with their latest risk per project.

-- SELECT Manager, Risk_Name
-- FROM Projects
-- INNER JOIN ProjectsRisks ON Projects.Project_ID = ProjectsRisks.Project_ID
-- WHERE Date


SELECT Manager, Project_Name, Risk_Name, MAX(Date) as Latest_Risk
FROM ProjectsRisks sub2
INNER JOIN Projects ON sub2.Project_ID = Projects.Project_ID
GROUP BY Manager
ORDER BY Date DESC
;


Select Manager,Project_Name,Risk_Name  
from 
(
  Select T1.Manager,T1.Project_Name,T2.Risk_Name,
  rank() over(partition by T.manager order by Date desc) rnk
  From Projects T1 join Projects_Risks T2
  On T1.ProjectID = T2.Project_id)
)
Where rnk=1;

Select Manager,Project_Name,Risk_Name  
FROM 
(
  Select 
    T1.Manager,
    T1.Project_Name,
    T2.Risk_Name,
    RANK() OVER (PARTITION BY T.Manager ORDER BY Date DESC) rnk
  From Projects T1 
  INNER JOIN ProjectsRisks T2 ON T1.Project_ID = T2.Project_ID
)

;



SELECT 
  Manager, 
  Project_Name, 
  Risk_Name,
  Date
FROM
(
  SELECT 
    Manager,
    Project_Name,
    Risk_Name,
    Date,
    RANK() OVER (PARTITION BY Manager ORDER BY Date DESC) AS Latest_Risk
  FROM Projects 
  INNER JOIN ProjectsRisks ON Projects.Project_ID = ProjectsRisks.Project_ID
) as SUB
WHERE Latest_Risk = 1
;