USE [Portfolio Projects]
GO

/****** Object:  View [dbo].[TypeDim]    Script Date: 04/08/2024 4:30:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[TypeDim] AS 
SELECT 
  TYPES as 'Type', 
  ROW_NUMBER() OVER (
    ORDER BY 
      TYPES
  ) AS TypeId 
FROM 
  (
    SELECT 
      DISTINCT 
      CASE 
        WHEN [Type] = 'Complaint' THEN 'Complaints'
        WHEN [Type] = 'Compliment' THEN 'Compliments'
        ELSE [Type]
      END AS TYPES
    FROM 
      [dbo].[RealEstate_Emails_Cases]
  ) AS uniqueType;
GO

