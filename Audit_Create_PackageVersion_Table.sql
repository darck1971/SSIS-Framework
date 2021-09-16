USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  Table [dbo].[PackageVersion]    Script Date: 3/17/2016 11:49:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PackageVersion](
	[PackageVersionID] [int] IDENTITY(1,1) NOT NULL,
	[PackageVersionGUID] [uniqueidentifier] NOT NULL,
	[PackageID] [int] NOT NULL,
	[VersionMajor] [int] NOT NULL,
	[VersionMinor] [int] NOT NULL,
	[VersionBuild] [int] NOT NULL,
	[VersionComment] [varchar](1000) NOT NULL,
	[EnteredDateTime] [datetime] NOT NULL CONSTRAINT [DF__PackageVe__Enter__0519C6AF]  DEFAULT (getdate()),
 CONSTRAINT [PK_PackageVersion] PRIMARY KEY CLUSTERED 
(
	[PackageVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PackageVersion]  WITH CHECK ADD  CONSTRAINT [FK_PackageVersion_Package] FOREIGN KEY([PackageID])
REFERENCES [dbo].[Package] ([PackageID])
GO

ALTER TABLE [dbo].[PackageVersion] CHECK CONSTRAINT [FK_PackageVersion_Package]
GO

