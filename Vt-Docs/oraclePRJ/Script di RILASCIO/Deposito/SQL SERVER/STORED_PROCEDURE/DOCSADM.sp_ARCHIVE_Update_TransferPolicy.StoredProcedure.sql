USE [PCM_DEPOSITO_1]
GO
/****** Object:  StoredProcedure [DOCSADM].[sp_ARCHIVE_Update_TransferPolicy]    Script Date: 08/14/2013 11:50:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC   [DOCSADM].[sp_ARCHIVE_Update_TransferPolicy]  
( @Description varchar (200) , @Description_Original varchar (200) , @Enabled int , @Enabled_Original int , 
@Transfer_ID int , @Transfer_ID_Original int , @TransferPolicyType_ID int , @TransferPolicyType_ID_Original int , @TransferPolicyState_ID int,@TransferPolicyState_ID_Original int,
@Registro_ID int , @Registro_ID_Original int , @UO_ID int , @UO_ID_Original int , @IncludiSottoalberoUO int , @IncludiSottoalberoUO_Original int , @Tipologia_ID int , @Tipologia_ID_Original int , @Titolario_ID int , @Titolario_ID_Original int , @ClasseTitolario varchar (100) , @ClasseTitolario_Original varchar (100) , @IncludiSottoalberoClasseTit int , @IncludiSottoalberoClasseTit_Original int , @AnnoCreazioneDa int , @AnnoCreazioneDa_Original int , @AnnoCreazioneA int , @AnnoCreazioneA_Original int , @AnnoProtocollazioneDa int , @AnnoProtocollazioneDa_Original int , @AnnoProtocollazioneA int , @AnnoProtocollazioneA_Original int , @AnnoChiusuraDa int , @AnnoChiusuraDa_Original int , @AnnoChiusuraA int , @AnnoChiusuraA_Original int , @System_ID int ,@RowsAffected int out )
AS
BEGIN
UPDATE [DOCSADM].[ARCHIVE_TransferPolicy]
SET  [Description] = @Description,
[Enabled] = @Enabled,
[Transfer_ID] = @Transfer_ID,
[TransferPolicyType_ID] = @TransferPolicyType_ID,
[TransferPolicyState_ID]=@TransferPolicyState_ID,
[Registro_ID] = @Registro_ID,
[UO_ID] = @UO_ID,
[IncludiSottoalberoUO] = @IncludiSottoalberoUO,
[Tipologia_ID] = @Tipologia_ID,
[Titolario_ID] = @Titolario_ID,
[ClasseTitolario] = @ClasseTitolario,
[IncludiSottoalberoClasseTit] = @IncludiSottoalberoClasseTit,
[AnnoCreazioneDa] = @AnnoCreazioneDa,
[AnnoCreazioneA] = @AnnoCreazioneA,
[AnnoProtocollazioneDa] = @AnnoProtocollazioneDa,
[AnnoProtocollazioneA] = @AnnoProtocollazioneA,
[AnnoChiusuraDa] = @AnnoChiusuraDa,
[AnnoChiusuraA] = @AnnoChiusuraA 
WHERE
   (
    (([Description] IS NOT NULL AND @Description_Original IS NOT NULL AND [Description] = @Description_Original) OR ([Description] IS NULL AND @Description_Original IS NULL)) AND
    (([Enabled] IS NOT NULL AND @Enabled_Original IS NOT NULL AND [Enabled] = @Enabled_Original) OR ([Enabled] IS NULL AND @Enabled_Original IS NULL)) AND
    (([Transfer_ID] IS NOT NULL AND @Transfer_ID_Original IS NOT NULL AND [Transfer_ID] = @Transfer_ID_Original) OR ([Transfer_ID] IS NULL AND @Transfer_ID_Original IS NULL)) AND
    (([TransferPolicyType_ID] IS NOT NULL AND @TransferPolicyType_ID_Original IS NOT NULL AND [TransferPolicyType_ID] = @TransferPolicyType_ID_Original) OR ([TransferPolicyType_ID] IS NULL AND @TransferPolicyType_ID_Original IS NULL)) AND
    (([TransferPolicyState_ID] IS NOT NULL AND @TransferPolicyState_ID_Original IS NOT NULL AND [TransferPolicyState_ID]= @TransferPolicyState_ID_Original) OR ([TransferPolicyState_ID] IS NULL AND @TransferPolicyState_ID_Original IS NULL)) AND
    (([Registro_ID] IS NOT NULL AND @Registro_ID_Original IS NOT NULL AND [Registro_ID] = @Registro_ID_Original) OR ([Registro_ID] IS NULL AND @Registro_ID_Original IS NULL)) AND
    (([UO_ID] IS NOT NULL AND @UO_ID_Original IS NOT NULL AND [UO_ID] = @UO_ID_Original) OR ([UO_ID] IS NULL AND @UO_ID_Original IS NULL)) AND
    (([IncludiSottoalberoUO] IS NOT NULL AND @IncludiSottoalberoUO_Original IS NOT NULL AND [IncludiSottoalberoUO] = @IncludiSottoalberoUO_Original) OR ([IncludiSottoalberoUO] IS NULL AND @IncludiSottoalberoUO_Original IS NULL)) AND
    (([Tipologia_ID] IS NOT NULL AND @Tipologia_ID_Original IS NOT NULL AND [Tipologia_ID] = @Tipologia_ID_Original) OR ([Tipologia_ID] IS NULL AND @Tipologia_ID_Original IS NULL)) AND
    (([Titolario_ID] IS NOT NULL AND @Titolario_ID_Original IS NOT NULL AND [Titolario_ID] = @Titolario_ID_Original) OR ([Titolario_ID] IS NULL AND @Titolario_ID_Original IS NULL)) AND
    (([ClasseTitolario] IS NOT NULL AND @ClasseTitolario_Original IS NOT NULL AND [ClasseTitolario] = @ClasseTitolario_Original) OR ([ClasseTitolario] IS NULL AND @ClasseTitolario_Original IS NULL)) AND
    (([IncludiSottoalberoClasseTit] IS NOT NULL AND @IncludiSottoalberoClasseTit_Original IS NOT NULL AND [IncludiSottoalberoClasseTit] = @IncludiSottoalberoClasseTit_Original) OR ([IncludiSottoalberoClasseTit] IS NULL AND @IncludiSottoalberoClasseTit_Original IS NULL)) AND
    (([AnnoCreazioneDa] IS NOT NULL AND @AnnoCreazioneDa_Original IS NOT NULL AND [AnnoCreazioneDa] = @AnnoCreazioneDa_Original) OR ([AnnoCreazioneDa] IS NULL AND @AnnoCreazioneDa_Original IS NULL)) AND
    (([AnnoCreazioneA] IS NOT NULL AND @AnnoCreazioneA_Original IS NOT NULL AND [AnnoCreazioneA] = @AnnoCreazioneA_Original) OR ([AnnoCreazioneA] IS NULL AND @AnnoCreazioneA_Original IS NULL)) AND
    (([AnnoProtocollazioneDa] IS NOT NULL AND @AnnoProtocollazioneDa_Original IS NOT NULL AND [AnnoProtocollazioneDa] = @AnnoProtocollazioneDa_Original) OR ([AnnoProtocollazioneDa] IS NULL AND @AnnoProtocollazioneDa_Original IS NULL)) AND
    (([AnnoProtocollazioneA] IS NOT NULL AND @AnnoProtocollazioneA_Original IS NOT NULL AND [AnnoProtocollazioneA] = @AnnoProtocollazioneA_Original) OR ([AnnoProtocollazioneA] IS NULL AND @AnnoProtocollazioneA_Original IS NULL)) AND
    (([AnnoChiusuraDa] IS NOT NULL AND @AnnoChiusuraDa_Original IS NOT NULL AND [AnnoChiusuraDa] = @AnnoChiusuraDa_Original) OR ([AnnoChiusuraDa] IS NULL AND @AnnoChiusuraDa_Original IS NULL)) AND
    (([AnnoChiusuraA] IS NOT NULL AND @AnnoChiusuraA_Original IS NOT NULL AND [AnnoChiusuraA] = @AnnoChiusuraA_Original) OR ([AnnoChiusuraA] IS NULL AND @AnnoChiusuraA_Original IS NULL)) AND
    ( [System_ID] = @System_ID )
   )
   set @RowsAffected = @@ROWCOUNT
END
GO
