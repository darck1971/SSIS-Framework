USE [USPC_SSIS_Config_QA]
GO

/****** Object:  Table [dbo].[SsisConfigurations]    Script Date: 3/17/2016 11:54:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SsisConfigurations](
	[SsisConfigurationID] [int] IDENTITY(1,1) NOT NULL,
	[ConfigurationFilter] [nvarchar](255) NOT NULL,
	[ConfiguredValue] [nvarchar](255) NULL,
	[PackagePath] [nvarchar](255) NOT NULL,
	[ConfiguredValueType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SsisConfigurations] PRIMARY KEY NONCLUSTERED 
(
	[SsisConfigurationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

