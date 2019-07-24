--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger TRIGGER_TRAM_PROD_G2
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."TRIGGER_TRAM_PROD_G2" 
BEFORE INSERT
 ON D_TRAM_PROD
 REFERENCING NEW AS NEW FOR EACH ROW
 BEGIN
 IF :NEW.ID_D_TRAM IS NULL THEN 
 SELECT SECUENCIA_TRAM_PROD_G2.nextval into :new.ID_D_TRAM FROM dual;
 END IF;
 END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."TRIGGER_TRAM_PROD_G2" ENABLE;
