USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  StoredProcedure [dbo].[usp_LogPackageError]    Script Date: 3/17/2016 11:52:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LogPackageError]
(
	@PackageLogID INT,
	@BatchLogID INT,
	@SourceName VARCHAR(64),
	@SourceID UNIQUEIDENTIFIER,
	@ErrorCode INT,
	@ErrorDescription VARCHAR(2000),
	@EndBatchAudit BIT
)
AS
BEGIN

    SET NOCOUNT ON

    INSERT INTO [dbo].[PackageErrorLog]
		( [PackageLogID], [SourceName], [SourceID], [ErrorCode], [ErrorDescription], [LogDateTime] )
    VALUES
		( @PackageLogID, @SourceName, @SourceID, @ErrorCode, @ErrorDescription, GETDATE() )

	UPDATE	[dbo].[PackageLog]
	SET		[Status] = 'F',
			[EndDatetime] = GETDATE()
	WHERE	[PackageLogID] = @PackageLogID

    IF @EndBatchAudit = 1
    BEGIN
	    UPDATE	[dbo].[BatchLog]
        SET		[Status] = 'F',
				[EndDatetime] = GETDATE()
        WHERE	[BatchLogID] = @BatchLogID
    END

END

GO

