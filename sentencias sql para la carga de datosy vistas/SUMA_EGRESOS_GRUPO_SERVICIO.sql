--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Materialized View SUMA_EGRESOS_GRUPO_SERVICIO
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "P54G4_OLTP_HR"."SUMA_EGRESOS_GRUPO_SERVICIO" ("ID_GRUPO", "GRUPO", "ID_SERVICIO", "DESCRIPCION_GENERAL", "DESCRIPCION_ESPECIFICA", "SUMA_EGRESOS")
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
  AS select 
    th.id_D_grup as id_grupo,
    g.grup as grupo,
    th.id_servicio ,
    s.des_ser1 as descripcion_general,
    s.des_ser2 as descripcion_especifica,
    sum(th.total_insumos+th.total_impuestos+th.total_iva_pagado+th.total_gastos_operacion) as suma_egresos 
from tabla_hechos_2 th,d_grup_serv g,d_Servicio s 
where th.id_d_grup = g.id_d_grup
and th.id_servicio = s.id_d_servicio
group by(th.id_d_grup, g.grup,th.id_servicio,s.des_ser1,s.des_ser2);
 

  CREATE UNIQUE INDEX "P54G4_OLTP_HR"."I_SNAP$_SUMA_EGRESOS_GRUPO" ON "P54G4_OLTP_HR"."SUMA_EGRESOS_GRUPO_SERVICIO" (SYS_OP_MAP_NONNULL("ID_GRUPO"), SYS_OP_MAP_NONNULL("GRUPO"), SYS_OP_MAP_NONNULL("ID_SERVICIO"), SYS_OP_MAP_NONNULL("DESCRIPCION_GENERAL"), SYS_OP_MAP_NONNULL("DESCRIPCION_ESPECIFICA")) 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSP_GBD_4263" ;
 

   COMMENT ON MATERIALIZED VIEW "P54G4_OLTP_HR"."SUMA_EGRESOS_GRUPO_SERVICIO"  IS 'snapshot table for snapshot P54G4_OLTP_HR.SUMA_EGRESOS_GRUPO_SERVICIO';
