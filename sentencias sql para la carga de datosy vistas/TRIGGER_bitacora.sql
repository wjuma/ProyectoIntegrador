--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger TRIGGER_BITACORA
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."TRIGGER_BITACORA" 
BEFORE INSERT
 ON bitacora
 REFERENCING NEW AS NEW FOR EACH ROW
 BEGIN
 IF :NEW.ID_bitacora IS NULL THEN 
 SELECT bitacorasec.nextval into :new.ID_bitacora FROM dual;
 END IF;
 END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."TRIGGER_BITACORA" ENABLE;
