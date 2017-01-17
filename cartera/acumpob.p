* Programa que sirve para dar de alta a los clientes
  DRBR 24 de Septiembre de 1997
*

#dMIS02 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS6 %6.2f~; #dMDS7 %,7.0f~;
#dMIE2 %-2d~;  #dMFS5 %5.1f~;
#dMDS13 %,13.2f~;

#i/programas/lib/funkey.i;

f0; M
	maxcol_z		i,
        maxrow_z		i,
        renst_z			i,
        sff_z			s2,
	fech9_z     {
	  dias2_z       	s16,
	  hora_z         	s6,
	  resto_z        	s5,
	            }
	impre_z			i,
	font_z			i,
	micar_z			s3,
	version_z		s21,
	carac_z			i,
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	bandimp_z		s3,
        ticte_z			s3,
        nommes_z		s13,
	enc_z			i,
	mes_z			i,
	anu_z			i,
        tarea_z			i,
        idtarea_z		l,
        aoi_z			s2,
        idacum_z		l,
	prlisca_z		d,
	prlispi_z		d,
	prlisfn_z		d,
	prlisfi_z		d,
	anlisca_z		d,
	anlispi_z		d,
	anlisfn_z		d,
	anlisfi_z		d,
	anliscn_z		d,
	totprlisca_z		d,
	totprlispi_z		d,
	totprlisfn_z		d,
	totprlisfi_z		d,
        totprlista_z		d,
	totfaca_z		d,
	totfafn_z		d,
	totfapi_z		d,
	totlis_z		d,
        totprliscn_z		d,
        prliscn_z		d,
        totfacn_z		d,
	prom1_z			d,
	prom2_z			d,
	prom3_z			d,
	prom4_z			d,
	prom5_z			d,

	bandman_z        	s3,
	band_z           	s3,
	bandh_z          	s3,
	nemp_z			s80,
	direc_z			s50,
	modul_z			s30,
	modul2_z		s10,
	usuarios_z      	s80,
	teruser_z       	s80,
	mibd_z          	s80,
	nombuse_z       	s15,
	clause_z        	s10,
	bandf1_z	 	s3,
	tothor_z		d,
	codcar_z		s3,
	ubica_z			s3,
	operac_z		s2,
	vend_z			s4,
	zona_z			s3,
	subzona_z		s4,
	calle_z			s3,
	precio_z		d,
	meses_z			i,
	prtda_z			i,
	ultda_z			i,
        idpob_z			l,
        perioini_z		l,
        periofin_z		l,
        anuini_z		l,
        cia_z			i,
	
	fecha_z			D,
	fechb_z			D,
        fechc_z			D,
        fechd_z			D,
        feche_z			D,
        periomes_z		i,
        perioanuini_z		i,
        perioanufin_z		i,
	fecini_z	{
	  feciniaa_z		i,
	  fecinimm_z		i,
	  fecinidd_z		i,
	  		}
	fecfin_z	{
	  fecfinaa_z		i,
	  fecfinmm_z		i,
	  fecfindd_z		i,
	  		}
        fecsig_z	{
          fecsigaa_z		i,
          fecsigmm_z		i,
          fecsigdd_z		i,
        		}
	linea_z		{
	  zon2_z		s2,
	  esp2_z		s1,
	  subzon2_z		s3,
	  esp3_z		s1,
	  voc2_z		s1,
	  unresto_z		s80,
	  		}
	
	voc_z			s2,
	pol_z			s2,
	codcli_z		s11,
	antcod_z		i,
	antubi_z		s4,
	coa_z			s2,
	poblac_z		s26,
        milin_z			s100,
	acu_z			s2,
        html_z			s2,
        nosaltopag_z   		s2,
        analimen_z		s2,
        analianu_z		s2,
	nubis_z			i,
        maxcolxtabla_z		i,
        colxtabla_z		i,
        ntablas_z		i,
        mitabla_z		i,
        colini_z		i,
        colfin_z		i,
        micol_z			i,
	fech8_z           	D,
        nubica_z		i,
	ind1_z            	i,
	ind2_z            	i,
        ii_z			i,
        iii_z			i,
	termi_z           	i,
	esp_z             	i,
	exten_z           	i,
	tam0             	s0,;

mtam0&; (impre_z)=(1);
* -----> Control de Versiones <-----------------
| V 2.01 ED: Se modifica para agregar la division de las megazonas
| 10-Abr-2015
|____________________________________________________________________ *

q+,version_z,"V:2.01 EC",;

Ff5; FO.impri2.ini~,r~;
FG|; |
  Fknemp_z,l;
  !(nemp_z)0($html,4)>|;
    (html_z)=($S,1);
  |
    >sinemp_z,#,impre_z;
  .
.
FC; 
z0,nemp_z,#; Ff5; FO.cias.ini~,r~; FG|; . Fknemp_z,l; >sinemp_z,#,cia_z; FC;
Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; GABRE_TABLA; 
!(html_z)0($S,1)>|;
  (arch_z)=($acumpob.html,12);
|
  (arch_z)=($acumpob2.tex,12);
.

&a; &cfechc_z; qD,2,fecsig_z,fechc_z,; GPRIMERO_DE_MES_ANTER;
qD,1,fecsig_z,fechc_z,; 
(prtda_z)=(1); (ultda_z)=(95); (acu_z)=($N,1); (coa_z)=($T,1);
GTOMA_PARAMETROS;

