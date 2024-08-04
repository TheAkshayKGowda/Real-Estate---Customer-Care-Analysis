USE [Portfolio Projects]
GO

/****** Object:  View [dbo].[slaStatusDim]    Script Date: 04/08/2024 4:30:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[slaStatusDim] AS 
SELECT 
  [SLAStatus], 
  ROW_NUMBER() OVER (
    ORDER BY 
      [SLAStatus]
  ) AS SLAStatusId 
FROM 
  (
    SELECT 
      DISTINCT [SLAStatus] 
    FROM 
      [dbo].[RealEstate_Emails_Cases]
  ) AS uniqueSLAStatus;
GO

