* Programa que sirve para generar el reporte de Servicio
  DRBR 29-Oct-1993
*

#dMLS5 %5ld~;  #dMLS3 %3ld~; #dMLS6 %6ld~; #dMIS4 %4d~; #dMFS7 %7.1f~;
#dMFS5 %5.1f~; #dMIE2 %-2d~; #dMIS2 %2d~;  #dMDS6 %6.0f~; #dMFS6 %6.2f~;

f0; M
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
        milin_z			s100,
        sff_z			s2,
	impre_z			i,
	totdias_z		i,
	diamay_z		i,
	diamen_z		i,
	resuel_z		i,
	visitad_z		i,
	solxent_z		i,
	font_z			i,
	carac_z			i,
        maxrow_z		i,
        maxcol_z		i,
        renst_z			i,
	promed_z		d,
	tres_z			i,
	media_z			d,
	media2_z		d,
        repxres1_z		d,
        repxres2_z		d,
        varia_z			d,
        porc1_z			d,
        porc2_z			d,
	tres2_z			i,
	micar_z			s3,
	salto_z			s2,
	miprog_z		s20,
	archini_z		s30,
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	bandimp_z		s2,
	ter_z            s2,
	fech9_z     {
	  dias_z        s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
	fech8_z           D,
	fecha_z           D,
	fechb_z           D,
	enc_z			s1,
	fechc_z			D,
	fechd_z			D,
	feche_z			D,
	fechg_z			D,
	tipo_z			s2,
	region_z		s2,
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
	fecman_z	{
	  fecmanaa_z		i,
	  fecmanmm_z		i,
	  fecmandd_z		i,
	  		}
	fecaan_z	{
	  fecaanaa_z		i,
	  fecaanmm_z		i,
	  fecaandd_z		i,
	  		}
	diasdif_z	         l,
	fech1_z		        s9,
	fech2_z         	s9,
	fech3_z          	s9,
	fech4_z			s9,
	tran_z           	s1,
	antip_z          	s2,
	prlin_z			s5,
	ullin_z			s5,
	prtipo_z		s2,
	ultipo_z		s2,
	nomcli_z    {
	  nombre_z      	s34,
	  sino_z         	s1,
	            }
	impres_z		s2,
        tablas_z		s2,
        analirep_z		s2,
        fecsig_z	{
          fecsigaa_z		i,
          fecsigmm_z		i,
          fecsigdd_z		i,
        		}
	dimayma_z		i,
	dimenma_z		i,
	totdima_z		i,
	resuma_z		i,
	nrpxl_z			i,
        prubi_z			i,
        ulubi_z			i,
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
	ind1_z            i,
	ind2_z            i,
	ind3_z			i,
        ii_z			i,
        iii_z			i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;
mtam0&; tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1;
q+,miprog_z,"lisrepxlin",; q+,archini_z,".",miprog_z,".ini",;
(impre_z)=(1); GPAN; (arch_z)=($lisrep00.tex,12); GTOMA_PARAMETROS; 

&a; &cfeche_z; qD,2,fecsig_z,feche_z,; 
GPRIMERO_DE_MES_ANTER; qD,1,fecsig_z,fechd_z,;
[fei; t@4,3; \Fecha Inicial  : \; t0Fin; (fecha_z)=(fechd_z); ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,; &bfecha_z; &p4fech1_z;
(fecsig_z)=(fecini_z,#); GULTIMO_DE_MES; qD,1,fecsig_z,feche_z,;
(fechg_z)=(fecha_z)(86400)-; qD,2,fecman_z,fechg_z,;
[feu; t@4,40; \Fecha Final (Corte) : \; t0fei; (fechb_z)=(feche_z); ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,; &bfechb_z; &p4fech2_z;
(fecaan_z)=(fecult_z,#); (fecaanaa_z)=(fecaanaa_z)(1)-;
!(fecaanmm_z)0($2)(fecaandd_z)0($29)&>|; (fecaandd_z)=(28); .
GST; pfecaanaa_z,MIS2; \-\; pfecaanmm_z,MIS2; \-\; pfecaandd_z,MIS2;
(impres_z)=($S,1); (analirep_z)=($S,1);
[prl; t@7,3; \Linea Inicial:\; t0fei; iprlin_z,4;
[ull; t@7,40; \Linea Final:\; t0prl; iullin_z,4;
!(ullin_z)2(prlin_z,#)>ull;
[prt; 
t@11,3; \Los tipos de los reportes son:\;
t@12,3; \0-Resuelto 1-Sin Accion 2-Visitados 3-Al taller 4-En taller 5-Sol x Entregar\;
t@8,3; \Estado Inicial:\; t0ull; iprtipo_z,1;
[ult; t@8,40; \Estado Final:\; t0prt; iultipo_z,1;
!(ultipo_z)2(prtipo_z,#)>ult;
(tablas_z)=($N,1);
GST; \Estan Correctos los Datos ? <S/N> : \; y|; | gfei; .
tS1,7,0,12,80; tv0; tc;

GGRABA_PARAMETROS; GABRE_TABLA;

!(analirep_z)0($S,1)>|; GANALITICO; .
Ff4; FC; Ff1; tf; tr; tS0;
GSalir;
gFin;

[TOMA_PARAMETROS;
z0,cmds_z,#; q+,cmds_z,"echo 1 >>",archini_z,;
x(cmds_z); Ff5; FO(archini_z),r~;
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (impres_z)=(milin_z,1);
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (analirep_z)=(milin_z,1);
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (tablas_z)=(milin_z,1);
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (prlin_z)=(milin_z,4);
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (ullin_z)=(milin_z,4);
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (prtipo_z)=(milin_z,1);
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (ultipo_z)=(milin_z,1);
[listos_parametros; Ff5; FC; Ff1;
R;

[GRABA_PARAMETROS;
Ff5; FO(archini_z),w~;
pimpres_z,0; l;
panalirep_z,0; l;
ptablas_z,0; l;
pprlin_z,0; l;
pullin_z,0; l;
pprtipo_z,0; l;
pultipo_z,0; l;
Ff5; FC; Ff1;
R;

[ACUMULA;
f4; k3; P$; f2; k2; P$; f1; k4; P;
{ n+;
  Ff1; \Leyendo : \; pnumero_rep,MLS6; s1; pcodcli_rep,0; s1;
  qD,1,fecha_rep,fechc_z,; &bfechc_z; &p4fech3_z; pfech3_z,0; l;
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
R;

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
(diasdif_z)=(fechb_z)(fechc_z)-(86400)/(1)+;
!(diasdif_z)1($15)>|;
  (tran16d_z)=(tran16d_z)(1)+;
|
  (tran15d_z)=(tran15d_z)(1)+;
.
!(devolt_rep)0($S,1)>|;
  qD,1,fecdvt_rep,fechd_z,; &bfechd_z; &p4fech3_z;
  !(fech3_z)4(fech2_z,#)>|;
    (solsdev_z)=(solsdev_z)(1)+; (tipo_z)=($5,1); GAGREGAENIND; R;
  |
    GCHECAENTALLER; R;
  .
|
  GCHECAENTALLER;
.
R;

[CHECAENTALLER;
!(taller_rep)0($S,1)>|;
  qD,1,fectal_rep,fechc_z,; &bfechc_z; &p4fech3_z;
  !(fech3_z)4(fech2_z,#)>|;
    (entaller_z)=(entaller_z)(1)+; (tipo_z)=($4,1); GAGREGAENIND; R;
  |
    GCHECAALTALLER; R;
  .
|
  GCHECAALTALLER;
.
R;

[CHECAALTALLER;
!(recogi_rep)0($S,1)>|;
  qD,1,fecrec_rep,fechc_z,; &bfechc_z; &p4fech3_z;
  !(fech3_z)4(fech2_z,#)>|;
    (altaller_z)=(altaller_z)(1)+; (tipo_z)=($3,1); GAGREGAENIND; R;
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
    (repvisi_z)=(repvisi_z)(1)+; (tipo_z)=($2,1); GAGREGAENIND; R;
  |
    (sinaccion_z)=(sinaccion_z)(1)+; (tipo_z)=($1,1); GAGREGAENIND; R;
  .
|
  (sinaccion_z)=(sinaccion_z)(1)+; (tipo_z)=($1,1); GAGREGAENIND; R;
.
R;

[AGREGAENIND;
z0,tipo_indrep,l; (tipo_indrep)=(tipo_z,#); (numrep_indrep)=(numero_rep);
(ubica_indrep)=(ubica_rep); (linea_indrep)=(linea_rep,#);
f2; QNOPDAGF2; k3; P$;
(linea_z)=(linea_rep,#);
f4; k1; P;
n|;
  f3; k1; P; n|; (region_z)=($2,1); | (region_z)=(region_lrep,#); .
  z0,fecha_ifs,l; (fecha_ifs)=(fecult_z,#); (linea_ifs)=(linea_z,#);
  (region_ifs)=(region_z,#); (ubica_ifs)=(ubica_z);
  GASIGNA_INFSER; f4; QNOPDAGF4; k6; P$;
|
  GASIGNA_INFSER; f4; QNOPDMDF4; k7; P$;
.
R;

[ASIGNA_INFSER;
!(tipo_z)0($0,1)>|;
  (resuel_ifs)=(resuel_ifs)(1)+;
  qD,1,fecres_rep,fechc_z,; qD,1,fecha_rep,fechd_z,;
  (diasdif_z)=(fechc_z)(fechd_z)-(86400)/(1)+;
  (totdres_ifs)=(totdres_ifs)(diasdif_z)+;
  !(diamen_ifs)0($0)(diamen_ifs)1(diasdif_z)|>|; (diamen_ifs)=(diasdif_z); .
  !(diasdif_z)1(diamay_ifs)>|; (diamay_ifs)=(diasdif_z); .
  !(diasdif_z)1($15)>|;
    (resmas15_ifs)=(resmas15_ifs)(1)+;
  |
    (resmen15_ifs)=(resmen15_ifs)(1)+;
  .
  !(clialm_rep)0($C,1)>|;
    (resxcli_ifs)=(resxcli_ifs)(1)+;
  |
    (resxalm_ifs)=(resxalm_ifs)(1)+;
  .
|
  qD,1,fecha_rep,fechc_z,;
  (diasdif_z)=(fechb_z)(fechc_z)-(86400)/(1)+;
  !(diasdif_z)1($15)>|;
    (tramas15_ifs)=(tramas15_ifs)(1)+;
  |
    (tramen15_ifs)=(tramen15_ifs)(1)+;
  .
  (transfin_ifs)=(transfin_ifs)(1)+;
  !(clialm_rep)0($C,1)>|;
    (traxcli_ifs)=(traxcli_ifs)(1)+;
  |
    (traxalm_ifs)=(traxalm_ifs)(1)+;
  .
  !(tipo_z)0($1,1)>|; (sinaccion_ifs)=(sinaccion_ifs)(1)+; .
  !(tipo_z)0($2,1)>|; (visitad_ifs)=(visitad_ifs)(1)+; .
  !(tipo_z)0($3,1)>|; (altaller_ifs)=(altaller_ifs)(1)+; .
  !(tipo_z)0($4,1)>|; (entaller_ifs)=(entaller_ifs)(1)+; .
  !(tipo_z)0($5,1)>|; (solxent_ifs)=(solxent_ifs)(1)+; .
.
qD,1,fecha_rep,fechd_z,; &bfechd_z; &p4fech3_z;
!(fech3_z)3(fech1_z,#)>|;
  (entraron_ifs)=(entraron_ifs)(1)+;
  !(clialm_rep)0($C,1)>|;
    (entxcli_ifs)=(entxcli_ifs)(1)+;
  |
    (entxalm_ifs)=(entxalm_ifs)(1)+;
  .
|
  (transini_ifs)=(transini_ifs)(1)+;
.
R;

[NOPDAGF4; GST; `7; \No pude agregar registro en infser ...\; Z1; R;
[NOPDMDF4; GST; `7; \No pude modificar registro en infser ...\; Z1; R;

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
(diasdif_z)=(fechc_z)(fechd_z)-(86400)/(1)+;
!(diasdif_z)1($15)>|;
  (res16d_z)=(res16d_z)(1)+;
|
  (res15d_z)=(res15d_z)(1)+;
.
(tipo_z)=($0,1); GAGREGAENIND;
R;

[NOPDAGF2; GST; `7; \No pude agregar registro en indrep...\; Z2; R;

[INFORME;
* --> Imprimo la Hoja de Condensado de Informe   <---- *
z0,ubica_z,#;
z0,resuel_maifs0,l; f8; k1; P; n|;.
z0,resuel_maifs1,l; f6; k1; P; n|;.
z0,resuel_maifs2,l; f7; k1; P; n|;.
z0,max_ind9,l; f9; k1; P; n|;.
>slprrep_ind9,#,prirep_z;
>slulrep_ind9,#,ultrep_z;
(enc_z)=($2,1);
!(band_z)5($S,1)>|;
    Ff4; FO(arch_z),w~; FP66,60,Enc,Pie; GFONT14; GFONT12;
|
  Ff4; GFONT30; GFONT14; GFONT12;
.
\Numero de reporte Inicial:\; pprirep_z,MLS6;
\ Numero de Reporte Final:\; pultrep_z,MLS6; 
\ Entraron: \; pcount_ind9,MLS6; l; l;
s49; GFONT17; \Actual|Mes.An|  %%  |Anu.An|  %%  |\; GFONT18; l;
\*  Reportes que entraron de Clientes           :\; 
pentxcli_maifs0,MDS6; \|\;
z0,porc1_z,#; z0,porc2_z,#;
!(entxcli_maifs1)5($0)>|;
  (porc1_z)=(entxcli_maifs0)(entxcli_maifs1)-(entxcli_maifs1)/(100)*;
.
!(entxcli_maifs2)5($0)>|;
  (porc2_z)=(entxcli_maifs0)(entxcli_maifs2)-(entxcli_maifs2)/(100)*;
.
pentxcli_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
pentxcli_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
\*  Reportes que entraron de Almacen            :\; 
pentxalm_maifs0,MDS6;  \|\;
z0,porc1_z,#; z0,porc2_z,#;
!(entxalm_maifs1)5($0)>|;
  (porc1_z)=(entxalm_maifs0)(entxalm_maifs1)-(entxalm_maifs1)/(100)*;
.
!(entxalm_maifs2)5($0)>|;
  (porc2_z)=(entxalm_maifs0)(entxalm_maifs2)-(entxalm_maifs2)/(100)*;
.
pentxalm_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
pentxalm_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
c-55; s1; c-6; s1; c-6; s1; c-6; s1; c-6; l;
(totrepen_z)=(entcli_z)(entalm_z)+;
\   Total de reportes que entraron              :\; pentraron_maifs0,MDS6; \|\;
!(entraron_maifs1)5($0)>|;
  (porc1_z)=(entraron_maifs0)(entraron_maifs1)-(entraron_maifs1)/(100)*;
.
!(entraron_maifs2)5($0)>|;
  (porc2_z)=(entraron_maifs0)(entraron_maifs2)-(entraron_maifs2)/(100)*;
.
pentraron_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
pentraron_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
(totrepen_z)=(entrancli_z)(entranalm_z)+;
\*  Mas Total de reportes en Transito           :\; ptransini_maifs0,MDS6; \|\;
!(transini_maifs1)5($0)>|;
  (porc1_z)=(transini_maifs0)(transini_maifs1)-(transini_maifs1)/(100)*;
.
!(transini_maifs2)5($0)>|;
  (porc2_z)=(transini_maifs0)(transini_maifs2)-(transini_maifs2)/(100)*;
.
ptransini_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
ptransini_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
c-55; s1; c-6; s1; c-6; s1; c-6; s1; c-6; l;
(totrepen_z)=(entraron_maifs0)(transini_maifs0)+;
\   Total de reportes a Resolver                :\; ptotrepen_z,MLS6; \|\;
(repxres1_z)=(entraron_maifs1)(transini_maifs1)+;
(repxres2_z)=(entraron_maifs2)(transini_maifs2)+;
!(repxres1_z)5($0)>|;
  (porc1_z)=(totrepen_z)(repxres1_z)-(repxres1_z)/(100)*;
.
!(repxres2_z)5($0)>|;
  (porc2_z)=(totrepen_z)(repxres2_z)-(repxres2_z)/(100)*;
.
prepxres1_z,MDS6; \|\; pporc1_z,MFS6; \|\;
prepxres2_z,MDS6; \|\; pporc2_z,MFS6; \|\; l; l;
\* Resueltos con fecha Mayor de 15 Dias         :\; presma15_maifs0,MDS6; \|\;
!(resma15_maifs1)5($0)>|;
  (porc1_z)=(resma15_maifs0)(resma15_maifs1)-(resma15_maifs1)/(100)*;
.
!(resma15_maifs2)5($0)>|;
  (porc2_z)=(resma15_maifs0)(resma15_maifs2)-(resma15_maifs2)/(100)*;
.
presma15_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
presma15_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
\* Resueltos c/Fecha Menor o igual 15 Dias      :\; presme15_maifs0,MDS6; \|\;
!(resme15_maifs1)5($0)>|;
  (porc1_z)=(resme15_maifs0)(resme15_maifs1)-(resme15_maifs1)/(100)*;
.
!(resme15_maifs2)5($0)>|;
  (porc2_z)=(resme15_maifs0)(resme15_maifs2)-(resme15_maifs2)/(100)*;
.
presme15_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
presme15_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
c-55; s1; c-6; s1; c-6; s1; c-6; s1; c-6; l;
(totrepen_z)=(resuel_maifs0);
\  Total de Reportes Resueltos                  :\; ptotrepen_z,MLS6; \|\;
!(resuel_maifs1)5($0)>|;
  (porc1_z)=(totrepen_z)(resuel_maifs1)-(resuel_maifs1)/(100)*;
.
!(resuel_maifs2)5($0)>|;
  (porc2_z)=(totrepen_z)(resuel_maifs2)-(resuel_maifs2)/(100)*;
.
presuel_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
presuel_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l; l;
(rescli_z)=(resxcli_maifs0);
\  Reportes de Clientes Resueltos               :\; prescli_z,MLS6; \|\;
!(resxcli_maifs1)5($0)>|;
  (porc1_z)=(rescli_z)(resxcli_maifs1)-(resxcli_maifs1)/(100)*;
.
!(resxcli_maifs2)5($0)>|;
  (porc2_z)=(rescli_z)(resxcli_maifs2)-(resxcli_maifs2)/(100)*;
.
presxcli_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
presxcli_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
(resalm_z)=(resxalm_maifs0);
\  Reportes de Almacen Resueltos                :\; presalm_z,MLS6; \|\;
!(resxalm_maifs1)5($0)>|;
  (porc1_z)=(resalm_z)(resxalm_maifs1)-(resxalm_maifs1)/(100)*;
.
!(resxalm_maifs2)5($0)>|;
  (porc2_z)=(resalm_z)(resxalm_maifs2)-(resxalm_maifs2)/(100)*;
.
presxalm_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
presxalm_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l; l;
(tran16d_z)=(trama15_maifs0);
\* En transito con fecha mayor de 15 Dias       :\; ptran16d_z,MLS6; \|\;
!(trama15_maifs1)5($0)>|;
  (porc1_z)=(tran16d_z)(trama15_maifs1)-(trama15_maifs1)/(100)*;
.
!(trama15_maifs2)5($0)>|;
  (porc2_z)=(tran16d_z)(trama15_maifs2)-(trama15_maifs2)/(100)*;
.
ptrama15_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
ptrama15_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\;l;
(tran15d_z)=(trame15_maifs0);
\* En transito c/fecha Menor o igual de 15 Dias :\; ptran15d_z,MLS6; \|\;
!(trame15_maifs1)5($0)>|;
  (porc1_z)=(tran15d_z)(trame15_maifs1)-(trame15_maifs1)/(100)*;
.
!(trame15_maifs2)5($0)>|;
  (porc2_z)=(tran15d_z)(trame15_maifs2)-(trame15_maifs2)/(100)*;
.
ptrame15_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
ptrame15_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
c-55; s1; c-6; s1; c-6; s1; c-6; s1; c-6; l;
(totrepen_z)=(tran16d_z)(tran15d_z)+;
\  Total de Reportes en Transito                :\; ptotrepen_z,MLS6; \|\;
!(transfin_maifs1)5($0)>|;
  (porc1_z)=(totrepen_z)(transfin_maifs1)-(transfin_maifs1)/(100)*;
.
!(transfin_maifs2)5($0)>|;
  (porc2_z)=(totrepen_z)(transfin_maifs2)-(transfin_maifs2)/(100)*;
.
ptransfin_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
ptransfin_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l; l;
(trancli_z)=(traxcli_maifs0);
\* Reportes de Clientes en Transito             :\; ptrancli_z,MLS6; \|\;
!(traxcli_maifs1)5($0)>|;
  (porc1_z)=(trancli_z)(traxcli_maifs1)-(traxcli_maifs1)/(100)*;
.
!(traxcli_maifs2)5($0)>|;
  (porc2_z)=(trancli_z)(traxcli_maifs2)-(traxcli_maifs2)/(100)*;
.
ptraxcli_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
ptraxcli_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
(tranalm_z)=(traxalm_maifs0);
\* Reportes de Almacen en Transito              :\; ptranalm_z,MLS6; \|\;
!(traxalm_maifs1)5($0)>|;
  (porc1_z)=(tranalm_z)(traxalm_maifs1)-(traxalm_maifs1)/(100)*;
.
!(traxalm_maifs2)5($0)>|;
  (porc2_z)=(tranalm_z)(traxalm_maifs2)-(traxalm_maifs2)/(100)*;
.
ptraxalm_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
ptraxalm_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
(solsdev_z)=(solxent_maifs0);
\* Reportes Solucionados y por Devolver         :\; psolsdev_z,MLS6; \|\;
!(solxent_maifs1)5($0)>|;
  (porc1_z)=(solsdev_z)(solxent_maifs1)-(solxent_maifs1)/(100)*;
.
!(solxent_maifs2)5($0)>|;
  (porc2_z)=(solsdev_z)(solxent_maifs2)-(solxent_maifs2)/(100)*;
.
psolxent_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
psolxent_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
(entaller_z)=(entaller_maifs0);
\* Reportes en Talleres                         :\; pentaller_z,MLS6; \|\;
!(entaller_maifs1)5($0)>|;
  (porc1_z)=(entaller_z)(entaller_maifs1)-(entaller_maifs1)/(100)*;
.
!(entaller_maifs2)5($0)>|;
  (porc2_z)=(entaller_z)(entaller_maifs2)-(entaller_maifs2)/(100)*;
.
pentaller_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
pentaller_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
(altaller_z)=(altaller_maifs0);
\* Reportes a Talleres                          :\; paltaller_z,MLS6; \|\;
!(altaller_maifs1)5($0)>|;
  (porc1_z)=(altaller_z)(altaller_maifs1)-(altaller_maifs1)/(100)*;
.
!(altaller_maifs2)5($0)>|;
  (porc2_z)=(altaller_z)(altaller_maifs2)-(altaller_maifs2)/(100)*;
.
paltaller_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
paltaller_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
(repvisi_z)=(visitad_maifs0);
\* Reportes Visitados sin Resolver              :\; prepvisi_z,MLS6; \|\;
!(visitad_maifs1)5($0)>|;
  (porc1_z)=(repvisi_z)(visitad_maifs1)-(visitad_maifs1)/(100)*;
.
!(visitad_maifs2)5($0)>|;
  (porc2_z)=(repvisi_z)(visitad_maifs2)-(visitad_maifs2)/(100)*;
.
pvisitad_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
pvisitad_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l;
(sinaccion_z)=(sinaccion_maifs0);
\* Reportes sin accion                          :\; psinaccion_z,MLS6; \|\;
!(sinaccion_maifs1)5($0)>|;
  (porc1_z)=(sinaccion_z)(sinaccion_maifs1)-(sinaccion_maifs1)/(100)*;
.
!(sinaccion_maifs2)5($0)>|;
  (porc2_z)=(sinaccion_z)(sinaccion_maifs2)-(sinaccion_maifs2)/(100)*;
.
psinaccion_maifs1,MDS6; \|\; pporc1_z,MFS6; \|\;
psinaccion_maifs2,MDS6; \|\; pporc2_z,MFS6; \|\; l; l;

z0,nelem_z,#; f4; k5; P; { n+; (nelem_z)=(nelem_z)(1)+; f4; a; )
c_20; (ind1_z)=(nelem_z); { !(ind1_z)4($0)>+; c_5; (ind1_z)=(ind1_z)(1)-; ) c_4; l;
\|    Status       |\; f4; k5; P; { n+; plinea_ifs,0; \|\; a; ) \Totl|\; l;
GCORTALIN1;
\|Resueltos        |\; z0,tothor_z,#; f4; k5; P;
{ n+; presuel_ifs,MIS4; \|\; (tothor_z)=(tothor_z)(resuel_ifs)+; a; )
ptothor_z,MIS4; \|\; l;
\|Transito Final   |\; z0,tothor_z,#; f4; k5; P;
{ n+; ptransfin_ifs,MIS4; \|\; (tothor_z)=(tothor_z)(transfin_ifs)+; a; )
ptothor_z,MIS4; \|\; l; GCORTALIN1;
\|    Total        |\; z0,tothor_z,#; f4; k5; P;
{ n+;
  (transfin_ifs)=(transfin_ifs)(resuel_ifs)+; ptransfin_ifs,MIS4; \|\;
  (tothor_z)=(tothor_z)(transfin_ifs)+; a;
)
ptothor_z,MIS4; \|\; l; GCORTALIN1;
\|    Entran       |\; z0,tothor_z,#; f4; k5; P;
{ n+; pentraron_ifs,MIS4; \|\; (tothor_z)=(tothor_z)(entraron_ifs)+; a; )
ptothor_z,MIS4; \|\; l; GCORTALIN1;
\|Transito Inicial |\; z0,tothor_z,#; f4; k5; P;
{ n+; ptransini_ifs,MIS4; \|\; (tothor_z)=(tothor_z)(transini_ifs)+; a; )
ptothor_z,MIS4; \|\; l; GCORTALIN1;
R;

[CORTALIN1;
\|\; c_17; \|\; (ind1_z)=(nelem_z);
{ !(ind1_z)4($0)>+; c_4; \|\; (ind1_z)=(ind1_z)(1)-; )
c_4; \|\; l;
R;

[ANALISIS_X_LINEA;
z0,ubica_z,#; z0,resuel_z,#; z0,sinaccion_z,#; z0,visitad_z,#; z0,altaller_z,#;
z0,entaller_z,#; z0,solxent_z,#;
(enc_z)=($3,1); (tipo_z)=($1,1); Ff4; GFONT30; f4; k2; P;
{ n+;
  !(region_ifs)5(tipo_z,#)>|;
    GCORTLIN2;
    \|Subtotal de los Reportes \;
    \|   \; presuel_z,MIS4; \|    \; psinaccion_z,MIS4;
    \|   \; pvisitad_z,MIS4; \|     \; paltaller_z,MIS4; \|     \;
    pentaller_z,MIS4; \|     \; psolxent_z,MIS4; \| \;
    (tothor_z)=(resuel_z)(sinaccion_z)+(visitad_z)+(altaller_z)+;
    (tothor_z)=(tothor_z)(entaller_z)+(solxent_z)+; ptothor_z,MIS4; \|\; l;
    GCORTLIN2; (tipo_z)=(region_ifs,1);
  .
  \|\; plinea_ifs,0; s1; (linea_z)=(linea_ifs,#); f3; k1; P; n|; GNOLIN; .
  pdescri_lrep,20; \|   \; presuel_ifs,MIS4; \|    \; psinaccion_ifs,MIS4;
  \|   \; pvisitad_ifs,MIS4; \|     \; paltaller_ifs,MIS4; \|     \;
  pentaller_ifs,MIS4; \|     \; psolxent_ifs,MIS4; \| \;
  (tothor_z)=(resuel_ifs)(sinaccion_ifs)+(visitad_ifs)+(altaller_ifs)+;
  (tothor_z)=(tothor_z)(entaller_ifs)+(solxent_ifs)+; ptothor_z,MIS4; \|\; l;
  (resuel_z)=(resuel_z)(resuel_ifs)+; (visitad_z)=(visitad_z)(visitad_ifs)+;
  (sinaccion_z)=(sinaccion_z)(sinaccion_ifs)+;
  (altaller_z)=(altaller_z)(altaller_ifs)+;
  (entaller_z)=(entaller_z)(entaller_ifs)+;
  (solxent_z)=(solxent_z)(solxent_ifs)+;
  f4; a;
)
GCORTLIN2;
\|Total de los Reportes    |   \; presuel_z,MIS4; \|    \; psinaccion_z,MIS4;
\|   \; pvisitad_z,MIS4; \|     \; paltaller_z,MIS4; \|     \;
pentaller_z,MIS4; \|     \; psolxent_z,MIS4; \| \;
(tothor_z)=(resuel_z)(sinaccion_z)+(visitad_z)+(altaller_z)+;
(tothor_z)=(tothor_z)(entaller_z)+(solxent_z)+; ptothor_z,MIS4; \|\; l;
GCORTLIN2;

(enc_z)=($4,1); Ff4; l; GSUBENC4;
z0,resuel_z,#; z0,totdias_z,#; z0,diamen_z,#; z0,diamay_z,#;
z0,dimayma_z,#; z0,dimenma_z,#; z0,ind3_z,#;

(tipo_z)=($1,1); f4; k2; P;
{ n+;
  !(region_ifs)5(tipo_z,#)>|;
    GCORTLIN2;
    \|Subtotal de los Reportes \;
    \|   \; presuel_z,MIS4; \|    \; ptotdias_z,MIS4;
    z0,promed_z,#; !(resuel_z)5($0)>|; (promed_z)=(totdias_z)(resuel_z)/; .
    \|\; ppromed_z,MFS7; \|     \; pdiamen_z,MIS4; \|     \; pdiamay_z,MIS4;
    (tres_z)=(resuel_z)(2)-;
    !(tres_z)5($0)>|;
      (media_z)=(totdias_z)(diamen_z)-(diamay_z)-(tres_z)/;
    |
      (media_z)=(promed_z);
    .
    \|  \; pmedia_z,MFS7; \|\;
    (tres_z)=(resuma_z)(2)-;
    !(tres_z)5($0)>|;
      (media_z)=(totdima_z)(dimenma_z)-(dimayma_z)-(tres_z)/;
    |
      z0,promed_z,#; !(resuma_z)5($0)>|; (promed_z)=(totdima_z)(resuma_z)/; .
      (media_z)=(promed_z);
    .
    pmedia_z,MFS5; \|\; l;
    GCORTLIN2; (tipo_z)=(region_ifs,1);
  .
  \|\; plinea_ifs,0; s1; (linea_z)=(linea_ifs,#); f3; k1; P; n|; GNOLIN; .
  pdescri_lrep,20; \|   \; presuel_ifs,MIS4; \|    \; ptotdres_ifs,MIS4;
  z0,promed_z,#; !(resuel_ifs)5($0)>|; (promed_z)=(totdres_ifs)(resuel_ifs)/; .
  \|\; ppromed_z,MFS7; \|     \; pdiamen_ifs,MIS4; \|     \; pdiamay_ifs,MIS4;
  (tres_z)=(resuel_ifs)(2)-;
  !(tres_z)5($0)>|;
    (media_z)=(totdres_ifs)(diamen_ifs)-(diamay_ifs)-(tres_z)/;
  |
    (media_z)=(promed_z);
  .
  \|  \; pmedia_z,MFS7;
  f5; k1; z0,fecha_maifs,l; P; n|;.
  (tres2_z)=(resuel_maifs)(2)-;
  !(tres2_z)5($0)>|;
    (media2_z)=(totdres_maifs)(diamen_maifs)-(diamay_maifs)-(tres2_z)/;
  |
    z0,promed_z,#; !(resuel_maifs)5($0)>|; (promed_z)=(totdres_maifs)(resuel_maifs)/; .
    (media2_z)=(promed_z);
  .
  \|\; pmedia2_z,MFS5; \|\; l;
  (resuel_z)=(resuel_z)(resuel_ifs)+;
  (resuma_z)=(resuma_z)(resuel_maifs)+;
  (totdias_z)=(totdias_z)(totdres_ifs)+;
  (totdima_z)=(totdima_z)(totdres_maifs)+;
  !(ind3_z)0($0)>|; 
    (diamen_z)=(diamen_ifs); (diamay_z)=(diamay_ifs);
    (dimenma_z)=(diamen_maifs); (dimayma_z)=(diamay_maifs);
    (ind3_z)=(1);
  .
  !(diamen_ifs)2(diamen_z)>|; (diamen_z)=(diamen_ifs); .
  !(diamay_ifs)1(diamay_z)>|; (diamay_z)=(diamay_ifs); .
  !(diamen_maifs)2(dimenma_z)>|; (dimenma_z)=(diamen_maifs); .
  !(diamay_maifs)1(dimayma_z)>|; (dimayma_z)=(diamay_maifs); .
  f4; a;
)
GCORTLIN2;
\|   Total de los Reportes \;
\|   \; presuel_z,MIS4; \|    \; ptotdias_z,MIS4;
z0,promed_z,#; !(resuel_z)5($0)>|; (promed_z)=(totdias_z)(resuel_z)/; .
\|\; ppromed_z,MFS7; \|     \; pdiamen_z,MIS4; \|     \; pdiamay_z,MIS4;
(tres_z)=(resuel_z)(2)-;
!(tres_z)5($0)>|;
  (media_z)=(totdias_z)(diamen_z)-(diamay_z)-(tres_z)/;
|
  (media_z)=(promed_z);
.
\|  \; pmedia_z,MFS7; \|\;
(tres_z)=(resuma_z)(2)-;
!(tres_z)5($0)>|;
  (media_z)=(totdima_z)(dimenma_z)-(dimayma_z)-(tres_z)/;
|
  z0,promed_z,#; !(resuma_z)5($0)>|; (promed_z)=(totdima_z)(resuma_z)/; .
  (media_z)=(promed_z);
.
pmedia_z,MFS5; \|\; l;
GCORTLIN2;
R;

[SUBENC4;
GFONT15; Fc40,\ANALISIS DE REPORTES RESUELTOS X LINEA~; GFONT16; l;
c_88; l;
GFONT19; \|  Linea                  |Resuelt|Tot.Dias|Promed.|Dia Menor|Dia Mayor|Mediana  |M.A. |\; GFONT20; l;
R;

[SUBENC3;
GFONT15; Fc40,\ANALISIS ACUMULADOS X LINEA~; GFONT16; l;
c_88; l;
GFONT19; \|  Linea                  |Resuelt|S/Accion|Visitad|Al Taller|En Taller|Sol.x.Ent|Total|\; GFONT20; l;
R;

[CORTLIN2;
\|_________________________|_______|________|_______|_________|_________|_________|_____|\; l;
R;

[Enc;
Ff3; FT; FGNodatos; Ff4; GFONT14; GFONT11; Fc80,3; l; Ff3; FGNodatos; Ff4; 
GFONT13; pmiprog_z,0; s1; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1;
phora_z,#; FW3; l;
Fc60,\Informe de Reportes de Servicio Al ~; pfechb_z,+10;
\ Pag: \; Fp%d~; GFONT12; l;
!(enc_z)0($1,1)>|; GSUBENC;  .
!(enc_z)0($3,1)>|; GSUBENC3; .
!(enc_z)0($4,1)>|; GSUBENC4; .
(band_z)=($S,1);
Ft;

[Pie; Fe;

[ANALITICO;
GACUMULA; (enc_z)=($1,1);
f2; k5; P;
{ n+;
  Ff1; \Leyendo : \; ptipo_indrep,0; s1; pnumrep_indrep,MLS6; l;
  !(impres_z)0($N,1)(tipo_indrep)0($0,1)&>|; f2; a; g-; .
  !(band_z)5($S,1)>|;
    (antip_z)=(tipo_indrep,#); (linea_z)=(linea_indrep,#);
    Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
  .
  !(antip_z)5(tipo_indrep,#)>|;
    GSUBTLIN; GSUBTIP; l; (linea_z)=(linea_indrep,#); z0,salto_z,#;
    (antip_z)=(tipo_indrep,#); GSUBENC;
  .
  !(linea_indrep)5(linea_z,#)>|; GSUBTLIN; (linea_z)=(linea_indrep,#); GSUBENCLIN; .
  (ubica_z)=(ubica_indrep); (reporte_z)=(numrep_indrep);
  f1; k1; P; n|; | GIMPRI; .
  f2; a;
)
GSUBTLIN; GSUBTIP; GULIN;
R;

[SUBENC;
Ff4; GFONT14; GFONT15; 
!(antip_z)0($0,1)>|; Fc40,\REPORTES RESUELTOS~; .
!(antip_z)0($1,1)>|; Fc40,\REPORTES SIN ACCION~; .
!(antip_z)0($2,1)>|; Fc40,\REPORTES VISITADOS~; .
!(antip_z)0($3,1)>|; Fc40,\REPORTES AL TALLER~; .
!(antip_z)0($4,1)>|; Fc40,\REPORTES EN TALLER~; .
!(antip_z)0($5,1)>|; Fc40,\REPORTES SOLUCIONADOS POR ENTREGAR~; .
GFONT16; GFONT13; l; GSUBENCLIN;
R;

[SUBENCLIN;
Ff4; l;
\Linea:\; GFONT15; plinea_z,0; s1; f3; k1; P; n|; GNOLIN; . 
pdescri_lrep,0; GFONT16; GFONT13; l;
GFONT19; \Numero __Fecha_ ----------- Nombre  --------------- --------- Articulo \;
\----------- --------- Defecto -------------------- \;
!(antip_z)0($0,1)>|; \Solucion Dias Rep \; .
!(antip_z)0($1,1)>|; \Poblacion ---------\; .
!(antip_z)0($2,1)>|; \Poblacion ---------\; .
!(antip_z)0($3,1)>|; \Recibido ----------\; .
!(antip_z)0($4,1)>|; \Al Taller ---------\; .
!(antip_z)0($5,1)>|; \Del Tal. Poblacion\; .
GFONT20; l;
R;

[IMPRI;
(nomcli_z)=(cliente_rep,#); qD,1,fecha_rep,fechc_z,;
Ff4; pnumero_rep,MLS5; s1; pfechc_z,+10; s1; pcodcli_rep,10; s1;
pnombre_z,32; s1; partic_rep,31; s1; psintom1_rep,31; s1;
qD,1,fecha_rep,fechd_z,; (dias2_z)=(fechb_z)(fechd_z)-(86400)/(1)+;
!(antip_z)0($0,1)>|;
  qD,1,fecres_rep,fechc_z,;
  pfechc_z,+10; (dias2_z)=(fechc_z)(fechd_z)-(86400)/(1)+;
.
!(antip_z)0($1,1)>|; ppobla_rep,18; .
!(antip_z)0($2,1)>|; ppobla_rep,18; .
!(antip_z)0($5,1)>|;
  qD,1,fecdvt_rep,fechc_z,; pfechc_z,+10; s1; ppobla_rep,9;
.
!(antip_z)0($3,1)>|; qD,1,fecrec_rep,fechc_z,; pfechc_z,+10; .
!(antip_z)0($4,1)>|;
  qD,1,fectal_rep,fechc_z,; pfechc_z,+10; s1; ptalser_rep,0;
.
s1; pdias2_z,MLS3; l; (nrep_z)=(nrep_z)(1)+; (nrep1_z)=(nrep1_z)(1)+;
(nrpxl_z)=(nrpxl_z)(1)+;
R;

[SUBTLIN;
Ff4;    \Total Reportes esta Linea: \; pnrpxl_z,MIS4; z0,nrpxl_z,#; l;
R;

[SUBTIP;
Ff4;    \Numero de Reportes       : \; pnrep1_z,MLS5; z0,nrep1_z,#; l;
R;

[ULIN;
Ff4; l; \Numero Total de Reportes : \; pnrep_z,MLS5; l;
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
k2; kp,"fecha <= ? and (status='N' or fecres >= ?) order by fecha, numero",
    fecult_z,#,3,fecini_z,#,3,;
k3; kp,"fecha between ? and ? order by linea, fecha, numero",
    fecini_z,#,3,fecult_z,#,3,;
k4; kp,"fecha <= ? and (status='N' or fecres >= ?) and linea between ? and ?
	order by fecha, numero",
	fecult_z,#,3,fecini_z,#,3,prlin_z,#,1,ullin_z,#,1,;

f2; #iindrep.i;
k0; ot,"indrep",;
k1; kp," tipo <> '' order by tipo,linea,ubica,numrep",;
k2; kq,"delete from indrep",;
k3; kq,"insert into indrep (tipo,ubica,numrep,linea) values (?,?,?,?)",
	tipo_indrep,#,1,ubica_indrep,numrep_indrep,linea_indrep,#,1,;
k4; kq,"select a.* from indrep a join reportes b on a.numrep = b.numero
	and a.ubica = b.ubica
	 order by a.tipo, a.linea, b.numero, b.fecha",;
k5; kq,"select a.* from indrep a join reportes b on a.numrep = b.numero
	and a.ubica = b.ubica
	where a.tipo between ? and ? and a.linea between ? and ?
	 order by a.tipo, a.linea, b.numero, b.fecha",
	 prtipo_z,#,1,ultipo_z,#,1,prlin_z,#,1,ullin_z,#,1,;

f3; #ilinrep.i;
k0; ot,"linrep",;
k1; kp,"numero=?",linea_z,#,1,;

f4; #iinfser.i;
k0; ot,"infser",;
k1; kp,"fecha=? and linea=?",fecult_z,#,3,linea_z,#,1,;
k2; kp,"fecha=? order by region,linea",fecult_z,#,3,;
k3; kq,"delete from infser where fecha=?",fecult_z,#,3,;
k4; kp,"fecha<? and linea=?",fecini_z,#,3,linea_z,#,1,;
k5; kp,"fecha=? order by linea",fecult_z,#,3,;
k6; kq,"insert into infser (fecha,linea,region,resuel,sinaccion,visitad,
	altaller,entaller,solxent,totdres,diamen,diamay,transfin,transini,
        entraron,ubica,entxcli,entxalm,resmas15,resmen15,resxcli,resxalm,
        tramas15,tramen15,traxcli,traxalm)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        fecha_ifs,#,3,linea_ifs,#,1,region_ifs,#,1,resuel_ifs,
        sinaccion_ifs,visitad_ifs,altaller_ifs,entaller_ifs,solxent_ifs,
        totdres_ifs,diamen_ifs,diamay_ifs,transfin_ifs,transini_ifs,
        entraron_ifs,ubica_ifs,entxcli_ifs,entxalm_ifs,resmas15_ifs,
        resmen15_ifs,resxcli_ifs,resxalm_ifs,tramas15_ifs,tramen15_ifs,
        traxcli_ifs,traxalm_ifs,;
k7; kq,"update infser set resuel=?,sinaccion=?,visitad=?,
	altaller=?,entaller=?,solxent=?,totdres=?,diamen=?,diamay=?,
        transfin=?,transini=?,entraron=?,entxcli=?,entxalm=?,resmas15=?,
        resmen15=?,resxcli=?,resxalm=?,tramas15=?,tramen15=?,
        traxcli=?,traxalm=?
        where fecha=? and linea=?",
        resuel_ifs,sinaccion_ifs,visitad_ifs,altaller_ifs,entaller_ifs,
        solxent_ifs,totdres_ifs,diamen_ifs,diamay_ifs,transfin_ifs,
        transini_ifs,entraron_ifs,entxcli_ifs,entxalm_ifs,resmas15_ifs,
        resmen15_ifs,resxcli_ifs,resxalm_ifs,tramas15_ifs,tramen15_ifs,
        traxcli_ifs,traxalm_ifs,fecult_z,#,3,linea_z,#,1,;

f5; M
* Buffer definitions for table infser *
	fecha_maifs { fechaYear_maifs i, fechaMon_maifs i, fechaDay_maifs i, }
	linea_maifs  s5,
	region_maifs  s2,
	resuel_maifs  i,
	sinaccion_maifs  i,
	visitad_maifs  i,
	altaller_maifs  i,
	entaller_maifs  i,
	solxent_maifs  i,
	totdres_maifs  i,
	diamen_maifs  i,
	diamay_maifs  i,
	transfin_maifs  i,
	transini_maifs  i,
	entraron_maifs  i,
	ubica_maifs	i,;
 * 15 columns (size for buffer = 37)*

k0; ot,"infser",;
k1; kp,"fecha = ? and linea=?",
	fecman_z,#,3,linea_z,#,1,;

f6; M
	resuel_maifs1  		d,
	sinaccion_maifs1  	d,
	visitad_maifs1 		d,
	altaller_maifs1  	d,
	entaller_maifs1  	d,
	solxent_maifs1 		d,
	totdres_maifs1 		d,
	diamen_maifs1  		d,
	diamay_maifs1  		d,
	transfin_maifs1  	d,
	transini_maifs1  	d,
	entraron_maifs1  	d,
        entxcli_maifs1		d,
        entxalm_maifs1		d,
        resma15_maifs1		d,
        resme15_maifs1		d,
        resxcli_maifs1		d,
        resxalm_maifs1		d,
        trama15_maifs1		d,
        trame15_maifs1		d,
        traxcli_maifs1		d,
        traxalm_maifs1		d,;
 * 15 columns (size for buffer = 37)*

k0; ot,"infser",;
k1; kq,"select sum(resuel),sum(sinaccion),sum(visitad),sum(altaller),
	sum(entaller),sum(solxent),sum(totdres),sum(diamen),sum(diamay),
        sum(transfin),sum(transini),sum(entraron),
        sum(entxcli),sum(entxalm),
        sum(resmas15),sum(resmen15),sum(resxcli),sum(resxalm),
        sum(tramas15),sum(tramen15),sum(traxcli),sum(traxalm)
        from infser where fecha = ?",
        fecman_z,#,3,;

f7; M
	resuel_maifs2  		d,
	sinaccion_maifs2  	d,
	visitad_maifs2 		d,
	altaller_maifs2  	d,
	entaller_maifs2  	d,
	solxent_maifs2 		d,
	totdres_maifs2 		d,
	diamen_maifs2  		d,
	diamay_maifs2  		d,
	transfin_maifs2  	d,
	transini_maifs2  	d,
	entraron_maifs2  	d,
        entxcli_maifs2		d,
        entxalm_maifs2		d,
        resma15_maifs2		d,
        resme15_maifs2		d,
        resxcli_maifs2		d,
        resxalm_maifs2		d,
        trama15_maifs2		d,
        trame15_maifs2		d,
        traxcli_maifs2		d,
        traxalm_maifs2		d,;
 * 15 columns (size for buffer = 37)*

k0; ot,"infser",;
k1; kq,"select sum(resuel),sum(sinaccion),sum(visitad),sum(altaller),
	sum(entaller),sum(solxent),sum(totdres),sum(diamen),sum(diamay),
        sum(transfin),sum(transini),sum(entraron),
        sum(entxcli),sum(entxalm),
        sum(resmas15),sum(resmen15),sum(resxcli),sum(resxalm),
        sum(tramas15),sum(tramen15),sum(traxcli),sum(traxalm)
        from infser where fecha = ?",
        fecaan_z,#,3,;

f8; M
	resuel_maifs0  		d,
	sinaccion_maifs0  	d,
	visitad_maifs0 		d,
	altaller_maifs0  	d,
	entaller_maifs0  	d,
	solxent_maifs0 		d,
	totdres_maifs0 		d,
	diamen_maifs0  		d,
	diamay_maifs0  		d,
	transfin_maifs0  	d,
	transini_maifs0  	d,
	entraron_maifs0  	d,
        entxcli_maifs0		d,
        entxalm_maifs0		d,
        resma15_maifs0		d,
        resme15_maifs0		d,
        resxcli_maifs0		d,
        resxalm_maifs0		d,
        trama15_maifs0		d,
        trame15_maifs0		d,
        traxcli_maifs0		d,
        traxalm_maifs0		d,;
 * 15 columns (size for buffer = 37)*
k0; ot,"infser",;
k1; kq,"select sum(resuel),sum(sinaccion),sum(visitad),sum(altaller),
	sum(entaller),sum(solxent),sum(totdres),sum(diamen),sum(diamay),
        sum(transfin),sum(transini),sum(entraron),
        sum(entxcli),sum(entxalm),
        sum(resmas15),sum(resmen15),sum(resxcli),sum(resxalm),
        sum(tramas15),sum(tramen15),sum(traxcli),sum(traxalm)
        from infser where fecha = ?",
        fecult_z,#,3,;

f9; M
	max_ind9		s11,
        ulrep_ind9		s10,
	min_ind9		s11,
        prrep_ind9		s10,
        count_ind9		l,
        tam_ind9		s0,;
ot,"reportes",;
k1; kq,"select  cast( max( convert_char(fecha)+':'+convert_char(numero) ) 
	as varchar(20)) as maximo,
        cast (min( convert_char(fecha)+':'+convert_char(numero) ) 
        as varchar(20)) as mnimo, count(*) as entran
        from reportes  where fecha between ? and ?",
        fecini_z,#,3,fecult_z,#,3,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;
#i/programas/lib/fechas.i;

[PAN; 
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro; tf; tn;
ta0; #iprog1.i; ^=direc_z,#);
z0,modul_z,#; (modul_z)=($Reporte de Servicio,19); (modul2_z)=($CAR-MDS,7);
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
