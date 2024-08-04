USE [Portfolio Projects]
GO

/****** Object:  View [dbo].[FACT_RealEstate_Emails_Cases]    Script Date: 04/08/2024 3:58:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER   VIEW [dbo].[FACT_RealEstate_Emails_Cases] AS
WITH Fact AS (
  SELECT 
    *, 
    CASE WHEN [Type] = 'Complaint' THEN 'Complaints' 
	WHEN [Type] = 'Compliment' THEN 'Compliments' 
	ELSE [Type] END AS Types 
  FROM 
    [dbo].[RealEstate_Emails_Cases]
) 
SELECT 
  f.[CaseNumber],
  CONVERT(date,f.[CreatedDate]) as CreatedDate,
  CAST(f.[CreatedDate] AS time) as CreatedTime,
  CONVERT(date,f.[ClosedDate]) as ClosedDate,
  t.[TypeId] ,
  cat.[CategoryId],
  subcat.[SubCategoryId],
  asTo.[AssignedToId],
  sla.[SLAStatusId],
  chan.[ChannelId],
  st.[Status]
FROM 
  Fact f 
  LEFT JOIN [dbo].[TypeDim] t ON f.Types = t.[Type]
  LEFT JOIN [dbo].[categoryDim] cat ON f.[Category] = cat.[Category]
  LEFT JOIN [dbo].[subCategoryDim] subcat ON f.[SubCategory] = subcat.[SubCategory]
  LEFT JOIN [dbo].[assignedToDim] asTo ON f.[AssignedTo] = asTo.[AssignedTo]
  LEFT JOIN [dbo].[slaStatusDim] sla ON f.[SLAStatus] = sla.[SLAStatus]
  LEFT JOIN [dbo].[ChannelDim] chan ON f.[Channel] = chan.[Channel]
  LEFT JOIN [dbo].[StatusDim] st ON f.[Status] = st.[Status]
  
  ;

GO


