* Programa que genera el reporte del informe de ventas brutas por zona
  DRBR 13-Mar-1993
  ---------------------------------------------------------------------
  Modificado para que tome las fechas de acumulados del acumulao.r
  DRBR 18-Ago-1993
*

#dMDS10 %,10.2f~; #dMDSF %5.2f~; #dMDS14 %,14.2f~;
#dMIS2 %02d~;

f0; M
        version_z		s21,
	maxcol_z		i,
        maxrow_z		i,
        renst_z			i,
        sff_z			s2,
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
	milin_z        s100,
	impre_z			i,
	font_z			i,
	micar_z			s3,
	carac_z			i,
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	bandimp_z		s3,
	html_z		s3,
        tipocar_z		s2,

	ter_z            	s2,
	esoferta_z            	s2,
	properac_z            	s2,
	uloperac_z            	s2,
	tiplazo_z		s2,
	antzon_z         	s3,
        subzona_z		s4,
	fech8_z           	D,
	fech9_z     {
	  dias_z        	s16,
	  hora_z         	s5,
	  resto_z        	s5,
	            }
	fecha_z           	D,
	fechb_z           	D,
        fechmai_z		D,
        fechmaf_z		D,
        fechaai_z		D,
        fechaaf_z		D,
        fechf_z			D,
        fechg_z			D,
        fechh_z			D,
        fechi_z			D,
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
        fecsig_z	{
          fecsigaa_z		i,
          fecsigmm_z		i,
          fecsigdd_z		i,
        		}
        fecacuini_z	{
          fecacuiniaa_z		i,
          fecacuinimm_z		i,
          fecacuinidd_z		i,
        		}
        fecacufin_z	{
          fecacufinaa_z		i,
          fecacufinmm_z		i,
          fecacufindd_z		i,
        		}
        ult_z			i,
        iii_z			i,
        linenc_z		s100,
        prmegazona_z		s3,
        ulmegazona_z		s3,
        megazona_z		s3,
        antmegazona_z		s3,
        saltop_z		s2,
	ploc_z			s2,
	mibd_z			s80,
	voc_z			s2,
	vtacon_z          d,
	vtaofe_z          d,
	vtacrd_z          d,
	vtctopl_z		d,
	vtlarpl_z		d,
	vtctoplz_z		d,
	vtlarplz_z		d,
	vtctoplt_z		d,
	vtlarplt_z		d,
	vtaofer_z          d,
	vtabru_z          d,
	vtabruz_z         d,
	vtaconz_z         d,
	vtaofez_z          d,
	vtacrdz_z         d,
	vtabrut_z         d,
	vtacont_z         d,
	vtacrdt_z         d,
	vtacrdmz_z		d,
	vtaconmz_z		d,
	vtaofemz_z          d,
	vtctoplmz_z		d,
	vtlarplmz_z		d,
	porc1_z           d,
	porc2_z           d,
	porc3_z           d,
	porc4_z           d,
	porc5_z           d,
        fechd_z			D,
        feche_z			D,
        tasiva_z		s5,
        piva1_z			d,
        piva2_z			d,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	ii_z			i,
	tam0             s0,;
mtam0&; 
* ------------ Control d Versiones
  Version 2.03 FD
  08-Abr-2016 Modificado para agregar division de Contado y Ofertas
  y elimino columna Cred.Largo.Plazo
  -----------------------------------
  Version 2.02 EA
  05/Feb/2015 Modificado para agregar division de MegaZonas
  -----------------------------------
*
q+,version_z,"V:2.02 EA",;
tr; 
Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1;
(impre_z)=(1); 
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
GPAN; GABRE_TABLA; GTOMA_PARAMETROS; 
(arch_z)=($vtacyc00.tex,12);
!(html_z)0($S,1)>|;
  (arch_z)=($vtacyc0.html,12);
|
  (arch_z)=($vtacyc00.tex,12);
.

(tasiva_z)=($XX,2); (ploc_z)=($L,1); (voc_z)=($V,1); (tipocar_z)=($T,1);

&a; &cfeche_z; qD,2,fecult_z,feche_z,;
(fecultdd_z)=(1); qD,1,fecult_z,feche_z,; (feche_z)=(feche_z)(86400)-;
qD,2,fecult_z,feche_z,; (fecultdd_z)=(1); qD,1,fecult_z,fechd_z,;

