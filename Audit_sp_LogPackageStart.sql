USE [mydatabase]
GO

/****** Object:  StoredProcedure [dbo].[usp_LogPackageStart]    Script Date: 3/17/2016 11:51:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LogPackageStart]
(
	@BatchLogID INT,
	@PackageName VARCHAR(255),
	@ExecutionInstanceID UNIQUEIDENTIFIER,
	@MachineName VARCHAR(64),
	@UserName VARCHAR(64),
	@StartDatetime DATETIME, 
	@PackageVersionGUID UNIQUEIDENTIFIER,
	@VersionMajor INT,
	@VersionMinor INT,
	@VersionBuild INT,
	@VersionComment VARCHAR(1000),
	@PackageGUID UNIQUEIDENTIFIER,
	@CreationDateTime DATETIME,
	@CreatedBy VARCHAR(255)
)
AS
BEGIN

	SET NOCOUNT ON

	DECLARE	@PackageID INT,
			@PackageVersionID INT,
			@PackageLogID INT,
			@EndBatchAudit BIT

	/* Initialize Variables */
	SET @EndBatchAudit = 0

	/* Get Package Metadata ID */
	IF NOT EXISTS	(
					SELECT	1
					FROM	[dbo].[Package]
					WHERE	[PackageGUID] = @PackageGUID
					AND		[PackageName] = @PackageName
					)
	BEGIN
		INSERT INTO [dbo].[Package]
			( [PackageGUID], [PackageName], [CreationDateTime], [CreatedBy] )
		VALUES
			( @PackageGUID, @PackageName, @CreationDateTime, @CreatedBy )
	END

	SELECT	@PackageID = [PackageID]
	FROM	[dbo].[Package]
	WHERE	[PackageGUID] = @PackageGUID
	AND		[PackageName] = @PackageName

	/* Get Package Version MetaData ID */
	IF NOT EXISTS	(
					SELECT	1
					FROM	[dbo].[PackageVersion]
					WHERE	[PackageVersionGUID] = @PackageVersionGUID
					)
	BEGIN
		INSERT INTO [dbo].[PackageVersion]
			( [PackageID], [PackageVersionGUID], [VersionMajor], [VersionMinor], [VersionBuild], [VersionComment] )
		VALUES
			( @PackageID, @PackageVersionGUID, @VersionMajor, @VersionMinor, @VersionBuild, @VersionComment )
	END

	SELECT	@PackageVersionID = [PackageVersionID]
	FROM	[dbo].[PackageVersion]
	WHERE	[PackageVersionGUID] = @PackageVersionGUID

	/* Get BatchLogID */
	IF ISNULL( @BatchLogID, 0 ) = 0
	BEGIN
		INSERT INTO [dbo].[BatchLog]
			( [StartDatetime], [Status] )
		VALUES
			( @StartDatetime, 'R' )
		
		SELECT @BatchLogID = SCOPE_IDENTITY()
		
		SELECT @EndBatchAudit = 1
	END

	/* Create PackageLog Record */
	INSERT INTO [dbo].[PackageLog]
		( [BatchLogID], [PackageVersionID], [ExecutionInstanceID], [MachineName], [UserName], [StartDatetime], [Status] )
	VALUES
		( @BatchLogID, @PackageVersionID, @ExecutionInstanceID, @MachineName, @UserName, @StartDatetime, 'R' )

	SELECT @PackageLogID = SCOPE_IDENTITY()

	SELECT	@BatchLogID AS [BatchLogID],
			@PackageLogID AS [PackageLogID],
			@EndBatchAudit AS [EndBatchAudit]

END

GO

