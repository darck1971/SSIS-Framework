USE [mydatabase]
GO

/****** Object:  StoredProcedure [dbo].[usp_LogPackageEnd]    Script Date: 3/17/2016 11:50:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LogPackageEnd]
(
	@PackageLogID INT,
    @BatchLogID INT,
    @EndBatchAudit BIT,
    @LogRetentionDays SMALLINT = 390
)
AS
BEGIN

    SET NOCOUNT ON

	UPDATE	[dbo].[PackageLog]
	SET		[Status] = 'S',
			[EndDatetime] = GETDATE()
	WHERE	[PackageLogID] = @PackageLogID

    IF @EndBatchAudit = 1
    BEGIN
        UPDATE	[dbo].[BatchLog]
        SET		[Status] = 'S',
				[EndDatetime] = GETDATE()
        WHERE	[BatchLogID] = @BatchLogID
    END
    
    EXEC usp_DeleteLog @LogRetentionDays

END

GO

