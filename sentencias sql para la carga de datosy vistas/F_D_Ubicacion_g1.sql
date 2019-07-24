--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function F_D_UBICACION_G1
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "P54G4_OLTP_HR"."F_D_UBICACION_G1" 
RETURN NUMBER
IS
------------------------------------
CURSOR CURSOR_UBICACION_P IS
    SELECT PA.CODPROV,P.PROV_DES from PROVINCIA P,PARROQUIA PA where lower(PROV_DES) not in (
    SELECT lower(NOMBRE_PROVINCIA) from D_UBICACION)AND PA.CODPROV=P.CODPROV
    ORDER BY CODPROV;
------------------------------

CURSOR CURSOR_UBICACION_C IS
     SELECT PA.ID_CANTON,C.CANTON_DES from CANTON C,PARROQUIA PA
     where lower(CANTON_DES) not in (SELECT lower(NOMBRE_CANTON) from D_UBICACION)
     AND PA.ID_CANTON=C.ID_CANTON;

    -------------------------------

CURSOR CURSOR_UBICACION_PA IS
     SELECT PA.CODPROV,PA.ID_CANTON,PA.ID_PARROQUIA,P.PROV_DES,C.CANTON_DES,PA.PARROQUIA_DES
     from PROVINCIA P,CANTON C,PARROQUIA PA
        where PA.CODPROV=P.CODPROV
        AND PA.ID_CANTON=C.ID_CANTON
        AND(PA.PARROQUIA_DES||P.PROV_DES) not in (
       SELECT (nombre_parroquia||nombre_canton||nombre_provincia)from D_UBICACION)
                order by P.CODPROV,C.ID_CANTON ;

    rv_ub_pa CURSOR_UBICACION_PA%ROWTYPE;
    rv_ub_c CURSOR_UBICACION_C%ROWTYPE;
    rv_ub_p CURSOR_UBICACION_P%ROWTYPE;
    v_ub_reg integer:=0;

BEGIN
open CURSOR_UBICACION_P;
fetch CURSOR_UBICACION_P into rv_ub_p;

while CURSOR_UBICACION_P%found loop
    insert into D_UBICACION(ID_PROVINCIA,ID_CANTON,ID_PARROQUIA,NOMBRE_PROVINCIA,NOMBRE_CANTON,NOMBRE_PARROQUIA)
        values(rv_ub_p.codprov,null,null,rv_ub_p.prov_des,null,null);
    fetch CURSOR_UBICACION_P into rv_ub_p;
    v_ub_reg:=v_ub_reg+1;
end loop;
close CURSOR_UBICACION_P;

--------------------------FIN CARGA PROV-----------------------------------
open CURSOR_UBICACION_C;
fetch CURSOR_UBICACION_C into rv_ub_c;

while CURSOR_UBICACION_C%found loop
     insert into D_UBICACION(ID_PROVINCIA,ID_CANTON,ID_PARROQUIA,NOMBRE_PROVINCIA,NOMBRE_CANTON,NOMBRE_PARROQUIA)
        values(null,rv_ub_c.id_canton,null,null,rv_ub_c.canton_des,null);
    fetch CURSOR_UBICACION_C into rv_ub_c;
    v_ub_reg:=v_ub_reg+1;
end loop;
close CURSOR_UBICACION_C;
-----------------FIN CARGA CANTON------------------
open CURSOR_UBICACION_PA;
fetch CURSOR_UBICACION_PA into rv_ub_pa;

while CURSOR_UBICACION_PA%found loop
    insert into D_UBICACION(ID_PROVINCIA,ID_CANTON,ID_PARROQUIA,NOMBRE_PROVINCIA,NOMBRE_CANTON,NOMBRE_PARROQUIA)
        values(rv_ub_pa.codprov,rv_ub_pa.id_canton,rv_ub_pa.id_parroquia,rv_ub_pa.prov_des,rv_ub_pa.canton_des,rv_ub_pa.parroquia_des);
    fetch CURSOR_UBICACION_PA into rv_ub_pa;
    v_ub_reg:=v_ub_reg+1;
end loop;
close CURSOR_UBICACION_PA;
commit;
return (v_ub_reg);
end;

/
