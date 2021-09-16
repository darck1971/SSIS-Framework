USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  Table [dbo].[PackageTaskLog]    Script Date: 3/17/2016 11:48:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PackageTaskLog](
	[PackageTaskLogID] [int] IDENTITY(1,1) NOT NULL,
	[PackageLogID] [int] NOT NULL,
	[SourceName] [varchar](255) NOT NULL,
	[SourceID] [uniqueidentifier] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [datetime] NULL,
 CONSTRAINT [PK_PackageTaskLog] PRIMARY KEY CLUSTERED 
(
	[PackageTaskLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PackageTaskLog]  WITH CHECK ADD  CONSTRAINT [FK_PackageTaskLog_PackageLog] FOREIGN KEY([PackageLogID])
REFERENCES [dbo].[PackageLog] ([PackageLogID])
GO

ALTER TABLE [dbo].[PackageTaskLog] CHECK CONSTRAINT [FK_PackageTaskLog_PackageLog]
GO

