--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger TRIGGER_PERSONAL_UBICACION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."TRIGGER_PERSONAL_UBICACION" 
BEFORE INSERT
 ON d_ubicacion
 REFERENCING NEW AS NEW FOR EACH ROW
 BEGIN
 IF :NEW.id_ubicacion IS NULL THEN 
 SELECT "P54G4_OLTP_HR"."ubicacion".nextval into :new.id_ubicacion FROM dual;
 END IF;
 END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."TRIGGER_PERSONAL_UBICACION" ENABLE;
