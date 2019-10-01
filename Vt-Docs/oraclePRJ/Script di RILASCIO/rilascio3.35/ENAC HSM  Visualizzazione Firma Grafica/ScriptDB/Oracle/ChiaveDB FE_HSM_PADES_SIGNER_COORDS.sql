/*
Script per l'inserimento della chiave di DB 'FE_HSM_PADES_SIGNER_COORDS'  
*/

  DECLARE 
  CODICE VARCHAR2(200);
  DESCRIZIONE VARCHAR2(200);
  VALORE VARCHAR2(200);
  TIPO_CHIAVE VARCHAR2(200);
  VISIBILE VARCHAR2(200);
  MODIFICABILE VARCHAR2(200);
  GLOBALE VARCHAR2(200);
  MYVERSIONE_CD VARCHAR2(200);
  CODICE_OLD_WEBCONFIG VARCHAR2(200);
  FORZA_UPDATE VARCHAR2(200);
  RFU VARCHAR2(200);

BEGIN 
  CODICE := 'FE_HSM_PADES_SIGNER_COORDS';
  DESCRIZIONE := 'Imposta le coordinate per il posizionamento della firma in forma grafica. Page;LeftX;LeftY;RightX;RightY';
  VALORE := '1;350;800;700;850';
  TIPO_CHIAVE := 'F';
  VISIBILE := '1';
  MODIFICABILE := '1';
  GLOBALE := '0';
  MYVERSIONE_CD := '3.30.1.5';
  CODICE_OLD_WEBCONFIG := NULL;
  FORZA_UPDATE := '1';
  RFU := NULL;

  UTL_INSERT_CHIAVE_CONFIG ( CODICE, DESCRIZIONE, VALORE, TIPO_CHIAVE, VISIBILE, MODIFICABILE, GLOBALE, MYVERSIONE_CD, CODICE_OLD_WEBCONFIG, FORZA_UPDATE, RFU );
  COMMIT; 
END; 