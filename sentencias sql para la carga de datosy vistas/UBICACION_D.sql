--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger UBICACION_D
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."UBICACION_D" 
BEFORE INSERT
 ON D_UBICACION
 REFERENCING NEW AS NEW FOR EACH ROW
 BEGIN
 IF :NEW.ID_UBICACION IS NULL THEN 
 SELECT SECUENCIA_UBICACION_D.nextval into :new.ID_UBICACION FROM dual;
 END IF;
 END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."UBICACION_D" ENABLE;
