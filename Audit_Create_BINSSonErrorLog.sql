USE [mydatabase]
GO

/****** Object:  Table [dbo].[BinsSonErrorLog]    Script Date: 3/17/2016 11:45:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[BinsSonErrorLog](
	[PackageName] [varchar](255) NOT NULL,
	[ErrorDescription] [varchar](2000) NULL,
	[ShortErrorDescription] [varchar](200) NULL,
	[BusinessErrorMessage] [varchar](200) NULL,
	[LogDateTime] [datetime] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

