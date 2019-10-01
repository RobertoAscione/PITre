﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestLeggibilita.aspx.cs" Inherits="ConservazioneWA.PopUp.TestLeggibilita" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/Conservazione.css" type="text/css" rel="stylesheet" />
   
   <base target="_self" />

   <style type="text/css">
        .testolabel
        {
            font-size:12px;
        }
        .cbtn
        {
            background-image: url('../Img/bg_button.jpg');
        }
        
        .cbtnHover
        {
            background-image: url('../Img/bg_button_hover.jpg');
        }
        
        .tab_istanze_header
        {
            background-image: url('../Img/bg_tab_header.jpg');
            background-repeat: repeat-x;
        }
        
        #content
        {
            background-image: url('../Img/bg_content.jpg');
        }
        
        .menu_pager_grigio
        {
            background-image: url('../Img/bg_pager_table.jpg');
            background-repeat: repeat-x;
        }
        
        #testoNote
        {
             background-image: url('../Img/bg_tab_header.jpg');
             background-repeat: repeat-x;
        }
       
    </style>
    <script language="javascript" type="text/javascript">
        function chk_1() {
            document.getElementById('lbl_file_da_aprire').enabled = false;
            
            document.getElementById('lbl_numero_file').enabled = true;
            document.getElementById('tb_num_file').enabled = true;
        }
        function chk_2() {
            document.getElementById('lbl_file_da_aprire').enabled = true;
            
            document.getElementById('lbl_numero_file').enabled = false;
            document.getElementById('tb_num_file').enabled = false;
        }
        function showVerificaLeggibilita(idConservazione, file, numero) {
            var returnvalue = window.showModalDialog("VerificaLeggibilita.aspx?idCons="+idConservazione+"&file="+file+"&num="+numero+"&locale=true", "", "dialogWidth:800px;dialogHeight:700px;status:no;resizable:no;scroll:no;center:yes;help:no");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    
        <div align="center">
            <div id="testoNote">
                <asp:Label runat="server" ID="lb_intestazione" Text="Verifica della leggibilità"></asp:Label>
            </div>
        </div>
        <div>
           <p><asp:Label ID="lbl_intro" runat="server"  CssClass="testolabel" 
                   Text="Per effettuare il controllo della leggibilità, scegliere una delle opzioni seguenti."></asp:Label></p> 
        </div>
        <asp:HiddenField ID="hd_idIstanza" runat="server" />
        <asp:HiddenField ID="hd_totDocs" runat="server" />
        <div align="left" style="margin:0 100px;"><table style="width:100%;">
            <tr>
            <td><asp:RadioButton ID="rbtn_numero_file" runat="server"  GroupName="radio1" 
                    CssClass="testolabel"  /> 
             </td>
             <td>
    <asp:Label ID="lbl_numero_file" runat="server" 
                     Text="Scegliere il numero di documenti da controllare:" 
                     CssClass="testolabel"></asp:Label>
             </td>
             <td>  
                    <asp:TextBox ID="tb_num_file" runat="server" Width="90px"></asp:TextBox>
                </td> </tr>
                <tr>
                <td><asp:RadioButton ID="rbtn_percent_file" runat="server" GroupName="radio1" CssClass="testolabel"/>
                </td>
                <td>
                    <asp:Label ID="lbl_percent_file" runat="server" CssClass="testolabel" 
                        Text="Scegliere la percentuale dei documenti da controllare:"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="tb_percent_file" runat="server" Width="58px"></asp:TextBox> <asp:Label runat="server" CssClass="testolabel" >%</asp:Label>
                </td></tr>
            
                <tr><td>
                <asp:RadioButton ID="rbtn_file_da_aprire" runat="server" GroupName="radio1" 
                        CssClass="testolabel" 
                        /> </td>
                        <td>
                    <asp:Label ID="lbl_file_da_aprire" runat="server" 
                                Text="Scegliere i documenti da controllare:" CssClass="testolabel"></asp:Label>
                        </td>
                <td> <select id="sel_file_da_aprire" runat="server" visible="False">
                <option></option>
            </select></td></tr>
            
        </table></div>
        <div align="center" style="margin:25px 0;">
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="150px">
            
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                EnableModelValidation="True" Width="590px">
    <Columns>
        <asp:BoundField HeaderText="ID Documento" DataField="docnumber" />
        <asp:BoundField HeaderText="Oggetto" DataField="desc" />
        <asp:BoundField HeaderText="Tipo File" DataField="tipo" />
        <asp:TemplateField>        
            <ItemTemplate>
<asp:CheckBox id="chk_doc" runat="server">
            </asp:CheckBox>
            </ItemTemplate> 
            
        
        </asp:TemplateField>
    </Columns>
            <HeaderStyle CssClass="tab_istanze_header" Font-Size="12px" 
        ForeColor="White" />
            </asp:GridView>
            </asp:Panel>
           
        </div>
        <div align="center">
            <asp:Button ID="btn_verifica" runat="server"  Text="Effettua Verifica" 
                CssClass="cbtn" onclick="btn_verifica_Click" />
            <asp:Button ID="btn_chiudi" runat="server" Text="Annulla" CssClass="cbtn" 
                onclick="btn_chiudi_Click"  />
        </div>
    
    </form>
</body>
</html>