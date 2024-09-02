SELECT
         [ID]
        ,[Name] AS 'Competitor Name' 
        ,CASE WHEN SEX = 'M' THEN 'Male' ELSE 'Female'
		END AS Sex
        ,[Age]
		,CASE	WHEN [Age] < 18 THEN 'Under 18'
				WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
				WHEN [Age] BETWEEN 25 AND 35 THEN '25-35'
				WHEN [Age] > 35 THEN 'Over 35'
		 END AS [Age Grouping]
        ,[Height]
        ,[Weight]
        ,[NOC] AS 'Nation Code' 
		,left(Games,CHARINDEX(' ', Games)-1) AS Year
		,right(games,len(Games)-CHARINDEX(' ', Games)) AS Season
        ,[Sport]
        ,[Event]
        ,CASE WHEN Medal = 'NA' THEN 'Not Applicable' ELSE Medal
		 END AS Medal
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE right(games,len(Games)-CHARINDEX(' ', Games))='Summer'