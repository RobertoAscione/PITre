USE [PCM_DEPOSITO_1]
GO
/****** Object:  StoredProcedure [DOCSADM].[sp_ARCHIVE_Delete_Transferpolicy_ProfileType_PK]    Script Date: 08/14/2013 11:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC   [DOCSADM].[sp_ARCHIVE_Delete_Transferpolicy_ProfileType_PK]  ( @TransferPolicy_ID int, @ProfileType_ID int, @RowsAffected int out  )
AS																				   
BEGIN
DELETE [DOCSADM].[ARCHIVE_Transferpolicy_ProfileType]
WHERE ( [TransferPolicy_ID] = @TransferPolicy_ID and [ProfileType_ID] = @ProfileType_ID )
set @RowsAffected=@@ROWCOUNT
END
GO
