SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================
-- Author:		Limiti Stefano
-- Create date: 21/10/2013
-- Description:	Update dei record della tabella TempProfileDisposal
--				e della tabella TempProfileDisposal
-- ============================================================================
ALTER PROCEDURE [DOCSADM].[sp_ARCHIVE_Update_TempProfileProjectDisposal]
	@Disposal_ID int,
	@ProjectsList VARCHAR(MAX),
	@ProfilesList VARCHAR(MAX)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @log VARCHAR(2000)
	DECLARE @logType VARCHAR(10)
	DECLARE @logObject VARCHAR(50) = OBJECT_NAME(@@PROCID)
	DECLARE @errorCode INT
	
	DECLARE @sql_string_profile nvarchar(MAX)
	DECLARE @sql_string_project nvarchar(MAX)

	-- Create temp table
	--
	IF OBJECT_ID('tempdb..#ProfilesListTable') IS NOT NULL DROP TABLE #ProfilesListTable
	CREATE TABLE #ProfilesListTable
	(
		ID int
	)
	
	IF OBJECT_ID('tempdb..#ProjectsListTable') IS NOT NULL DROP TABLE #ProjectsListTable
	CREATE TABLE #ProjectsListTable
	(
		ID int
	)

	SET @sql_string_profile = CAST(N'
		INSERT INTO #ProfilesListTable (ID)
		SELECT Profile_ID FROM ARCHIVE_TempProfileDisposal
		WHERE Profile_ID IN (' AS NVARCHAR(MAX)) + CAST(@ProfilesList AS NVARCHAR(MAX)) + CAST(N')' AS NVARCHAR(MAX))
		
	

	SET @sql_string_project = CAST(N'
		INSERT INTO #ProjectsListTable (ID)
		SELECT Project_ID FROM ARCHIVE_TempProjectDisposal
		WHERE Project_ID IN (' AS NVARCHAR(MAX)) + CAST(@ProjectsList AS NVARCHAR(MAX)) + CAST(N')' AS NVARCHAR(MAX))
	
	-- stampo le due query 	
	PRINT @sql_string_profile;
	PRINT @sql_string_project;

	BEGIN TRANSACTION T1

		EXECUTE sp_executesql @sql_string_profile;

			Update ARCHIVE_TempProfileDisposal 
			set ARCHIVE_TempProfileDisposal.DaScartare = 0 
			where ARCHIVE_TempProfileDisposal.Disposal_ID = @Disposal_ID
			AND ARCHIVE_TempProfileDisposal.Profile_ID in (select ID from #ProfilesListTable);
			
			Update ARCHIVE_TempProfileDisposal 
			set ARCHIVE_TempProfileDisposal.DaScartare = 1 
			where ARCHIVE_TempProfileDisposal.Disposal_ID = @Disposal_ID
			AND ARCHIVE_TempProfileDisposal.Profile_ID not in (select ID from #ProfilesListTable);

		set @errorCode = @@ERROR

		IF @errorCode <> 0
		BEGIN
			-- Rollback the transaction
			ROLLBACK
			
			set @logType = 'ERROR'
			set @log = 'Errore durante l''aggiornamento della ARCHIVE_TempProfileDisposal' + ' - Codice errore: ' + CAST(@errorCode AS NVARCHAR(8))
			
			EXECUTE sp_ARCHIVE_BE_InsertLog @log, @logType, @logObject

			-- Raise an error and return
			RAISERROR (@log, 16, 1)
			RETURN
		END
		
			EXECUTE sp_executesql @sql_string_project;

				Update ARCHIVE_TempProjectDisposal 
				set ARCHIVE_TempProjectDisposal.DaScartare = 0 
				where ARCHIVE_TempProjectDisposal.Disposal_ID = @Disposal_ID
				AND ARCHIVE_TempProjectDisposal.Project_ID in (select ID from  #ProjectsListTable);

				Update ARCHIVE_TempProjectDisposal 
				set ARCHIVE_TempProjectDisposal.DaScartare = 1
				where ARCHIVE_TempProjectDisposal.Disposal_ID = @Disposal_ID
				AND ARCHIVE_TempProjectDisposal.Project_ID not in (select ID from  #ProjectsListTable);

		set @errorCode = @@ERROR

		IF @errorCode <> 0
		BEGIN
			-- Rollback the transaction
			ROLLBACK
			
			set @logType = 'ERROR'
			set @log = 'Errore durante l''aggiornamento della ARCHIVE_TempProjectDisposal' + ' - Codice errore: ' + CAST(@errorCode AS NVARCHAR(8))
			
			EXECUTE sp_ARCHIVE_BE_InsertLog @log, @logType, @logObject

			-- Raise an error and return
			RAISERROR (@log, 16, 1)
			RETURN
		END
	COMMIT TRANSACTION T1
END
