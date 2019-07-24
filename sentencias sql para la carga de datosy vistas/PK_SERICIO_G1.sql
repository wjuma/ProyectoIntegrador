--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger PK_SERICIO_G1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."PK_SERICIO_G1" --QUISUPANGUI, RAMIREZ
BEFORE INSERT 
ON D_SERVICIO
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
IF :NEW.ID_D_SERVICIO IS NULL THEN
SELECT  SECUENCIA_SERVICIOS_G1.NEXTVAL INTO :NEW.ID_D_SERVICIO FROM DUAL;
END IF ;
END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."PK_SERICIO_G1" ENABLE;
