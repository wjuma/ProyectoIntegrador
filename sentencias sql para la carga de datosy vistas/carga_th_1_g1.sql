--------------------------------------------------------
-- Archivo creado  - martes-julio-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function CARGA_TH_1_G1
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "P54G4_OLTP_HR"."CARGA_TH_1_G1" (VANIO INT)  --g1
return number
is 
    cursor c_th_ubic is 
    select * from d_PROVINCIA 
    ORDER BY ID_D_PROVINCIA;

    cursor c_th_grup_serv is 
    select * from d_grup_serv
    order by id_d_grup;

    cursor c_th_SERV is 
    select *
    from d_SERVICIO
    order by id_D_SERVICIO;
    --------------- definición de registros
    --r_tiempo c_tiempo%rowtype;
    r_ubic c_th_ubic%rowtype;
    r_grup_ser c_th_grup_serv%rowtype;
    r_servicio c_th_SERV%rowtype;
    --r_empleado c_th_tip_empleado%rowtype;
    --------------------
    v_ubic_cont int := 0 ; 
    anio_d int:=0;

BEGIN 
--select * from d_tiempos
select id_d_tiempo into anio_d
from d_tiempos 
where codanio=vanio; --2013;
--CARGA DE DATOS0
-- carga datos anuales
OPEN c_th_ubic;
FETCH c_th_ubic INTO r_ubic;
WHILE c_th_ubic%FOUND LOOP 
--select * from d_tiempos
    INSERT INTO tabla_hechos_1(codanio, id_d_provincia, id_d_grup, total_emp_m, total_emp_h, tot_sal_m, tot_sal_h,total_m,total_h)
    select anio_d,r_ubic.id_d_provincia,null,
    SUM(t.omsindisp + t.omsindise + t.emsindisp + t.emsindise), SUM(t.ohsindisp + t.ohsindise + t.ehsindisp + t.ehsindise),
    SUM(t.suesaobm + t.suesaemu),sum(t.suesaobh + t.suesaeho),
    sum(t.totalmuj),sum(t.totalhom)
    from tabla_general t 
    where t.codanio=vanio
    and r_ubic.codprov=t.codprov
    group by t.CODANIO, t.codprov;
    commit;
    ----------------------------------------------------------------------------------------------------**

    OPEN c_th_grup_serv;
    FETCH c_th_grup_serv INTO r_grup_ser;
    WHILE c_th_grup_serv%FOUND LOOP 
                    INSERT INTO tabla_hechos_1(codanio, id_d_provincia, id_d_grup,total_emp_m, total_emp_h, tot_sal_m, tot_sal_h,total_m,total_h)
                    select anio_d,r_ubic.id_d_provincia,r_grup_ser.id_grup_serv,
                    SUM(t.omsindisp + t.omsindise + t.emsindisp + t.emsindise), SUM(t.ohsindisp + t.ohsindise + t.ehsindisp + t.ehsindise),
                    SUM(t.suesaobm + t.suesaemu),sum(t.suesaobh + t.suesaeho),
                    sum(t.totalmuj),sum(t.totalhom)
                    from tabla_general t 
                    where t.codanio=vanio
                    and t.codprov=r_ubic.codprov
                    and t.wgruenc=r_grup_ser.id_grup_serv
                    group by t.CODANIO, t.codprov,t.wgruenc;
                    commit;
                    ---------------------------------------------------------------------
                    OPEN c_th_SERV;
                        FETCH c_th_SERV INTO r_servicio;
                        WHILE c_th_SERV%FOUND LOOP 

                            INSERT INTO tabla_hechos_1(codanio, id_d_provincia, id_d_grup, id_servicio,total_emp_m, total_emp_h, tot_sal_m, tot_sal_h,total_m,total_h)
                            select anio_d,r_ubic.id_d_provincia,r_grup_ser.id_grup_serv,r_servicio.id_d_servicio,
                            SUM(t.omsindisp + t.omsindise + t.emsindisp + t.emsindise), SUM(t.ohsindisp + t.ohsindise + t.ehsindisp + t.ehsindise),
                            SUM(t.suesaobm + t.suesaemu),sum(t.suesaobh + t.suesaeho),
                            sum(t.totalmuj),sum(t.totalhom)
                            from tabla_general t 
                            where t.codanio=vanio
                            and t.codprov=r_ubic.codprov
                            and t.wgruenc=r_grup_ser.id_grup_serv
                            and t.ciiu2=r_servicio.id_ser_1
                            --group by t.codanio,t.codprov,t.wgruenc,t.ciiu2;
                            group by anio_d,r_ubic.id_d_provincia,r_grup_ser.id_grup_serv,r_servicio.id_ser_2;
                            commit;

                            INSERT INTO tabla_hechos_1(codanio, id_d_provincia, id_d_grup, id_servicio,total_emp_m, total_emp_h, tot_sal_m, tot_sal_h,total_m,total_h)
                            select anio_d,r_ubic.id_d_provincia,r_grup_ser.id_grup_serv,r_servicio.id_d_servicio,
                            SUM(t.omsindisp + t.omsindise + t.emsindisp + t.emsindise), SUM(t.ohsindisp + t.ohsindise + t.ehsindisp + t.ehsindise),
                            SUM(t.suesaobm + t.suesaemu),sum(t.suesaobh + t.suesaeho),
                            sum(t.totalmuj),sum(t.totalhom)
                            from tabla_general t 
                            where t.codanio=vanio
                            and t.codprov=r_ubic.codprov
                            and t.wgruenc=r_grup_ser.id_grup_serv
                            and t.ciiu2=r_servicio.id_ser_1
                            and t.ciiu3=r_servicio.id_ser_2
                            --group by t.codanio,t.codprov,t.wgruenc,t.ciiu2,t.ciiu3;
                            group by anio_d,r_ubic.id_d_provincia,r_grup_ser.id_grup_serv,r_servicio.id_ser_2;

                            INSERT INTO tabla_hechos_1(codanio, id_d_provincia, id_d_grup, id_servicio,total_emp_m, total_emp_h, tot_sal_m, tot_sal_h,total_m,total_h)
                            select anio_d,r_ubic.id_d_provincia,r_grup_ser.id_grup_serv,r_servicio.id_d_servicio,
                            SUM(t.omsindisp + t.omsindise + t.emsindisp + t.emsindise), SUM(t.ohsindisp + t.ohsindise + t.ehsindisp + t.ehsindise),
                            SUM(t.suesaobm + t.suesaemu),sum(t.suesaobh + t.suesaeho),
                            sum(t.totalmuj),sum(t.totalhom)
                            from tabla_general t 
                            where t.codanio=vanio
                            and t.codprov=r_ubic.codprov
                            and t.wgruenc=r_grup_ser.id_grup_serv
                            and t.ciiu2=r_servicio.id_ser_1
                            and t.ciiu3=r_servicio.id_ser_2
                            and t.ciiu4d=r_servicio.id_ser_3
                            --group by t.codanio,t.codprov,t.wgruenc,t.ciiu2,t.ciiu3,t.ciiu4d;
                            group by anio_d,r_ubic.id_d_provincia,r_grup_ser.id_grup_serv,r_servicio.id_ser_3;

                            -------------------------------------------------------------------------------

                            FETCH c_th_SERV INTO r_servicio;
                            v_ubic_cont:= v_ubic_cont+1;

                        END LOOP;
                        CLOSE c_th_SERV;

                    -------------------------------------------------------------------
                FETCH c_th_grup_serv INTO r_grup_ser;
                v_ubic_cont:= v_ubic_cont+1;
         END LOOP;
        CLOSE c_th_grup_serv;   

    -------------------------------------------------------------------------------------------------------
    FETCH c_th_ubic INTO r_ubic;
    v_ubic_cont:= v_ubic_cont+1;
END LOOP;
CLOSE c_th_ubic;



COMMIT;
RETURN (v_ubic_cont);
END;

/
