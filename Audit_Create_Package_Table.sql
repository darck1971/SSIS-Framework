USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  Table [dbo].[Package]    Script Date: 3/17/2016 11:44:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Package](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[PackageGUID] [uniqueidentifier] NOT NULL,
	[PackageName] [varchar](255) NOT NULL,
	[CreationDateTime] [datetime] NOT NULL,
	[CreatedBy] [varchar](255) NOT NULL,
	[EnteredDateTime] [datetime] NOT NULL CONSTRAINT [DF__Package__Entered__023D5A04]  DEFAULT (getdate()),
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

