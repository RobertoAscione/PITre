CREATE OR REPLACE VIEW @db_user.RDE_REGISTRO
(IDREGISTROREMOTO, DESCRIZIONE, CODICE)
AS 
SELECT     SYSTEM_ID AS IdRegistroRemoto, VAR_DESC_REGISTRO AS Descrizione, VAR_CODICE AS Codice FROM       DPA_EL_REGISTRI
/