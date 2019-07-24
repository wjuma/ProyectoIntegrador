--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger TRIGGER_TABLA_HECHOS_1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."TRIGGER_TABLA_HECHOS_1" --QUISUPANGUI, RAMIREZ
BEFORE INSERT 
ON tabla_hechos_1
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
IF :NEW.ID_tabla_hechos_1 IS NULL THEN
SELECT  SECUENCIA_TABLA_HECHOS_1.NEXTVAL INTO :NEW.ID_tabla_hechos_1 FROM DUAL;
END IF ;
END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."TRIGGER_TABLA_HECHOS_1" ENABLE;
