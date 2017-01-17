* Programa que sirve para la captura de los reportes
  DRBR  13-Oct-1994
  -------------------------------------------------------------------------
  Modificado para que permita Imprimir los reportes en el nuevo formato
  DRBR 11-Feb-1994
*

#i/programas/lib/funkey.i;
#dMLE5 %-5ld~; #dMIE5 %-5d~; #dMIS4 %04d~; #dMDS10 %10.0f~; #dMDS10a %,10.2f~;
#dMLS5 %05ld~; #dMIS5 %05d~; #dMDE10 %-10.0f~; #dMIS2 %2d~; #dMIS02 %02d~;
#dMDE12 %-12.2f~; #dMLS6 %6ld~;
#dMDS12 %,12.2f~;

tsp60; tsf25;

f0; M
	maxcol_z		i,
        maxrow_z		i,
        renst_z			i,
        version_z		s20,
        mibdcartera_z		s80,
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
	llavf_z    {
	  impre_z        s2,
	  font_z         s5,
	           }
	ter_z            s2,
	fech9_z     {
	  dias_z        s16,
	  hora_z         s5,
	  resto_z        s5,
	            }
	fecpol_z	{
	  fecpolaa_z		i,
	  fecpolmm_z		i,
	  fecpoldd_z		i,
	  		}
	fecini_z	{
	  feciniaa_z		i,
	  fecinimm_z		i,
	  fecinidd_z		i,
	  		}
	fecult_z	{
	  fecultaa_z		i,
	  fecultmm_z		i,
	  fecultdd_z		i,
	  		}
	fecobs_z	{
	  fecobsaa_z		i,
	  fecobsmm_z		i,
	  fecobsdd_z		i,
			}
        fecha2_z	{
          fecha2aa_z		s4,
          fecha2mm_z		s2,
          fecha2dd_z		s2,
                        }
	milin_z			s100,
        fecpolin_z		s10,
        idobscli_z		l,
        tipoobs_z		l,
        idobserv_z		l,
        idcli_z			l,
	reporte_z		l,
	ubica_z			i,
	fechc_z			D,
	observ_z		s201,
	tdaini_z		s5,
	tdault_z		s5,
	fecinia_z		D,
	feculta_z		D,
	fecvis1_z		D,
	fecvis2_z		D,
	fecvis3_z		D,
	fecrec_z		D,
	fectal_z		D,
	fecdvt_z		D,
	fecres_z		D,
	
	llavpol_z   {
	  fech1_z        s6,
	  tda_z          s5,
	            }
	llavexre_z  {
	   repo_z        s5,
	   fecr_z        s6,
	   conr_z        s4,
	            }
	llavxcod_z  {
	  codcli2_z     s10,
	  nrep2_z        s5,
	            }
	prom_z			s4,
	fech5_z     {
	  dd_z           s3,
	  mm_z           s3,
	  aa_z           s2,
	            }
	taller_z	s4,
	fech6_z          s6,
	fech7_z          s6,
	nudi_z            d,
	fechd_z           D,
	feche_z           D,
	atiende_z       s21,
	mibd_z		s60,
	tope_z			i,

	clialm_z		s2,
	pueblo_z	        s26,
	codcli_z      		s11,
	nomcli_z      		s36,
	dircli_z		s35,
	serie_z			s11,
	falla1_z		s31,
	falla2_z		s61,
	obser1_z		s61,
	artic_z			s31,
	carcli_z		s2,
	impccli_z		d,
	carmds_z		s2,
	impcmds_z		d,
	linea_z			s5,
	diiase_z		s2,
	
	bandc_z		s3,
	bndf1_z		s3,
	bandf7_z	s3,
	sitrep_z	s3,
	tope1_z		i,
	base1_z		i,
	rep1_z		l,
	rep2_z		l,
	reptmp_z		l,

	ubi_z		i,

	bandren_z        s3,
	nrep_z            l,
	mov_z            s2,
	arser_z     {
	  fecser_z      s10,
	  obser_z       s21,
	            }
	llavren_z   {
	  poliza_z      s10,
	  conse_z        s4,
	            }
	llavxnom_z  {
	  nomcli1_z     s35,
	  nrep1_z        s5,
	            }
	llavinu_z   {
	  repinu_z       s5,
	  fechinu_z      s6,
	  consinu_z      s4,
	            }
	enganc_z          d,
	cargos_z          d,
	abonos_z          d,
	saldo_z           d,
	nren_z            i,
	nulet_z           i,
	esmoro_z         s3,
	bandpan_z        s3,
	bandh_z          s3,
	bandh2_z         s3,
	antrep_z         s5,
	antmov_z         s3,
	band_z           s3,
	top_z            s3,

