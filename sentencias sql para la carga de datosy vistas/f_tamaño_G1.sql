--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function F_TAMAÑO_G1
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "P54G4_OLTP_HR"."F_TAMAÑO_G1" --QUISUPANGUI, RAMIREZ
RETURN NUMBER
IS 
CURSOR CUR_TAM IS  
SELECT * 
FROM TAM_EMPR
--NOT IN SE VUELVE A DUPLICAR LOS DATOS 
WHERE LOWER(TAM_DES) NOT IN (SELECT LOWER(DES_TAM) from d_tamaño);
--ORDER BY REGION;
RV_TAM TAM_EMPR%ROWTYPE;
V_TAM_CONT INTEGER:=0;
BEGIN
--CARGA DE DATOS
OPEN CUR_TAM;
--INICIA CAPTURA REG
FETCH CUR_TAM INTO RV_TAM;
WHILE CUR_TAM%FOUND LOOP 
    INSERT INTO D_TAMAÑO(TAMAÑO,DES_TAM)
        VALUES (RV_TAM.TAMAÑO,RV_TAM.TAM_DES);

    FETCH CUR_TAM INTO RV_TAM;
    V_TAM_CONT := V_TAM_CONT+1;
END LOOP;
CLOSE CUR_TAM;
COMMIT;
RETURN V_TAM_CONT;
END;

/