[fei; t@5,3; \Fecha Inicial:\; t0Fin; (fecha_z)=(fechc_z); ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
qD,2,fecsig_z,fecha_z,; GULTIMO_DE_MES; qD,1,fecsig_z,fechd_z,; 
[feu; t@5,40; \Fecha Final:\; t0fei; (fechb_z)=(fechd_z); ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecfin_z,fechb_z,;
(mes_z)=(fecfinmm_z); (anu_z)=(fecfinaa_z);
[prt; t0feu; t@6,3; \Del Codigo:\; t@6,20; iprtda_z,MIE2,MIS2;
[ult; t0prt; t@6,40; \Al Codigo:\; t@6,60; iultda_z,MIE2,MIS2;
[acu; t0ult; t@7,3; \Acumulo de Nuevo ? <S/N> :\; iacu_z,1;
!(acu_z)5($S,1)(acu_z)5($N,1)&>acu;
[aoi; t0acu; t@8,3; \Reporte ordenado `A`lfabeticamente o por `I`mporte de ventas ? <A/I>:\; 
iaoi_z,1; !(aoi_z)5($A,1)(aoi_z)5($I,1)&>aoi;
(perioini_z)=(feciniaa_z)(100)*(fecinimm_z)+; (periofin_z)=(perioini_z);
(anuini_z)=(feciniaa_z)(100)*(1)+; 
(periomes_z)=(fecinimm_z);
(perioanuini_z)=(periomes_z); (perioanufin_z)=(periomes_z);
[anm; t@9,3; \Desea Imprimir el Analitico Mensual de Pisos ? <S/N>:\;
t0aoi; ianalimen_z,1; !(analimen_z)5($S,1)(analimen_z)5($N,1)&>anm;
!(analimen_z)0($S,1)>|;
  [fim; t@10,3; \Analitico Mensual de:\; t0anm; 
  t@10,25; iperiomes_z,MIE2,MIS2;
  !(periomes_z)2($1)(periomes_z)1($12)|>fim;
  (mes_z)=(periomes_z); GTOMANOMMES; t@10,28; pnommes_z,12;
.
[ann; t@11,3; \Desea Imprimir el Analitico Trimestral de Pisos ? <S/N>:\;
t0anm; ianalianu_z,1; !(analianu_z)5($S,1)(analianu_z)5($N,1)&>ann;
!(analianu_z)0($S,1)>|;
  (perioanuini_z)=(periomes_z)(2)-; 
  !(perioanuini_z)2($1)>|; (perioanuini_z)=(1); .
  (perioanufin_z)=(periomes_z);
  [fia; t@12,3; \Inicia en :\; t0ann; 
  t@12,15; iperioanuini_z,MIE2,MIS2;
  !(perioanuini_z)2($1)(perioanuini_z)1($12)|>fia;
  (mes_z)=(perioanuini_z); GTOMANOMMES; t@12,18; pnommes_z,12;
  [fif; t@12,40; \Termina en :\; t0fia; 
  t@12,55; iperioanufin_z,MIE2,MIS2;
  !(perioanufin_z)2($1)(perioanufin_z)1($12)|(perioanufin_z)1(perioanuini_z)>fif;
  (mes_z)=(perioanufin_z); GTOMANOMMES; t@12,58; pnommes_z,12;
.

t@13,3; panuini_z,MLS6; s1; pperiofin_z,MLS6;
GST; \Estan correctos los datos ? <S/N> : \; y|; | gult; .

ttttarea_z; (idtarea_z)=(tarea_z);

tS1,8,0,11,80; tv0; tc; GGRABA_PARAMETROS;
!(acu_z)0($S,1)>|; GACUMULALOS; .

[reporte;
GREP_TEXTO;
!(analimen_z)0($S,1)>|; 
  (perioini_z)=(feciniaa_z)(100)*(periomes_z)+; (periofin_z)=(perioini_z);
  z0,bandf1_z,#; GREP_ACUM_X_UBI_MENS; 
.
!(analianu_z)0($S,1)>|; 
  (perioini_z)=(feciniaa_z)(100)*(perioanuini_z)+; 
  (periofin_z)=(feciniaa_z)(100)*(perioanufin_z)+; 
  z0,bandf1_z,#; GREP_ACUM_X_UBI_MENS; 
.
GFINHTML; 
Ff4; FC; Ff1; tf; tr; tS0; GSalir;
gFin;
R;


[REP_TEXTO;
(enc_z)=(1); z0,totprlisca_z,#; z0,totprlispi_z,#; z0,totprlisfn_z,#;
Ff4; FO(arch_z),w~; (band_z)=($S,1);
!(html_z)0($S,1)>|;
  GENC_HTML;
|
  FP66,60,Enc,Pie;
.
(perioini_z)=(feciniaa_z)(100)*(fecinimm_z)+; (periofin_z)=(perioini_z);
(anuini_z)=(feciniaa_z)(100)*(1)+;
!(aoi_z)0($I,1)>|;
  f4; k3; P$; k4; P$; k2; P;
|
  f4; k1; P;
.
{ n+;
  Ff1; \Imprimiendo:\; ppoblac_ind2,0; l;
  GIMPRI1;
  f4; a;
)
GULIN1;

z0,totprlispi_z,#; z0,totprlisca_z,#; z0,totprlisfn_z,#;
z0,totprlisfi_z,#; z0,totprliscn_z,#;
(enc_z)=(2); (perioini_z)=(anuini_z);
!(html_z)0($S,1)>|;
  GSUBENC2;
|
  Ff4; GFONT30;
.
!(aoi_z)0($I,1)>|;
  f4; k3; P$; k4; P$; k2; P;
|
  f4; k1; P;
.
{ n+;
  Ff1; \Imprimiendo:\; ppoblac_ind2,0; l;
  GIMPRI2;
  f4; a;
)
GULIN2; 
R;

[TOMA_PARAMETROS;
x echo  >>.acumpob.ini ~;
Ff5; FO.acumpob.ini~,r~;
(ii_z)=(0);
{ FG+; z0,milin_z,#; Fkmilin_z,l; 
  (ii_z)=(ii_z)(1)+;
  !(ii_z)0($1)>|; >similin_z,#,prtda_z; .
  !(ii_z)0($2)>|; >similin_z,#,ultda_z; .
  !(ii_z)0($3)>|; (acu_z)=(milin_z,1);  .
  !(ii_z)0($4)>|; (coa_z)=(milin_z,1);  .
  !(ii_z)0($5)>|; (aoi_z)=(milin_z,1);  .
  !(ii_z)0($6)>|; (analimen_z)=(milin_z,1); .
  !(ii_z)0($7)>|; (analianu_z)=(milin_z,1); .
)
Ff5; FC; Ff1;
R;

[GRABA_PARAMETROS;
Ff5; FO.acumpob.ini~,w~;
pprtda_z,MIS2; l;
pultda_z,MIS2; l;
pacu_z,0; l;
pcoa_z,0; l;
paoi_z,0; l;
panalimen_z,0; l;
panalianu_z,0; l;
Ff5; FC; Ff1;
R;


[SUBENC1;
Ff4;
GININEGRILLA; \Ventas Acumuladas por Poblacion Precio Lista S/Iva del \;
pfecha_z,+10; \ Al \; pfechb_z,+10; \ Pag:\; Fp%d~; l;
GINICENTRADO; GFONT15; Fc40,\TABLA MENSUAL DE VENTAS~; 
GFINCENTRADO; GFINNEGRILLA; 
GFONT16; GFONT13; l;
!(html_z)5($S,1)>|; c_132; c_14; l; . GTABLA1;
R;

[TABLA1;
GINITXTSUBRAYADO; GINITABLA; 
GINIREN; GINICOLENC; \Poblacion           \; GFINCOLENC;
GINICOLENC; \Total P.Lista\; GFINCOLENC;
GINICOLENC; \PRM/MES\; GFINCOLENC;
GINICOLENC; \TOTAL CALLE \; GFINCOLENC;
GINICOLENC; \PRM/MES\; GFINCOLENC;
GINICOLENC; \ TOTAL V.PISO\; GFINCOLENC;
GINICOLENC; \PRM/MES\; GFINCOLENC;
GINICOLENC; \TOTAL FONACOT\; GFINCOLENC;
GINICOLENC; \PRM/MES\; GFINCOLENC;
GINICOLENC; \   TOTAL FIDE\; GFINCOLENC;
GINICOLENC; \PRM/MES\; GFINCOLENC;
GINICOLENC; \TOTAL CONTADO\; GFINCOLENC; GFINTXTSUBRAYADO; l;
R;

[IMPRI1;
(poblac_z)=(poblac_ind2,#); (idpob_z)=(idpoblac_ind2); 
z0,prelis_ind1,l; f2; k1; P; n|;. (prlispi_z)=(prelis_ind1);
z0,prelis_ind1,l; f2; k2; P; n|;. (prlisca_z)=(prelis_ind1);
z0,prelis_ind1,l; (ticte_z)=($FN,2); 
f2; k4; P; n|;. (prlisfn_z)=(prelis_ind1);
z0,prelis_ind1,l; (ticte_z)=($IM,2); 
f2; k4; P; n|;. (prlisfn_z)=(prlisfn_z)(prelis_ind1)+;
z0,prelis_ind1,l; (ticte_z)=($FI,2);
f2; k4; P; n|;. (prlisfi_z)=(prelis_ind1);
z0,prelis_ind1,l; f2; k5; P; n|;. (prliscn_z)=(prelis_ind1);
* -- Ahora los Acumulados Anuales -- *
z0,prelis_ind1,l; f2; k6; P; n|;. (anlispi_z)=(prelis_ind1);
z0,prelis_ind1,l; f2; k7; P; n|;. (anlisca_z)=(prelis_ind1);
z0,prelis_ind1,l; (ticte_z)=($FN,2);
f2; k9; P; n|;. (anlisfn_z)=(prelis_ind1);
z0,prelis_ind1,l; (ticte_z)=($IM,2);
f2; k9; P; n|;. (anlisfn_z)=(anlisfn_z)(prelis_ind1)+;
z0,prelis_ind1,l; (ticte_z)=($FI,2);
f2; k9; P; n|;. (anlisfi_z)=(prelis_ind1);
z0,prelis_ind1,l; f2; k10; P; n|;. (anliscn_z)=(prelis_ind1);
(totprlispi_z)=(totprlispi_z)(prlispi_z)+;
(totprlisca_z)=(totprlisca_z)(prlisca_z)+;
(totprlisfn_z)=(totprlisfn_z)(prlisfn_z)+;
(totprlisfi_z)=(totprlisfi_z)(prlisfi_z)+;
(totprliscn_z)=(totprliscn_z)(prliscn_z)+;

(totlis_z)=(prlisca_z)(prlispi_z)+(prlisfn_z)+(prlisfi_z)+;
(totprlista_z)=(anlisca_z)(anlispi_z)+(anlisfn_z)+(anlisfi_z)+;
(prom1_z)=(totprlista_z)(mes_z)/; 
(prom2_z)=(anlisca_z)(mes_z)/; 
(prom3_z)=(anlispi_z)(mes_z)/;
(prom4_z)=(anlisfn_z)(mes_z)/;
(prom5_z)=(anlisfi_z)(mes_z)/;
Ff4; 
GINIREN; 
GINICOL; ppoblac_ind2,20;  GFINCOL;
GINICOLDER; ptotlis_z,MDS13;  GFINCOL;
GINICOLDER; pprom1_z,MDS7;    GFINCOL;
GINICOLDER; pprlisca_z,MDS13; GFINCOL;
GINICOLDER; pprom2_z,MDS7;    GFINCOL;
GINICOLDER; pprlispi_z,MDS13; GFINCOL;
GINICOLDER; pprom3_z,MDS7;    GFINCOL;
GINICOLDER; pprlisfn_z,MDS13; GFINCOL;
GINICOLDER; pprom4_z,MDS7;    GFINCOL;
GINICOLDER; pprlisfi_z,MDS13; GFINCOL;
GINICOLDER; pprom5_z,MDS7;    GFINCOL;
GINICOLDER; pprliscn_z,MDS13;  GFINCOL; GFINREN; l;
R;

[ULIN1;
(totlis_z)=(totprlisca_z)(totprlispi_z)+(totprlisfn_z)+(totprlisfi_z)+;
z0,prom1_z,#; z0,prom2_z,#; z0,prom3_z,#;
!(totlis_z)5($0)>|;
  (prom1_z)=(totprlisca_z)(totlis_z)/(100)*;
  (prom2_z)=(totprlispi_z)(totlis_z)/(100)*;
  (prom3_z)=(totprlisfn_z)(totlis_z)/(100)*;
  (prom4_z)=(totprlisfi_z)(totlis_z)/(100)*;
.
Ff4; !(html_z)5($S,1)>|; GSACALIN; .
GINITXTSUBRAYADO; GINIREN; 
GINICOL; \Total de:\; GSACANOMMES; GFINCOL;
GINICOLDER; ptotlis_z,MDS13; GFINCOL;
GINICOLDER; GESPACIOS; s7; GFINCOL;
GINICOLDER; ptotprlisca_z,MDS13; GFINCOL;
GINICOLDER; pprom1_z,MFS6; \%\; GFINCOL;
GINICOLDER; ptotprlispi_z,MDS13; GFINCOL; 
GINICOLDER; pprom2_z,MFS6; \%\; GFINCOL;
GINICOLDER; ptotprlisfn_z,MDS13; GFINCOL;
GINICOLDER; pprom3_z,MFS6; \%\; GFINCOL;
GINICOLDER; ptotprlisfi_z,MDS13; GFINCOL;
GINICOLDER; pprom4_z,MFS6; \%\; GFINCOL;
GINICOLDER; ptotprliscn_z,MDS13; GFINCOL; GFINREN; GFINTXTSUBRAYADO; 
l;
GFINTABLA;
z0,totprlisca_z,#; z0,totprlispi_z,#; z0,totprlisfn_z,#; z0,totprliscn_z,#;
R;

[SACALIN;
\____________________|\;
\_____________|_______|_____________|_______|_____________|_______|\;
\_____________|_______|_____________|_______|_____________|\; l;
R;

[SUBENC2;
Ff4;
GININEGRILLA; \Ventas Acumuladas por Poblacion Precio Lista S/Iva Al \;
pfechb_z,+10; \ Pag:\; Fp%d~; l;
GINICENTRADO; GFONT15; Fc40,\TABLA ANUAL DE VENTAS~; 
GFINCENTRADO; GFINNEGRILLA; GFONT16; GFONT13; l;
!(html_z)5($S,1)>|; c_130; l; .
GINITXTSUBRAYADO; GINIREN;
GINICOLENC; \Poblacion           \; GFINCOLENC;
GINICOLENC; \ Tot. P.Lista\; GFINCOLENC;
GINICOLENC; \ TOTAL CALLE \; GFINCOLENC;
GINICOLENC; \  %  \; GFINCOLENC;
GINICOLENC; \ TOTAL V.PISO\; GFINCOLENC;
GINICOLENC; \  %  \; GFINCOLENC;
GINICOLENC; \TOTAL FONACOT\; GFINCOLENC;
GINICOLENC; \  %  \; GFINCOLENC;
GINICOLENC; \   TOTAL FIDE\; GFINCOLENC;
GINICOLENC; \  %  \; GFINCOLENC;
GINICOLENC; \TOTAL CONTADO\; GFINCOLENC; GFINREN; GFINTXTSUBRAYADO; l;
R;

[IMPRI2;
* -- Ahora los Acumulados Anuales -- *
(poblac_z)=(poblac_ind2,#); (idpob_z)=(idpoblac_ind2);
z0,prelis_ind1,l; f2; k6; P; n|;. (anlispi_z)=(prelis_ind1);
z0,prelis_ind1,l; f2; k7; P; n|;. (anlisca_z)=(prelis_ind1);
z0,prelis_ind1,l; (ticte_z)=($FN,2);
f2; k9; P; n|;. (anlisfn_z)=(prelis_ind1);
z0,prelis_ind1,l; (ticte_z)=($IM,2);
f2; k9; P; n|;. (anlisfn_z)=(anlisfn_z)(prelis_ind1)+;
z0,prelis_ind1,l; (ticte_z)=($FI,2);
f2; k9; P; n|;. (anlisfi_z)=(prelis_ind1);
z0,prelis_ind1,l; f2; k10; P; n|;. (anliscn_z)=(prelis_ind1);
(totprlispi_z)=(totprlispi_z)(anlispi_z)+;
(totprlisca_z)=(totprlisca_z)(anlisca_z)+;
(totprlisfn_z)=(totprlisfn_z)(anlisfn_z)+;
(totprlisfi_z)=(totprlisfi_z)(anlisfi_z)+;
(totprliscn_z)=(totprliscn_z)(anliscn_z)+;

(totlis_z)=(anlisca_z)(anlispi_z)+(anlisfn_z)+(anlisfi_z)+;
!(totlis_z)5($0)>|;
  (prom2_z)=(anlisca_z)(totlis_z)/(100)*;
  (prom3_z)=(anlispi_z)(totlis_z)/(100)*;
  (prom4_z)=(anlisfn_z)(totlis_z)/(100)*;
  (prom5_z)=(anlisfi_z)(totlis_z)/(100)*;
.
Ff4; 
GINIREN;
GINICOL; ppoblac_ind2,20;  
GINICOLDER; ptotlis_z,MDS13;  GFINCOL;
GINICOLDER; panlisca_z,MDS13; GFINCOL;
GINICOLDER; pprom2_z,MFS5;    GFINCOL;
GINICOLDER; panlispi_z,MDS13; GFINCOL;
GINICOLDER; pprom3_z,MFS5;    GFINCOL;
GINICOLDER; panlisfn_z,MDS13; GFINCOL;
GINICOLDER; pprom4_z,MFS5;    GFINCOL;
GINICOLDER; panlisfi_z,MDS13; GFINCOL;
GINICOLDER; pprom5_z,MFS5;    GFINCOL;
GINICOLDER; panliscn_z,MDS13; GFINCOL;
GFINREN;
l;
R;

[ULIN2;
(totlis_z)=(totprlisca_z)(totprlispi_z)+(totprlisfn_z)+(totprlisfi_z)+;
z0,prom1_z,#; z0,prom2_z,#; z0,prom3_z,#;
!(totlis_z)5($0)>|;
  (prom1_z)=(totprlisca_z)(totlis_z)/(100)*;
  (prom2_z)=(totprlispi_z)(totlis_z)/(100)*;
  (prom3_z)=(totprlisfn_z)(totlis_z)/(100)*;
  (prom4_z)=(totprlisfi_z)(totlis_z)/(100)*;
.
Ff4; 
GINITXTSUBRAYADO; GINIREN; GINICOL; GESPACIOS; s20; GFINCOL;
GINICOLDER; ptotlis_z,MDS13;     GFINCOL;
GINICOLDER; ptotprlisca_z,MDS13; GFINCOL;
GINICOLDER; pprom1_z,MFS5;       GFINCOL;
GINICOLDER; ptotprlispi_z,MDS13; GFINCOL;
GINICOLDER; pprom2_z,MFS5;       GFINCOL;
GINICOLDER; ptotprlisfn_z,MDS13; GFINCOL;
GINICOLDER; pprom3_z,MFS5;       GFINCOL;
GINICOLDER; ptotprlisfi_z,MDS13; GFINCOL;
GINICOLDER; pprom4_z,MFS5;       GFINCOL;
GINICOLDER; ptotprliscn_z,MDS13; GFINCOL;
GFINREN; GFINTABLA; GFINTXTSUBRAYADO;
l;
R;

[SACALIN2;
\____________________|_____________|_____________|_____|_____________|____|\;
                      \_____________|_____________|_____|_____________|\; l;
R;


* --------------------   --> Reporte en HTML <--  ------------------  *

[ENC_HTML;
Ff4;
GINIHTML; GINICENTRADO;
\<font size=+2><B><I>\; pnemp_z,0; \</I></B></font><br>\; l;
Ff3; FT; FGNodatos; Ff3; FGNodatos; Ff4;
\<font size=-2>acumpob </font>\; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; \<br>\; GFINCENTRADO; l;
!(enc_z)0($1)>|; GSUBENC1; .
!(enc_z)0($2)>|; GSUBENC2; .
!(enc_z)0($3)>|; GSUBENC3; .
!(enc_z)0($4)>|; GSUBENC4; .
R;

[SUBENC1_HTML;
Ff4;
\<center>Ventas Acumuladas por Poblacion Precio Lista S/Iva del \;
pfecha_z,+10; \ Al \; pfechb_z,+10; \</center>\;
\<H2><CENTER>TABLA MENSUAL DE VENTAS</h2></CENTER>\; l;
\<table border=1>\;
\<tr><th>Poblacion</th><th>Total P.Lista</th><th>PROM/MENS</th>\;
\<th>TOTAL CALLE</th><th>PROM/MENS</th><th>TOTAL V.PISO</th>\;
\<th>PROM/MENS</th><th>TOTAL FONACOT</th><th>PROM/MENS</th>\;
\<th>TOTAL FIDE</th><th>PROM/MENS</th><th>TOTAL CONTADO</th></tr>\; l;
R;

[SUBENC2_HTML;
Ff4;
\<br><br><B><CENTER>Ventas Acumuladas por Poblacion Precio Lista S/Iva Al \;
pfechb_z,+10; \<BR>\; l;
\<h2>TABLA ANUAL DE VENTAS</h2></CENTER>\; l;
GINITABLA; l;
GINIREN; \<th>Poblacion</th><th>Tot. P.Lista</th><th>TOTAL CALLE</th>\;
\<th>%</th><th> TOTAL V.PISO</th><th>% </th><th>TOTAL FONACOT</th>\;
\<th>%</th><th>TOTAL FIDE</th><th>%</th><th>TOTAL CONTADO</th>\; 
GFINREN;
l;
R;

[REP_ACUM_X_UBI_MENS;
z0,anlispi_z,#; z0,totprlispi_z,#;
z0,anlisfn_z,#; z0,totprlisfn_z,#;
z0,anlisfi_z,#; z0,totprlisfi_z,#;
z0,anliscn_z,#; z0,totprliscn_z,#;
(ubica_z)=($-1,2); (enc_z)=(4);
f9; k1; P;
{ n+;
  Ff1; \Leyendo:\; pubica_ind9,0; s1; ppoblac_ind9,0; l;
  !(ubica_ind9)5(ubica_z,#)>|;
    !(band_z)5($S,1)>|;
      (ubica_z)=(ubica_ind9,#);
      Ff4; FO(arch_z),w~; 
      !(html_z)0($S,1)>|; GENC_HTML; | FP66,60,Enc,Pie; . (band_z)=($S,1);
    |
      Ff4;
      !(bandf1_z)5($S,1)>|;
        (ubica_z)=(ubica_ind9,#);
        !(html_z)0($S,1)>|; 
          GCORTE_HORIZONTAL; GSUBENC4;
        |
          GSALTO_PAGINA;
        .
        (bandf1_z)=($S,1);
      |
        GSUBTUBI; (ubica_z)=(ubica_ind9,#); Ff4; l; GSUBENCUBI;
      .
    .
  .
  GIMPRI4;
  f9; a;
)
GSUBTUBI; GULIN4;
R;

[SUBENC4;
Ff4;
GINICENTRADO; GININEGRILLA; 
\Ventas Acumuladas por Poblacion Precio Lista S/Iva de \;
>lsperioini_z,nommes_z,MLS6; (nommes_z)=($    ,4); >sinommes_z,#,mes_z;
GTOMANOMMES; pnommes_z,0;
!(perioini_z)5(periofin_z)>|;
 \ A \; >lsperiofin_z,nommes_z,MLS6; (nommes_z)=($    ,4); >sinommes_z,#,mes_z;
  GTOMANOMMES; pnommes_z,0;
.
\ Pag:\; Fp%d~; 
GFINNEGRILLA; GFINCENTRADO; l;
GINITABLA; GINITXTSUBRAYADO; 
GINIREN;
GINICOLENC; \Poblacion           \; GFINCOLENC;
GINICOLENC; \      Credito\; GFINCOLENC;
GINICOLENC; \      Contado\; GFINCOLENC;
GINICOLENC; \      Fonacot\; GFINCOLENC;
GINICOLENC; \         Fide\; GFINCOLENC;
GINICOLENC; \        Total\; GFINCOLENC; GFINREN; GFINTXTSUBRAYADO; l;
GSUBENCUBI;
R;

[SUBENCUBI;
GINIREN; (ii_z)=(6); GINICOLSPAN; GININEGRILLA;
\Ubicacion:\; pubica_z,0; s1; f8; k1; P; n|;. pnombre_ubi,0; 
GFINCOL; GFINREN; GFINNEGRILLA; l;
R;

[IMPRI4;
(poblac_z)=(poblac_ind9,#); (idpob_z)=(idpoblac_ind9); 
(ubica_z)=(ubica_ind9,#);
z0,prelis_ind1,l; f2; k13; P; n|;. (prlispi_z)=(prelis_ind1);
z0,prelis_ind1,l; (ticte_z)=($FN,2); 
f2; k15; P; n|;. (prlisfn_z)=(prelis_ind1);
z0,prelis_ind1,l; (ticte_z)=($IM,2); 
f2; k15; P; n|;. (prlisfn_z)=(prlisfn_z)(prelis_ind1)+;
z0,prelis_ind1,l; (ticte_z)=($FI,2);
f2; k15; P; n|;. (prlisfi_z)=(prelis_ind1);
z0,prelis_ind1,l; f2; k14; P; n|;. (prliscn_z)=(prelis_ind1);
(tothor_z)=(prlispi_z)(prliscn_z)+(prlisfn_z)+(prlisfi_z)+;
Ff4; 
GINIREN; GINICOL; ppoblac_z,20; GFINCOL; 
GINICOLDER; !(prlispi_z)5($0)>|; pprlispi_z,MDS13; | s13; GESPACIOS; . GFINCOL; 
GINICOLDER; !(prliscn_z)5($0)>|; pprliscn_z,MDS13; | s13; GESPACIOS; . GFINCOL; 
GINICOLDER; !(prlisfn_z)5($0)>|; pprlisfn_z,MDS13; | s13; GESPACIOS; . GFINCOL; 
GINICOLDER; !(prlisfi_z)5($0)>|; pprlisfi_z,MDS13; | s13; GESPACIOS; . GFINCOL; 
GINICOLDER; ptothor_z,MDS13; GFINCOL; GFINREN; l;
(totprlispi_z)=(totprlispi_z)(prlispi_z)+;
(totprlisfn_z)=(totprlisfn_z)(prlisfn_z)+;
(totprlisfi_z)=(totprlisfi_z)(prlisfi_z)+;
(totprliscn_z)=(totprliscn_z)(prliscn_z)+;
R;

[SUBTUBI; 
(tothor_z)=(totprlispi_z)(totprliscn_z)+(totprlisfn_z)+(totprlisfi_z)+;
Ff4; GINITXTSUBRAYADO; GINIREN; GINICOL;
\Total de \; pubica_z,2; s1; f8; k1; P; n|;. pnombre_ubi,8; GFINCOL;
GINICOLDER; ptotprlispi_z,MDS13; GFINCOL;
GINICOLDER; ptotprliscn_z,MDS13; GFINCOL;
GINICOLDER; ptotprlisfn_z,MDS13; GFINCOL;
GINICOLDER; ptotprlisfi_z,MDS13; GFINCOL;
GINICOLDER; ptothor_z,MDS13; GFINCOL; GFINREN; GFINTXTSUBRAYADO; l;
(anlispi_z)=(anlispi_z)(totprlispi_z)+; z0,totprlispi_z,#;
(anlisfn_z)=(anlisfn_z)(totprlisfn_z)+; z0,totprlisfn_z,#;
(anlisfi_z)=(anlisfi_z)(totprlisfi_z)+; z0,totprlisfi_z,#;
(anliscn_z)=(anliscn_z)(totprliscn_z)+; z0,totprliscn_z,#;
R;

[ULIN4; 
Ff4; 
GINITXTSUBRAYADO; GINIREN; GINICOL; \Tota General \; s7; GFINCOL;
GINICOLDER; panlispi_z,MDS13; GFINCOL;
GINICOLDER; panliscn_z,MDS13; GFINCOL;
GINICOLDER; panlisfn_z,MDS13; GFINCOL;
GINICOLDER; panlisfi_z,MDS13; GFINCOL;
(tothor_z)=(anlispi_z)(anliscn_z)+(anlisfn_z)+(anlisfi_z)+;
GINICOLDER; ptothor_z,MDS13; GFINCOL; GFINREN; GFINTXTSUBRAYADO; GFINTABLA; l;
R;

[TABLAS_ACUM_X_UBI_MENS;
(perioini_z)=(feciniaa_z)(100)*(fecinimm_z)+; (periofin_z)=(perioini_z);
(anuini_z)=(feciniaa_z)(100)*(1)+;
* ----> Reporte de Ventas x Ubicacion Mensual <------- *
z0,totprlispi_z,#; z0,totprlisca_z,#; z0,totprlisfn_z,#;
z0,totprlisfi_z,#; z0,totprliscn_z,#;
(perioini_z)=(feciniaa_z)(100)*(fecinimm_z)+; (periofin_z)=(perioini_z);
z0,nubis_z,#; (maxcolxtabla_z)=(132)(21)-(14)/;
!(aoi_z)0($I,1)>|; f4; k3; P$; k4; P$; .
Ff6; FOacumpob2.dat~,w~;
f7; k1; P; 
{ n+;
  Ff6; pubica_ind7,0; l; (nubis_z)=(nubis_z)(1)+;
  f7; a;
)
Ff6; FC;
Ff6; FOacumpob2.dat~,r~;
(ntablas_z)=(nubis_z)(maxcolxtabla_z)/;
(ii_z)=(ntablas_z)(maxcolxtabla_z)*;
!(ii_z)2(nubis_z)>|; (ntablas_z)=(ntablas_z)(1)+; .
(colxtabla_z)=(nubis_z)(ntablas_z)/;
(enc_z)=(3); (mitabla_z)=(1);
{ !(mitabla_z)1(ntablas_z)>+;
  GIMPRIME_MI_TABLA;
  (mitabla_z)=(mitabla_z)(1)+;
)
GFINHTML;
R;

[IMPRIME_MI_TABLA;
(colini_z)=(mitabla_z)(1)-(colxtabla_z)*(1)+;
(colfin_z)=(colini_z)(colxtabla_z)+(1)-;
!(band_z)5($S,1)>|;
  Ff4; FO(arch_z),w~; (band_z)=($S,1); FP66,60,Enc,Pie;
  (nosaltopag_z)=($S,1);
.
!(html_z)0($S,1)>|;
  GENC_HTML;
|
  !(nosaltopag_z)5($S,1)>|; Ff4; GFONT30; . z0,nosaltopag_z,#;
.
!(aoi_z)0($I,1)>|;
  f4; k2; P;
|
  f4; k1; P;
.
{ n+;
  Ff1; \Imprimiendo:\; ppoblac_ind2,0; l;
  GIMPRI3;
  f4; a;
)
GULIN3;
R;

[SUBENC3;
Ff4;
!(html_z)0($S,1)>|; \<center>\; | GFONT11; GFONT17; .
\Ventas Acumuladas por Poblacion Precio Lista S/Iva Al \;
pfechb_z,+10; \ Pag:\; Fp%d~; 
!(html_z)0($S,1)>|; \<br>\; . l;
!(html_z)0($S,1)>|; \<b>\; | GFONT15; .
Fc40,\TABLA MENSUAL DE VENTAS~; 
!(html_z)0($S,1)>|; \</b></center>\; | GFONT16; GFONT18; GFONT13; . l;
!(html_z)5($S,1)>|; 
  c_22; (ii_z)=(colini_z); 
  { !(ii_z)1(colfin_z)>+; c_14; (ii_z)=(ii_z)(1)+; ) 
  !(mitabla_z)0(ntablas_z)>|; c_14; . l;
.
GINITXTSUBRAYADO; GINITABLA; GINIREN; 
GINICOLENC; \Poblacion           \; GFINCOLENC;
Ff6; FT; (micol_z)=(1);
{ FG+; !(micol_z)1(colfin_z)>+;
  !(micol_z)3(colini_z)>|;
    Fkubica_z,2; f8; k1; P; n|;.
    Ff4; GINICOLENC; pubica_z,2; s1; pnombre_ubi,10; GFINCOLENC; 
  .
  (micol_z)=(micol_z)(1)+;
  Ff6;
)
Ff4;
!(mitabla_z)0(ntablas_z)>|;
  GINICOLENC; \     Total   \; GFINCOLENC;
.
GFINREN; GFINTXTSUBRAYADO; l;
R;

[IMPRI3;
Ff4; 
z0,totlis_z,#; (idpob_z)=(idpoblac_ind2); 
GINIREN; GINICOL; ppoblac_ind2,20; GFINCOL;
(micol_z)=(1);
Ff6; FT;
{ FG+;
  !(micol_z)1(colfin_z)>+;
  z0,nommes_z,#; z0,ubica_z,#; Fknommes_z,l; q+,ubica_z,nommes_z,; 
  z0,prelis_ind1,l; f2; k11; P; n|;.
  (totlis_z)=(totlis_z)(prelis_ind1)+;
  !(micol_z)3(colini_z)>|;
    Ff4; 
    GINICOLDER; !(prelis_ind1)5($0)>|; pprelis_ind1,MDS13; | s13; . GFINCOL;
  .
  (micol_z)=(micol_z)(1)+;
  Ff6;
)
Ff4; 
!(mitabla_z)0(ntablas_z)>|;
  GINICOLDER; ptotlis_z,MDS13; GFINCOL;
.
GFINREN; l;
R;

[ULIN3;
Ff4; 
z0,totlis_z,#; (idpob_z)=(idpoblac_ind2); 
GINITXTSUBRAYADO; GINIREN; GINICOL;
\    Total General   \; GFINCOL;
(micol_z)=(1);
Ff6; FT;
{ FG+; !(micol_z)1(colfin_z)>+;
  z0,nommes_z,#; z0,ubica_z,#; Fknommes_z,l; q+,ubica_z,nommes_z,; 
  z0,prelis_ind1,l; f2; k12; P; n|;.
  !(micol_z)3(colini_z)>|;
    Ff4; 
    GINICOLDER; !(prelis_ind1)5($0)>|; pprelis_ind1,MDS13; | s13; . GFINCOL;
  .
  (micol_z)=(micol_z)(1)+;
  (totlis_z)=(totlis_z)(prelis_ind1)+;
  Ff6;
)
Ff4; 
!(mitabla_z)0(ntablas_z)>|;
  GINICOLDER; ptotlis_z,MDS13; GFINCOL;
.
GFINREN; GFINTABLA; GFINTXTSUBRAYADO; l;
R;

[ACUMULALOS;
f1; k2; P$;
f5; k1; P;
{ n+;
  Ff1; \Leyendo y Acumulando:\; pidpob_ind5,MLS4; s1;
  pqom_ind5,0; s1; pubiage_ind5,0; s1; pticte_ind5,0; l;
  z0,idacum_ind6,l; f6; k1; P; n|;. (idacum_z)=(idacum_ind6)(1)+;
  z0,idacumpob_apb,l;
  (idacumpob_apb)=(idacum_z); (perio_apb)=(periofin_z); 
  (idpob_apb)=(idpob_ind5);
  (voc_apb)=($V,1); (qom_apb)=(qom_ind5,#); (ubica_apb)=(ubiage_ind5,#);
  (ticte_apb)=(ticte_ind5,#); (status_apb)=(status_ind5,#);
  (letras_apb)=(letras_ind5); (enganc_apb)=(enganc_ind5);
  (servic_apb)=(servic_ind5); (totfact_apb)=(cargos_ind5);
  (precon_apb)=(prelista_ind5); (comisi_apb)=(comisi_ind5);
  (cojepa_apb)=(cojepa_ind5); (cia_apb)=(cia_z);
  f1; k4; P$;
  f5; a;
)
R;

[NOPDAGF1; GST; `7; \No pude agregar registro en acumpob...\; Z1; R;

[Enc;
Ff3; FT; FGNodatos; GFONT14; Ff4; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \acumpob \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; GFONT12; l;
*
!(coa_z)0($A,1)>|; Fc80,\VENTAS DE CONTADO~; .
!(coa_z)0($C,1)>|; Fc80,\VENTAS DE CREDITO~; .
!(coa_z)0($T,1)>|; Fc80,\VENTAS DE CONTADO y CREDITO~; .
l;
*
!(enc_z)0($1)>|; GSUBENC1; .
!(enc_z)0($2)>|; GSUBENC2; .
!(enc_z)0($3)>|; GSUBENC3; .
!(enc_z)0($4)>|; GSUBENC4; .
Ft;

[Pie;
Ff4; 
!(enc_z)0($1)>|; GSACALIN; .
!(enc_z)0($2)>|; GSACALIN2; .
Fe;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

#isacaf.i;
#iimpri.i;
#i/programas/lib/sacanommes.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *

f1; #icar_acumpob.i;
k0; ot,"car_acumpob",;
k2; kq,"delete from car_acumpob where perio = ? and cia=?",
	periofin_z,cia_z,;
k4; kq,"insert into car_acumpob (idacumpob,perio,idpob,voc,ubica,qom,ticte,
	status,letras,enganc,servic,totfact,precon,comisi,cojepa,cia)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idacumpob_apb,perio_apb,idpob_apb,voc_apb,#,1,ubica_apb,#,1,
        qom_apb,#,1,ticte_apb,#,1,status_apb,#,1,letras_apb,enganc_apb,
        servic_apb,totfact_apb,precon_apb,comisi_apb,cojepa_apb,cia_apb,;

f2; M
	prelis_ind1		d,
	totfac_ind1		d,
	tam_ind1		s0,;
k0; ot,"cartapro",;
k1; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte <> 'FI' and ticte <> 'FN' and ticte <> 'IM' and ubica <> 'CA' and cia=?",
        idpob_z,perioini_z,periofin_z,cia_z,;
k2; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte <> 'FI' and ticte <> 'FN' and ticte <> 'IM' and ubica = 'CA' and cia=?",
        idpob_z,perioini_z,periofin_z,cia_z,;
k4; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte = ? and cia=?",
        idpob_z,perioini_z,periofin_z,ticte_z,#,1,cia_z,;
k5; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte <> 'FI' and ticte <> 'FN' and ticte <> 'IM' and qom='C' and cia=?",
        idpob_z,perioini_z,periofin_z,cia_z,;
k6; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte <> 'FI' and ticte <> 'FN' and ticte <> 'IM' and ubica <> 'CA' and cia=?",
        idpob_z,anuini_z,periofin_z,cia_z,;
k7; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte <> 'FI' and ticte <> 'FN' and ticte <> 'IM' and ubica = 'CA' and cia=?",
        idpob_z,anuini_z,periofin_z,cia_z,;
k9; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte = ? and cia=?",
        idpob_z,anuini_z,periofin_z,ticte_z,#,1,cia_z,;
k10; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte <> 'FI' and ticte <> 'FN' and ticte <> 'IM' and qom='C' and cia=?",
        idpob_z,anuini_z,periofin_z,cia_z,;
k11; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and ubica=? and perio = ? and cia=?",
        idpob_z,ubica_z,#,1,perioini_z,cia_z,;
k12; kq,"select sum(precon), sum(totfact) from car_acumpob
	where ubica=? and perio = ? and cia=?",
        ubica_z,#,1,perioini_z,cia_z,;
k13; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte <> 'FI' and ticte <> 'FN' and ticte <> 'IM' 
        and ubica <> 'CA' and cia=? and qom <> 'C' and ubica=?",
        idpob_z,perioini_z,periofin_z,cia_z,ubica_z,#,1,;
k14; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte <> 'FI' and ticte <> 'FN' and ticte <> 'IM' 
        and ubica <> 'CA' and cia=? and qom = 'C' and ubica=?",
        idpob_z,perioini_z,periofin_z,cia_z,ubica_z,#,1,;
k15; kq,"select sum(precon), sum(totfact) from car_acumpob
	where idpob=? and perio between ? and ?
        and ticte = ? and cia=? and ubica=?",
        idpob_z,perioini_z,periofin_z,ticte_z,#,1,cia_z,ubica_z,#,1,;


f4; M
	poblac_ind2		s26,
	idpoblac_ind2		l,
        totfac_ind2		d,
	tam_ind2		s0,;
k0; ot,"clientes",;
k1; kq,"select a.nombre, a.numero, sum(precon) as tfac
	from poblacs a join car_acumpob b on a.numero = b.idpob
        where perio between ? and ? and cia=? group by a.nombre, a.numero",
        perioini_z,periofin_z,cia_z,;
k2; kq,"select cast( descri as varchar(25) ) as poblac, idfac, total
	from renfacmentmp order by total desc",;
k3; kq,"delete from renfacmentmp",;
k4; kq,"insert into renfacmentmp ( idfac, descri, total )
	select a.numero, a.nombre, sum(precon) as tfac
	from poblacs a join car_acumpob b on a.numero = b.idpob
        where perio between ? and ? and cia=? group by a.nombre, a.numero",
        perioini_z,periofin_z,cia_z,;


f5; M
	idpob_ind5		l,
        ubiage_ind5		s3,
        qom_ind5       		s2,
        ticte_ind5     		s3,
        status_ind5		s2,
        letras_ind5		i,
        enganc_ind5		d,
        servic_ind5		d,
        cargos_ind5		d,
        prelista_ind5		d,
        comisi_ind5		d,
        cojepa_ind5		d,
        tam_ind5		s0,;
k0; ot,"clientes",;
k1; kq,"select b.numero, ubiage, qom, ticte, status, nulet1 as letras,
	sum(enganc), sum(servic), sum (cargos), sum(precon),
       	sum(comisi+comis2), sum(cojepa)
        from clientes a join poblacs b on a.poblac = b.nombre
        where fechavta between ? and ? and a.tienda between ? and ?
        group by b.numero, ubiage, qom, ticte, status, letras",
        fecini_z,#,3,fecfin_z,#,3,prtda_z,ultda_z,;

f6; M
	idacum_ind6		l,
        tam_ind6		s0,;
k0; ot,"car_acumpob",;
k1; kq,"select max(idacumpob) from car_acumpob where idacumpob > 0",;

f7; M
	ubica_ind7		s3,
        precon_ind7		d,
        totfac_ind7		d,
        tam_ind7		s0,;
k0; ot,"car_acumpob",;
k1; kq,"select ubica, sum(precon), sum(totfact) from car_acumpob
	where perio = ? and cia=? group by ubica",
        perioini_z,cia_z,;

f8; #iubivta.i;
k0; ot,"ubivta",;
k1; kp,"codcar='00' and ubica=?",ubica_z,#,1,;

f9; M
	ubica_ind9		s3,
        poblac_ind9		s26,
        idpoblac_ind9		l,
        precon_ind9		d,
        totfac_ind9		d,
        tam_ind9		s0,;
k0; ot,"car_acumpob",;
k1; kq,"select b.ubica,a.nombre, a.numero, sum(precon) as tfac
	from poblacs a join car_acumpob b on a.numero = b.idpob
        where perio between ? and ? and cia=? and ubica <> 'CA'
        group by ubica, a.nombre, a.numero",
        perioini_z,periofin_z,cia_z,;


f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;
#i/programas/lib/fechas.i;
#i/programas/lib/htmlotxt.i;

[PAN; 
Ff1; Gtomamaxrc; Gdefine_colores; Gamarillo_negro; GST; tf; #iprog1.i;
^=direc_z,#); z0,modul_z,#;
(modul_z)=($Acumulado x Poblacion,21); (modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
