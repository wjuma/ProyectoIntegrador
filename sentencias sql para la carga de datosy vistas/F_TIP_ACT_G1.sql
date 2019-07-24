--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function F_TIP_ACT_G1
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "P54G4_OLTP_HR"."F_TIP_ACT_G1" --QUISUPANGUI, RAMIREZ
RETURN NUMBER
IS 
CURSOR CUR_TIP_ACT IS  
SELECT * 
FROM TIP_ACTIVIDAD
--NOT IN SE VUELVE A DUPLICAR LOS DATOS 
WHERE LOWER(LETRA_des) NOT IN (SELECT LOWER(ACT_DES) from D_TIP_ACT);
--ORDER BY REGION;
RV_TIP TIP_ACTIVIDAD%ROWTYPE;
V_TIP_CONT INTEGER:=0;
BEGIN
--CARGA DE DATOS
OPEN CUR_TIP_ACT;
--INICIA CAPTURA REG
FETCH CUR_TIP_ACT INTO RV_TIP;
WHILE CUR_TIP_ACT%FOUND LOOP 
    INSERT INTO D_TIP_ACT(ID_PERSONAL,ACT_DES)
        VALUES (RV_TIP.LETRA,RV_TIP.LETRA_DES);

    FETCH CUR_TIP_ACT INTO RV_TIP;
    V_TIP_CONT := V_TIP_CONT+1;
END LOOP;
CLOSE CUR_TIP_ACT;
COMMIT;
RETURN V_TIP_CONT;
END;

/