*  --> Defino el comando que tendra la alta de comandos  <--  *
	cmda_z      {
	  cmd1a_z       s44,
	  cmd2a_z       s11,
	            }
*   -->  Variables y Rutina para Reportes Multiples en variables   <--    *
	cmd_z       {
	  cmd1_z         s7,
	  narch_z       s13,
	  cmd3_z        s20,
	            }
	arch_z      {
	  nomar_z        s7,
	  nter_z         s2,
	  reser_z        s5,
	            }

	yapedi_z         s3,
* --> Estas son las variables que se necesitan para usar esta funcion  <--   *
	pos_z             l,
	narts_z           i,
	tpmov_z          s3,
	bandbu_z         s3,
	bandb_z          s3,
	band4_z          s3,
	bandr_z          s3,
	bandhrp_z        s3,
	ren_z             i,
	iii_z             i,
	pos1_z            l,
	col1_z            i,
	col2_z            i,
	xx_z              i,
	yy_z              i,
	ren2_z            i,
	cols_z            i,
	ii_z              i,

	ncon_z            i,
	base_z            i,
	renb_z            i,
	rena_z            i,
	col00_z           i,
	col01_z           i,
	col02_z           i,
	col03_z           i,
	col04_z           i,
	col05_z           i,
	col06_z           i,
	col07_z           i,
	col08_z           i,
	col09_z           i,
	col10_z           i,
	fecha_z           D,
	fech8_z           D,
	fechg_z           D,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	tarea_z           i,
	tar_z            s4,
	esp_z             i,
	exten_z           i,
	tam0             s0,;
