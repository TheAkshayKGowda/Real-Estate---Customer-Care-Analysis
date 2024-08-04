USE [Portfolio Projects]
GO

/****** Object:  View [dbo].[categoryDim]    Script Date: 04/08/2024 4:29:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[categoryDim] AS 
SELECT 
  [Category], 
  ROW_NUMBER() OVER (
    ORDER BY 
      [Category]
  ) AS CategoryId 
FROM 
  (
    SELECT 
      DISTINCT [Category] 
    FROM 
      [dbo].[RealEstate_Emails_Cases]
  ) AS uniqueCategory;
GO

