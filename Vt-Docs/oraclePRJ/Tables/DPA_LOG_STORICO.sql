--------------------------------------------------------
--  DDL for Table DPA_LOG_STORICO
--------------------------------------------------------

  CREATE TABLE @db_user."DPA_LOG_STORICO" 
   (	"SYSTEM_ID" NUMBER(10,0), 
	"USERID_OPERATORE" VARCHAR2(20 BYTE), 
	"ID_PEOPLE_OPERATORE" NUMBER(10,0), 
	"ID_GRUPPO_OPERATORE" NUMBER(10,0), 
	"ID_AMM" NUMBER(10,0), 
	"DTA_AZIONE" DATE, 
	"VAR_OGGETTO" VARCHAR2(64 BYTE), 
	"ID_OGGETTO" NUMBER(10,0), 
	"VAR_DESC_OGGETTO" VARCHAR2(2000 BYTE), 
	"VAR_COD_AZIONE" VARCHAR2(32 BYTE), 
	"VAR_DESC_AZIONE" VARCHAR2(2000 BYTE), 
	"CHA_ESITO" VARCHAR2(1 BYTE),	
	"VAR_COD_WORKING_APPLICATION" VARCHAR2(200 BYTE)                       
   ) ;
