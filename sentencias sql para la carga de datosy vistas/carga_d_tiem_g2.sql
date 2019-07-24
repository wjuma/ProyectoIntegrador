--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function CARGA_D_TIEM_G2
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "P54G4_OLTP_HR"."CARGA_D_TIEM_G2" 
return number
is 
v_anio int := 2013;
--v_fecha date; 
--v_fechaf date;
v_trimestre int; 
--v_mes int; 
--v_año int;
v_carga int;
mesf int := 12;
mesi int := 1;
v_num_reg int;

BEGIN 
select count (anio) into v_carga 
from d_tiempo 
    where anio= v_anio;

if v_carga > 1 then 
    return v_num_reg; 
end if; 

insert into d_tiempo(trimestre, mes, anio) values (null,null,v_anio);
insert into d_tiempo (trimestre, mes, anio)  values (1,null,v_anio);
insert into d_tiempo (trimestre, mes, anio) values (2,null,v_anio);
insert into d_tiempo (trimestre, mes, anio) values (3,null,v_anio);
insert into d_tiempo (trimestre, mes, anio) values (4,null,v_anio);

while mesi <= mesf loop 

if mesi in (1,2,3)then 
    v_trimestre :=1;
elsif mesi in (4,5,6)then 
    v_trimestre :=2;
elsif mesi in (7,8,9)then
    v_trimestre := 3;
else 
    v_trimestre := 4;
end if;


insert into d_tiempo(trimestre, mes, anio) values (v_trimestre,mesi,v_anio);
mesi := mesi+1;
end loop;
commit;

end;

/
