* Programa que sirve para Generar el informe de acumulados de polizas
  DRBR 24 de Septiembre de 1997
*

#dMIS02 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~;  #dMLS4 %4ld~;  #dMFS6 %6.2f~; #dMDS9 %-9.2f~;
#dMFS5 %5.2f~;
#dMIS5 %5d~;
#i/programas/lib/funkey.i;

f0; M
	fech9_z     {
	  dias2_z       s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
        sff_z		s2,
        maxcol_z		i,
        maxrow_z		i,
        renst_z			i,
	bandman_z        s3,
	band_z           s3,
	bandh_z          s3,
	nemp_z		s80,
	direc_z		s50,
	modul_z		s30,
	modul2_z	s10,
	usuarios_z      s80,
	teruser_z       s80,
	mibd_z          s80,
	nombuse_z       s15,
	clause_z        s10,
	bandf1_z	 s3,
	antsdo_z		s3,
        primero_z		s2,
        idinfacupo_z		l,
        periodo_z		l,
        cia_z			i,
	saldo_z			d,
        anu_z			l,
        antanu_z		l,
	vigpol_z		i,
	clspol_z		i,
	prlpol_z		d,
	vigzon_z		i,
	clszon_z		i,
	prlzon_z		d,
	vigtot_z		i,
	clstot_z		i,
        idcli_z			l,
        ncon_z			l,
	prltot_z		d,
	
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	bandimp_z		s3,
	impre_z			i,
	font_z			i,
	micar_z			s3,
	carac_z			i,

	codcli_z			s11,
	antcli_z			s11,
	prtda_z				s3,
	ultda_z				s3,
	antzon_z			s3,
	antpol_z			s3,
	prime_z				s2,
	piva_z				d,
	implarpl_z			d,
	impcorpl_z			d,
	clisdos_z			i,
	fecha_z				D,
	fechb_z				D,
	fechd_z				D,
	feche_z				D,
	fech1_z				s8,
	fech2_z				s8,
	fecini_z	{
	  feciniaa_z			i,
	  fecinimm_z			i,
	  fecinidd_z			i,
	  		}
	fecult_z	{
	  fecultaa_z			i,
	  fecultmm_z			i,
	  fecultdd_z			i,
	  		}
	fecinima_z	{
	  fecinimaaa_z			i,
	  fecinimamm_z			i,
	  fecinimadd_z			i,
	  		}
	fecultma_z	{
	  fecultmaaa_z			i,
	  fecultmamm_z			i,
	  fecultmadd_z			i,
	  		}
        fecsig_z       {
          fecsigaa_z            i,
          fecsigmm_z            i,
          fecsigdd_z            i,
                        }
	iii_z				i,
	vence_z				D,
	fevta_z				D,
	fepol_z				D,
	dias_z				i,
	milet_z				i,
	meses_z				i,
	diaspla_z			f,
	tda_z				s3,
	cod_z				s3,
	zoncar_z			s3,
	tasiva_z			s6,
	antasiva_z			s6,
	nvopiva_z			s6,
	concp_z		{
	  concep_z			C31,
			}
	lta_z				s2,
	acum_z				s2,
	enc_z				i,
	mes_z				i,
	mes1_z				i,
	mes2_z				i,
	clidispo_z			i,
	csaldspol_z			i,
	ccancapol_z			i,
	ccanpipol_z			i,
	ccrdcapol_z			i,
	ccrdpipol_z			i,
	csaldszon_z			i,
	ccancazon_z			i,
	ccanpizon_z			i,
	ccrdcazon_z			i,
	ccrdpizon_z			i,
	csaldstot_z			i,
	ccancatot_z			i,
	ccanpitot_z			i,
	ccrdcatot_z			i,
	ccrdpitot_z			i,
	clican_z			i,
	clicrd_z			i,
	sdoprli_z			d,
	porc1_z				d,
	porc2_z				d,
	
	antcod_z			s3,
	sdosprlis_z			d,
	docnet_z			d,
	efectiv_z			d,
	impor_z				d,
	bonif_z				d,
	recar_z				d,
	docbon_z			d,
	docrec_z			d,
	actnet_z			d,
	sdoeng_z			d,
	docbmedoce_z			d,
	docrmadoce_z			d,
	doccpl_z			d,
	doclpl_z			d,
	saldados_z			i,
	sodsprlis_z			d,
	
	efec_z				d,
	impmapol_z			d,
	impmazon_z			d,
	impmatot_z			d,
	doccplpol_z			d,
	doclplpol_z			d,
	doccplzon_z			d,
	doclplzon_z			d,
	doccpltot_z			d,
	doclpltot_z			d,
	docbmedocepol_z			d,
	docrmadocepol_z			d,
	docbmedocezon_z			d,
	docrmadocezon_z			d,
	docbmedocetot_z			d,
	docrmadocetot_z			d,
	imporpol_z			d,
	bonifpol_z			d,
	recarpol_z			d,
	imporpol15_z			d,
	bonifpol15_z			d,
	recarpol15_z			d,
	imporpol10_z			d,
	bonifpol10_z			d,
	recarpol10_z			d,
	imporpol20_z			d,
	bonifpol20_z			d,
	recarpol20_z			d,

	imporzon_z			d,
	bonifzon_z			d,
	recarzon_z			d,
	imporzon15_z			d,
	bonifzon15_z			d,
	recarzon15_z			d,
	imporzon10_z			d,
	bonifzon10_z			d,
	recarzon10_z			d,

	importot_z			d,
	boniftot_z			d,
	recartot_z			d,
	importot15_z			d,
	boniftot15_z			d,
	recartot15_z			d,
	importot10_z			d,
	boniftot10_z			d,
	recartot10_z			d,
	
	docbonpol_z			d,
	docrecpol_z			d,
	actnetpol_z			d,
	sdoengpol_z			d,
	docbonzon_z			d,
	docreczon_z			d,
	actnetzon_z			d,
	sdoengzon_z			d,
	docbontot_z			d,
	docrectot_z			d,
	actnettot_z			d,
	sdoengtot_z			d,
	
	fech8_z           		D,
	ind1_z            		i,
	ind2_z            		i,
	termi_z           		i,
	esp_z             		i,
	exten_z           		i,
	tam0             		s0,;

mtam0&; tr; Ff5; FO.impri.ini~,r~; FGNodatos; z0,nemp_z,#; Fknemp_z,l;
>sinemp_z,#,impre_z; FC;
Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; GABRE_TABLA; (arch_z)=($infacupo.tex,12);

&a; &cfeche_z; qD,2,fecsig_z,feche_z,; GPRIMERO_DE_MES_ANTER; 
qD,1,fecsig_z,fechd_z,;

[fei; t@5,3; \Fecha Inicial:\; t0Fin; (fecha_z)=(fechd_z); ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
(fecsig_z)=(fecini_z,#); GULTIMO_DE_MES; qD,1,fecsig_z,feche_z,;
GPRIMERO_DE_MES_ANTER; (fecinima_z)=(fecsig_z,#);
GULTIMO_DE_MES; (fecultma_z)=(fecsig_z,#); (ultda_z)=($ZZ,2);

GST; \ Fecinima:\; pfecinimaaa_z,MIS2; \-\; pfecinimamm_z,MIS2; \-\; pfecinimadd_z,MIS2;
\ Fecultma:\; pfecultmaaa_z,MIS2; \-\; pfecultmamm_z,MIS2; \-\; pfecultmadd_z,MIS2;

[feu; t@5,40; \Fecha Final:\; t0Fin; (fechb_z)=(feche_z); ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
[tdi; t@6,3; \De Poliza:\; t0feu; iprtda_z,2;
[ult; t@6,40; \A Poliza:\; t0tdi; iultda_z,2;
[acu; t@7,3; \Acumulo de Nuevo ? <S/N>:\; t0ult; iacum_z,1;
!(acum_z)5($S,1)(acum_z)5($N,1)&>acu;
GST; \Estan correctos los datos ? <S/N> : \; y|; | gult; .
(periodo_z)=(fecultaa_z)(100)*(fecultmm_z)+; (cia_z)=(1);

tS1,7,0,12,80; tv0; tc;
!(acum_z)0($N,1)>reporte;
GACUMULALO;
greporte;

f2; k2; P$;
f1; k2; P;
{ n+;
  Ff1; \Tienda:\; pcodigo_tda,0; s1; pnombre_tda,0; l;
  (tda_z)=(codigo_tda,#); (zoncar_z)=(zoncar_tda,#);
  GACUMULALO;
  f1; a;
)
f9; k2; P$;
f2; k3; P;
{ n+;
  Ff1; \Leyendo:\; pzoncar_ifap,0; s1; l;
  >sdtasaiva_ifap,#,piva_z,; (cod_z)=(cod_ifap,#);
  (implarpl_z)=(doclpl_ifap);
  (impcorpl_z)=(doccpl_ifap);
  (clisdos_z)=(saldados_ifap);
  (sdoprli_z)=(sdosprlis_ifap);
  (anu_z)=(anter_ifap);
  f9; k5; P;
  n|; f9; k4; P$; .
  f9; k3; P$;
  f2; a;
)

[reporte;
GACUMULADO;
GINDBONYREC;
GANLSISEDOPAG;
GANLSISCORLARPL;
GCOMPARMESAN;
Ff4; FC; Ff1; tf; tr; tS0; GSalir;
gFin;
GANACLICAR;
GANACARVTCAN;
GBALCLIEN;

[ACUMULADO;
(enc_z)=(1); f2; k3; P;
{ n+;
  Ff1; \Leyendo:\; pzoncar_ifap,0; l;
  !(impor_ifap)0($0)(bonif_ifap)0($0)&(recar_ifap)0($0)&>|; f2; a; g-; .
  !(zoncar_ifap)5(antzon_z,#)>|;
    !(band_z)5($S,1)>|;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      Ff4; FO(arch_z),w~; FP66,60,Enc,Pie; (band_z)=($S,1);
    |
      GSUBTPOL1; GSUBTZON1;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      GSUBENC1;
    .
  .
  !(pol_ifap)5(antpol_z,#)>|;
    GSUBTPOL1; (antpol_z)=(pol_ifap,#); GSUBENC1A;
  .
  GIMPRI1;
  f2; a;
)
!(band_z)5($S,1)>Fin; GSUBTPOL1; GSUBTZON1; GULIN1;
R;

[SUBENC1;
Ff4; GFONT15; Fc40,\ACUMULADOS DE POLIZAS CON ANALITICOS~; GFONT16; l;
\Zona:\; GFONT15; pantzon_z,0; s1; f3; k1; P; n|; GNOZON; .
pnombre_zon,0; GFONT16; GFONT11; l; GSUBENC1A;
R;

[SUBENC1A;
Ff4; GFONT14; \Poliza:\; GFONT15; pantpol_z,0; s1; f1; k1; P; n|; GNOPOL; .
pnombre_tda,0; GFONT16; GFONT13; l;
GFONT19; \Codigo            |Importe_Docs|Bonificacion|    Recargos|\;
\    Efectivo|Comision|Devoluciones|Efe.Real\; GFONT20; l;
R;


[IMPRI1;
(efectiv_z)=(impor_ifap)(bonif_ifap)-(recar_ifap)+;
Ff4; pcod_ifap,2; s1; ptasaiva_ifap,2; s1;
!(anter_ifap)2($2002)>|; 
  \2001 y Ant. \;
|
  !(anter_ifap)2($2005)>|; 
    \2002 - 2004 \;
  |
    \2005 y Post \;
  .
.
\|\; pimpor_ifap,MDS12; \|\; pbonif_ifap,MDS12;
\|\; precar_ifap,MDS12; \|\; pefectiv_z,MDS12; 
\|\; c_8; \|\; c_12; \|\; c_7;
l;
(imporpol_z)=(imporpol_z)(impor_ifap)+;
(bonifpol_z)=(bonifpol_z)(bonif_ifap)+;
(recarpol_z)=(recarpol_z)(recar_ifap)+;
!(tasaiva_ifap)0($15,2)>|;
  (imporpol15_z)=(imporpol15_z)(impor_ifap)+;
  (bonifpol15_z)=(bonifpol15_z)(bonif_ifap)+;
  (recarpol15_z)=(recarpol15_z)(recar_ifap)+;
|
  !(tasaiva_ifap)0($20)>|;
    (imporpol20_z)=(imporpol20_z)(impor_ifap)+;
    (bonifpol20_z)=(bonifpol20_z)(bonif_ifap)+;
    (recarpol20_z)=(recarpol20_z)(recar_ifap)+;
  |
    (imporpol10_z)=(imporpol10_z)(impor_ifap)+;
    (bonifpol10_z)=(bonifpol10_z)(bonif_ifap)+;
    (recarpol10_z)=(recarpol10_z)(recar_ifap)+;
  .
.
R;

[SUBTPOL1;
(efectiv_z)=(imporpol_z)(bonifpol_z)-(recarpol_z)+;
Ff4; \Totales de Esta Poliza:\; l;
GFONT19; s12; \      |\; pimporpol_z,MDS12; \|\; pbonifpol_z,MDS12;
\|\; precarpol_z,MDS12; \|\; pefectiv_z,MDS12; \|\; c_8; \|\; c_12; \|\; c_8;
GFONT20; l;
(imporzon_z)=(imporzon_z)(imporpol_z)+;
(bonifzon_z)=(bonifzon_z)(bonifpol_z)+;
(recarzon_z)=(recarzon_z)(recarpol_z)+;
f14; k1; P;
{ n+;
  Ff4; GFONT19; ptasaiva_ind14,2; \%   \;
  !(anter_ind14)2($2002)>|;
    \2001 y Ant. \;
  |
    !(anter_ind14)2($2005)>|; 
      \2002 - 2004 \;
    |
      \2005 y Post \;
    .
  .
  \|\; pimport_ind14,MDS12; \|\; pbonif_ind14,MDS12; \|\;
  precar_ind14,MDS12; \|\; pneto_ind14,MDS12; GFONT20; l;
  f14; a;
)
l;
z0,imporpol_z,#; z0,bonifpol_z,#; z0,recarpol_z,#;
R;

[SUBTZON1;
(efectiv_z)=(imporzon_z)(bonifzon_z)-(recarzon_z)+;
Ff4; \Totales de Esta Zona:\; l;
GFONT19; s12; \      |\; pimporzon_z,MDS12; \|\; pbonifzon_z,MDS12; \|\;
precarzon_z,MDS12; \|\; pefectiv_z,MDS12; \|\; c_8; \|\; c_12; \|\; c_8;
GFONT20; l;
f14; k2; P;
{ n+;
  Ff4; GFONT19; ptasaiva_ind14,2; \%   \;
  !(anter_ind14)2($2002)>|;
    \2001 y Ant. \;
  |
    !(anter_ind14)2($2005)>|; 
      \2002 - 2004 \;
    |
      \2005 y Post \;
    .
  .

  \|\; pimport_ind14,MDS12; \|\; pbonif_ind14,MDS12; \|\;
  precar_ind14,MDS12; \|\; pneto_ind14,MDS12; GFONT20; l;
  f14; a;
)
l;

(importot_z)=(importot_z)(imporzon_z)+;
(boniftot_z)=(boniftot_z)(bonifzon_z)+;
(recartot_z)=(recartot_z)(recarzon_z)+;
z0,imporzon_z,#; z0,bonifzon_z,#; z0,recarzon_z,#;
z0,imporzon10_z,#; z0,bonifzon10_z,#; z0,recarzon10_z,#;
z0,imporzon15_z,#; z0,bonifzon15_z,#; z0,recarzon15_z,#;
R;

[ULIN1;
(efectiv_z)=(importot_z)(boniftot_z)-(recartot_z)+;
Ff4; \Totales Generales\; l;
GFONT19; s12; \      |\; pimportot_z,MDS12; \|\; pboniftot_z,MDS12;
\|\; precartot_z,MDS12; \|\; pefectiv_z,MDS12; \|\; c_8; \|\; c_12; \|\; c_8;
l;
f14; k3; P;
{ n+;
  Ff4; GFONT19; ptasaiva_ind14,2; \%   \;
  !(anter_ind14)2($2002)>|;
    \2001 y Ant. \;
  |
    !(anter_ind14)2($2005)>|; 
      \2002 - 2004 \;
    |
      \2005 y Post \;
    .
  .
  \|\; pimport_ind14,MDS12; \|\; precar_ind14,MDS12; \|\;
  pbonif_ind14,MDS12; \|\; pneto_ind14,MDS12; GFONT20; l;
  f14; a;
)
l;

GFONT11; GFONT13; GFONT15; \ACUMULADOS DE POLIZAS POR ZONA\; GFONT16; l;
\----- Zona ------------|  D/COBRADOS|BONIFICACION|    RECARGOS|    EFECTIVO|  COMISIONES|DEVOLUCIONES|EFECTVO REAL\; l;
f7; k1; P;
{ n+;
  (zoncar_z)=(zona_ind1,#); f8; k1; P; n|; z0,impor_ind2,l; .
  (antzon_z)=(zoncar_z,#); f3; k1; P; n|; GNOZON; .
  (efectiv_z)=(impor_ind2)(bonif_ind2)-(recar_ind2)+;
  pzoncar_z,2; s1; pnombre_zon,20; \|\; pimpor_ind2,MDS12; \|\;
  pbonif_ind2,MDS12; \|\; precar_ind2,MDS12; \|\; pefectiv_z,MDS12; \|\;
  c_12; \|\; c_12; \|\; c_12; \|\; l;
  f7; a;
)
(efectiv_z)=(importot_z)(boniftot_z)-(recartot_z)+;
\Total General          |\; pimportot_z,MDS12; \|\; pboniftot_z,MDS12; \|\;
precartot_z,MDS12; \|\; pefectiv_z,MDS12; \|\; c_12; \|\; c_12; \|\; c_12;
\|\; l;
z0,importot_z,#; z0,boniftot_z,#; z0,recartot_z,#;
z0,importot10_z,#; z0,boniftot10_z,#; z0,recartot10_z,#;
z0,importot15_z,#; z0,boniftot15_z,#; z0,recartot15_z,#;
R;


* ------ Indice de Bonificaciones y Recargos -------------- *
[INDBONYREC;
z32,band_z,#;
(enc_z)=(2); f2; k3; P;
{ n+;
  Ff1; \Leyendo:\; pzoncar_ifap,0; s1; ppol_ifap,0; s1; pcod_ifap,0; l;
  !(impor_ifap)0($0)(bonif_ifap)0($0)&(recar_ifap)0($0)&>|; f2; a; g-; .
  !(zoncar_ifap)5(antzon_z,#)>|;
    !(band_z)5($S,1)>|;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      Ff4; GFONT30; (band_z)=($S,1);
    |
      GSUBTPOL2; GSUBTZON2;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      GSUBENC2;
    .
  .
  !(pol_ifap)5(antpol_z,#)>|;
    GSUBTPOL2; (antpol_z)=(pol_ifap,#); GSUBENC2A;
  .
  GIMPRI2;
  f2; a;
)
GSUBTPOL2; GSUBTZON2; GULIN2;
R;

[SUBENC2;
Ff4; GFONT15; Fc40,\INDICE DE BONIFICACIONES Y RECARGOS~; GFONT16; l;
\Zona:\; GFONT15; pantzon_z,0; s1; f3; k1; P; n|; GNOZON; .
pnombre_zon,0; GFONT16; l; GSUBENC2A;
R;

[SUBENC2A;
Ff4; \Poliza:\; GFONT15; pantpol_z,0; s1; f1; k1; P; n|; GNOPOL; .
pnombre_tda,0; GFONT16; GFONT12; l;
\CD|         |Bonif/Doctos|  %  |Recar/Doctos|  %  |Doctos.Netos| Actas.Netos|Saldo.Enganc\; l;
R;

[IMPRI2;
z0,porc1_z,#; z0,porc2_z,#; (cod_z)=(cod_ifap,#);
(docnet_z)=(impor_ifap)(docbon_ifap)-(docrec_ifap)-(actnet_ifap)-(sdoeng_ifap)-;
(efectiv_z)=(impor_ifap)(bonif_ifap)-(recar_ifap)+;
!(docbon_ifap)5($0)>|; (porc1_z)=(bonif_ifap)(docbon_ifap)/(100)*; .
!(docrec_ifap)5($0)>|; (porc2_z)=(recar_ifap)(docrec_ifap)/(100)*; .
f1; k3; P; n|; GNOPOL; .
Ff4;
pcod_ifap,0; s1; pnombre_tda,9; s1; GFONT19; pbonif_ifap,MDS12; GFONT20; pporc1_z,MFS6;
s1; GFONT19; precar_ifap,MDS12; GFONT20; pporc2_z,MFS6; GFONT20; s1; pdocnet_z,MDS12; s1;
pactnet_ifap,MDS12; s1; psdoeng_ifap,MDS12; l;
!(anter_ifap)2($2002)>|;
  \2001 y Ant.  \;
|
  !(anter_ifap)2($2005)>|; 
    \2002 - 2004  \;
  |
    \2005 y Post  \;
  .
.

pdocbon_ifap,MDS12; s7; pdocrec_ifap,MDS12; s7; pefectiv_z,MDS12; \ Efectivo\; l; l;
(imporpol_z)=(imporpol_z)(impor_ifap)+;
(bonifpol_z)=(bonifpol_z)(bonif_ifap)+;
(recarpol_z)=(recarpol_z)(recar_ifap)+;
(docbonpol_z)=(docbonpol_z)(docbon_ifap)+;
(docrecpol_z)=(docrecpol_z)(docrec_ifap)+;
(actnetpol_z)=(actnetpol_z)(actnet_ifap)+;
(sdoengpol_z)=(sdoengpol_z)(sdoeng_ifap)+;
R;

[SUBTPOL2;
z0,porc1_z,#; z0,porc2_z,#;
(docnet_z)=(imporpol_z)(docbonpol_z)-(docrecpol_z)-(actnetpol_z)-(sdoengpol_z)-;
(efectiv_z)=(imporpol_z)(bonifpol_z)-(recarpol_z)+;
!(docbonpol_z)5($0)>|; (porc1_z)=(bonifpol_z)(docbonpol_z)/(100)*; .
!(docrecpol_z)5($0)>|; (porc2_z)=(recarpol_z)(docrecpol_z)/(100)*; .
Ff4;
\Total Poliza \; GFONT19; pbonifpol_z,MDS12; GFONT20; pporc1_z,MFS6; 
s1; GFONT19; precarpol_z,MDS12; GFONT20; pporc2_z,MFS6; GFONT20; s1; pdocnet_z,MDS12; s1;
pactnetpol_z,MDS12; s1; psdoengpol_z,MDS12; l;
s13; pdocbonpol_z,MDS12; s7; pdocrecpol_z,MDS12; s7; pefectiv_z,MDS12; \ Efectivo\; l; l;
(imporzon_z)=(imporzon_z)(imporpol_z)+;
(bonifzon_z)=(bonifzon_z)(bonifpol_z)+;
(recarzon_z)=(recarzon_z)(recarpol_z)+;
(docbonzon_z)=(docbonzon_z)(docbonpol_z)+;
(docreczon_z)=(docreczon_z)(docrecpol_z)+;
(actnetzon_z)=(actnetzon_z)(actnetpol_z)+;
(sdoengzon_z)=(sdoengzon_z)(sdoengpol_z)+;
z0,bonifpol_z,#; z0,recarpol_z,#; z0,docbonpol_z,#;
z0,actnetpol_z,#; z0,docrecpol_z,#; z0,sdoengpol_z,#; z0,imporpol_z,#;
R;

[SUBTZON2;
z0,porc1_z,#; z0,porc2_z,#;
(docnet_z)=(imporzon_z)(docbonzon_z)-(docreczon_z)-(actnetzon_z)-(sdoengzon_z)-;
(efectiv_z)=(imporzon_z)(bonifzon_z)-(recarzon_z)+;
!(docbonzon_z)5($0)>|; (porc1_z)=(bonifzon_z)(docbonzon_z)/(100)*; .
!(docreczon_z)5($0)>|; (porc2_z)=(recarzon_z)(docreczon_z)/(100)*; .
Ff4;
\Total Zona   \; GFONT19; pbonifzon_z,MDS12; GFONT20; pporc1_z,MFS6; 
s1; GFONT19; precarzon_z,MDS12; GFONT20; pporc2_z,MFS6; GFONT20; s1; pdocnet_z,MDS12; s1;
pactnetzon_z,MDS12; s1; psdoengzon_z,MDS12; l;
s13; pdocbonzon_z,MDS12; s7; pdocreczon_z,MDS12; s7; pefectiv_z,MDS12; \ Efectivo\; l; l;
(importot_z)=(importot_z)(imporzon_z)+;
(boniftot_z)=(boniftot_z)(bonifzon_z)+;
(recartot_z)=(recartot_z)(recarzon_z)+;
(docbontot_z)=(docbontot_z)(docbonzon_z)+;
(docrectot_z)=(docrectot_z)(docreczon_z)+;
(actnettot_z)=(actnettot_z)(actnetzon_z)+;
(sdoengtot_z)=(sdoengtot_z)(sdoengzon_z)+;
z0,bonifzon_z,#; z0,recarzon_z,#; z0,docbonzon_z,#; z0,imporzon_z,#;
z0,actnetzon_z,#; z0,docreczon_z,#; z0,sdoengzon_z,#;
R;

[ULIN2;
z0,porc1_z,#; z0,porc2_z,#;
(docnet_z)=(importot_z)(docbontot_z)-(docrectot_z)-(actnettot_z)-(sdoengtot_z)-;
(efectiv_z)=(importot_z)(boniftot_z)-(recartot_z)+;
!(docbontot_z)5($0)>|; (porc1_z)=(boniftot_z)(docbontot_z)/(100)*; .
!(docrectot_z)5($0)>|; (porc2_z)=(recartot_z)(docrectot_z)/(100)*; .
Ff4;
\Total Gral   \; GFONT19; pboniftot_z,MDS12; GFONT20; pporc1_z,MFS6; 
s1; GFONT19; precartot_z,MDS12; GFONT20; pporc2_z,MFS6; GFONT20; s1; pdocnet_z,MDS12; s1;
pactnettot_z,MDS12; s1; psdoengtot_z,MDS12; l;
s13; pdocbontot_z,MDS12; s7; pdocrectot_z,MDS12; s7; pefectiv_z,MDS12; \ Efectivo\; l; l;
z0,boniftot_z,#; z0,recartot_z,#; z0,docbontot_z,#; z0,importot_z,#;
z0,actnettot_z,#; z0,docrectot_z,#; z0,sdoengtot_z,#;
R;

[ANLSISEDOPAG;
* --> Analisis de Estado de Pago  <--  *
z32,band_z,#;
(enc_z)=(3); f2; k3; P;
{ n+;
  Ff1; \Leyendo:\; pzoncar_ifap,0; s1; ppol_ifap,0; s1; pcod_ifap,0; l;
  !(impor_ifap)0($0)(bonif_ifap)0($0)&(recar_ifap)0($0)&>|; f2; a; g-; .
  !(zoncar_ifap)5(antzon_z,#)>|;
    !(band_z)5($S,1)>|;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      Ff4; GFONT30; (band_z)=($S,1);
    |
      GSUBTPOL3; GSUBTZON3;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      GSUBENC3;
    .
  .
  !(pol_ifap)5(antpol_z,#)>|;
    GSUBTPOL3; (antpol_z)=(pol_ifap,#); GSUBENC3A;
  .
  GIMPRI3;
  f2; a;
)
GSUBTPOL3; GSUBTZON3; GULIN3;
R;

[SUBENC3;
Ff4; GFONT15; Fc40,\ANALISIS DE ESTADO DE PAGO~; GFONT16; l;
\Zona:\; GFONT15; pantzon_z,0; s1; f3; k1; P; n|; GNOZON; .
pnombre_zon,0; GFONT16; l; GSUBENC3A;
R;

[SUBENC3A;
Ff4; \Poliza:\; GFONT15; pantpol_z,0; s1; f1; k1; P; n|; GNOPOL; .
pnombre_tda,0; GFONT16; GFONT12; l;
\CD|                         |Doc.Bon/ <12|  %  |Doc.Rec/ >12|  %  \; l;
R;

[IMPRI3;
(efectiv_z)=(docbmedoce_ifap)(docrmadoce_ifap)+;
(cod_z)=(cod_ifap,#); f1; k3; P; n|; GNOPOL; .
z0,porc1_z,#; z0,porc2_z,#;
!(docbmedoce_ifap)5($0)>|; (porc1_z)=(docbon_ifap)(docbmedoce_ifap)/(100)*; .
!(docrmadoce_ifap)5($0)>|; (porc2_z)=(docrec_ifap)(docrmadoce_ifap)/(100)*; .
Ff4;
pcod_ifap,2; s1; pnombre_tda,9; s1; ptasaiva_ifap,2; \% \;
!(anter_ifap)2($2002)>|;
  \2001 y Ant. \;
|
  !(anter_ifap)2($2005)>|; 
    \2002 - 2004 \;
  |
    \2005 y Post \;
  .
.

GFONT19; pdocbon_ifap,MDS12; GFONT20;
pporc1_z,MFS6; s1; GFONT19; pdocrec_ifap,MDS12; GFONT20; pporc2_z,MFS6; l;
\Total Docts:\; pefectiv_z,MDS12; s5; pdocbmedoce_ifap,MDS12; s7;
pdocrmadoce_ifap,MDS12; l; l;
(docbonpol_z)=(docbonpol_z)(docbon_ifap)+;
(docrecpol_z)=(docrecpol_z)(docrec_ifap)+;
(docbmedocepol_z)=(docbmedocepol_z)(docbmedoce_ifap)+;
(docrmadocepol_z)=(docrmadocepol_z)(docrmadoce_ifap)+;
R;

[SUBTPOL3;
(efectiv_z)=(docbmedocepol_z)(docrmadocepol_z)+;
z0,porc1_z,#; z0,porc2_z,#;
!(docbmedocepol_z)5($0)>|; (porc1_z)=(docbonpol_z)(docbmedocepol_z)/(100)*; .
!(docrmadocepol_z)5($0)>|; (porc2_z)=(docrecpol_z)(docrmadocepol_z)/(100)*; .
Ff4; GFONT17;
s6; \Total de Poliza\; s8; GFONT19; pdocbonpol_z,MDS12; GFONT20;
pporc1_z,MFS6; s1; GFONT19; pdocrecpol_z,MDS12; GFONT20; pporc2_z,MFS6; l;
\Total Docts:\; pefectiv_z,MDS12; s5; pdocbmedocepol_z,MDS12; s7;
pdocrmadocepol_z,MDS12; l;
z0,porc1_z,#; z0,porc2_z,#;
!(efectiv_z)5($0)>|;
  (porc1_z)=(docbmedocepol_z)(efectiv_z)/(100)*;
  (porc2_z)=(docrmadocepol_z)(efectiv_z)/(100)*;
.
s20; pporc1_z,MFS6; s26; pporc2_z,MFS6; GFONT18; l;
l;
(docbonzon_z)=(docbonzon_z)(docbonpol_z)+;
(docreczon_z)=(docreczon_z)(docrecpol_z)+;
(docbmedocezon_z)=(docbmedocezon_z)(docbmedocepol_z)+;
(docrmadocezon_z)=(docrmadocezon_z)(docrmadocepol_z)+;
z0,docbonpol_z,#; z0,docrecpol_z,#; z0,docbmedocepol_z,#; z0,docrmadocepol_z,#;
R;

[SUBTZON3;
(efectiv_z)=(docbmedocezon_z)(docrmadocezon_z)+;
z0,porc1_z,#; z0,porc2_z,#;
!(docbmedocezon_z)5($0)>|; (porc1_z)=(docbonzon_z)(docbmedocezon_z)/(100)*; .
!(docrmadocezon_z)5($0)>|; (porc2_z)=(docreczon_z)(docrmadocezon_z)/(100)*; .
Ff4; GFONT17;
s6; \Total de zona: \; s8; GFONT19; pdocbonzon_z,MDS12; GFONT20;
pporc1_z,MFS6; s1; GFONT19; pdocreczon_z,MDS12; GFONT20; pporc2_z,MFS6; l;
\Total Docts:\; pefectiv_z,MDS12; s5; pdocbmedocezon_z,MDS12; s7;
pdocrmadocezon_z,MDS12; l;
z0,porc1_z,#; z0,porc2_z,#;
!(efectiv_z)5($0)>|;
  (porc1_z)=(docbmedocezon_z)(efectiv_z)/(100)*;
  (porc2_z)=(docrmadocezon_z)(efectiv_z)/(100)*;
.
s20; pporc1_z,MFS6; s26; pporc2_z,MFS6; GFONT18; l; l;
(docbontot_z)=(docbontot_z)(docbonzon_z)+;
(docrectot_z)=(docrectot_z)(docreczon_z)+;
(docbmedocetot_z)=(docbmedocetot_z)(docbmedocezon_z)+;
(docrmadocetot_z)=(docrmadocetot_z)(docrmadocezon_z)+;
z0,docbonzon_z,#; z0,docreczon_z,#; z0,docbmedocezon_z,#; z0,docrmadocezon_z,#;
R;

[ULIN3;
(efectiv_z)=(docbmedocetot_z)(docrmadocetot_z)+;
z0,porc1_z,#; z0,porc2_z,#;
!(docbmedocetot_z)5($0)>|; (porc1_z)=(docbontot_z)(docbmedocetot_z)/(100)*; .
!(docrmadocetot_z)5($0)>|; (porc2_z)=(docrectot_z)(docrmadocetot_z)/(100)*; .
Ff4; GFONT17;
s6; \Total General :\; s8; GFONT19; pdocbontot_z,MDS12; GFONT20;
pporc1_z,MFS6; s1; GFONT19; pdocrectot_z,MDS12; GFONT20; pporc2_z,MFS6; l;
\Total Docts:\; pefectiv_z,MDS12; s5; pdocbmedocetot_z,MDS12; s7;
pdocrmadocetot_z,MDS12; l;
z0,porc1_z,#; z0,porc2_z,#;
!(efectiv_z)5($0)>|;
  (porc1_z)=(docbmedocetot_z)(efectiv_z)/(100)*;
  (porc2_z)=(docrmadocetot_z)(efectiv_z)/(100)*;
.
s20; pporc1_z,MFS6; s26; pporc2_z,MFS6; GFONT18; l; l;
z0,docbontot_z,#; z0,docrectot_z,#; z0,docbmedocetot_z,#; z0,docrmadocetot_z,#;
R;

[ANLSISCORLARPL;
*  --> Analisis corto-largo plazo  <--  *
z32,band_z,#;
(enc_z)=(4); f2; k3; P;
{ n+;
  Ff1; \Leyendo:\; pzoncar_ifap,0; s1; ppol_ifap,0; s1; pcod_ifap,0; l;
  !(impor_ifap)0($0)(bonif_ifap)0($0)&(recar_ifap)0($0)&>|; f2; a; g-; .
  !(zoncar_ifap)5(antzon_z,#)>|;
    !(band_z)5($S,1)>|;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      Ff4; GFONT30; (band_z)=($S,1);
    |
      GSUBTPOL4; GSUBTZON4;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      GSUBENC4;
    .
  .
  !(pol_ifap)5(antpol_z,#)>|;
    GSUBTPOL4; (antpol_z)=(pol_ifap,#); GSUBENC4A;
  .
  GIMPRI4;
  f2; a;
)
GSUBTPOL4; GSUBTZON4; GULIN4;
R;

[SUBENC4;
Ff4; GFONT15; Fc40,\ANALISIS DE CORTO-LARGO PLAZO~; GFONT16; l;
\Zona:\; GFONT15; pantzon_z,0; s1; f3; k1; P; n|; GNOZON; .
pnombre_zon,0; GFONT16; l; GSUBENC4A;
R;

[SUBENC4A;
Ff4; \Poliza:\; GFONT15; pantpol_z,0; s1; f1; k1; P; n|; GNOPOL; .
pnombre_tda,0; GFONT16; GFONT12; l;
\CD|                         |Corto Plazo |Largo Plazo |   T o t a l\; l;
R;

[IMPRI4;
(cod_z)=(cod_ifap,#); f1; k3; P; n|; GNOPOL; .
Ff4; pcod_ifap,2; s1; pnombre_tda,9; s1; ptasaiva_ifap,2; \%\;
!(anter_ifap)2($2002)>|;
    \2001 y Ant. \;
  |
    !(anter_ifap)2($2005)>|; 
      \2002 - 2004 \;
    |
      \2005 y Post \;
    .
  .

\|\; pdoccpl_ifap,MDS12; \|\;
pdoclpl_ifap,MDS12; \|\; pimpor_ifap,MDS12; l;
(doccplpol_z)=(doccplpol_z)(doccpl_ifap)+;
(doclplpol_z)=(doclplpol_z)(doclpl_ifap)+;
(imporpol_z)=(imporpol_z)(impor_ifap)+;
R;

[SUBTPOL4;
Ff4;
s6; \Total de Poliza\; s8; pdoccplpol_z,MDS12; \|\;
pdoclplpol_z,MDS12; \|\; pimporpol_z,MDS12; l; l;
(doccplzon_z)=(doccplzon_z)(doccplpol_z)+;
(doclplzon_z)=(doclplzon_z)(doclplpol_z)+;
(imporzon_z)=(imporzon_z)(imporpol_z)+;
z0,doccplpol_z,#; z0,doclplpol_z,#; z0,imporpol_z,#;
R;

[SUBTZON4;
Ff4;
f12; k1; P;
{ n+;
  s6; ptasaiva_ind12,2; \% Ventas \;
  !(anter_ind12)2($2002)>|;
    \2001 y Ant. \;
  |
    !(anter_ind12)2($2005)>|; 
      \2002 - 2004 \;
    |
      \2005 y Post \;
    .
  .

  pcortopl_ind12,MDS12; \|\; plargopl_ind12,MDS12; \|\; ptotal_ind12,MDS12; l;
  f12; a;
)
s6; \Total de Zona :\; s8; pdoccplzon_z,MDS12; \|\; pdoclplzon_z,MDS12;
\|\; pimporzon_z,MDS12; l; l;
(doccpltot_z)=(doccpltot_z)(doccplzon_z)+;
(doclpltot_z)=(doclpltot_z)(doclplzon_z)+;
(importot_z)=(importot_z)(imporzon_z)+;
z0,doccplzon_z,#; z0,doclplzon_z,#; z0,imporzon_z,#;
R;

[ULIN4;
Ff4;
s6; \Zona| Iva |Fecha Vta.  | Corto Plazo| Largo PLazo|       Total\; l;
f12; k2; P;
{ n+;
  s6; pzoncar_ind12,2; \  |\; ptasaiva_ind12,5; \|\;
  !(anter_ind12)2($2002)>|;
    \2001 y Ant. \;
  |
    !(anter_ind12)2($2005)>|; 
      \2002 - 2004 \;
    |
      \2005 y Post \;
    .
  .

  \|\; pcortopl_ind12,MDS12; \|\; plargopl_ind12,MDS12; \|\; 
  ptotal_ind12,MDS12; l;
  f12; a;
)
s6; \Total General :\; s8; pdoccpltot_z,MDS12; \|\; pdoclpltot_z,MDS12;
\|\; pimportot_z,MDS12; l; l;
z0,doccpltot_z,#; z0,doclpltot_z,#; z0,importot_z,#;
R;

[ANACLICAR;
* ---> Analisis de clientes de cartera <---   *
z32,band_z,#;
(enc_z)=(6); f2; k3; P;
{ n+;
  Ff1; \Leyendo:\; pzoncar_ifap,0; s1; ppol_ifap,0; s1; pcod_ifap,0; l;
  !(zoncar_ifap)5(antzon_z,#)>|;
    !(band_z)5($S,1)>|;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      Ff4; GFONT30; (band_z)=($S,1);
    |
      GSUBTPOL6; GSUBTZON6;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      GSUBENC6;
    .
  .
  !(pol_ifap)5(antpol_z,#)>|;
    GSUBTPOL6; (antpol_z)=(pol_ifap,#); GSUBENC6A;
  .
  GIMPRI6;
  f2; a;
)
GSUBTPOL6; GSUBTZON6; GULIN6;
R;

[SUBENC6;
Ff4; GFONT15; Fc40,\ANALISIS DE CLIENTES CARTERA~; GFONT16; l;
\Zona:\; GFONT15; pantzon_z,0; s1; f3; k1; P; n|; GNOZON; .
pnombre_zon,0; GFONT16; l; GSUBENC6A;
R;

[SUBENC6A;
Ff4; \Poliza:\; GFONT15; pantpol_z,0; s1; f1; k1; P; n|; GNOPOL; .
pnombre_tda,0; GFONT16; GFONT11; l;
\Codigo de Cliente      |Vigentes|Saldados|Precio.Lista\; l;
R;

[IMPRI6;
(tda_z)=(pol_ifap,#); (cod_z)=(cod_ifap,#);
f1; k3; P; n|; GNOPOL; . z0,fecha_edc,l; f10; k1; P;
n|; | >sdtasaiva_ifap,#,piva_z; f9; k1; P; n|;. .
Ff4; pcod_ifap,0; s1; pnombre_tda,20; \|   \; pclivig_edc,MIS5;
\|   \; psaldados_ifap,MIS5; \|\; psdosprlis_ifap,MDS12; l;
(vigpol_z)=(vigpol_z)(clivig_edc)+;
(clspol_z)=(clspol_z)(saldados_ifap)+;
(prlpol_z)=(prlpol_z)(sdosprlis_ifap)+;
R;

[SUBTPOL6;
Ff4;
s6; \Total de Poliza\; s6; pvigpol_z,MIS5; \|   \; pclspol_z,MIS5; \|\;
pprlpol_z,MDS12; l; l;
(vigzon_z)=(vigzon_z)(vigpol_z)+; z0,vigpol_z,#;
(clszon_z)=(clszon_z)(clspol_z)+; z0,clspol_z,#;
(prlzon_z)=(prlzon_z)(prlpol_z)+; z0,prlpol_z,#;
R;

[SUBTZON6;
Ff4;
s6; \Total de Zona: \; s6; pvigzon_z,MIS5; \|   \; pclszon_z,MIS5; \|\;
pprlzon_z,MDS12; l;
(vigtot_z)=(vigtot_z)(vigzon_z)+; z0,vigzon_z,#;
(clstot_z)=(clstot_z)(clszon_z)+; z0,clszon_z,#;
(prltot_z)=(prltot_z)(prlzon_z)+; z0,prlzon_z,#;
R;

[ULIN6;
Ff4;
s6; \Total General: \; s6; pvigtot_z,MIS5; \|   \; pclstot_z,MIS5; \|\;
pprltot_z,MDS12; l;
(vigtot_z)=(vigtot_z)(vigzon_z)+; z0,vigzon_z,#;
(clstot_z)=(clstot_z)(clszon_z)+; z0,clszon_z,#;
(prltot_z)=(prltot_z)(prlzon_z)+; z0,prlzon_z,#;
R;

[ANACARVTCAN;
* ---> Analisis de clientes de cartera ventas - cancelaciones <---   *
z32,band_z,#;
(enc_z)=(7); f10; k2; P;
{ n+;
  Ff1; \Leyendo:\; pzona_cca,0; s1; pcodcar_cca,0; s1; pcodcli_cca,0; l;
  !(zona_cca)5(antzon_z,#)>|;
    !(band_z)5($S,1)>|;
      (antzon_z)=(zona_cca,#); (antpol_z)=(codcar_cca,#);
      Ff4; GFONT30; (band_z)=($S,1);
    |
      GSUBTPOL7; GSUBTZON7;
      (antzon_z)=(zona_cca,#); (antpol_z)=(codcar_cca,#);
      GSUBENC7;
    .
  .
  !(codcar_cca)5(antpol_z,#)>|;
    GSUBTPOL7; (antpol_z)=(codcar_cca,#); GSUBENC7A;
  .
  GIMPRI7;
  f10; a;
)
GSUBTPOL7; GSUBTZON7; GULIN7;
R;

[SUBENC7;
Ff4; GFONT15; Fc40,\ANALISIS DE CLIENTES CARTERA~; GFONT16; l;
\Zona:\; GFONT15; pantzon_z,0; s1; f3; k1; P; n|; GNOZON; .
pnombre_zon,0; GFONT16; l; GSUBENC7A;
R;

[SUBENC7A;
Ff4; \Cartera:\; GFONT15; pantpol_z,0; s1; f1; k1; P; n|; GNOPOL; .
pnombre_tda,0; GFONT16; GFONT11; l;
\                       |Ventas a  Credito| Cancelaciones   |\; l;
\Codigo de Cliente      |Calle| Piso|Total|Calle| Piso|Total|\; l;
R;

[IMPRI7;
(cod_z)=(codcli_cca,#); (piva_z)=(piva_cca); z0,fecha_edc,l; f9; k1; P; nR;
(clicrd_z)=(clicrdca_edc)(clicrdpi_edc)+;
(clican_z)=(clicanca_edc)(clicanpi_edc)+;
f1; k3; P; n|; GNOPOL; . 
Ff4; pcod_z,0; s1; pnombre_tda,20; \|\; pclicrdca_edc,MIS5;
\|\; pclicrdpi_edc,MIS5; \|\; pclicrd_z,MIS5; \|\; pclicanca_edc,MIS5; \|\;
pclicanpi_edc,MIS5; \|\; pclican_z,MIS5; \|\; l;
(ccrdcapol_z)=(ccrdcapol_z)(clicrdca_edc)+;
(ccrdpipol_z)=(ccrdpipol_z)(clicrdpi_edc)+;
(ccancapol_z)=(ccancapol_z)(clicanca_edc)+;
(ccanpipol_z)=(ccanpipol_z)(clicanpi_edc)+;
R;

[SUBTPOL7;
(clicrd_z)=(ccrdcapol_z)(ccrdpipol_z)+;
(clican_z)=(ccancapol_z)(ccanpipol_z)+;
Ff4;
s6; \Total Cartera: \; s3; pccrdcapol_z,MIS5; \|\; pccrdpipol_z,MIS5; \|\;
pclicrd_z,MIS5; \|\; pccancapol_z,MIS5; \|\; pccanpipol_z,MIS5; \|\;
pclican_z,MIS5; \|\; l; l;
(ccrdcazon_z)=(ccrdcazon_z)(ccrdcapol_z)+; z0,ccrdcapol_z,#;
(ccrdpizon_z)=(ccrdpizon_z)(ccrdpipol_z)+; z0,ccrdpipol_z,#;
(ccancazon_z)=(ccancazon_z)(ccancapol_z)+; z0,ccancapol_z,#;
(ccanpizon_z)=(ccanpizon_z)(ccanpipol_z)+; z0,ccanpipol_z,#;
R;

[SUBTZON7;
(clicrd_z)=(ccrdcazon_z)(ccrdpizon_z)+;
(clican_z)=(ccancazon_z)(ccanpizon_z)+;
Ff4;
s6; \Total Zona   : \; s3; pccrdcazon_z,MIS5; \|\; pccrdpizon_z,MIS5; \|\;
pclicrd_z,MIS5; \|\; pccancazon_z,MIS5; \|\; pccanpizon_z,MIS5; \|\;
pclican_z,MIS5; \|\; l; l;
(ccrdcatot_z)=(ccrdcatot_z)(ccrdcazon_z)+; z0,ccrdcazon_z,#;
(ccrdpitot_z)=(ccrdpitot_z)(ccrdpizon_z)+; z0,ccrdpizon_z,#;
(ccancatot_z)=(ccancatot_z)(ccancazon_z)+; z0,ccancazon_z,#;
(ccanpitot_z)=(ccanpitot_z)(ccanpizon_z)+; z0,ccanpizon_z,#;

R;

[ULIN7;
(clicrd_z)=(ccrdcatot_z)(ccrdpitot_z)+;
(clican_z)=(ccancatot_z)(ccanpitot_z)+;
Ff4;
s6; \Total General: \; s3; pccrdcatot_z,MIS5; \|\; pccrdpitot_z,MIS5; \|\;
pclicrd_z,MIS5; \|\; pccancatot_z,MIS5; \|\; pccanpitot_z,MIS5; \|\;
pclican_z,MIS5; \|\; l; l;
z0,ccrdcatot_z,#; z0,ccrdpitot_z,#; z0,ccancatot_z,#; z0,ccanpitot_z,#;
R;


[BALCLIEN;
* ---> Analisis de clientes de cartera Balance de Clientes <---   *
z32,band_z,#;
(enc_z)=(8); f10; k2; P;
{ n+;
  Ff1; \Leyendo:\; pzona_cca,0; s1; pcodcar_cca,0; s1; pcodcli_cca,0; l;
  !(zona_cca)5(antzon_z,#)>|;
    !(band_z)5($S,1)>|;
      (antzon_z)=(zona_cca,#); (antpol_z)=(codcar_cca,#);
      Ff4; GSUBENC8; (band_z)=($S,1);
    |
      GSUBTPOL8; GSUBTZON8;
      (antzon_z)=(zona_cca,#); (antpol_z)=(codcar_cca,#);
      GSUBENC8;
    .
  .
  !(codcar_cca)5(antpol_z,#)>|;
    GSUBTPOL8; (antpol_z)=(codcar_cca,#); GSUBENC8A;
  .
  GIMPRI8;
  f10; a;
)
GSUBTPOL8; GSUBTZON8; GULIN8;
R;

[SUBENC8;
Ff4; GFONT15; Fc40,\ANALISIS DE CLIENTES CARTERA BALANCE~; GFONT16; l;
\Zona:\; GFONT15; pantzon_z,0; s1; f3; k1; P; n|; GNOZON; .
pnombre_zon,0; GFONT16; l; GSUBENC8A;
R;

[SUBENC8A;
Ff4; \Cartera:\; GFONT15; pantpol_z,0; s1; f1; k1; P; n|; GNOPOL; .
pnombre_tda,0; GFONT16; GFONT11; l;
\Codigo de Cliente      |Ventas|Cancelacions|Saldados|Disponible|\; l;
R;

[IMPRI8;
(cod_z)=(codcli_cca,#); (piva_z)=(piva_cca); z0,fecha_edc,l; f9; k1; P; nR;
(clicrd_z)=(clicrdca_edc)(clicrdpi_edc)+;
(clican_z)=(clicanca_edc)(clicanpi_edc)+;
(clidispo_z)=(clicrd_z)(clican_z)-(clisdos_edc)-;
f1; k3; P; n|; GNOPOL; . 
Ff4; pcod_z,0; s1; pnombre_tda,20; \| \; pclicrd_z,MIS5;
\|\; s7; pclican_z,MIS5; \|   \; pclisdos_edc,MIS5; \|\; s5;
pclidispo_z,MIS5; \|\; l;
(ccrdcapol_z)=(ccrdcapol_z)(clicrdca_edc)+;
(ccrdpipol_z)=(ccrdpipol_z)(clicrdpi_edc)+;
(ccancapol_z)=(ccancapol_z)(clicanca_edc)+;
(ccanpipol_z)=(ccanpipol_z)(clicanpi_edc)+;
(csaldspol_z)=(csaldspol_z)(clisdos_edc)+;
R;

[SUBTPOL8;
(clicrd_z)=(ccrdcapol_z)(ccrdpipol_z)+;
(clican_z)=(ccancapol_z)(ccanpipol_z)+;
(clidispo_z)=(clicrd_z)(clican_z)-(csaldspol_z)-;
Ff4;
s6; \Total Cartera: \; s4; pclicrd_z,MIS5; \|\; s7; pclican_z,MIS5;
\|   \; pcsaldspol_z,MIS5; \|\; s5; pclidispo_z,MIS5; \|\; l; l;
(ccrdcazon_z)=(ccrdcazon_z)(ccrdcapol_z)+; z0,ccrdcapol_z,#;
(ccrdpizon_z)=(ccrdpizon_z)(ccrdpipol_z)+; z0,ccrdpipol_z,#;
(ccancazon_z)=(ccancazon_z)(ccancapol_z)+; z0,ccancapol_z,#;
(ccanpizon_z)=(ccanpizon_z)(ccanpipol_z)+; z0,ccanpipol_z,#;
(csaldszon_z)=(csaldszon_z)(csaldspol_z)+; z0,csaldspol_z,#;
R;

[SUBTZON8;
(clicrd_z)=(ccrdcazon_z)(ccrdpizon_z)+;
(clican_z)=(ccancazon_z)(ccanpizon_z)+;
(clidispo_z)=(clicrd_z)(clican_z)-(csaldszon_z)-;
Ff4;
s6; \Total Zona   : \; s4; pclicrd_z,MIS5; \|\; s7; pclican_z,MIS5;
\|   \; pcsaldszon_z,MIS5; \|\; s5; pclidispo_z,MIS5; \|\; l; l;
(ccrdcatot_z)=(ccrdcatot_z)(ccrdcazon_z)+; z0,ccrdcazon_z,#;
(ccrdpitot_z)=(ccrdpitot_z)(ccrdpizon_z)+; z0,ccrdpizon_z,#;
(ccancatot_z)=(ccancatot_z)(ccancazon_z)+; z0,ccancazon_z,#;
(ccanpitot_z)=(ccanpitot_z)(ccanpizon_z)+; z0,ccanpizon_z,#;
(csaldstot_z)=(csaldstot_z)(csaldszon_z)+; z0,csaldszon_z,#;
R;

[ULIN8;
(clicrd_z)=(ccrdcatot_z)(ccrdpitot_z)+;
(clican_z)=(ccancatot_z)(ccanpitot_z)+;
(clidispo_z)=(clicrd_z)(clican_z)-(csaldstot_z)-;
Ff4;
s6; \Total General: \; s4; pclicrd_z,MIS5; \|\; s7; pclican_z,MIS5;
\|   \; pcsaldstot_z,MIS5; \|\; s5; pclidispo_z,MIS5; \|\; l; l;
z0,ccrdcatot_z,#; z0,ccrdpitot_z,#; z0,ccancatot_z,#;
z0,ccanpitot_z,#; z0,csaldstot_z,#;
R;

[COMPARMESAN;
*  --> Comparativo Mes anterior <--  *
f7; k2; P;
{ n+;
  (zoncar_z)=(zona_ind1,#); (tda_z)=(pol_ind1,#); (cod_z)=(cod_ind1,#);
  (tasiva_z)=(tiv_ind1,#); (antanu_z)=(anter_ind1);
  Ff1; \Busco:\; pzona_ind1,0; s1; ppol_ind1,0; s1;
  pcod_ind1,0; s1; ptiv_ind1,0; s1; panter_ind1,MLS4; l;
  f2; k4; P;
  n|;
    Ff1; \Agrego:\; pzona_ind1,0; s1; ppol_ind1,0; s1;
    pcod_ind1,0; s1; ptiv_ind1,0; l;
    z0,zoncar_ifap,l; (zoncar_ifap)=(zona_ind1,#); (pol_ifap)=(pol_ind1,#);
    (cod_ifap)=(cod_ind1,#); (tasaiva_ifap)=(tiv_ind1,#);
    (fecini_ifap)=(fecini_z,#); (fecfin_ifap)=(fecult_z,#);
    (anter_ifap)=(anter_ind1);
    f2; QNOPDAGF2; k8; P$;
  .
  f7; a;
)

z32,band_z,#;
(enc_z)=(5); f2; k3; P;
{ n+;
  Ff1; \Leyendo:\; pzoncar_ifap,0; s1; ppol_ifap,0; s1; pcod_ifap,0; l;
  !(zoncar_ifap)5(antzon_z,#)>|;
    !(band_z)5($S,1)>|;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      Ff4; GFONT30; (band_z)=($S,1);
    |
      GSUBTPOL5; GSUBTZON5;
      (antzon_z)=(zoncar_ifap,#); (antpol_z)=(pol_ifap,#);
      GSUBENC5;
    .
  .
  !(pol_ifap)5(antpol_z,#)>|;
    GSUBTPOL5; (antpol_z)=(pol_ifap,#); GSUBENC5A;
  .
  GIMPRI5;
  f2; a;
)
GSUBTPOL5; GSUBTZON5; GULIN5;
R;

[SUBENC5;
Ff4; GFONT15; Fc40,\COMPARATIVO DE DOCUMENTOS COBRADOS~; GFONT16; l;
\Zona:\; GFONT15; pantzon_z,0; s1; f3; k1; P; n|; GNOZON; .
pnombre_zon,0; GFONT16; l; GSUBENC5A;
R;

[SUBENC5A;
Ff4; \Poliza:\; GFONT15; pantpol_z,0; s1; f1; k1; P; n|; GNOPOL; .
pnombre_tda,0; GFONT16; GFONT12; l; (mes1_z)=(fecultmm_z); (mes2_z)=(mes1_z)(1)-;
!(mes2_z)2($1)>|; (mes2_z)=(12); .
\CD|                          |\; (mes_z)=(mes2_z); GSACAMIMES; \|\;
(mes_z)=(mes1_z); GSACAMIMES; \|Diferencia  |  %\; l;
R;

[IMPRI5;
(cod_z)=(cod_ifap,#); f1; k3; P; n|; GNOPOL; .
Ff4;
(zoncar_z)=(zoncar_ifap,#); (tda_z)=(pol_ifap,#); (antanu_z)=(anter_ifap);
(tasiva_z)=(tasaiva_ifap,#);
z0,zona_ifma,l; f6; k1; P; n|;.
!(impor_ifap)0($0)(impor_ifma)0($0)&>R;
(efectiv_z)=(impor_ifap)(impor_ifma)-;
z0,porc1_z,#; 
!(impor_ifma)5($0)>|; (porc1_z)=(efectiv_z)(impor_ifma)/(100)*; .
pcod_ifap,0; s1; pnombre_tda,10; s1; ptasaiva_ifap,2; \%\;
!(anter_ifap)2($2002)>|;
    \2001 y Ant. \;
  |
    !(anter_ifap)2($2005)>|; 
      \2002 - 2004 \;
    |
      \2005 y Post \;
    .
  .

\|\; pimpor_ifma,MDS12;
\|\; pimpor_ifap,MDS12; \|\; pefectiv_z,MDS12; \|\; pporc1_z,MFS6; l;
(imporpol_z)=(imporpol_z)(impor_ifap)+;
(impmapol_z)=(impmapol_z)(impor_ifma)+;
R;

[SUBTPOL5;
(efectiv_z)=(imporpol_z)(impmapol_z)-; z0,porc1_z,#; 
!(impmapol_z)5($0)>|; (porc1_z)=(efectiv_z)(impmapol_z)/(100)*; .
Ff4;
s6; \Total de Poliza\; s9; pimpmapol_z,MDS12; \|\; pimporpol_z,MDS12;
\|\; pefectiv_z,MDS12; \|\; pporc1_z,MFS6; l; l;
(imporzon_z)=(imporzon_z)(imporpol_z)+; z0,imporpol_z,#;
(impmazon_z)=(impmazon_z)(impmapol_z)+; z0,impmapol_z,#;
R;

[SUBTZON5;
Ff4;
(efectiv_z)=(imporzon_z)(impmazon_z)-; z0,porc1_z,#; 
!(impmazon_z)5($0)>|; (porc1_z)=(efectiv_z)(impmazon_z)/(100)*; .
s6; \Total de Zona :\; s9; pimpmazon_z,MDS12; \|\; pimporzon_z,MDS12;
\|\; pefectiv_z,MDS12; \|\; pporc1_z,MFS6; l; l;
(importot_z)=(importot_z)(imporzon_z)+; z0,imporzon_z,#;
(impmatot_z)=(impmatot_z)(impmazon_z)+; z0,impmazon_z,#;
R;

[ULIN5;
Ff4;
(efectiv_z)=(importot_z)(impmatot_z)-; z0,porc1_z,#; 
!(impmatot_z)5($0)>|; (porc1_z)=(efectiv_z)(impmatot_z)/(100)*; .
s6; \Total General :\; s9; pimpmatot_z,MDS12; \|\; pimportot_z,MDS12;
\|\; pefectiv_z,MDS12; \|\; pporc1_z,MFS6; l; l;
z0,importot_z,#; z0,impmatot_z,#;
R;

[SACAMIMES;
!(mes_z)0($1)>|;  \   Enero    \; .
!(mes_z)0($2)>|;  \   Febrero  \; .
!(mes_z)0($3)>|;  \   Marzo    \; .
!(mes_z)0($4)>|;  \   Abril    \; .
!(mes_z)0($5)>|;  \   Mayo     \; .
!(mes_z)0($6)>|;  \   Junio    \; .
!(mes_z)0($7)>|;  \   Julio    \; .
!(mes_z)0($8)>|;  \   Agosto   \; .
!(mes_z)0($9)>|;  \ Septiembre \; .
!(mes_z)0($10)>|; \ Octubre    \; .
!(mes_z)0($11)>|; \ Noviembre  \; .
!(mes_z)0($12)>|; \ Diciembre  \; .
R;

[Enc;
Ff3; FT; FGNodatos; Ff4; GFONT14; GFONT11; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \infacupo \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; l;
GFONT15; Fc40,\INFORME DE DIRECCION~; GFONT16; \ Pag:\; Fp%d~; l;
GFONT15; \POLIZAS DEL \; pfecha_z,+10; \ AL \; pfechb_z,+10; GFONT16; l;
GFONT15; Fc40,\INFORME DE CARTERA~; GFONT16; l; l;
!(enc_z)0($1)>|; GSUBENC1; .
!(enc_z)0($2)>|; GSUBENC2; .
!(enc_z)0($3)>|; GSUBENC3; .
!(enc_z)0($4)>|; GSUBENC4; .
!(enc_z)0($5)>|; GSUBENC5; .
!(enc_z)0($6)>|; GSUBENC6; .
!(enc_z)0($7)>|; GSUBENC7; .
!(enc_z)0($8)>|; GSUBENC7; .
Ft;

[Pie; Fe;

[ACUMULALO; GACUMULA_CAR_INF; R:
(prime_z)=($S,1); z0,antcod_z,#; z0,antpol_z,#; (primero_z)=($S,1);
z0,antcli_z,#; f4; k1; P;
{ n+;
  (idcli_z)=(idcli_rpo);
  \Leyendo:\; pidcli_rpo,MLS6; s1; pconcep_rpo,MLS4; s1;
  pfechaYear_rpo,MIS2; \-\; pfechaMon_rpo,MIS2; \-\; pfechaDay_rpo,MIS2;
  s1; ptda_rpo,0;
  f5; k2; P; n|; >lsidcli_rpo,numcli_cli,MLS6;  .
  !(fechavtaYear_cli)2($2002)>|; 
    (anu_z)=(2001); 
  |
    !(fechavtaYear_cli)2($2005)>|;
      (anu_z)=(2002);
    |
      (anu_z)=(2005);
    .
  .
  (cod_z)=(numcli_cli,2); s1; pcod_z,0; l; @piva_cli,100;
  >dspiva_cli,nvopiva_z,MFS5;
  !(primero_z)0($S,1)>|;
    z0,primero_z,#; (antcod_z)=(cod_z,#); (antpol_z)=(tda_rpo,#);
    (antanu_z)=(anu_z); (tasiva_z)=(nvopiva_z,#);
  .
  !(cod_z)5(antcod_z,#)(tda_rpo)5(antpol_z,#)|(anu_z)5(antanu_z)|(nvopiva_z)5(tasiva_z,#)|>|;
    GGRABACUM; (antcod_z)=(cod_z,#); (antpol_z)=(tda_rpo,#);
    (antanu_z)=(anu_z);  (tasiva_z)=(nvopiva_z,#);
  .
  (ncon_z)=(concep_rpo); z0,concepto_cpm,l; f11; k1; P; n|;.
  (concp_z)=(concepto_cpm,#); (ind1_z)=(concep_z&); z0,ind2_z,#;
  z0,milet_z,#; z0,lta_z,#;
  { !(ind2_z)3($29)>+; (lta_z)=(concep_z[ind1_z],2);
    !(lta_z)3($0,1)(lta_z)4($9,1)&>|; >silta_z,#,milet_z; !(milet_z)1($0)>+; .
    (ind1_z)=(ind1_z)(1)+; (ind2_z)=(ind2_z)(1)+;
  )
  qD,1,fechavta_cli,fevta_z,; qD,1,fecha_rpo,fepol_z,;
  (meses_z)=(nulet1_cli)(nulet2_cli)+;
  !(qom_cli)0($Q,1)>|; 
    (diaspla_z)=(15.2); (meses_z)=(meses_z)(2)/; 
  |
    (diaspla_z)=(30.4);
  .
  !(milet_z)0($0)>|;
    (vence_z)=(fevta_z)(diaspla_z)(2)/(86400)*+;
  |
    (vence_z)=(fevta_z)(milet_z)(diaspla_z)*(86400)*+;
  .
  (dias_z)=(fepol_z)(vence_z)-(86400)/; s1; pmilet_z,MIS2; \:\; pvence_z,+10;
  (impor_z)=(impor_z)(impor_rpo)+;
  !(rob_rpo)0($0)>|;
    !(milet_z)0($0)>|;
      (sdoeng_z)=(sdoeng_z)(impor_rpo)+;
    |
      !(ace_rpo)0($A,1)(concepto_cpm)0($ACTA,4)|>|;
        (actnet_z)=(actnet_z)(impor_rpo)+;
      .
    .
  |  
    !(tipo_rpo)0($AB,2)>|;
      (bonif_z)=(bonif_z)(rob_rpo)+;
      (docbon_z)=(docbon_z)(impor_rpo)+;
    |
      (recar_z)=(recar_z)(rob_rpo)+;
      (docrec_z)=(docrec_z)(impor_rpo)+;
    .
  .
  !(dias_z)2($12)>|;
    (docbmedoce_z)=(docbmedoce_z)(impor_rpo)+;
  |
    (docrmadoce_z)=(docrmadoce_z)(impor_rpo)+;
  .
  !(meses_z)1($12)>|;
    (doclpl_z)=(doclpl_z)(impor_rpo)+;
  |
    (doccpl_z)=(doccpl_z)(impor_rpo)+;
  .
  !(antcli_z)5(antcod_z,#)>|; z0,antsdo_z,#; . @salcli_rpo,100;
  !(salcli_rpo)0($0)>|;
    (saldados_z)=(saldados_z)(1)+;
    (sdosprlis_z)=(sdosprlis_z)(precon_cli)+; (antsdo_z)=($S,1);
  .
  (antcli_z)=(numcli_cli,#);
  f4; a;
)
!(primero_z)5($S,1)>|; GGRABACUM; .
GACUMULA_CAR_INF;
R;

[GRABACUM;
@impor_rpo,100; @rob_rpo,100;
f2; k5; P;
n|;
  f2; QNOPDAGF2; k6; P$;
  *
  z0,fecini_ifap,l; (fecini_ifap)=(fecini_z,#); (fecfin_ifap)=(fecult_z,#);
  (zoncar_ifap)=(zoncar_z,#); (pol_ifap)=(antpol_z,#); (cod_ifap)=(antcod_z,#);
  (tasaiva_ifap)=(tasiva_z,#); f2; QNOPDAGF2; k8; P$; f2; k5; P; nNOPDAGF2;
  *
|
  f2; QNOPDAGF2; k7; P$;
.
(impor_ifap)=(impor_z);	 		z0,impor_z,#;
(sdoeng_ifap)=(sdoeng_z);	 	z0,sdoeng_z,#;
(actnet_ifap)=(actnet_z);		z0,actnet_z,#;
(bonif_ifap)=(bonif_z);			z0,bonif_z,#;
(docbon_ifap)=(docbon_z);		z0,docbon_z,#;
(recar_ifap)=(recar_z);			z0,recar_z,#;
(docrec_ifap)=(docrec_z);		z0,docrec_z,#;
(docbmedoce_ifap)=(docbmedoce_z);	z0,docbmedoce_z,#;
(docrmadoce_ifap)=(docrmadoce_z);	z0,docrmadoce_z,#;
(doclpl_ifap)=(doclpl_z);		z0,doclpl_z,#;
(doccpl_ifap)=(doccpl_z);		z0,doccpl_z,#;
(saldados_ifap)=(saldados_z);		z0,saldados_z,#;
(sdosprlis_ifap)=(sdosprlis_z);		z0,sdosprlis_z,#;
* f2; QNOPDMDF2; w; *
R;

[ACUMULA_CAR_INF;
* --> En esta area se graba el acumulado condensado (mas filas, menos columnas) <-- *
f15; k1; P$;
(ind1_z)=(1); GACUMULA_CAR_INFACUPO;
(ind1_z)=(2); GACUMULA_CAR_INFACUPO;
(ind1_z)=(3); GACUMULA_CAR_INFACUPO;
(ind1_z)=(4); GACUMULA_CAR_INFACUPO;
R;

[ACUMULA_CAR_INFACUPO;
z0,ultimo_ind17,l; f17; k1; P; n|;. (idinfacupo_z)=(ultimo_ind17);
f16; 
!(ind1_z)0($1)>|; k1; .
!(ind1_z)0($2)>|; k2; .
!(ind1_z)0($3)>|; k3; .
!(ind1_z)0($4)>|; k4; .
P;
{ n+;
  (idinfacupo_z)=(idinfacupo_z)(1)+;
  Ff1; \Leyendo:\; pidperiodo_ind16,MLS6; s1; pidcorlar_ind16,MLS6; s1;
  ppoliza_ind16,0; s1; ptdacli_ind16,MIS2; s1; precob_ind16,0; l;
  z0,idinfacupo_ifc,l; (idinfacupo_ifc)=(idinfacupo_z);
  (idperiodo_ifc)=(idperiodo_ind16); (idcorlarpzo_ifc)=(idcorlar_ind16);
  (poliza_ifc)=(poliza_ind16,#); (tdacli_ifc)=(tdacli_ind16);
  (piva_ifc)=(piva_ind16); 
  !(anuvta_ind16)2($2002)>|; 
    (anu_z)=(2001);
  |
    !(anuvta_ind16)2($2005)>|; 
      (anu_z)=(2002);
    |
      (anu_z)=(2005);
    .
  .
  (anu_ifc)=(anu_z); (tipo_ifc)=(recob_ind16,#); (ace_ifc)=(ace_ind16,#);
  (diasv_ifc)=(diasv_ind16); (rob_ifc)=(recobon_ind16); 
  (impor_ifc)=(import_ind16); (cia_ifc)=(cia_ind16);
  * <--- Aqui comienza el comentario
  \idinfacupo   :	\; pidinfacupo_ifc,MLS6; l;
  \Periodo      :	\; pidperiodo_ifc,MLS6; l;
  \Corto/Largo P:	\; pidcorlarpzo_ifc,MLS6; l;
  \Poliza       :	\; ppoliza_ifc,0; l;
  \tdacli       :	\; ptdacli_ifc,MIS2; l;
  \piva         :	\; ppiva_ifc,MFS6; l;
  \anu          :	\; panu_ifc,MIS2; l;
  \tipo         :	\; ptipo_ifc,0; l;
  \Ace          :	\; pace_ifc,0; l;
  \diasv        :	\; pdiasv_ifc,MIS2; l;
  \rob          :	\; prob_ifc,MDS12; l;
  \importe      :	\; pimpor_ifc,MDS12; l; y|;.
  ---> Aqui termina el comentario *
  f15; k2; P$;
  f16; a;
)
R;

[NOPDAGF2; t@0,0; ti; \No pude agregar registro en infacupo...\; Z1; R;
[NOPDMDF2; t@0,0; ti; \No pude modificar registro en infacupo...\; Z1; R;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

#iimpri.i;
#isacaf.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #itiendas.i;
k0; ot,"tiendas",;
k1; kp,"codigo = ?",antpol_z,#,1,;
k2; kp,"acum <> 'N' and codigo between ? and ? order by codigo",
    prtda_z,#,1,ultda_z,#,1,;
k3; kp,"codigo = ?",cod_z,#,1,;

f2; #iinfacupo.i;
k0; ot,"infacupo",;
k1; kp,"fecini=? and fecfin=? and zoncar=? and pol=? and cod=? and tasaiva=?",
    fecini_z,#,3,fecult_z,#,3,zoncar_z,#,1,tda_z,#,1,cod_z,#,1,tasiva_z,#,1,;
k2; kq,"delete from infacupo where fecini=? and fecfin=?",
    fecini_z,#,3,fecult_z,#,3,;
k3; kp,"fecini=? and fecfin=? order by zoncar,pol,cod,tasaiva,anter",
    fecini_z,#,3,fecult_z,#,3,;
k4; kp,"fecini=? and fecfin=? and zoncar=? and pol=? and cod=?
	and tasaiva=? and anter=?",
        fecini_z,#,3,fecult_z,#,3,zoncar_z,#,1,tda_z,#,1,cod_z,#,1,
        tasiva_z,#,1,antanu_z,;
k5; kp,"fecini=? and fecfin=? and zoncar=? and pol=? and cod=? and tasaiva=?
	and anter = ?",
        fecini_z,#,3,fecult_z,#,3,zoncar_z,#,1,antpol_z,#,1,antcod_z,#,1,
        tasiva_z,#,1,antanu_z,;
k6; kq,"insert into infacupo (fecini,fecfin,zoncar,pol,cod,tasaiva,impor,
	sdoeng,actnet,bonif,docbon,recar,docrec,docbmedoce,docrmadoce,doclpl,
        doccpl,saldados,sdosprlis, anter)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        fecini_z,#,3,fecult_z,#,3,zoncar_z,#,1,antpol_z,#,1,antcod_z,#,1,
        tasiva_z,#,1,
        impor_z,sdoeng_z,actnet_z,bonif_z,docbon_z,recar_z,docrec_z,
        docbmedoce_z,docrmadoce_z,doclpl_z,doccpl_z,saldados_z,sdosprlis_z,
        antanu_z,;

k7; kq,"update infacupo set impor=impor+?,sdoeng=sdoeng+?,actnet=actnet+?,
	bonif=bonif+?,docbon=docbon+?,recar=recar+?,docrec=docrec+?,
        docbmedoce=docbmedoce+?,docrmadoce=docrmadoce+?,doclpl=doclpl+?,
        doccpl=doccpl+?,saldados=saldados+?,sdosprlis=sdosprlis+?
        where fecini=? and fecfin=? and zoncar=? and pol=?
        and cod=? and tasaiva=? and anter=?",
        impor_z,sdoeng_z,actnet_z,bonif_z,docbon_z,recar_z,docrec_z,
        docbmedoce_z,docrmadoce_z,doclpl_z,doccpl_z,saldados_z,sdosprlis_z,
        fecini_z,#,3,fecult_z,#,3,zoncar_z,#,1,antpol_z,#,1,
        antcod_z,#,1,tasiva_z,#,1,antanu_z,;
k8; kq,"insert into infacupo (fecini,fecfin,zoncar,pol,cod,tasaiva,impor,
	bonif,recar,docbon,docrec,actnet,sdoeng,docbmedoce,docrmadoce,
        doccpl,doclpl,saldados,sdosprlis,anter)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        fecini_ifap,#,3,fecfin_ifap,#,3,zoncar_ifap,#,1,pol_ifap,#,1,
        cod_ifap,#,1,tasaiva_ifap,#,1,impor_ifap,bonif_ifap,
        recar_ifap,docbon_ifap,docrec_ifap,actnet_ifap,sdoeng_ifap,
        docbmedoce_ifap,docrmadoce_ifap,doccpl_ifap,doclpl_ifap,
        saldados_ifap,sdosprlis_ifap,anter_ifap,;
        
f3; #izonas.i;
k0; ot,"zonas",;
k1; kp,"zona=?",antzon_z,#,1,;

f4; #irenpol2.i;
k0; ot,"renpol2",;
k1; kq,"select a.* from renpol2 a join clientes b on a.idcli = b.idcli
	where a.fecha between ? and ? and a.tda =?
        and (impor <> 0 or rob <> 0) order by a.tda, b.fechavta,
        b.piva, a.idcli",
        fecini_z,#,3,fecult_z,#,3,tda_z,#,1,;

f5; #iclientes.i;
k0; ot,"clientes",;
k1; kp,"numcli=?",codcli_z,#,1,;
k2; kp,"idcli=?",idcli_z,;

f6; M
	zona_ifma		s3,
	pol_ifma		s3,
	cod_ifma		s3,
	tiv_ifma		s6,
        anter_ifma		l,
        impor_ifma		d,
	tam_ifma		s0,;
k0; ot,"infacupo",;
k1; kq,"select zoncar, pol, cod, tasaiva, anter, impor from infacupo
	where fecini=? and fecfin = ? and zoncar=? and pol=?
	and cod=? and tasaiva=? and anter =?",
	fecinima_z,#,3,fecultma_z,#,3,zoncar_z,#,1,tda_z,#,1,
        cod_z,#,1,tasiva_z,#,1,antanu_z,;

f7; M
	zona_ind1		s3,
	pol_ind1		s3,
	cod_ind1		s3,
	tiv_ind1		s6,
        anter_ind1		l,
	tam_ind1		s0,;
k0; ot,"infacupo",;
k1; kq,"select unique zoncar from infacupo where fecini=? and fecfin=? order by zoncar",
    fecini_z,#,3,fecult_z,#,3,;
k2; kq,"select unique zoncar, pol, cod, tasaiva, anter from infacupo where
    fecini = ? and fecfin = ? and impor <> 0
    order by zoncar,pol,cod,tasaiva,anter",
    fecinima_z,#,3,fecultma_z,#,3,;

f8; M
	impor_ind2		d,
	bonif_ind2		d,
	recar_ind2		d,;
k0; ot,"infacupo",;
k1; kq,"select sum(impor),sum(bonif),sum(recar) from infacupo where
    fecini=? and fecfin=? and zoncar=?",
    fecini_z,#,3,fecult_z,#,3,zoncar_z,#,1,;

f9; #iedorescar.i;
k0; ot,"edorescar",;
k1; kp,"fecha=? and cod=? and tasiva=?",fecult_z,#,3,cod_z,#,1,piva_z,;
k2; kq,"update edorescar set polizasctopl=0,polizaslarpl=0,clisdos=0,
	clisdprlis=0 where fecha=?",
        fecult_z,#,3,;
k3; kq,"update edorescar set polizasctopl=polizasctopl+?,
	polizaslarpl=polizaslarpl+?,clisdos=clisdos+?,clisdprlis=clisdprlis+?
	where fecha=? and cod=? and tasiva=? and anter=?",
	impcorpl_z,implarpl_z,clisdos_z,sdoprli_z,fecult_z,#,3,cod_z,#,1,
	piva_z,anu_z,;
k4; kq,"insert into edorescar (fecha,tasiva,cod,vtasctopl,vtaslarpl,
	engctopl,englgopl,polizasctopl,polizaslarpl,cancelctopl,cancellarpl,
        incobctopl,incoblarpl,totcarctopl,totcarlarpl,clivig,clisdos,
        clicrdca,clicrdpi,clicanca,clicanpi,vigprlis,clisdprlis,anter)
        values (?,?,?,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,?)",
        fecult_z,#,3,piva_z,cod_z,#,1,anu_z,;
k5; kp,"fecha=? and cod=? and tasiva=? and anter=?",
	fecult_z,#,3,cod_z,#,1,piva_z,anu_z,;
    
f10; #icarteras.i;
k0; ot,"carteras",;
k1; kp,"codcar=? and codcli=?",tda_z,#,1,cod_z,#,1,;
k2; kp,"codcar <> 'x' order by zona,codcar,codcli",;

f11; #iconceps.i;
k0; ot,"conceps",;
k1; kp,"ncon=?",ncon_z,;

f12; M
	zoncar_ind12		s3,
        tasaiva_ind12		s6,
        anter_ind12		l,
	cortopl_ind12		d,
	largopl_ind12		d,
	total_ind12		d,;
k0; ot,"infacupo",;
k1; kq,"select zoncar, tasaiva, anter,
	sum(doccpl),sum(doclpl),sum(doccpl+doclpl)
	from infacupo where fecini=? and fecfin=? and zoncar=?
        group by zoncar, tasaiva, anter",
        fecini_z,#,3,fecult_z,#,3,antzon_z,#,1,;
k2; kq,"select zoncar, tasaiva, anter,
	sum(doccpl),sum(doclpl),sum(doccpl+doclpl)
	from infacupo where fecini=? and fecfin=?
        group by zoncar, tasaiva, anter",
        fecini_z,#,3,fecult_z,#,3,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;

f14; M
        tasaiva_ind14		s6,
        anter_ind14		l,
	import_ind14		d,
	bonif_ind14		d,
	recar_ind14		d,
	neto_ind14		d,;
k0; ot,"infacupo",;
k1; kq,"select tasaiva, anter,
	sum(impor), sum(bonif), sum(recar), sum(impor - bonif + recar)
	from infacupo where fecini=? and fecfin=? and zoncar=? and pol=?
        group by tasaiva, anter",
        fecini_z,#,3,fecult_z,#,3,antzon_z,#,1,antpol_z,#,1,;
k2; kq,"select tasaiva, anter,
	sum(impor), sum(bonif), sum(recar), sum(impor - bonif + recar)
	from infacupo where fecini=? and fecfin=? and zoncar=?
        group by tasaiva, anter",
        fecini_z,#,3,fecult_z,#,3,antzon_z,#,1,;
k3; kq,"select tasaiva, anter,
	sum(impor), sum(bonif), sum(recar), sum(impor - bonif + recar)
	from infacupo where fecini=? and fecfin=?
        group by tasaiva, anter",
        fecini_z,#,3,fecult_z,#,3,;

f15; #icar_infacupo.i;
k0; ot,"car_infacupo",;
k1; kq,"delete from car_infacupo where idperiodo=? and cia=?",
	periodo_z,cia_z,;
k2; kq,"insert into car_infacupo (idinfacupo,idperiodo,idcorlarpzo,
	poliza,tdacli,piva,anu,tipo,ace,diasv,rob,impor,cia)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idinfacupo_ifc,idperiodo_ifc,idcorlarpzo_ifc,poliza_ifc,#,1,
        tdacli_ifc,piva_ifc,anu_ifc,tipo_ifc,#,1,ace_ifc,#,1,
        diasv_ifc,rob_ifc,impor_ifc,cia_ifc,;

f16; M
	idperiodo_ind16		l,
        idcorlar_ind16		l,
        poliza_ind16		s3,
        tdacli_ind16		i,
        piva_ind16		d,
        anuvta_ind16		l,
        recob_ind16		s3,
        ace_ind16		s2,
        diasv_ind16		i,
        cia_ind16		i,
        recobon_ind16		d,
        import_ind16		d,
        tam_ind16		s0,;
k0; ot,"car_infacupo",;
k1; kq,"select cast(Year(fecha)*100+Month(fecha) as integer) as idperiodo,
	d.idcorlarpzo, a.tda, b.tienda, b.piva, Year(fechavta) as anuvta,
        cast ( 'NE' as varchar(2)) as recob, ace, 
        cast(12  as smallint) as diasv, cast(1 as smallint) as cia, 
        sum(rob), sum(impor)
        from tiendas e join renpol2 a on e.codigo=a.tda
        join clientes b on a.idcli = b.idcli
        join car_corlarpzodet c on b.qom = c.qom and b.nulet1 = c.nulets
        join car_corlarpzo d on c.idcorlarpzo = d.idcorlarpzo
        where e.acum='S' and a.fecha between ? and ? and rob = 0
        and impor <> 0 and a.dias < 12
        group by idperiodo, d.idcorlarpzo, a.tda, b.tienda, b.piva, anuvta, 
        recob, a.ace, diasv, cia",
        fecini_z,#,3,fecult_z,#,3,;
k2; kq,"select cast(Year(fecha)*100+Month(fecha) as integer) as idperiodo,
	d.idcorlarpzo, a.tda, b.tienda, b.piva, Year(fechavta) as anuvta,
        cast ( 'NE' as varchar(2)) as recob, ace, 
        cast(13  as smallint) as diasv, cast(1 as smallint) as cia, 
        sum(rob), sum(impor)
        from tiendas e join renpol2 a on e.codigo=a.tda
        join clientes b on a.idcli = b.idcli
        join car_corlarpzodet c on b.qom = c.qom and b.nulet1 = c.nulets
        join car_corlarpzo d on c.idcorlarpzo = d.idcorlarpzo
        where e.acum='S' and a.fecha between ? and ? and rob = 0
        and impor <> 0 and a.dias >= 12
        group by idperiodo, d.idcorlarpzo, a.tda, b.tienda, b.piva, anuvta,
        recob, a.ace, diasv, cia",
        fecini_z,#,3,fecult_z,#,3,;
k3; kq,"select cast(Year(fecha)*100+Month(fecha) as integer) as idperiodo,
	d.idcorlarpzo, a.tda, b.tienda, b.piva, Year(fechavta) as anuvta,
        tipo as recob, ace,
        cast(12  as smallint) as diasv, cast(1 as smallint) as cia, 
        sum(rob), sum(impor)
        from tiendas e join renpol2 a on e.codigo=a.tda
        join clientes b on a.idcli = b.idcli
        join car_corlarpzodet c on b.qom = c.qom and b.nulet1 = c.nulets
        join car_corlarpzo d on c.idcorlarpzo = d.idcorlarpzo
        where e.acum='S' and a.fecha between ? and ? and rob <> 0
        and impor <> 0 and a.dias < 12
        group by idperiodo, d.idcorlarpzo, a.tda, b.tienda, b.piva, anuvta, 
        recob, a.ace, diasv, cia",
        fecini_z,#,3,fecult_z,#,3,;
k4; kq,"select cast(Year(fecha)*100+Month(fecha) as integer) as idperiodo,
	d.idcorlarpzo, a.tda, b.tienda, b.piva, Year(fechavta) as anuvta,
        tipo as recob, ace,
        cast(13  as smallint) as diasv, cast(1 as smallint) as cia, 
        sum(rob), sum(impor)
        from tiendas e join renpol2 a on e.codigo=a.tda
        join clientes b on a.idcli = b.idcli
        join car_corlarpzodet c on b.qom = c.qom and b.nulet1 = c.nulets
        join car_corlarpzo d on c.idcorlarpzo = d.idcorlarpzo
        where e.acum='S' and a.fecha between ? and ? and rob <> 0
        and impor <> 0 and a.dias >= 13
        group by idperiodo, d.idcorlarpzo, a.tda, b.tienda, b.piva, anuvta, 
        recob, a.ace, diasv, cia",
        fecini_z,#,3,fecult_z,#,3,;

f17; M
	ultimo_ind17		l,
        tam_ind7		s0,;
k0; ot,"car_infacupo",;
k1; kq,"select max(idinfacupo) from car_infacupo where idinfacupo > 0",;

R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;
#i/programas/lib/fechas.i;

[PAN; 
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro;
GST; tf; tn; #iprog1.i;
^=direc_z,#); z0,modul_z,#;
(modul_z)=($Informe Acumulado Polizas,25); (modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[NOZON; z0,nombre_zon,#; (nombre_zon)=($INEXISTENTE,11); R;
[NOPOL; z0,nombre_tda,#; (nombre_tda)=($INEXISTENTE,11); R;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
