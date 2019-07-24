--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger PK_TABLA_TH_2
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."PK_TABLA_TH_2" --QUISUPANGUI, RAMIREZ
BEFORE INSERT 
ON tabla_hechos_2
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
IF :NEW.ID_tabla_hechos_2 IS NULL THEN
SELECT  SECUENCIA_th_2.NEXTVAL INTO :NEW.ID_tabla_hechos_2 FROM DUAL;
END IF ;
END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."PK_TABLA_TH_2" ENABLE;