mtam0&; 
q+,version_z,"V:BE01",;
tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; ts0;
>istermi_z,ter_z,%02d~; ttttarea_z; >istarea_z,tar_z,%04X~;
&a; &cfechg_z; (bandpan_z)=($1,1);
(tipoobs_z)=(2); * -> Solo Observaciones de Reportes *
(nomar_z)=($altarep,7); (nter_z)=(ter_z,#); (reser_z)=($.tex,4);

* &a; &cfech8_z; &p3fech9_z; pfech8_z,+10; s1; phora_z,#; s1; FW3; l; *
GABRE_TABLA; GPAN;
(base_z)=(13); (col00_z)=(0); (col01_z)=(6); (col02_z)=(17); (col03_z)=(47);
(col04_z)=(58); (col05_z)=(60); z0,linea_z,#; (tope_z)=(22);

GTOMA_PARAMETROS;


[fei; t@1,3; \Fecha Inicial  :\; pfecinia_z,+10; qD,2,fecini_z,fecinia_z,;
[feu; t@2,3; \Fecha Final    :\; pfeculta_z,+10; qD,2,fecult_z,feculta_z,;
[tin; t@3,3; \Almacen Inicial:\; ptdaini_z,4;
[tul; t@4,3; \Almacen Final  :\; ptdault_z,4;

tf; tS0; tc;
f10; k1; P;
{ n+;
  GDESPOL; GRECIPOL;
  f10; a;
)
GRECIOBS; Ff1; tf; tr; tS0;
gFin;

[TOMA_PARAMETROS;
x creaparam.bat .recipolser.ini~;
Ff5; FO.recipolser.ini~,r~;
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (fecha2_z)=(milin_z,8);
z0,fecpolin_z,#; (fecpolin_z)=(fecha2aa_z,4); >sifecpolin_z,#,feciniaa_z;
z0,fecpolin_z,#; (fecpolin_z)=(fecha2mm_z,2); >sifecpolin_z,#,fecinimm_z;
z0,fecpolin_z,#; (fecpolin_z)=(fecha2dd_z,2); >sifecpolin_z,#,fecinidd_z;
qD,1,fecini_z,fecinia_z,;
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (fecha2_z)=(milin_z,8);
z0,fecpolin_z,#; (fecpolin_z)=(fecha2aa_z,4); >sifecpolin_z,#,fecultaa_z;
z0,fecpolin_z,#; (fecpolin_z)=(fecha2mm_z,2); >sifecpolin_z,#,fecultmm_z;
z0,fecpolin_z,#; (fecpolin_z)=(fecha2dd_z,2); >sifecpolin_z,#,fecultdd_z;
qD,1,fecult_z,feculta_z,;
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (tdaini_z)=(milin_z,2);
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (tdault_z)=(milin_z,2);

[listos_parametros; Ff5; FC; Ff1;
R;

[RECIPOL;
(fecpol_z)=(fecha_tmppos,#); (tda_z)=(tda_tmppos,#); f6; k1; P;
n|;
  (fecha_pos)=(fecha_tmppos,#); (tda_pos)=(tda_z,#);
  (status_pos)=(status_tmppos,#); (usuario_pos)=(usuario_tmppos,#);
  f6; QNOPDAGF6; k3; P$;
.
f11; k1; P;
{ n+;
  GDESPREN; (nrep_z)=(reporte_rps); (antmov_z)=(movto_rps,#); GAGREREN;
  f11; a;
)
R;

[DESPOL;
qD,1,fecha_tmppos,fecha_z,;
Ff1; \Leyendo:\; pfecha_z,+10; s1; ptda_tmppos,0; l;
R;

[AGREREN;
(nrep_z)=(reporte_tmprps); (mov_z)=(movto_tmprps,#);
(obser_z)=(observ_tmprps,#); (taller_z)=(atie2_tmprps,#); 
(ubi_z)=(ubica_tmprps);
f7; k5; P; n|; GINSERTALO; GAFECREP; .
R;

[INSERTALO;
f12; k1; P; n|; z0,ulticon_ind12,#; . (ncon_z)=(ulticon_ind12)(1)+;
f7; z0,fecha_rps,l; (fecha_rps)=(fecpol_z,#); (tda_rps)=(tda_z,#);
(conse_rps)=(ncon_z); (reporte_rps)=(reporte_tmprps);
(movto_rps)=(movto_tmprps,#);
(observ_rps)=(observ_tmprps,#); (atie2_rps)=(atie2_tmprps,#);
(nomat_rps)=(nomat_tmprps,#); (top_rps)=(top_tmprps,#);
(ubica_rps)=(ubica_tmprps); (import_rps)=(import_tmprps);
f7; QNOPDAGF7; k6; P$; GAFECREP;
R;

[AFECREP;
(exten_z)=(prom2_tmprep&)(2)-;
f1; k1; P; 
n|;
  \Voy a agregar en reportes\; l;
  f2; k1; P; nR; (codcli_rep)=(codcli_tmprep,exten_z);
  (ubica_rep)=(ubica_tmprep); (numero_rep)=(numero_tmprep);
  f1; QNOPDAGF1; k5; P$;
  \Ya ejecute f1 k5 \; l;
.
R;

f1; k1; P; nR;
!(mov_z)0($1,1)>|;
  (visit1_rep)=($S,1); (fevis1_rep)=(fecha_pos,#); (resvi1_rep)=(obser_z,#);
.
!(mov_z)0($2,1)>|;
  (visit2_rep)=($S,1); (fevis2_rep)=(fecha_pos,#); (resvi2_rep)=(obser_z,#);
.
!(mov_z)0($3,1)>|;
  (visit3_rep)=($S,1); (fevis3_rep)=(fecha_pos,#); (resvi3_rep)=(obser_z,#);
.
!(mov_z)0($R,1)>|;
  (recogi_rep)=($S,1); (fecrec_rep)=(fecha_pos,#); (obsrec_rep)=(obser_z,#);
.
!(mov_z)0($T,1)>|;
  (taller_rep)=($S,1); (fectal_rep)=(fecha_pos,#); (talser_rep)=(taller_z,#);
  (devolt_rep)=($N,1);
.
!(mov_z)0($D,1)>|;
  (devolt_rep)=($S,1); (fecdvt_rep)=(fecha_pos,#);
.
!(mov_z)0($A,1)>|;
  (artser_rep)=($S,1); z32,fecser_z,#; &bfechg_z; &p4fecser_z; (desars_rep)=(arser_z,#);
.
!(mov_z)0($S,1)>|;
  (status_rep)=($S,1); (fecres_rep)=(fecha_pos,#); (obsolu_rep)=(obser_z,#);
.
f1; QNOPDMDF1; k6; P$;
R;

[DESPREN;
(reptmp_z)=(reporte_tmprps); f2; k1; P; n|;.
Ff1; \Renglon:\; preporte_tmprps,MLS5; s1; pcodcli_tmprep,0; s1;
partic_tmprep,30; s1; pserie_tmprep,0; s1; pmovto_tmprps,0; s1; 
pobserv_tmprps,0; l;
R;

[RECIOBS;
\Ahora Agrego las Observaciones...\; l;
f16; k1; P;
{ n+;
  qD,1,fecha_tmpobc,fechc_z,;
  \Leyendo:\; pfechc_z,+10; s1; pidobserv_tmpobc,MLS6; l;
  GAGREGAOBS1;
  f16; a;
)
R;

[NOPDAGF5; GST; `7; \No pude agregar registro en observrep...\; Z1;

[AGREGAOBS1;
(idobserv_z)=(idobserv_tmpobc); z0,idobserv_tmpobs,l; f18; k1; P; nR;
(observ_z)=(observ_tmpobs,#); z0,idobserv_obs,l; f17; k1; P; nR;
Ff1; \Id Observ:\; pidobserv_obs,MLS6; s1; pobserv_z,0; l;
(idobserv_z)=(idobserv_obs); (fecobs_z)=(fecha_tmpobc,#);
(idcli_z)=(idcli_tmpobc);
f15; k1; P;
n|;
  z0,ulticon_ind12,l; f12; k5; P; n|;. (idobscli_z)=(ulticon_ind12)(1)+;
  z0,idobservcli_obc,l; (idobservcli_obc)=(idobscli_z); 
  (idcli_obc)=(idcli_tmpobc,#); (tipoobs_obc)=(tipoobs_tmpobc); 
  (fecha_obc)=(fecha_tmpobc,#); (idobserv_obc)=(idobserv_z); 
  f15; QNOPDAGF15; k2; P$;
.
R;

[NOPDAGF15; `7; \No pude agregar registro en observcli...\; l; R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;


[PAN; 
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro; GST; tf; tn;
tP/programas/vps/cartera/capolrep.s~; tL/programas/vps/cartera/capolrep.pos~;
ta0; t@2,0; tB80,3; t@4,0; tB80,7; t@0,0; tB80,11;
^=direc_z,#); (modul_z)=($Captura Poliza Reportes,23); (modul2_z)=($CAR-MDS,7); 
GBANNER; Gblanco_azul;
R;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1; 
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *

f1; #ireportes.i;
k0; ot,"reportes",;
k1; kp,"ubica=? and numero=?",ubi_z,nrep_z,;
k2; kp,"codcli=? and numero < ? order by fecha desc",codcli_z,#,1,nrep_z,;
k3; kp,"ubica=? and numero between ? and ?",ubi_z,rep1_z,rep2_z,;
k4; kq,"select * from reportes order by ubica,numero desc",;
k5; kq,"insert into reportes (ubica,numero,codcli,cliente,fecha,artic,
	serie,sintom1,sintom2,dircli,pobla,cargo,importe,status,fecres,
        ccarmds,carmds,obser1,clialm,taller,fectal,visit1,fevis1,resvi1,
        visit2,fevis2,resvi2,visit3,fevis3,resvi3,situac,devolt,fecdvt,
        recogi,fecrec,obsrec,artser,desars,linea,diiase,obsolu,talser,prom2)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,
        ?,?,?,?,?,?,?,?,?,?,?,?,?)",
        ubica_rep,numero_rep,codcli_rep,#,1,cliente_rep,#,1,fecha_rep,#,3,
        artic_rep,#,1,serie_rep,#,1,sintom1_rep,#,1,sintom2_rep,#,1,
        dircli_rep,#,1,pobla_rep,#,1,cargo_rep,#,1,importe_rep,
        status_rep,#,1,fecres_rep,#,3,ccarmds_rep,#,1,carmds_rep,
        obser1_rep,#,1,clialm_rep,#,1,taller_rep,#,1,fectal_rep,#,3,
        visit1_rep,#,1,fevis1_rep,#,3,resvi1_rep,#,1,visit2_rep,#,1,
        fevis2_rep,#,3,resvi2_rep,#,1,visit3_rep,#,1,fevis3_rep,#,3,
        resvi3_rep,#,1,situac_rep,#,1,devolt_rep,#,1,fecdvt_rep,#,3,
        recogi_rep,#,1,fecrec_rep,#,3,obsrec_rep,#,1,artser_rep,#,1,
        desars_rep,#,1,linea_rep,#,1,diiase_rep,#,1,obsolu_rep,#,1,
        talser_rep,#,1,prom2_rep,#,1,;
k6; kq,"update reportes set visit1=?,fevis1=?,resvi1=?,
	visit2=?,fevis2=?,resvi2=?,visit3=?,fevis3=?,resvi3=?,
        recogi=?,fecrec=?,obsrec=?,taller=?,fectal=?,talser=?,devolt=?,
        fecdvt=?,artser=?,desars=?,status=?,fecres=?,obsolu=?
        where ubica=? and numero=?",
        visit1_rep,#,1,fevis1_rep,#,3,resvi1_rep,#,1,
        visit2_rep,#,1,fevis2_rep,#,3,resvi2_rep,#,1,
        visit3_rep,#,1,fevis3_rep,#,3,resvi3_rep,#,1,
        recogi_rep,#,1,fecrec_rep,#,3,obsrec_rep,#,1,
        taller_rep,#,1,fectal_rep,#,3,talser_rep,#,1,
        devolt_rep,#,1,fecdvt_rep,#,3,
        artser_rep,#,1,desars_rep,#,1,
        status_rep,#,1,fecrec_rep,#,3,obsolu_rep,#,1,
        ubi_z,nrep_z,;

f5; #iobservrep.i;
k0; ot,"observrep",;
k1; kp,"reporte=? and fecha=? and observs=? and ubica=?",
	reporte_z,fecobs_z,#,3,observ_z,#,1,ubica_z,;
k2; kq,"insert into observrep (reporte,ubica,fecha,conse,observs)
	values (?,?,?,?,?)",
        reporte_obr,ubica_obr,fecha_obr,#,3,conse_obr,observs_obr,#,1,;

f6; #ipolser.i;
k0; ot,"polser",;
k1; kp,"fecha=? and tda=?",fecpol_z,#,3,tda_z,#,1,;
k2; kp,"fecha=? and tda=? ",fecpol_z,#,3,tda_z,#,1,;
k3; kq,"insert into polser (fecha,tda,status,usuario) values (?,?,?,?)",
	fecha_pos,#,3,tda_pos,#,1,status_pos,#,1,usuario_pos,#,1,;

f7; #irenposer.i;
k0; ot,"renposer",;
k1; kp,"fecha=? and tda=?",fecpol_z,#,3,tda_z,#,1,;
k2; kp,"fecha=? and tda=? order by conse desc",fecpol_z,#,3,tda_z,#,1,;
k3; kp,"fecha=? and tda=? and conse=?",fecpol_z,#,3,tda_z,#,1,ncon_z,;
k4; kq,"delete from renposer where fecha=? and tda=?",fecpol_z,#,3,tda_z,#,1,;
k5; kp,"fecha=? and tda=? and reporte=? and movto=? and observ=?",
	fecpol_z,#,3,tda_z,#,1,nrep_z,mov_z,#,1,obser_z,#,1,;
k6; kq,"insert into renposer (fecha,tda,conse,reporte,movto,observ,top,
	nomat,atie2,zona,ubica,import,boe) 
        values (?,?,?,?,?,?,?,?,?,?,?,?,?)",
        fecha_rps,#,3,tda_rps,#,1,conse_rps,reporte_rps,movto_rps,#,1,
        observ_rps,#,1,top_rps,#,1,nomat_rps,#,1,atie2_rps,#,1,
        zona_rps,#,1,ubica_rps,import_rps,boe_rps,#,1,;

f8; #ialmacen.i;
k0; ot,"almacen",;
k1; kp,"clave=?",tda_z,#,1,;

f9; #isitrep.i;
k0; ot,"sitrep",;
k1; kp,"clave=?",mov_z,#,1,;
k2; kq,"select * from sitrep",;

f12; M
	ulticon_ind12		l,;
k0; ot,"conceps",;
k1; kq,"select max(conse) from renposer where 
        fecha=? and tda=? ",fecpol_z,#,3,tda_z,#,1,;
k5; kq,"select max(idobservcli) from car_obsercli where idobservcli > 0",;

f14; #ipromotor.i;
k0; ot,"promotor",;
k1; kp,"clave=?",prom_z,#,1,;

f15; #icar_obsercli.i;
k0; ot,"car_obsercli",;
k1; kp,"fecha=? and idobserv=? and idcli=?",
	fecobs_z,#,3,idobserv_z,idcli_z,;
k2; kq,"insert into car_obsercli (idobservcli,idcli,fecha,tipoobs,idobserv)
	values (?,?,?,?,?)",
        idobservcli_obc,idcli_obc,fecha_obc,#,3,tipoobs_obc,idobserv_obc,;

f17; #icar_observs.i;
k0; ot,"car_observs",;
k1; kq,"call busobserv(?)",observ_z,#,1,;

* --> Abro la BD de Cartera para buscar Clientes Anteriores <----*
Ff5; FObdcartera.ini~,r~; FGNOBD; Fkmibdcartera_z,l; FC; Ff1;
GST; \Haciendo Conexion a:\; pmibdcartera_z,0; 
fd3; O@,mibdcartera_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *

f2; #ireportestmp.i;
k0; ot,"reportes",;
k1; kp,"ubica=? and numero=?",ubi_z,nrep_z,;

f4; #iobservreptmp.i;
k0; ot,"observrep",;
k1; kp,"fecha between ? and ?",fecini_z,#,3,fecult_z,#,3,;

f10; #ipolsertmp.i;
k0; ot,"polser",;
k1; kp,"fecha between ? and ? and tda between ? and ?",
    fecini_z,#,3,fecult_z,#,3,tdaini_z,#,1,tdault_z,#,1,;
    
f11; 
* Buffer definitions for table renposer *
M
fecha_tmprps 		{
	fechaYear_tmprps 	i,
	fechaMon_tmprps 	i,
	fechaDay_tmprps 	i,
	}

tda_tmprps 		s5,
conse_tmprps 		i,
reporte_tmprps 		l,
movto_tmprps 		s2,
observ_tmprps 		s21,
top_tmprps 		s2,
nomat_tmprps 		s21,
atie2_tmprps 		s4,
zona_tmprps 		s3,
ubica_tmprps 		i,
import_tmprps 		d,
boe_tmprps 		s2,;
k0; ot,"renposer",;
k1; kp,"fecha=? and tda=?",fecpol_z,#,3,tda_z,#,1,;
k3; kq,"delete from renposertmp",;
k4; kq,"delete from polsertmp",;
k5; kq,"delete from reportestmp",;

f16; #icar_obserclitmp.i;
k0; ot,"car_obsercli",;
k1; kp,"fecha between ? and ? and tipoobs = ?",
	fecini_z,#,3,fecult_z,#,3,tipoobs_z,;
k2; kq,"delete from car_obserclitmp",;
k3; kq,"delete from car_observstmp",;

f18; #icar_observstmp.i;
k0; ot,"car_observs",;
k1; kp,"idobserv=?",idobserv_z,;
R;

[R; R; [E; ];
[ATRVID; ta0; ta1; ta=; ta0; tp; R;
[ST; t@11,0; tl; GATRVID; R;
[ST2; t@23,0; te; GATRVID; R;
[ERROR1; gFin1;
[ERROR6; gFin1;
[NOPDMDF7; GST; `7; \No pude modificar renposer ... Intente mas tarde...\; Z2; R;
[NOPDAGF1; GST; `7; \No pude agregar reportes ... Intente mas tarde...\; Z2; R;
[NOPDMDF1; GST; `7; \No pude modificar reportes ... Intente mas tarde...\; Z2; R;
[NOPDAGF7; GST; `7; \No pude agregar   renposer ... Intente mas tarde...\; Z2; R;
[NOPDAGF6; GST; `7; \No pude agregar   polser ... Intente mas tarde...\; Z2; R;

[EROR13; gFin1;
[EROR20; GST; `7; \No pude agregar registro en nvreptmp.v ...\; gFin1;
[NOTDA; (nombre_alm)=($I N E X I S T E N TE,20); R;
[NORUT; (dias_z)=($INEXISTENTE,11); R;
	[NOPRO; (nombre_prm)=($INEXISTENTE,11); R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;

[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Salir; R;

*   -->  Variables y Rutina para Reportes Multiples en variables   <--    *

[Fin1; y|;.
[Fin; t@23,0; te; };
