--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger TRIGGER_HECHOS_G2
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."TRIGGER_HECHOS_G2" 
BEFORE INSERT
 ON TABLA_HECHOS_2
 REFERENCING NEW AS NEW FOR EACH ROW
 BEGIN
 IF :NEW.ID_TABLA_HECHOS_2 IS NULL THEN 
 SELECT SECUENCIA_HECHOSG2.nextval into :new.ID_TABLA_HECHOS_2 FROM dual;
 END IF;
 END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."TRIGGER_HECHOS_G2" ENABLE;
