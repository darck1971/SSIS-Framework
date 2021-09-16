USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  Table [dbo].[BINSUsers]    Script Date: 3/17/2016 11:46:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BINSUsers](
	[EmailAddress] [varchar](100) NULL,
	[NotifyFailuresOnly] [int] NULL,
	[NotificationID] [int] NULL,
	[NotificationDesc] [varchar](55) NULL,
	[PackageName] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

