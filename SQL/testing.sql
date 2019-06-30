
/*

SELECT COunt, 
  COUNT(
    CASE
      WHEN State="New"
      THEN 1
      ELSE NULL
    END
  ) AS Count




SELECT COUNT(CASE when StateCount=3 Then "Prospect" ELSE NULL END) As Counter
FROM (
  SELECT COUNT(*) As StateCount
  FROM MOCK_DATA
  GROUP BY ProjectName
)

*/

/*
  
  
  SELECT ProjectName, COUNT(*) As StateCount
  FROM MOCK_DATA 
  GROUP BY ProjectName
 ;


SELECT State, 
  COUNT(
    CASE
      WHEN State="Rejected"
      THEN 1
      ELSE NULL,
      WHEN State='New'
      THEN 1
      ELSE NULL
    END
  ) AS Count

FROM MOCK_DATA
GROUP BY State;
*/

/*
SELECT 
    COUNT(CASE WHEN rsp_ind = 0 then 1 ELSE NULL END) as "New",
    COUNT(CASE WHEN rsp_ind = 1 then 1 ELSE NULL END) as "Accepted"
from tb_a

*/

/*
SELECT
FROM (
  SELECT [ProjectID, State, StateEntryTime]
  FROM MOCK_DATA
) AS SourceTable PIVOT(AVG([StateEntryTime]) For [State] in ([New], [Submitted], [Prospect], [Approved], [Rejected]))
AS PivotTable;
*/




/* 
SELECT *
FROM
(
    SELECT [PolNumber],
           [PolType],
           [Effective Date],
           [DocName],
           [Submitted]
    FROM [dbo].[InsuranceClaims]
) AS SourceTable PIVOT(AVG([Submitted]) FOR [DocName] IN([Doc A],
                                                         [Doc B],
                                                         [Doc C],
                                                         [Doc D],
                                                         [Doc E])) AS PivotTable;
*/