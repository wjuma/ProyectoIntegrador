--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger PK_TIP_ACT_G1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."PK_TIP_ACT_G1" --QUISUPANGUI, RAMIREZ
BEFORE INSERT 
ON D_TIP_ACT
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
IF :NEW.ID_D_ACT IS NULL THEN
SELECT  SECUENCIA_TIP_ACT.NEXTVAL INTO :NEW.ID_D_ACT FROM DUAL;
END IF ;
END;
/
ALTER TRIGGER "P54G4_OLTP_HR"."PK_TIP_ACT_G1" ENABLE;
