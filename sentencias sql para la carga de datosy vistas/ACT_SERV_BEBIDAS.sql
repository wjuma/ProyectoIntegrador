--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Materialized View ACT_SERV_BEBIDAS
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "P54G4_OLTP_HR"."ACT_SERV_BEBIDAS" ("ANIO", "REGION", "PROVINCIA", "SERVICIO", "TOTEMPLEMUJERES", "TOTHOMBRES")
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSP_GBD_4263" 
  BUILD IMMEDIATE
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSP_GBD_4263" 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE QUERY REWRITE
  AS select T.codanio as anio,
R.des_prov as Region,
P.prov_des as Provincia,
D.des_ser3 as servicio,
T.total_emp_m as TotEmpleMujeres,
T.total_emp_h as TotHombres  
from tabla_hechos_1 T,d_provincia P,d_reguion R,d_servicio D
where id_reg = wregion
and id_ser_3='I5630'
and T.id_tabla_hechos_1 > 1958652 and T.id_tabla_hechos_1 < 1958666
GROUP by ( T.codanio ,
R.des_prov ,
P.prov_des ,
D.des_ser3 ,
T.total_emp_m ,
T.total_emp_h   
);
 

  CREATE UNIQUE INDEX "P54G4_OLTP_HR"."I_SNAP$_ACT_SERV_BEBIDAS" ON "P54G4_OLTP_HR"."ACT_SERV_BEBIDAS" (SYS_OP_MAP_NONNULL("ANIO"), SYS_OP_MAP_NONNULL("REGION"), SYS_OP_MAP_NONNULL("PROVINCIA"), SYS_OP_MAP_NONNULL("SERVICIO"), SYS_OP_MAP_NONNULL("TOTEMPLEMUJERES"), SYS_OP_MAP_NONNULL("TOTHOMBRES")) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSP_GBD_4263" ;
 

   COMMENT ON MATERIALIZED VIEW "P54G4_OLTP_HR"."ACT_SERV_BEBIDAS"  IS 'snapshot table for snapshot P54G4_OLTP_HR.ACT_SERV_BEBIDAS';
