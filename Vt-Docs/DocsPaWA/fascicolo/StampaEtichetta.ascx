<%@ Control Language="c#" AutoEventWireup="false" Codebehind="StampaEtichetta.ascx.cs" Inherits="DocsPAWA.fascicolo.StampaEtichetta" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

    <object id="ctrlPrintPen" codebase="../activex/DocsPa_PrintPen.CAB#version=1,1,0,0" height="0px"
	    width="0px" classid="CLSID:2860F27F-FC9F-4CDA-B0CB-55A5BD09C52E" >
	    <param name="_ExtentX" value="26"/>
	    <param name="_ExtentY" value="26"/>
	    <param name="PortaCOM" value="1"/>
	    <param name="Text" value="DFPrintPen Test"/>
	    <param name="NumCopie" value="1"/>
	    <param name="TimeOut" value="60"/>
	    <param name="Dispositivo" value="Penna"/>
	    <param name="Amministrazione" value=""/>
	    <param name="UrlFileIni" value=""/>
	    <param name="Fascicolo" value=""/>
	    <param name="Classifica" value=""/>
	    <param name="Amministrazione_Etichetta" value=""/>
	    <param name="NumeroDocumento" value=""/>
	    <param name="CodiceUoProtocollatore" value=""/>
	    <param name="CodiceRegistroProtocollo" value=""/>
	    <param name="TipoProtocollo" value=""/>
	    <param name="NumeroProtocollo" value=""/>
	    <param name="AnnoProtocollo" value=""/>
	    <param name="DataProtocollo" value=""/>
	    <param name="NumeroAllegati" value=""/>
        <param name="NumeroStampe" value=""/>
        <param name="NumeroStampeEffettuate" value=""/>
	    <param name="Q1" value="Q690"/>
	    <param name="Q2" value="24+0"/>
	    <param name="P1" value="A63"/>
	    <param name="P2" value="696"/>
	    <param name="P3" value="3"/>
	    <param name="P4" value="4"/>
	    <param name="P5" value="3"/>
	    <param name="P6" value="1"/>

           <param name="ClassificaFasc" value=""/>
	    <param name="CodiceFasc" value=""/>
	    <param name="DescrizioneFasc" value=""/>

        <param name="ModelloDispositivo" value=""/>
        
    </object>

       <input id="hd_fascicolo" type="hidden" name="hd_fascicolo" runat="server"/>
        <input id="hdnSpedisciConInterop" type="hidden" name="hdnSpedisciConInterop"/>
        <input id="hd_num_proto" type="hidden" name="hd_num_proto" runat="server"/>
        <input id="hd_anno_proto" type="hidden" name="hd_anno_proto" runat="server"/>
        <input id="hd_data_proto" type="hidden" name="hd_data_proto" runat="server"/>
        <input id="hd_classifica" type="hidden" name="hd_classifica" runat="server"/>
        <input id="hd_dispositivo" type="hidden" name="hd_dispositivo" runat="server"/>
        <input id="hd_amministrazioneEtichetta" type="hidden" name="hd_amministrazioneEtichetta" runat="server"/> 
        <input id="hd_descrizioneAmministrazione" type="hidden" name="hd_descrizioneAmministrazione" runat="server"/>
        <input id="hd_UrlIniFileDispositivo" type="hidden" name="hd_UrlIniFileDispositivo" runat="server"/>
        <input id="hd_tipoProtocollazione" type="hidden" name="hd_tipoProtocollazione" runat="server"/>
        <input id="hd_coduo_proto" type="hidden" name="hd_coduo_proto" runat="server"/>
        <input id="hd_codreg_proto" type="hidden" name="hd_codreg_proto" runat="server"/>
        <input id="hd_tipo_proto" type="hidden" name="hd_tipo_proto" runat="server"/>
        <input id="hd_num_doc" type="hidden" name="hd_num_doc" runat="server"/>
        <input id="hd_signature" type="hidden" name="hd_num_doc" runat="server" />
	    <input id="hd_numeroAllegati" type="hidden" name="hd_numeroAllegati" runat="server" />
	    <input id="hd_codiceUoCreatore" type="hidden" name="hd_codiceUoCreatore" runat="server" />
	    <input id="hd_dataCreazione" type="hidden" name="hd_dataCreazione" runat="server" />
	    <input id="hd_descreg_proto" type="hidden" name="hd_descreg_proto" runat="server" />
        <input id="hd_modello_dispositivo" type="hidden" name="hd_modello_dispositivo" runat="server" />
        <input id="hd_num_stampe" type="hidden" name="hd_num_stampe" runat="server" />
        <input id="hd_num_stampe_effettuate" type="hidden" name="hd_num_stampe_effettuate" runat="server" />

        <input id="hd_fasc_classifica" type="hidden" name="hd_fasc_classifica" runat="server"/>
        <input id="hd_fasc_codice" type="hidden" name="hd_fasc_codice" runat="server" />
        <input id="hd_fasc_desc" type="hidden" name="hd_fasc_desc" runat="server"/>
    
    <script type="text/javascript">

	// Caricamento dati stampa
        function FillPrintData() {

            var nome_contenitore = 'ctl09_';
        
            var obj = document.getElementById('ctrlPrintPen');

          
            obj.ModelloDispositivo = document.getElementById(nome_contenitore + 'hd_modello_dispositivo').value;
          

            obj.UrlFileIni = document.getElementById(nome_contenitore + 'hd_UrlIniFileDispositivo').value;
          

            obj.Dispositivo = document.getElementById(nome_contenitore + 'hd_dispositivo').value;



	    
	    obj.ClassificaFasc  = document.getElementById(nome_contenitore + 'hd_fasc_classifica').value;

	    obj.CodiceFasc  = document.getElementById(nome_contenitore + 'hd_fasc_codice').value;

	    obj.DescrizioneFasc  = document.getElementById(nome_contenitore + 'hd_fasc_desc').value;

	   
	    
	   
	}

	// stampa segnatura protocollo
	function PrintSignature(showMsg) {

	    var obj = document.getElementById('ctrlPrintPen');

		var retValue=showMsg;
		
		if (retValue)
		{
			retValue=window.confirm("Si desidera stampare la segnatura?");
		}
		else
		{
			retValue=true;
		}
					
		if (retValue) 
		{
			try {

			 
			    
			    FillPrintData();
			
			    var result = obj.StampaFascicolo();



			} 
			catch(e) 
			{
				alert("Errore nella stampa della segnatura o stampante etichette non installata");
			}					
		}
	}
	
</script>

   
	
     

