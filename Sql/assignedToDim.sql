USE [Portfolio Projects]
GO

/****** Object:  View [dbo].[assignedToDim]    Script Date: 04/08/2024 4:29:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[assignedToDim] AS 
SELECT 
  [AssignedTo], 
  ROW_NUMBER() OVER (
    ORDER BY 
      [AssignedTo]
  ) AS AssignedToId 
FROM 
  (
    SELECT 
      DISTINCT [AssignedTo] 
    FROM 
      [dbo].[RealEstate_Emails_Cases]
  ) AS uniqueAssignedTo;
GO


