USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  StoredProcedure [dbo].[usp_DeleteLog]    Script Date: 3/17/2016 11:50:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteLog]
(
	@LogRetentionDays SMALLINT
)
AS 
BEGIN
	SET NOCOUNT ON
	
	
	DECLARE @lastDate DATETIME
	
	SET @lastDate = DATEADD(d, -1 * @LogRetentionDays, GETDATE())
	
	BEGIN TRY
		DELETE PackageVariableLog WHERE LogDateTime < @lastDate
		DELETE PackageErrorLog WHERE LogDateTime < @LastDate
		DELETE PackageTaskLog WHERE EndDateTime < @LastDate
		DELETE PackageLog WHERE EndDateTime < @LastDate
		DELETE BatchLog WHERE EndDateTime < @LastDate
	END TRY
	BEGIN CATCH
		RETURN 0
	END CATCH	
END

GO

