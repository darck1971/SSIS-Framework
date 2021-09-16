USE [mydatabase]
GO

/****** Object:  Table [dbo].[PackageLog]    Script Date: 3/17/2016 11:47:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PackageLog](
	[PackageLogID] [int] IDENTITY(1,1) NOT NULL,
	[BatchLogID] [int] NOT NULL,
	[PackageVersionID] [int] NOT NULL,
	[ExecutionInstanceID] [uniqueidentifier] NOT NULL,
	[MachineName] [varchar](64) NOT NULL,
	[UserName] [varchar](64) NOT NULL,
	[StartDateTime] [datetime] NOT NULL CONSTRAINT [DF__PackageLo__Start__07F6335A]  DEFAULT (getdate()),
	[EndDateTime] [datetime] NULL,
	[Status] [char](1) NOT NULL,
 CONSTRAINT [PK_PackageLog] PRIMARY KEY CLUSTERED 
(
	[PackageLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PackageLog]  WITH CHECK ADD  CONSTRAINT [FK_PackageLog_BatchLog] FOREIGN KEY([BatchLogID])
REFERENCES [dbo].[BatchLog] ([BatchLogID])
GO

ALTER TABLE [dbo].[PackageLog] CHECK CONSTRAINT [FK_PackageLog_BatchLog]
GO

ALTER TABLE [dbo].[PackageLog]  WITH CHECK ADD  CONSTRAINT [FK_PackageLog_PackageVersion] FOREIGN KEY([PackageVersionID])
REFERENCES [dbo].[PackageVersion] ([PackageVersionID])
GO

ALTER TABLE [dbo].[PackageLog] CHECK CONSTRAINT [FK_PackageLog_PackageVersion]
GO

