--------------------------------------------------------
--  DDL for Index REMOTE_LIBSCU
--------------------------------------------------------

  CREATE UNIQUE INDEX "ITCOLL_6GIU12"."REMOTE_LIBSCU" ON "ITCOLL_6GIU12"."REMOTE_LIBRARIES" (UPPER("LIBRARY_NAME")) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536
  FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "PITRE_INFOTN_DATA_COLL" ;
