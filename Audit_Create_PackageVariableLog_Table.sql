USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  Table [dbo].[PackageVariableLog]    Script Date: 3/17/2016 11:49:10 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PackageVariableLog](
	[PackageVariableLogID] [int] IDENTITY(1,1) NOT NULL,
	[PackageLogID] [int] NOT NULL,
	[VariableName] [varchar](255) NOT NULL,
	[VariableValue] [varchar](max) NOT NULL,
	[LogDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_PackageVariableLog] PRIMARY KEY CLUSTERED 
(
	[PackageVariableLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PackageVariableLog]  WITH CHECK ADD  CONSTRAINT [FK_PackageVariableLog_PackageLog] FOREIGN KEY([PackageLogID])
REFERENCES [dbo].[PackageLog] ([PackageLogID])
GO

ALTER TABLE [dbo].[PackageVariableLog] CHECK CONSTRAINT [FK_PackageVariableLog_PackageLog]
GO

