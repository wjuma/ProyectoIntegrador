--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger PK_GENERA_D_TAMA�O
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."PK_GENERA_D_TAMA�O" --QUISUPANGUI, RAMIREZ
BEFORE INSERT 
ON D_TAMA�O
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
IF :NEW.ID_D_TAMA�O IS NULL THEN
SELECT  SECUENCIA_TAMA�O.NEXTVAL INTO :NEW.ID_D_TAMA�O FROM DUAL;
END IF ;
END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."PK_GENERA_D_TAMA�O" ENABLE;
