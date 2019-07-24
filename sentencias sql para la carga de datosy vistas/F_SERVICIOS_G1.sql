--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function F_SERVICIOS_G1
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "P54G4_OLTP_HR"."F_SERVICIOS_G1" --QUISUPANGUI, RAMIREZ
RETURN NUMBER
IS 
CURSOR CUR_SER IS  
select * from ciiu2 c2,ciiu3 c3,ciiu4d c4
where c2.ciiu2=substr(c3.ciiu3,1,3)
and c3.ciiu3=substr(c4.ciiu4d,1,4)
and c2.ciiu2 in ('c10','I55','I56')
AND LOWER(CIIU_DES) NOT IN (SELECT LOWER(DES_SER1) from D_SERVICIO)
AND LOWER(CIIU3_DES) NOT IN (SELECT LOWER(DES_SER2) from D_SERVICIO)
AND LOWER(CIUU4D_DES) NOT IN (SELECT LOWER(DES_SER3) from D_SERVICIO);

RV_SER CUR_SER%ROWTYPE;
V_SER_CONT INTEGER:=0;
BEGIN
--CARGA DE DATOS
OPEN CUR_SER;
--INICIA CAPTURA REG
FETCH CUR_SER INTO RV_SER;
WHILE CUR_SER%FOUND LOOP 
    INSERT INTO D_SERVICIO(ID_SER_1,DES_SER1,ID_SER_2,DES_SER2,ID_SER_3,DES_SER3)
        VALUES (RV_SER.CIIU2,RV_SER.CIIU_DES,RV_SER.CIIU3,RV_SER.CIIU3_DES,RV_SER.CIIU4D,RV_SER.CIUU4D_DES);

    FETCH CUR_SER INTO RV_SER;
    V_SER_CONT := V_SER_CONT+1;
END LOOP;
CLOSE CUR_SER;
COMMIT;
RETURN V_SER_CONT;
END;

/