[fei; t@5,3; \Fecha Inicial : \; t0Fin; (fecha_z)=(fechd_z);
t@5,23; ifecha_z,+10; !(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
[feu; t@5,40; \Fecha Final   : \; t0fei; (fechb_z)=(feche_z);
t@5,63; ifechb_z,+10; !(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
[loc; t@6,3; \Acumulados de Precio `L`ista o `C`redito ? <L/C>:\; t0feu;
iploc_z,1; !(ploc_z)5($L,1)(ploc_z)5($C,1)&>loc;
[voc; t@7,3; \Reporte de `V`entas o `C`ancelaciones <V/C> :\; t0loc;
ivoc_z,1; !(voc_z)5($V,1)(voc_z)5($C,1)&>voc;
!(voc_z)0($C,1)>|; (voc_z)=($c,1); .
[tiv; t@8,3; \Ventas de Iva al (XX es total):\; t0loc; itasiva_z,2;
!(tasiva_z)0($XX,2)>|;
  (piva1_z)=(0); (piva2_z)=(100);
|
  >sdtasiva_z,#,piva1_z; (piva2_z)=(piva1_z);
.

(fecsig_z)=(fecini_z,#); GPRIMERO_DE_MES_ANTER; qD,1,fecsig_z,fechf_z,;
(fecsig_z)=(fecult_z,#); GULTIMO_DE_MES_ANTER;  qD,1,fecsig_z,fechg_z,;
(fecsig_z)=(fecini_z,#); (fecsigaa_z)=(fecsigaa_z)(1)-;
qD,1,fecsig_z,fechh_z,;
(fecsig_z)=(fecult_z,#); (fecsigaa_z)=(fecsigaa_z)(1)-; 
GULTIMO_DE_MES; qD,1,fecsig_z,fechi_z,;

[mai; t@9,3; \Inicial Mes Ant:\; t0tiv; (fechmai_z)=(fechf_z);
t@9,23; ifechmai_z,+10; !(fechmai_z)0($-1)>mai;
[maf; t@9,40; \Final   Mes Ant:\; t0mai; (fechmaf_z)=(fechg_z);
t@9,60; ifechmaf_z,+10; !(fechmaf_z)0($-1)>maf;
[aai; t@10,3; \Inicial Anu Ant:\; t0maf; (fechaai_z)=(fechh_z);
t@10,23; ifechaai_z,+10; !(fechaai_z)0($-1)>aai;
[aaf; t@10,40; \Final   Anu Ant:\; t0aai; (fechaaf_z)=(fechi_z);
t@10,60; ifechaaf_z,+10; !(fechaaf_z)0($-1)>aaf;
[prm; t@11,3; \Mega Zona Inicial:\; t0aaf; iprmegazona_z,2;
[ulm; t@11,40; \Mega Zona Final:\; t0prm; iulmegazona_z,2;
[slp; t@12,3; \Deseas Salto de Pagina x Megazona ? <S/N>:\; t0ulm;
isaltop_z,1; !(saltop_z)5($S,1)(saltop_z)5($N,1)&>slp;

GST; \Estan correctos los datos ? <S/N> : \; y|; | gfeu; .
GGRABA_PARAMETROS;
GHAZ_REPORTE;
gFin;

[TOMA_PARAMETROS;
x echo 1 >>.vtacyc.ini ~;
(ii_z)=(1);
Ff5; FO.vtacyc.ini~,r~;
{ FG+;
  z0,milin_z,#; Fkmilin_z,l; 
  !(ii_z)0($1)>|; (ploc_z)=(milin_z,1);        .
  !(ii_z)0($2)>|; (voc_z)=(milin_z,1);         .
  !(ii_z)0($3)>|; (tasiva_z)=(milin_z,4);      .
  !(ii_z)0($4)>|; (prmegazona_z)=(milin_z,2);  .
  !(ii_z)0($5)>|; (ulmegazona_z)=(milin_z,2);  .
  !(ii_z)0($6)>|; (saltop_z)=(milin_z,1);      .
  (ii_z)=(ii_z)(1)+;
)
[listos_parametros; Ff5; FC; Ff1;
R;

[GRABA_PARAMETROS;
tc;
Ff5; FO.vtacyc.ini~,w~;
pploc_z,0; l;
pvoc_z,0; l;
ptasiva_z,0; l;
pprmegazona_z,0; l;
pulmegazona_z,0; l;
psaltop_z,0; l;
Ff5; FC; tr; Ff1;
R;

[HAZ_REPORTE;
GST; \Primero se Recorren las Tiendas para determinar el total ...\;
tS1,0,0,23,80; tc;
f3; k1; P;
{ n+;
  Ff1; \Leyendo :\; pmegazona_ind1,0; s1; pzona_ind1,0; s1; psubzona_ind1,0; l;
  (antzon_z)=(zona_ind1,#); (subzona_z)=(subzona_ind1,#);
  (tiplazo_z)=($C,1); z0,prelis_ind2,l; f4; k1; P; n|;.
  !(ploc_z)0($C,1)>|;
    (vtacrd_z)=(vtacrd_z)(totfac_ind2)+;
    (vtctopl_z)=(totfac_ind2);
  |
    (vtacrd_z)=(vtacrd_z)(prelis_ind2)+;
    (vtctopl_z)=(prelis_ind2);
  .
  (vtctoplt_z)=(vtctoplt_z)(vtctopl_z)+;
  (tiplazo_z)=($L,1); z0,prelis_ind2,l; f4; k1; P; n|;.
  !(ploc_z)0($C,1)>|;
    (vtacrd_z)=(vtacrd_z)(totfac_ind2)+;
    (vtlarpl_z)=(totfac_ind2);
  |
    (vtacrd_z)=(vtacrd_z)(prelis_ind2)+;
    (vtlarpl_z)=(prelis_ind2);
  .
  (vtlarplt_z)=(vtlarplt_z)(vtlarpl_z)+;

  (esoferta_z)=($S,1);
  z0,prelis_ind2,l; f4; k2; P; n|;.
  !(ploc_z)0($C,1)>|;
    (vtaofe_z)=(vtaofe_z)(totfac_ind2)+;
  |
    (vtaofe_z)=(vtaofe_z)(prelis_ind2)+;
  .
  
  (esoferta_z)=($N,1);
  z0,prelis_ind2,l; f4; k2; P; n|;.
  !(ploc_z)0($C,1)>|;
    (vtacon_z)=(vtacon_z)(totfac_ind2)+;
  |
    (vtacon_z)=(vtacon_z)(prelis_ind2)+;
  .

  f3; a;
)
(vtabru_z)=(vtacon_z)(vtctoplt_z)+(vtlarplt_z)+(vtaofe_z)+;
Ff1; \Vtacon:\; pvtacon_z,MDS14; 
\ VtaOfe:\; pvtaofe_z,MDS14;
\ VtaCtoPlt:\; pvtctoplt_z,MDS14; l;
Ff1; \Ahora se genera el reporte ...\; l;
z0,megazona_ind1,l; f3; k1; P; n|;.
(antmegazona_z)=(megazona_ind1,#); (antzon_z)=(zona_ind1,#);
Ff4; FO(arch_z),w~; GFONT34; FP66,60,Enc,Pie;
f3; k1; P;
{ n+;
  Ff1; \Imprimo :\; pmegazona_ind1,0; s1; pzona_ind1,0; s1; psubzona_ind1,0; l;
  !(megazona_ind1)5(antmegazona_z,#)>|;
     GSUBTZON; GSUBT_MEGAZONA;
     (antmegazona_z)=(megazona_ind1,#);  (antzon_z)=(zona_ind1,#); 
     !(saltop_z)0($S,1)>|; GSALTO_PAGINA; | GSUBENC_MEGAZONA; .
  .  
  !(zona_ind1)5(antzon_z,#)>|; GSUBTZON; (antzon_z)=(zona_ind1,#); GSUBENC; .
  GIMPRI;
  f3; a;
)
GSUBTZON; GSUBT_MEGAZONA;
!(saltop_z)0($S,1)>|; GSALTO_PAGINA; .
GULIN; Ff4; FC; Ff1; tf; tr; tS0; GSalir;
gFin;



[Enc; GENCAB; Ft;

[ENCAB;
Ff3; FT; FGNodatos; Ff4; 
GINIHTML; GFONT11; GINICENTRADO; Fc80,3; GSALTO_LINEA; Ff3; FGNodatos; Ff4;
(ii_z)=(-1); GINIFONTSIZE; 
GINITXTCONDENSADO; \vtacyc \; GFINTXTCONDENSADO; GFINFONT; 
&a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; GSALTO_LINEA; 
GINITXTDOBLEANCHO; (ii_z)=(1); GINIFONTSIZE; 
Fc40,\INFORME DIRECCION~; 
GINITXTDOBLEANCHO; GSALTO_LINEA; 

z0,linenc_z,#; q+,linenc_z,"ACUMULADOS DE ",;
!(voc_z)0($V,1)>|; 
  q+,linenc_z,"VENTAS ",;
|
  q+,linenc_z,"CANCELACIONES ",;
.

!(tasiva_z)0($XX,1)>|;
  q+,linenc_z,"TODAS TASAS DE IVA",;
|
  q+,linenc_z,"IVA Al ",tasiva_z,;
.
GININEGRILLA;
Fslexten_z,linenc_z; (esp_z)=(80)(exten_z)-(2)/;
sesp_z; plinenc_z,0; GININEGRILLA; GSALTO_LINEA;

GINITXTDOBLEANCHO; (ii_z)=(1); GINIFONTSIZE; 
s4;
!(voc_z)0($V,1)>|; 
  \VENTAS DEL \;
|
  \CANCELACIONES DEL \;
.
pfecha_z,+8; \ AL \; pfechb_z,+8; 
GFINTXTDOBLEANCHO; GFINFONT; GSALTO_LINEA;

GINITXTDOBLEANCHO; (ii_z)=(1); GINIFONTSIZE; 
!(voc_z)0($V,1)>|; 
  Fc50,\INFORME DE VENTAS~;
|
  Fc50,\INFORME DE CANCELACIONES~;
.
GFINTXTDOBLEANCHO; GFINFONT; GSALTO_LINEA;

GINITXTDOBLEANCHO; (ii_z)=(1); GINIFONTSIZE; 
Fc30,\ACUMULADOS EN PRECIO ~;
!(ploc_z)0($L,1)>|; \ LISTA \; | \CREDITO\; . 
GFINTXTDOBLEANCHO; GININEGRILLA; GFINFONT; GSALTO_LINEA;
!(voc_z)0($V,1)>|; 
  \RESULTADOS DE VENTAS \;
|
  \RESULTADOS DE CANCELACIONES \;
.
\A CONTADO Y A CREDITO\; GFINNEGRILLA; GINITXTCONDENSADO; 
GSALTO_LINEA;

\VENTAS DE MEGAZONA:\; pprmegazona_z,0; s1; 
(megazona_z)=(prmegazona_z,#); 
z0,nombre_ind3,l; f5; k3; P; n|;. pnombre_ind3,0;
!(prmegazona_z)5(ulmegazona_z,#)>|;
  \ A Megazona:\; pulmegazona_z,0; s1;
  (megazona_z)=(ulmegazona_z,#); 
   z0,nombre_ind3,l; f5; k3; P; n|;. pnombre_ind3,0;
.
GSALTO_LINEA;
GINITABLA;
GSUBENC_TABLA;
GSUBENC_MEGAZONA;
R;

[SUBENC_TABLA;
Ff4; 
s4; GINIREN; GINITXTREN; 
GINICOL; GESPACIOS; s16;
!(voc_z)0($V,1)>|; 
   \Ventas Brutas-\;
|
   \Cancelaciones-\;
.
GFINCOL;
GINICOL; \  %  \; GFINCOL;
!(voc_z)0($V,1)>|;
  GINICOL; \-- Contado ---\; GFINCOL; 
  GINICOL; \  %  \; GFINCOL;
  GINICOL; \--- Oferta ---\; GFINCOL; 
  GINICOL; \  %  \; GFINCOL;
.
GINICOL; \Cred.Corto Pzo\; GFINCOL; 
GINICOL; \  %  \; GFINCOL;
!(voc_z)0($c,1)>|;
  GINICOL; \Cred.Largo Pzo\; GFINCOL; 
  GINICOL; \  %  \; GFINCOL;
.
GFINREN;
l;
R;

[Pie; Fe;

[SUBENC_MEGAZONA;
(megazona_z)=(antmegazona_z,#);
f5; k3; P; n|; GNOZONA; .
Ff4; s4; 
GINIREN; GININEGRILLA; GINICOL; 
\Megazona:\; pmegazona_z,0; s1; pnombre_ind3,0; 
GFINNEGRILLA; GFINCOL; GFINREN; l;
GSUBENC;
R;

[SUBENC;
f1; k1; P; n|; GNOZONA; .
Ff4; s4; 
GINIREN; GININEGRILLA; GINICOL; 
pantzon_z,0; s1; pnombre_zon,0; 
GFINNEGRILLA; GINICOL; GFINREN; l;
R;

[IMPRI;
(antzon_z)=(zona_ind1,#); (subzona_z)=(subzona_ind1,#);
(tiplazo_z)=($C,1); z0,prelis_ind2,l; f4; k1; P; n|;.
!(ploc_z)0($C,1)>|;
  (vtacrdt_z)=(totfac_ind2)+;
|
  (vtacrdt_z)=(prelis_ind2)+;
.
(vtctopl_z)=(vtacrdt_z);
(tiplazo_z)=($L,1); z0,prelis_ind2,l; f4; k1; P; n|;.
!(ploc_z)0($C,1)>|;
  (vtacrdt_z)=(totfac_ind2)+;
|
  (vtacrdt_z)=(prelis_ind2)+;
.
(vtlarpl_z)=(vtacrdt_z); 
(vtacrdt_z)=(vtctopl_z)(vtlarpl_z)+;
(esoferta_z)=($S,1);
z0,prelis_ind2,l; f4; k2; P; n|;.
!(ploc_z)0($C,1)>|;
  (vtaofer_z)=(totfac_ind2)+;
|
  (vtaofer_z)=(prelis_ind2)+;
.
(esoferta_z)=($N,1);
z0,prelis_ind2,l; f4; k2; P; n|;.
!(ploc_z)0($C,1)>|;
  (vtacont_z)=(totfac_ind2)+;
|
  (vtacont_z)=(prelis_ind2)+;
.

(vtabrut_z)=(vtacrdt_z)(vtacont_z)+(vtaofer_z)+;
z0,porc1_z,#; z0,porc2_z,#; z0,porc3_z,#;
!(vtabru_z)5($0)>|; (porc3_z)=(vtabrut_z)(vtabru_z)/(100)*; .
!(vtabrut_z)5($0)>|;
  (porc1_z)=(vtacont_z)(vtabrut_z)/(100)*;
  (porc2_z)=(vtctopl_z)(vtabrut_z)/(100)*;
  (porc5_z)=(vtlarpl_z)(vtabrut_z)/(100)*;
  (porc4_z)=(vtaofer_z)(vtabrut_z)/(100)*;
.
f5; k1; P; n|; f5; k2; P; n|;. .
Ff4; s4; 
GINIREN; GINITXTREN; 
GINICOLDER; pnombre_ind3,15; GFINCOL;
GINICOLDER; pvtabrut_z,MDS14; GFINCOL; 
GINICOLDER; pporc3_z,MDSF; GFINCOL;
!(voc_z)0($V,1)>|; 
  GINICOLDER; pvtacont_z,MDS14; GFINCOL; 
  GINICOLDER; pporc1_z,MDSF; GFINCOL;
  GINICOLDER; pvtaofer_z,MDS14; GFINCOL; 
  GINICOLDER; pporc4_z,MDSF; GFINCOL;
.
GINICOLDER; pvtctopl_z,MDS14; GFINCOL; 
GINICOLDER; pporc2_z,MDSF; GFINCOL;
!(voc_z)0($c,1)>|; 
  GINICOLDER; pvtlarpl_z,MDS14; GFINCOL; 
  GINICOLDER; pporc5_z,MDSF; GFINCOL;
.
GFINREN;
l;
(vtacrdz_z)=(vtacrdz_z)(vtctopl_z)+(vtlarpl_z)+;
(vtaconz_z)=(vtaconz_z)(vtacont_z)+;
(vtaofez_z)=(vtaofez_z)(vtaofer_z)+;
(vtctoplz_z)=(vtctoplz_z)(vtctopl_z)+;
(vtlarplz_z)=(vtlarplz_z)(vtlarpl_z)+;
R;

[CORTE_LIN_TXT;
s21;
c-14; s1; c-5; s1; 
!(voc_z)0($V,1)>|;
  c-14; s1; c-5; s1; 
  c-14; s1; c-5; s1;
. 
!(voc_z)0($c,1)>|; 
  c-14; s1; c-5; s1;
.
c-14; s1; c-5; l;
R;

[SUBTZON;
(vtabruz_z)=(vtaconz_z)(vtaofez_z)+(vtctoplz_z)+(vtlarplz_z)+;
Ff4;
!(html_z)5($S,1)>|; GCORTE_LIN_TXT; .
!(vtabruz_z)5($0)>|; 
  (porc1_z)=(vtaconz_z)(vtabruz_z)/(100)*; 
  (porc2_z)=(vtctoplz_z)(vtabruz_z)/(100)*;
  (porc4_z)=(vtaofez_z)(vtabruz_z)/(100)*;
  (porc5_z)=(vtlarplz_z)(vtabruz_z)/(100)*;
.
s4; GINIREN; GINITXTREN;
GINICOL; \Total de Zona  \; GFINCOL;
GINICOLDER; pvtabruz_z,MDS14; GFINCOL; 
GINICOLDER; s5; GESPACIOS; GFINCOL;
!(voc_z)0($V,1)>|; 
  GINICOLDER; pvtaconz_z,MDS14; GFINCOL; 
  GINICOLDER; s5; GESPACIOS; GFINCOL; 
  GINICOLDER; pvtaofez_z,MDS14; GFINCOL;
  GINICOLDER; s5; GESPACIOS; GFINCOL;
. 
GINICOLDER; pvtctoplz_z,MDS14; GFINCOL;
GINICOLDER; s5; GESPACIOS; GFINCOL; 
!(voc_z)0($c,1)>|; 
  GINICOLDER; pvtlarplz_z,MDS14; GFINCOL;
  GINICOLDER; s5; GESPACIOS; GFINCOL;
.
* GINICOLDER; pvtlarplz_z,MDS14; GFINCOL; *
GFINREN;
l;
z0,porc1_z,#; z0,porc2_z,#; z0,porc3_z,#; z0,porc5_z,#; z0,porc4_z,#;
!(vtabru_z)5($0)>|; (porc1_z)=(vtabruz_z)(vtabru_z)/(100)*; .
!(vtacon_z)5($0)>|; (porc2_z)=(vtaconz_z)(vtacon_z)/(100)*; .
!(vtaofe_z)5($0)>|; (porc4_z)=(vtaofez_z)(vtaofe_z)/(100)*; .
!(vtctoplt_z)5($0)>|; (porc3_z)=(vtctoplz_z)(vtctoplt_z)/(100)*; .
!(vtlarplt_z)5($0)>|; (porc5_z)=(vtlarplz_z)(vtlarplt_z)/(100)*; . 
s4; GINIREN; GINITXTREN;
GINICOL;    \Porcen. S/Total\; GFINCOL;
GINICOLDER; s14; GESPACIOS; GFINCOL; 
GINICOLDER; pporc1_z,MDSF; GFINCOL;
!(voc_z)0($V,1)>|;
  GINICOLDER; s14; GESPACIOS; GFINCOL; 
  GINICOLDER; pporc2_z,MDSF; GFINCOL; 
  GINICOLDER; s14; GESPACIOS; GFINCOL; 
  GINICOLDER; pporc4_z,MDSF; GFINCOL;
.
GINICOLDER; s14; GESPACIOS; GFINCOL; 
GINICOLDER; pporc3_z,MDSF; GFINCOL; 
!(voc_z)0($c,1)>|;
  GINICOLDER; s14; GESPACIOS; GFINCOL; 
  GINICOLDER; pporc5_z,MDSF; GFINCOL; 
.
GSALTO_LINEA; GFINREN; 
l;
(vtacrdmz_z)=(vtacrdmz_z)(vtacrdz_z)+;     z0,vtacrdz_z,#; 
(vtaconmz_z)=(vtaconmz_z)(vtaconz_z)+;     z0,vtaconz_z,#;
(vtaofemz_z)=(vtaofemz_z)(vtaofez_z)+;     z0,vtaofez_z,#;
(vtctoplmz_z)=(vtctoplmz_z)(vtctoplz_z)+;  z0,vtctoplz_z,#; 
(vtlarplmz_z)=(vtlarplmz_z)(vtlarplz_z)+;  z0,vtlarplz_z,#;
R;

[SUBT_MEGAZONA;
(vtabruz_z)=(vtaconmz_z)(vtctoplmz_z)+(vtlarplmz_z)+(vtaofemz_z)+;
Ff4;
!(html_z)5($S,1)>|; GCORTE_LIN_TXT; . 
!(vtabruz_z)5($0)>|; 
  (porc1_z)=(vtaconmz_z)(vtabruz_z)/(100)*; 
  (porc2_z)=(vtctoplmz_z)(vtabruz_z)/(100)*; 
  (porc4_z)=(vtaofemz_z)(vtabruz_z)/(100)*; 
  (porc5_z)=(vtlarplmz_z)(vtabruz_z)/(100)*; 
.
s4; GINIREN; GINITXTREN;
GINICOL; \Total MegaZona \; GFINCOL;
GINICOLDER; pvtabruz_z,MDS14; GFINCOL;
GINICOLDER; s5; GESPACIOS; GFINCOL; 
!(voc_z)0($V,1)>|; 
  GINICOLDER; pvtaconmz_z,MDS14;  GFINCOL; 
  GINICOLDER; pporc1_z,MDSF;  GFINCOL; 
  GINICOLDER; pvtaofemz_z,MDS14; GFINCOL; 
  GINICOLDER; pporc4_z,MDSF;  GFINCOL;
.
GINICOLDER; pvtctoplmz_z,MDS14; GFINCOL; 
GINICOLDER; pporc2_z,MDSF;  GFINCOL;
!(voc_z)0($c,1)>|; 
  GINICOLDER; pvtlarplmz_z,MDS14; GFINCOL; 
  GINICOLDER; pporc5_z,MDSF;  GFINCOL;
.
GFINREN;
l;
z0,porc1_z,#; z0,porc2_z,#; z0,porc3_z,#; z0,porc4_z,#; z0,porc5_z,#;
!(vtabru_z)5($0)>|; (  porc1_z)=(vtabruz_z)(vtabru_z)/(100)*;     .
!(vtacon_z)5($0)>|;   (porc2_z)=(vtaconmz_z)(vtacon_z)/(100)*;    .
!(vtctoplt_z)5($0)>|; (porc3_z)=(vtctoplmz_z)(vtctoplt_z)/(100)*; .
!(vtaofe_z)5($0)>|;   (porc4_z)=(vtaofemz_z)(vtaofe_z)/(100)*;    .
!(vtlarplt_z)5($0)>|; (porc5_z)=(vtlarplmz_z)(vtlarplt_z)/(100)*; .
s4; GINIREN; GINITXTREN;
GINICOL; \Porcen. S/Total\; GFINCOL;
GINICOLDER; s14; GESPACIOS; GFINCOL; 
GINICOLDER; pporc1_z,MDSF; GFINCOL; 
!(voc_z)0($V,1)>|;
  GINICOLDER; s14; GESPACIOS; GFINCOL; 
  GINICOLDER; pporc2_z,MDSF; GFINCOL; 
  GINICOLDER; s14; GESPACIOS; GFINCOL; 
  GINICOLDER; pporc4_z,MDSF; GFINCOL;
.
GINICOLDER; s14; GESPACIOS; GFINCOL; 
GINICOLDER; pporc3_z,MDSF; GFINCOL; 
!(voc_z)0($c,1)>|;
  GINICOLDER; s14; GESPACIOS; GFINCOL; 
  GINICOLDER; pporc5_z,MDSF; GFINCOL; 
.
GFINREN; l; l;
z0,vtacrdmz_z,#;  z0,vtaconmz_z,#;
z0,vtctoplmz_z,#; z0,vtlarplmz_z,#; 
z0,vtaofemz_z,#;
R;

[ULIN;
(ult_z)=(1); GSACA_TOTALES;
qD,2,fecacuini_z,fechmai_z,; qD,2,fecacufin_z,fechmaf_z,;
GACUMULA_TOTALES; (ult_z)=(2); GSACA_TOTALES;
qD,2,fecacuini_z,fechaai_z,; qD,2,fecacufin_z,fechaaf_z,;
GACUMULA_TOTALES; (ult_z)=(3); GSACA_TOTALES;
GFINTABLA; GFINHTML;
R;

[ACUMULA_TOTALES;
(tiplazo_z)=($C,1); z0,prelis_ind2,l; f4; k3; P; n|;.
!(ploc_z)0($C,1)>|;
  (vtacrd_z)=(totfac_ind2)+;
|
  (vtacrd_z)=(prelis_ind2)+;
.
(vtctoplt_z)=(vtacrd_z);
(tiplazo_z)=($L,1); z0,prelis_ind2,l; f4; k3; P; n|;.
!(ploc_z)0($C,1)>|;
  (vtacrd_z)=(totfac_ind2)+;
|
  (vtacrd_z)=(prelis_ind2)+;
.
(vtlarplt_z)=(vtacrd_z);

(properac_z)=($O,1); (uloperac_z)=($O,1);
z0,prelis_ind2,l; f4; k4; P; n|;.
!(ploc_z)0($C,1)>|;
  (vtaofe_z)=(totfac_ind2)+;
|
  (vtaofe_z)=(prelis_ind2)+;
.

z0,properac_z,#; (uloperac_z)=($z,1);
z0,prelis_ind2,l; f4; k4; P; n|;.
!(ploc_z)0($C,1)>|;
  (vtacon_z)=(totfac_ind2)+;
|
  (vtacon_z)=(prelis_ind2)+;
.
(vtacon_z)=(vtacon_z)(vtaofe_z)-;
(vtabru_z)=(vtctoplt_z)(vtlarplt_z)+(vtacon_z)+(vtaofe_z)+;
R;

[SACA_TOTALES;
Ff4; s4; 
GINIREN; GINITXTREN; GINITXTSUBRAYADO; GININEGRILLA;
GINICOL; 
!(ult_z)0($1)>|; \ GRAN TOTAL    \; .
!(ult_z)5($1)>|; 
  pfecacuinimm_z,MIS2; \/\; pfecacuiniaa_z,MIS2; \-\;
  pfecacufinmm_z,MIS2; \/\; pfecacufinaa_z,MIS2;
.
GFINCOL;
z0,porc1_z,#; z0,porc2_z,#; z0,porc4_z,#; z0,porc5_z,#;
!(vtabru_z)5($0)>|;
  (porc1_z)=(vtacon_z)(vtabru_z)/(100)*; 
  (porc2_z)=(vtctoplt_z)(vtabru_z)/(100)*;
  (porc4_z)=(vtaofe_z)(vtabru_z)/(100)*;
  (porc5_z)=(vtlarplt_z)(vtabru_z)/(100)*;
.

GINICOLDER; pvtabru_z,MDS14; GFINCOL;
GINICOLDER; s5; GESPACIOS; GFINCOL;
!(voc_z)0($V,1)>|;
  GINICOLDER; pvtacon_z,MDS14; GFINCOL;
  GINICOLDER; pporc1_z,MDSF;     GFINCOL; 
  GINICOLDER; pvtaofe_z,MDS14;   GFINCOL;
  GINICOLDER; pporc4_z,MDSF;     GFINCOL;
.
GINICOLDER; pvtctoplt_z,MDS14; GFINCOL; 
GINICOLDER; pporc2_z,MDSF;     GFINCOL;
!(voc_z)0($c,1)>|;
  GINICOLDER; pvtlarplt_z,MDS14; GFINCOL;
  GINICOLDER; pporc5_z,MDSF;     GFINCOL;
.
GFINNEGRILLA; GFINTXTSUBRAYADO; 
GFINREN; l;
R;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1; 
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #izonas.i;
k0; ot,"zonas",;
k1; kp,"zona = ?",antzon_z,#,1,;

f3; M
	megazona_ind1		s3,
	zona_ind1		s3,
	subzona_ind1		s4,
        prelis_ind1		d,
        totfac_ind1		d,;
k0; ot,"acuvtas",;
k1; kq,"select e.clave, c.zona, subzona, sum(precon), sum(totfact) 
        from acuvtas c
        join car_megazonasdet d on c.zona = d.zona
	join car_megazonas e on d.idmegazona = e.idmegazona
	where voc=? and fecini between ? and ?
        and fecini = convert_date(
          convert_char(Year(fecfin))+ '-' + 
          convert_char(Month(fecfin)) + '-01'
        )
        and voc=?
        and fecfin =  timestampadd(4, -1, timestampadd(6, 1, fecini))
        and e.clave between ? and ?
	group by e.clave,c.zona,subzona",
        voc_z,#,1,fecini_z,#,3,fecult_z,#,3,voc_z,#,1,
        prmegazona_z,#,1,ulmegazona_z,#,1,;

f4; M
	prelis_ind2		d,
        totfac_ind2		d,
	tam_ind2		s0,;
k0; ot,"zontda",;
k1; kq,"select sum(precon), sum(totfact) from car_tipocar a 
	join car_tipocardet b on a.idtipocar = b.idtipocar
	join acuvtas c on b.ticte = c.ticte 
	join car_corlarpzodet d on c.qom=d.qom and c.letras=d.nulets
	join car_corlarpzo    e on d.idcorlarpzo = e.idcorlarpzo
        join car_anuscartera f on d.idanucartera = f.idanucartera and
        ( c.anuvta >= f.anuini and c.anuvta <= f.anufin)
	where
        a.tipocar = ? and c.qom <> 'C' and
	fecini between ? and ? and zona=? and subzona=? 
        and piva between ? and ? and voc=?
        and e.tiplazo=?
        and fecini = convert_date(
          convert_char(Year(fecfin))+ '-' + 
          convert_char(Month(fecfin)) + '-01'
        ) 
        and fecfin =  timestampadd(4, -1, timestampadd(6, 1, fecini))",
	tipocar_z,#,1,fecini_z,#,3,fecult_z,#,3,antzon_z,#,1,subzona_z,#,1,
        piva1_z,piva2_z,voc_z,#,1,tiplazo_z,#,1,;
k2; kq,"select sum(precon), sum(totfact) 
        from car_tipocar a 
	join car_tipocardet b on a.idtipocar = b.idtipocar
	join acuvtas c on b.ticte = c.ticte 
  join cartapro d on c.operac = d.clave 
	where
  a.tipocar = ? and qom = 'C' and d.esoferta = ? and
	fecini between ? and ? and zona=? and subzona=?
        and piva between ? and ? and voc=?
        and fecini = convert_date(
          convert_char(Year(fecfin))+ '-' + 
          convert_char(Month(fecfin)) + '-01'
        ) 
        and fecfin =  timestampadd(4, -1, timestampadd(6, 1, fecini))",
	tipocar_z,#,1,esoferta_z,#,1,fecini_z,#,3,fecult_z,#,3,
  antzon_z,#,1,subzona_z,#,1,
        piva1_z,piva2_z,voc_z,#,1,;
k3; kq,"select sum(precon), sum(totfact) 
        from car_tipocar a 
	join car_tipocardet b on a.idtipocar = b.idtipocar
	join acuvtas c on b.ticte = c.ticte 
	join car_corlarpzodet d on c.qom=d.qom and c.letras=d.nulets
	join car_corlarpzo    e on d.idcorlarpzo = e.idcorlarpzo
        join car_anuscartera f on d.idanucartera = f.idanucartera and
        ( c.anuvta >= f.anuini and c.anuvta <= f.anufin)
	join car_megazonasdet g on c.zona = g.zona
	join car_megazonas h on g.idmegazona = h.idmegazona
	where
        a.tipocar = ? and c.qom <> 'C' and
	fecini between ? and ? and piva between ? and ? and voc=?
	and e.tiplazo=?
        and fecini = convert_date(
          convert_char(Year(fecfin))+ '-' + 
          convert_char(Month(fecfin)) + '-01'
        ) 
        and fecfin =  timestampadd(4, -1, timestampadd(6, 1, fecini))
        and h.clave between ? and ?",
	tipocar_z,#,1,fecacuini_z,#,3,fecacufin_z,#,3,
        piva1_z,piva2_z,voc_z,#,1,tiplazo_z,#,1,
        prmegazona_z,#,1,ulmegazona_z,#,1,;
k4; kq,"select sum(precon), sum(totfact) from car_tipocar a 
	join car_tipocardet b on a.idtipocar = b.idtipocar
	join acuvtas c on b.ticte = c.ticte 
	join car_megazonasdet d on c.zona = d.zona
	join car_megazonas e on d.idmegazona = e.idmegazona
	where
        a.tipocar = ? and qom = 'C' and operac between ? and ? and
	fecini between ? and ? and piva between ? and ? and voc=?
        and fecini = convert_date(
          convert_char(Year(fecfin))+ '-' + 
          convert_char(Month(fecfin)) + '-01'
        ) 
        and fecfin =  timestampadd(4, -1, timestampadd(6, 1, fecini))
        and e.clave between ? and ?",
	tipocar_z,#,1,properac_z,#,1,uloperac_z,#,1,
  fecacuini_z,#,3,fecacufin_z,#,3,
  piva1_z,piva2_z,voc_z,#,1,prmegazona_z,#,1,ulmegazona_z,#,1,;

f5; M
	nombre_ind3		s31,
	tam_ind3		s0,;
k0; ot,"zontda",;
k1; kq,"select nombre from ubivta where zona=? and subzon=?",
	antzon_z,#,1,subzona_z,#,1,;
k2; kq,"select nombre from ubivta where codcar='XX' and subzon=?",
      subzona_z,#,1,;
k3; kq,"select descri from car_megazonas where clave=?",megazona_z,#,1,;

f6; M
	ultfec_ind5	{
          ultfecaa_ind5		i,
          ultfecmm_ind5		i,
          ultfecdd_ind5		i,
        		}
        tam_ind5		s0,;
k0; ot,"acuvtas",;
k1; kq,"select max(fecfin) from acuvtas",;

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
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro; GST; tf; tn;
ta0; #iprog1.i; ^=direc_z,#); 
(modul_z)=($Informe Vtas Cred y Cont.,25); (modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[NOZONA; z0,nombre_zon,0; (nombre_zon)=($INEXISTENTE,11); R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };

