--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function CARGA_CIIU4D_G2
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "P54G4_OLTP_HR"."CARGA_CIIU4D_G2" 
RETURN NUMBER
is
cursor cur_CIIU4D is
select *
from CIIU4D
where lower(CIUU4D_DES) not in(select lower(DES_CIIU) from D_CLASF_NACI_ACT)
order by CIIU4D;
rv_CIIU4D CIIU4D%ROWTYPE;
reg integer:=0; 
begin
--carga de datos peroc
open cur_CIIU4D;
--inciia captura reg
fetch cur_CIIU4D into rv_CIIU4D;
--fetch cur_personal into v_personaldes;
--fetch coge al primer registro y poenne en la variable
while cur_CIIU4D%found loop
    insert into D_CLASF_NACI_ACT(ID_CIIU,DES_CIIU)
    values(rv_CIIU4D.CIIU4D,rv_CIIU4D.CIUU4D_DES);
    fetch cur_CIIU4D into rv_CIIU4D;
    reg :=reg+1;
end loop;
close cur_CIIU4D;
commit;
return (reg);
end;

/
