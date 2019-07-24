--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger TRIGGER_CIIU4D_G2
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."TRIGGER_CIIU4D_G2" 
BEFORE INSERT
 ON D_CLASF_NACI_ACT
 REFERENCING NEW AS NEW FOR EACH ROW
 BEGIN
 IF :NEW.ID_D_CLAS IS NULL THEN 
 SELECT SECUENCIA_CIIU4D_G2.nextval into :new.ID_D_CLAS FROM dual;
 END IF;
 END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."TRIGGER_CIIU4D_G2" ENABLE;
