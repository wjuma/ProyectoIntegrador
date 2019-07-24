--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger PK_GRUP_SERV_G1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "P54G4_OLTP_HR"."PK_GRUP_SERV_G1" --QUISUPANGUI, RAMIREZ
BEFORE INSERT 
ON D_GRUP_SERV
REFERENCING NEW AS NEW FOR EACH ROW
BEGIN
IF :NEW.ID_D_GRUP IS NULL THEN
SELECT  SECUENCIA_GRUPO.NEXTVAL INTO :NEW.ID_D_GRUP FROM DUAL;
END IF ;
END;



/
ALTER TRIGGER "P54G4_OLTP_HR"."PK_GRUP_SERV_G1" ENABLE;
