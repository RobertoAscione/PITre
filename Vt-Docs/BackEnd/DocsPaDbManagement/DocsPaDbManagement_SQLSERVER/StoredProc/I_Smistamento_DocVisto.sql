CREATE  PROCEDURE [DOCSADM].[I_Smistamento_DocVisto]
@IDTrasmissioneUtenteMittente int,
@TrasmissioneConWorkflow bit,
@IDPeopleMittente INT,
@IDTrasmissione INT

AS

DECLARE @TipoTrasmSingola nvarchar(1)

BEGIN
/* Aggiornamento trasmissione del mittente */
IF (@TrasmissioneConWorkflow='1')
UPDATE 	DPA_TRASM_UTENTE
SET 	DTA_VISTA = GETDATE(),
CHA_VISTA = '1',
DTA_ACCETTATA = GETDATE(),
CHA_ACCETTATA = '1',
CHA_IN_TODOLIST = '0'
WHERE	SYSTEM_ID = @IDTrasmissioneUtenteMittente
ELSE
UPDATE 	DPA_TRASM_UTENTE
SET 	DTA_VISTA = GETDATE(),
CHA_VISTA = '1',
CHA_IN_TODOLIST = '0'
WHERE (SYSTEM_ID = @IDTrasmissioneUtenteMittente
OR
SYSTEM_ID = (SELECT TU.SYSTEM_ID FROM
DPA_TRASM_UTENTE TU,DPA_TRASMISSIONE TX,DPA_TRASM_SINGOLA TS WHERE TU.ID_PEOPLE=@IDPeopleMittente AND
TX.SYSTEM_ID=TS.ID_TRASMISSIONE AND TX.SYSTEM_ID=@IDTrasmissione AND TS.SYSTEM_ID=TU.ID_TRASM_SINGOLA
AND TS.CHA_TIPO_DEST= 'U')
)
AND CHA_VALIDA='1'
END


/* verifica se la trasmissione singola  destinata a: "Tutti" (T) o a "Uno" (S) */
BEGIN
SET @TipoTrasmSingola=
(SELECT top 1 A.CHA_TIPO_TRASM
FROM DPA_TRASM_SINGOLA A, DPA_TRASM_UTENTE B
WHERE A.SYSTEM_ID=B.ID_TRASM_SINGOLA
AND B.SYSTEM_ID IN (SELECT TU.SYSTEM_ID FROM
DPA_TRASM_UTENTE TU,DPA_TRASMISSIONE TX,DPA_TRASM_SINGOLA TS WHERE TU.ID_PEOPLE= @IDPeopleMittente AND
TX.SYSTEM_ID=TS.ID_TRASMISSIONE AND TX.SYSTEM_ID=@IDTrasmissione AND TS.SYSTEM_ID=TU.ID_TRASM_SINGOLA
and TS.SYSTEM_ID = (SELECT ID_TRASM_SINGOLA FROM DPA_TRASM_UTENTE WHERE SYSTEM_ID =@IDTrasmissioneUtenteMittente))
ORDER BY CHA_TIPO_DEST
)
END

IF (@TipoTrasmSingola='S' AND @TrasmissioneConWorkflow='1')
/* se la trasmissione era destinata a SINGOLO, allora toglie la validit della trasmissione a tutti gli altri utenti del ruolo (tranne a quella del mittente) */
UPDATE 	DPA_TRASM_UTENTE
SET 	CHA_VALIDA = '0',
CHA_IN_TODOLIST = '0'
WHERE ID_TRASM_SINGOLA IN
(SELECT A.SYSTEM_ID
FROM DPA_TRASM_SINGOLA A, DPA_TRASM_UTENTE B
WHERE A.SYSTEM_ID=B.ID_TRASM_SINGOLA
AND B.SYSTEM_ID IN (SELECT TU.SYSTEM_ID FROM
DPA_TRASM_UTENTE TU,DPA_TRASMISSIONE TX,DPA_TRASM_SINGOLA TS WHERE TU.ID_PEOPLE=@IDPeopleMittente AND
TX.SYSTEM_ID=TS.ID_TRASMISSIONE AND TX.SYSTEM_ID=@IDTrasmissione AND TS.SYSTEM_ID=TU.ID_TRASM_SINGOLA
and TS.SYSTEM_ID = (SELECT ID_TRASM_SINGOLA FROM DPA_TRASM_UTENTE WHERE SYSTEM_ID =@IDTrasmissioneUtenteMittente)))
AND SYSTEM_ID NOT IN(@IDTrasmissioneUtenteMittente);
RETURN 0

GO