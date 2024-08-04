USE [Portfolio Projects]
GO

/****** Object:  View [dbo].[subCategoryDim]    Script Date: 04/08/2024 4:30:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[subCategoryDim] AS 
SELECT 
  [SubCategory], 
  ROW_NUMBER() OVER (
    ORDER BY 
      [SubCategory]
  ) AS SubCategoryId 
FROM 
  (
    SELECT 
      DISTINCT [SubCategory] 
    FROM 
      [dbo].[RealEstate_Emails_Cases]
  ) AS uniqueSubCategory;
GO

