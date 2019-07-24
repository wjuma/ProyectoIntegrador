--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Materialized View VM_G2_GENERAL
--------------------------------------------------------

  CREATE MATERIALIZED VIEW "P54G4_OLTP_HR"."VM_G2_GENERAL" ("CODIGO_AÑO", "AÑO", "ID_D_PROVINCIA", "REGION", "PROVINCIA", "ID_GRUPO", "GRUPO", "ID_SERVICIO", "SERVICIO_NUMERO_1", "SERVICIO_NUMERO_2", "SERVICIO_NUMERO_3", "TOTAL_IMPUESTOS_PAGADOS", "TOTAL_ALQUILERES", "TOTAL_IVA_COBRADO", "TOTAL_IVA_PAGAO", "AS_TOTAL_INSUMOS", "TOTAL_GASTOS_OPERACIONALES")
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TSP_GBD_4263" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  USING ENFORCED CONSTRAINTS DISABLE QUERY REWRITE
  AS select  
	th.CODANIO  as codigo_Año , 
	 t.codanio as año,
     th.ID_D_PROVINCIA , decode(p.wregion,1,'Sierra',2,'Costa',3,'Oriente',4,'Insular')as region ,p.prov_des as provincia,
	 th.ID_D_GRUP as id_grupo, gs.grup as grupo,
	 th.ID_SERVICIO  , s.des_ser1 as servicio_numero_1, s.des_ser2 as servicio_numero_2 ,s.des_ser3 as servicio_numero_3,
	 th.TOTAL_IMPUESTOS as total_impuestos_pagados  , 
	 th.TOTAL_ALQUILERES as total_alquileres  , 
	 th.TOTAL_IVA_COBRADO as total_iva_cobrado  , 
	 th.TOTAL_IVA_PAGADO  as total_iva_pagao  , 
	 th.TOTAL_INSUMOS  as_total_insumos , 
	 th.TOTAL_GASTOS_OPERACION  as total_gastos_operacionales  
     from tabla_hechos_2 th, d_provincia p, d_grup_serv gs, d_servicio s, d_tiempos t
     where p.codprov = th.id_d_provincia
     and th.id_d_grup = gs.id_d_grup
     and s.id_d_servicio = th.id_servicio
     and t.id_d_tiempo = th.codanio;
 

   COMMENT ON MATERIALIZED VIEW "P54G4_OLTP_HR"."VM_G2_GENERAL"  IS 'snapshot table for snapshot P54G4_OLTP_HR.VM_G2_GENERAL';
