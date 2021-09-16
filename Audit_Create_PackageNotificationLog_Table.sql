USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  Table [dbo].[PackageNotificationLog]    Script Date: 3/17/2016 11:48:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PackageNotificationLog](
	[PackageName] [varchar](35) NULL,
	[Alias] [varchar](35) NULL,
	[NotificationID] [int] NULL,
	[NotificationDescription] [varchar](75) NULL,
	[NotificationDateTime] [datetime] NULL,
	[PackageSuccess] [varchar](35) NULL,
	[NotificationSent] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

