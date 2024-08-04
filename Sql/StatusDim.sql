USE [Portfolio Projects]
GO

/****** Object:  View [dbo].[StatusDim]    Script Date: 04/08/2024 4:30:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[StatusDim] AS 
SELECT 
  [Status], 
  ROW_NUMBER() OVER (
    ORDER BY 
      [Status]
  ) AS StatusId 
FROM 
  (
    SELECT 
      DISTINCT [Status] 
    FROM 
      [dbo].[RealEstate_Emails_Cases]
  ) AS uniqueStatus;



GO

