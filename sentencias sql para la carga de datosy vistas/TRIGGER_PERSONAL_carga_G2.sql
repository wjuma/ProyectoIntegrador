--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger TRIGGER_PERSONAL_CARGA_G2
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."TRIGGER_PERSONAL_CARGA_G2" 
BEFORE INSERT
 ON d_PERSONAL
 REFERENCING NEW AS NEW FOR EACH ROW
 BEGIN
 IF :NEW.id_personal IS NULL THEN 
 SELECT SECUENCIA_PERSONAL.nextval into :new.id_personal FROM dual;
 END IF;
 END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."TRIGGER_PERSONAL_CARGA_G2" ENABLE;
