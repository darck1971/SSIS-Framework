USE [mydatabase]
GO

/****** Object:  Table [dbo].[BatchLog]    Script Date: 3/17/2016 11:45:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BatchLog](
	[BatchLogID] [int] IDENTITY(1,1) NOT NULL,
	[StartDateTime] [datetime] NOT NULL CONSTRAINT [DF__BatchLog__StartD__7F60ED59]  DEFAULT (getdate()),
	[EndDateTime] [datetime] NULL,
	[Status] [char](1) NOT NULL,
 CONSTRAINT [PK_BatchLog] PRIMARY KEY CLUSTERED 
(
	[BatchLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

