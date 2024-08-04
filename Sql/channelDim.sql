USE [Portfolio Projects]
GO

/****** Object:  View [dbo].[channelDim]    Script Date: 04/08/2024 4:30:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER   VIEW [dbo].[channelDim] AS 
SELECT 
  Channel, 
  ROW_NUMBER() OVER (
    ORDER BY 
      channel
  ) AS ChannelId 
FROM 
  (
    SELECT 
      DISTINCT channel 
    FROM 
      [dbo].[RealEstate_Emails_Cases]
  ) AS uniqueChannel;

GO

