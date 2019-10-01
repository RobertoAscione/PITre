SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE PROCEDURE [@db_user].[U_TASTO_SET_GIA_VISTE]
AS
DECLARE @ID_TIPO_FUNZIONE int
DECLARE curr CURSOR FOR
select system_id from dpa_tipo_funzione
BEGIN
OPEN curr
FETCH NEXT FROM curr INTO @ID_TIPO_FUNZIONE
WHILE @@FETCH_STATUS = 0
BEGIN
INSERT INTO DPA_FUNZIONI
(ID_AMM,COD_FUNZIONE,VAR_DESC_FUNZIONE,ID_PARENT,CHA_TIPO_FUNZ,ID_PESO,CHA_FLAG_PARENT,ID_TIPO_FUNZIONE)
VALUES
(NULL,'DO_TRASM_SET_VISTE','DO_TRASM_SET_VISTE',NULL,NULL,NULL,NULL,@ID_TIPO_FUNZIONE)
FETCH NEXT FROM curr INTO @ID_TIPO_FUNZIONE
END
CLOSE curr
DEALLOCATE curr
END

GO


SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO