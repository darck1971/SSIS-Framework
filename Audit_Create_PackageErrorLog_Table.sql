USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  Table [dbo].[PackageErrorLog]    Script Date: 3/17/2016 11:47:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PackageErrorLog](
	[PackageErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[PackageLogID] [int] NOT NULL,
	[SourceName] [varchar](64) NOT NULL,
	[SourceID] [uniqueidentifier] NOT NULL,
	[ErrorCode] [int] NULL,
	[ErrorDescription] [varchar](2000) NULL,
	[LogDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PackageErrorLog] PRIMARY KEY CLUSTERED 
(
	[PackageErrorLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PackageErrorLog]  WITH CHECK ADD  CONSTRAINT [FK_PackageErrorLog_PackageLog] FOREIGN KEY([PackageLogID])
REFERENCES [dbo].[PackageLog] ([PackageLogID])
GO

ALTER TABLE [dbo].[PackageErrorLog] CHECK CONSTRAINT [FK_PackageErrorLog_PackageLog]
GO

