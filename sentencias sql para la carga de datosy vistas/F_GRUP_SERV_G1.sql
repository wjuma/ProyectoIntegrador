--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function F_GRUP_SERV_G1
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "P54G4_OLTP_HR"."F_GRUP_SERV_G1" --QUISUPANGUI, RAMIREZ
RETURN NUMBER
IS 
CURSOR CUR_GRUP_SERV IS  
SELECT * 
FROM tip_encuesta
--NOT IN SE VUELVE A DUPLICAR LOS DATOS 
WHERE LOWER(wgruenc_des) NOT IN (SELECT LOWER(GRUP) from D_GRUP_SERV);
--ORDER BY REGION;
RV_GRUP TIP_ENCUESTA%ROWTYPE;
V_GRUP_CONT INTEGER:=0;
BEGIN
--CARGA DE DATOS
OPEN CUR_GRUP_SERV;
--INICIA CAPTURA REG
FETCH CUR_GRUP_SERV INTO RV_GRUP;
WHILE CUR_GRUP_SERV%FOUND LOOP 
    INSERT INTO D_GRUP_SERV(ID_GRUP_SERV,GRUP)
        VALUES (RV_GRUP.WGRUENC,RV_GRUP.WGRUENC_DES);

    FETCH CUR_GRUP_SERV INTO RV_GRUP;
    V_GRUP_CONT := V_GRUP_CONT+1;
END LOOP;
CLOSE CUR_GRUP_SERV;
COMMIT;
RETURN V_GRUP_CONT;
END;

/
