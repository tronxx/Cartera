* Programa que sirve para generar el reporte de Servicio
  DRBR 29-Oct-1993
*

#dMLS5 %5ld~; #dMLS3 %3ld~; #dMLS6 %6ld~; #dMIS4 %4d~; #dMFS7 %7.1f~; #dMFS5 %5.1f~;
#dMIE2 %-2d~; #dMIS2 %2d~;

f0; M
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
	sff_z			s2,
        maxcol_z		i,
        maxrow_z		i,
        renst_z			i,
	priubi_z		i,
	ultubi_z		i,
	impre_z			i,
	totdias_z		i,
	diamay_z		i,
	diamen_z		i,
	resuel_z		i,
	visitad_z		i,
	solxent_z		i,
	font_z			i,
	carac_z			i,
	promed_z		d,
	tres_z			i,
	media_z			d,
	media2_z		d,
	tres2_z			i,
	micar_z			s3,
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	bandimp_z		s3,
	ter_z            s2,
	fech9_z     {
	  dias_z        s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
	fech8_z           	D,
	fecha_z           	D,
	fechb_z           	D,
	enc_z			s1,
	fechc_z			D,
	fechd_z			D,
	tipo_z			s2,
	band_z			s1,
	linea_z			s5,
	ubica_z			i,
	reporte_z		l,
	tothor_z		i,
	nelem_z			i,
	mibd_z			s80,
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
	diasdif_z         l,
	fech1_z          s9,
	fech2_z          s9,
	fech3_z          s9,
	fech4_z		s9,
	tran_z           s1,
	antip_z          s2,
	nomcli_z    {
	  nombre_z      s34,
	  sino_z         s1,
	            }
	dias2_z           l,
	nrep1_z           l,
	nrep_z            l,
	entaller_z        l,
	altaller_z        l,
	sinaccion_z       l,
	total_z           l,
	prirep_z          l,
	ultrep_z          l,
	tran15d_z         l,
	tran16d_z         l,
	entalm_z          l,
	entcli_z          l,
	resalm_z          l,
	rescli_z          l,
	res15d_z          l,
	res16d_z          l,
	tranalm_z         l,
	trancli_z         l,
	trans15d_z        l,
	trans16d_z        l,
	entranalm_z       l,
	entrancli_z       l,
	solsdev_z         l,
	repvisi_z         l,
	totrepen_z		l,
	diasmin_z		i,
	diasmax_z		i,
	diavis_z		s2,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;
mtam0&; tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1;
(impre_z)=(1); GPAN; (arch_z)=($repxserv.tex,12);
GABRE_TABLA;

[feu; t@5,3; \Fecha Corte : \; t0Fin; &cfechb_z; ifechb_z,+10;
!(fechb_z)0($-1)>feu; (fecha_z)=(fechb_z)(86400)(7)*-;
qD,2,fecini_z,fecha_z,; qD,2,fecult_z,fechb_z,; &bfechb_z; &p4fech2_z;
[dia; t@7,3; \Ruta de Visita:\; t0feu; idiavis_z,1;
f5; k1; P; n|; GST; `7; \Ruta Inexistente...\; Z1; gdia; . s1; pdescri_rut,0;
[tie; t@8,3; \Con     a      dias en taller:\;
[di1; t0dia; t@8,7; idiasmin_z,MIE2,MIS2;
[di2; t0di1; t@8,13; idiasmax_z,MIE2,MIS2;
GST; \Estan Correctos los Datos ? <S/N> : \; y|; | gfeu; .

tS1,7,0,12,80; tc;
f2; k2; P$; f1; k2; P;
{ n+;
  Ff1; \Leyendo : \; pnumero_rep,MLS6; s1; pcodcli_rep,0; l;
  qD,1,fecha_rep,fechc_z,; &bfechc_z; &p4fech3_z; pfech3_z,0;
  !(fech3_z)2(fech1_z,#)>|;               * <-  Es Anterior Puede ser Transito *
    (tran_z)=($N,1);
    !(status_rep)0($N,1)>|;                 * <-  Es sin Resolver Checarlo   *
      GCHECASINRESTRAN;
    |
      qD,1,fecres_rep,fechc_z,; &bfechc_z; &p4fech3_z;
      !(fech3_z)1(fech2_z,#)>|;
        GCHECASINRESTRAN;
      |
        !(fech3_z)3(fech1_z,#)(fech3_z)4(fech2_z,#)&>|; GCHECARESTRAN; .
      .
    .
  |
    !(prirep_z)0($0)>|; (prirep_z)=(numero_rep); . (ultrep_z)=(numero_rep);
    (tran_z)=($S,1);
    !(status_rep)0($N,1)>|;
      GCHECASINRESTRAN;
    |
      qD,1,fecres_rep,fechc_z,; &bfechc_z; &p4fech3_z;
      !(fech3_z)1(fech2_z,#)>|;
        GCHECASINRESTRAN;
      |
        !(fech3_z)3(fech1_z,#)(fech3_z)4(fech2_z,#)&>|; GCHECARESTRAN; .
      .
    .
  .
  f1; a;
)
GREPOR;
gFin;

[CHECASINRESTRAN;
Ff1; \Estoy en CHECASINRESTRAN \; ptran_z,#; l;
!(clialm_rep)0($C,1)>|;
  !(tran_z)0($N,1)>|;
    (entrancli_z)=(entrancli_z)(1)+;
  |
    (entcli_z)=(entcli_z)(1)+;
  .
  (trancli_z)=(trancli_z)(1)+;
|
  !(tran_z)0($N,1)>|;
    (entranalm_z)=(entranalm_z)(1)+;
  |
    (entalm_z)=(entalm_z)(1)+;
  .
  (tranalm_z)=(tranalm_z)(1)+;
.
qD,1,fecha_rep,fechc_z,;
(diasdif_z)=(fechb_z)(fechc_z)-(86400)/;
!(diasdif_z)1($15)>|;
  (tran16d_z)=(tran16d_z)(1)+;
|
  (tran15d_z)=(tran15d_z)(1)+;
.
!(devolt_rep)0($S,1)>|;
  qD,1,fecdvt_rep,fechd_z,; &bfechd_z; &p4fech3_z;
  !(fech3_z)4(fech2_z,#)>|;
    (solsdev_z)=(solsdev_z)(1)+; (tipo_z)=($5,1); GAGREGAENIND;
  |
    GCHECAENTALLER;
  .
|
  GCHECAENTALLER;
.
R;

[CHECAENTALLER;
!(taller_rep)0($S,1)>|;
  qD,1,fectal_rep,fechc_z,; &bfechc_z; &p4fech3_z;
  !(fech3_z)4(fech2_z,#)>|;
    (entaller_z)=(entaller_z)(1)+; (tipo_z)=($4,1); GAGREGAENIND;
  |
    GCHECAALTALLER;
  .
|
  GCHECAALTALLER;
.
R;

[CHECAALTALLER;
!(recogi_rep)0($S,1)>|;
  qD,1,fecrec_rep,fechc_z,; &bfechc_z; &p4fech3_z;
  !(fech3_z)4(fech2_z,#)>|;
    (altaller_z)=(altaller_z)(1)+; (tipo_z)=($3,1); GAGREGAENIND;
  |
    GCHECAVISI;
  .
|
  GCHECAVISI;
.
R;

[CHECAVISI;
!(visit1_rep)0($S,1)>|;
  qD,1,fevis1_rep,fechc_z,; &bfechc_z; &bfechc_z; &p4fech3_z;
  !(fech3_z)4(fech2_z,#)|>|;
    (repvisi_z)=(repvisi_z)(1)+; (tipo_z)=($2,1); GAGREGAENIND;
  |
    (sinaccion_z)=(sinaccion_z)(1)+; (tipo_z)=($1,1); GAGREGAENIND;
  .
|
  (sinaccion_z)=(sinaccion_z)(1)+; (tipo_z)=($1,1); GAGREGAENIND;
.
R;

[AGREGAENIND;
!(tipo_z)5($4,1)>R;
qD,1,fectal_rep,fechc_z,; pfechc_z,+10; s1; ptalser_rep,0;
(diasdif_z)=(fechb_z)(fechc_z)-(86400)/(1)+;
!(diasdif_z)2(diasmin_z)(diasdif_z)1(diasmax_z)|>R;
z0,tipo_indrep,l; (tipo_indrep)=(tipo_z,#); (numrep_indrep)=(numero_rep);
(ubica_indrep)=(ubica_rep); (linea_indrep)=(linea_rep,#);
f2; QNOPDAGF2; k3; P$;
R;

[CHECARESTRAN;
!(clialm_rep)0($C,1)>|;
  !(tran_z)0($N,1)>|;
    (entrancli_z)=(entrancli_z)(1)+;
  |
    (entcli_z)=(entcli_z)(1)+;
  .
  (rescli_z)=(rescli_z)(1)+;
|
  !(tran_z)0($N,1)>|;
    (entranalm_z)=(entranalm_z)(1)+;
  |
    (entalm_z)=(entalm_z)(1)+;
  .
  (resalm_z)=(resalm_z)(1)+;
.
qD,1,fecres_rep,fechc_z,; qD,1,fecha_rep,fechd_z,;
(diasdif_z)=(fechc_z)(fechd_z)-(86400)/;
!(diasdif_z)1($15)>|;
  (res16d_z)=(res16d_z)(1)+;
|
  (res15d_z)=(res15d_z)(1)+;
.
(tipo_z)=($0,1); GAGREGAENIND; R;
R;

[NOPDAGF2; GST; `7; \No pude agregar registro en indrep...\; Z2; R;

[REPOR;
GANALITICO;
Ff4; FC; Ff1; tf; tr; tS0;
gSalir;
R;

[INFORME; R;

[Enc;
Ff3; FT; FGNodatos; Ff4; GFONT14; GFONT11; s5; Fc80,3; l; Ff3; FGNodatos; Ff4; 
s5; GFONT13; \diarep \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1;
phora_z,#; s10; FW3; l;
s5; \Listado Reportes de Servicios Al \; pfechb_z,+10; \ Con Ruta de:\;
pdiavis_z,1; s1; pdescri_rut,0; l;
s5; \ Con \; pdiasmin_z,MIS2; \ a \;
pdiasmax_z,MIS2; \ Dias en Taller \; \ Pag: \; Fp%d~; GFONT12; l;
!(enc_z)0($1,1)>|; GSUBENC;  .
(band_z)=($S,1);
Ft;

[Pie; Fe;

[ANALITICO;
(enc_z)=($1,1);
f2; k1; P;
{ n+;
  Ff1; \Leyendo : \; ptipo_indrep,0; s1; pnumrep_indrep,MLS6; l;
  !(tipo_indrep)5(antip_z,#)>|;
    !(band_z)5($S,1)>|;
      (antip_z)=(tipo_indrep,#); (linea_z)=(linea_indrep,#);
      Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
    |
      GSUBTIP; l; (linea_z)=(linea_indrep,#); (antip_z)=(tipo_indrep,#);
      GSUBENC;
    .
  .
  !(linea_indrep)5(linea_z,#)>|; (linea_z)=(linea_indrep,#); GSUBENCLIN; .
  (ubica_z)=(ubica_indrep); (reporte_z)=(numrep_indrep);
  f1; k1; P; n|; | GIMPRI; .
  f2; a;
)
!(band_z)5($S,1)>|;
  (antip_z)=(tipo_indrep,#); (linea_z)=(linea_indrep,#);
  tc; Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
.
GSUBTIP; GULIN;
R;

[SUBENC;
Ff4; s5; GFONT14; GFONT15; 
!(antip_z)0($0,1)>|; Fc40,\REPORTES RESUELTOS~; .
!(antip_z)0($1,1)>|; Fc40,\REPORTES SIN ACCION~; .
!(antip_z)0($2,1)>|; Fc40,\REPORTES VISITADOS~; .
!(antip_z)0($3,1)>|; Fc40,\REPORTES AL TALLER~; .
!(antip_z)0($4,1)>|; Fc40,\REPORTES EN TALLER~; .
!(antip_z)0($5,1)>|; Fc40,\REPORTES SOLUCIONADOS POR ENTREGAR~; .
GFONT16; GFONT13; l; GSUBENCLIN;
R;

[SUBENCLIN;
Ff4; s5; l;
\Linea:\; GFONT15; plinea_z,0; s1; f3; k1; P; n|; GNOLIN; . pdescri_lrep,0; GFONT16; l;
s5; \Numero __Fecha_ ----------- Nombre  --------------- --------- Articulo \;
\----------- --------- Defecto -------------------- \;
!(antip_z)0($0,1)>|; \Solucion Dias Rep \; .
!(antip_z)0($1,1)>|; \Poblacion ---------\; .
!(antip_z)0($2,1)>|; \Poblacion ---------\; .
!(antip_z)0($3,1)>|; \Recibido ----------\; .
!(antip_z)0($4,1)>|; \Al Taller ---------\; .
!(antip_z)0($5,1)>|; \Del Tal. Poblacion\; .
l;
R;

[IMPRI;
(nomcli_z)=(cliente_rep,#); qD,1,fecha_rep,fechc_z,;
Ff4; s5; pnumero_rep,MLS5; s1; pfechc_z,+10; s1; pcodcli_rep,0; s1;
pnombre_z,32; s1; partic_rep,31; s1; psintom1_rep,31; s1;
qD,1,fecha_rep,fechd_z,; (dias2_z)=(fechb_z)(fechd_z)-(86400)/(1)+;
!(antip_z)0($0,1)>|;
  qD,1,fecres_rep,fechc_z,;
  pfechc_z,+10; s1; pdias2_z,MLS3;
.
!(antip_z)0($1,1)>|; ppobla_rep,18; s1; pdias2_z,MLS3; .
!(antip_z)0($2,1)>|; ppobla_rep,18; s1; pdias2_z,MLS3; .
!(antip_z)0($5,1)>|;
  qD,1,fecdvt_rep,fechc_z,; pfechc_z,+10; s1; ppobla_rep,9; s1; pdias2_z,MLS3;
.
!(antip_z)0($3,1)>|;
  qD,1,fecrec_rep,fechc_z,; pfechc_z,+10; s1; pdias2_z,MLS3;
.
!(antip_z)0($4,1)>|;
  qD,1,fectal_rep,fechc_z,; pfechc_z,+10; s1; ptalser_rep,0;
  (diasdif_z)=(fechb_z)(fechc_z)-(86400)/(1)+;
  s1; pdias2_z,MLS3; s1; pdiasdif_z,MLS3;
.
l; (nrep_z)=(nrep_z)(1)+; (nrep1_z)=(nrep1_z)(1)+;
R;

[SUBTIP;
Ff4; s5; \Numero de Reportes       : \; pnrep1_z,MLS5; z0,nrep1_z,#; l;
R;

[ULIN;
Ff4; l; s5; \Numero Total de Reportes : \; pnrep_z,MLS5; l;
R;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;
#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1; 
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #ireportes.i;
k0; ot,"reportes",;
k1; kp,"numero=?",reporte_z,;
k2; kp,"fecha <= ? and status='N' and taller='S' and devolt='N' and diiase=?",
	fecini_z,#,3,diavis_z,#,1,;

f2; #iindrep.i;
k0; ot,"indrep",;
k1; kp," tipo <> '' order by tipo,linea,ubica,numrep",;
k2; kq,"delete from indrep",;
k3; kq,"insert into indrep (tipo,ubica,numrep,linea) values (?,?,?,?)",
	tipo_indrep,#,1,ubica_indrep,numrep_indrep,linea_indrep,#,1,;

f3; #ilinrep.i;
k0; ot,"linrep",;
k1; kp,"numero=?",linea_z,#,1,;

f5; #irutas.i;
k0; ot,"rutas",;
k1; kp,"dia=?",diavis_z,#,1,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;

[PAN; 
Ff1; Gtomamaxrc; Gdefine_colores; Gamarillo_negro; tf; tn;
ta0; #iprog1.i; ^=direc_z,#); z0,modul_z,#; 
q+,modul_z,"Reportes Servicio x Visitar",; (modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];

[ERROR3; Ff1; GST; `7; \No pude agregar registro en "revrep.v" ...\; gFin1;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[NOLIN; z0,descri_lrep,#; (descri_lrep)=($INEXISTENTE,11); R;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

*   -->  Variables y Rutina para Reportes Multiples en variables   <--    *

[Fin1; y|;.
[Fin; t@23,0; te; };
