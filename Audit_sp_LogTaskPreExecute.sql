USE [mydatabase]
GO

/****** Object:  StoredProcedure [dbo].[usp_LogTaskPreExecute]    Script Date: 3/17/2016 11:53:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LogTaskPreExecute]
(   
	@PackageLogID int,
	@SourceName varchar(64),
	@SourceID uniqueidentifier,
	@PackageID uniqueidentifier
)
AS
BEGIN

    SET NOCOUNT ON

    IF	@PackageID <> @SourceID
	AND	@SourceName <> 'SQL LogPackageStart'
	AND	@SourceName <> 'SQL LogPackageEnd'
	BEGIN
        INSERT INTO [dbo].[PackageTaskLog]
			( [PackageLogID], [SourceName], [SourceID], [StartDateTime] )
        VALUES
			( @PackageLogID, @SourceName, @SourceID, GETDATE() )
	END

END

GO

