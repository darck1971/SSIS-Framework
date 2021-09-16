USE [USPC_SSIS_Audit_QA]
GO

/****** Object:  StoredProcedure [dbo].[usp_LogVariableValueChanged]    Script Date: 3/17/2016 11:53:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LogVariableValueChanged]
(
	@PackageLogID	int,
    @VariableName	varchar(255),
    @VariableValue	varchar(MAX)
)
AS
BEGIN

	SET NOCOUNT ON

	INSERT INTO [dbo].[PackageVariableLog]
		( [PackageLogID], [VariableName], [VariableValue], [LogDateTime] )
	VALUES
		( @PackageLogID, @VariableName, @VariableValue, GETDATE() )

END

GO

