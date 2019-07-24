--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger PK_GENERA_D_TAMAÑO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."PK_GENERA_D_TAMAÑO" --QUISUPANGUI, RAMIREZ
BEFORE INSERT 
ON D_TAMAÑO
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
IF :NEW.ID_D_TAMAÑO IS NULL THEN
SELECT  SECUENCIA_TAMAÑO.NEXTVAL INTO :NEW.ID_D_TAMAÑO FROM DUAL;
END IF ;
END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."PK_GENERA_D_TAMAÑO" ENABLE;
