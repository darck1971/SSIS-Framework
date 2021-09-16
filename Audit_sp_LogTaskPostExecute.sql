USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  StoredProcedure [dbo].[usp_LogTaskPostExecute]    Script Date: 3/17/2016 11:52:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LogTaskPostExecute]
(
	@PackageLogID INT,
	@SourceID UNIQUEIDENTIFIER,
	@PackageID UNIQUEIDENTIFIER
)
AS
BEGIN

    SET NOCOUNT ON

    IF @PackageID <> @SourceID
    BEGIN
		UPDATE	[dbo].[PackageTaskLog]
		SET		[EndDateTime] = GETDATE()
		WHERE	[PackageLogID] = @PackageLogID
		AND		[SourceID] = @SourceID
		AND		[EndDateTime] IS NULL
	END

END

GO

