--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function CARGA_D_PERSONAL_G2
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "P54G4_OLTP_HR"."CARGA_D_PERSONAL_G2" 
RETURN NUMBER
is
cursor cur_personal is
select *
from personal
where lower(peroc_des) not in(select lower(peroc_des) from d_personal)
order by peroc;
rv_personal personal%ROWTYPE;
v_num_reg integer:=0; 
begin
--carga de datos peroc
open cur_personal;
--inciia captura reg
fetch cur_personal into rv_personal;
--fetch cur_personal into v_personaldes;
--fetch coge al primer registro y poenne en la variable
while cur_personal%found loop
    insert into d_personal (id_peroc,peroc_des)
    values(rv_personal.peroc,rv_personal.peroc_des);
    fetch cur_personal into rv_personal;
    v_num_reg :=v_num_reg+1;
end loop;
close cur_personal;
commit;
return (v_num_reg);
end;

/
