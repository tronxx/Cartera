*
  Programa que sirve para capturar la Poliza de Cobranza de Ventas de Credito
  DRBR 06-May-1998

  JRPH 10 - de Octubre - 2001
*

#dMIS02 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE5 %-5.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~; #dMLS4 %4ld~;   #dMFS5 %5.2f~;
#dMDE6 %-6.0f~; #dMIE5 %-5d~; #dMDE12 %-12.2f~; #dMDS9 %-9.2f~;
#dMDS6 %6.0f~;  #dMIS5 %5d~;  #dMDS12 %,12.2f~; #dMDS4 %4.0f~;
#dMLE3 %-3ld~; #dMIE4 %-4d~;  #dMLS5 %5ld~; #dMIS3 %3d~;
#dMLS3 %3ld~;  #dMIS4 %4d~; #dMIE2 %-2d~; #dMDS3 %3.0f~;
#dMDS12a %12.2f~;

#i/programas/lib/funkey.i;

f0; M

*      Definicion de Variables *     
       ncolsexis                 i,
       pmialmac                  s5,
       indogrpomi		 s1,
       codf26_z                  s14,
       desc26_z                  s31,
       grpf26_z                  s14,
        mifecha_z                 D,
        mifechaux 	{
          mifechauxaa_z		i,
          mifechauxmm_z		i,
          mifechauxdd_z		i,
          		}
        mifechaux1 	{
          mifechaux1aa_z		i,
          mifechaux1mm_z		i,
          mifechaux1dd_z		i,
          		}
       
*      Fin de Definicion de Variables *     

	impre_z			i,
	font_z			i,
	micar_z			s3,
	carac_z			i,
	ter_z			s2,
	fech9_z		{
	  dias2_z		s16,
	  hora_z		s6,
	  resto_z		s5,
			}
	bandman_z		s2,
	band_z			s2,
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	bandh_z			s2,
        bandimp_z		s2,
        esalta_z		s2,
	nemp_z			s80,
	direc_z			s50,
	modul_z			s30,
	modul2_z		s10,
	usuarios_z		s80,
	teruser_z		s80,
	mibd_z			s80,
	nombuse_z		s15,
	clause_z		s10,
	bandf1_z		s2,
        iog_z			s2,
        campre_z		s2,
        antprecel_z		d,
        antprelis_z		d,
	univend_z     		d,
        factor_z		d,
        mubmds_z		d,
        mubelc_z		d,
	codigo_z		s14,
	codest_z		s14,
	descri_z		s31,
	codbus_z		s13,
	tipo_z			s4,
	prove_z			s5,
	cod2_z			s14,
	linea_z			s5,
	empaqe_z		s11,
	soli_z      {
	  progra_z      	s41,
	  codref_z      	s15,
	            }
        fecalta_z		s9,
        fecinianu_z		s9,
        diasdif_z		l,
        tipomov_z		i,
        conse_z			i,
	goal_z			s2,
	bandprog_z		s2,
        hacia_z			s2,
        espor_z			i,
        nlineas_z		i,
	basest_z		i,
	renest_z		i,
        topest_z		i,
        maxest_z		i,
	mes_z			i,
	totxmes_z		i12,
	totxpvt_z		i12,
	tothor_z		d,
        precelec_z		d,
	tpestad_z		i,
	tpestad2_z		i,
	prfol_z			l,
        folio_z			l,
        alm2_z			s5,
        fol2_z			l,
        serie_z			s21,
        fos_z			s2,
        aot_z			s2,
        exist_z			i,
        minimo_z		i,
	maximo_z		i,
	precio_z		d,
	piva_z			d,
	costos_z		d,
	coston_z		d,
        renaa_z			i,
	cia_z			i,
	nrens_z			i,
	renb_z			i,
	fechoy_z	{
	  fechoyaa_z		i,
	  fechoymm_z		i,
	  fechoydd_z		i,
	  		}
	alm_z			s5,
	anu_z			i,
	totents_z		d,
	bandkrdx_z		s2,
        bandet_z		s2,
        observs_z		s71,
	fecent_z		D,
	fecsal_z		D,
	fecha_z			D,
        fechb_z			D,
        inianu_z		D,
        feculcamp_z		D,
        fecvig_z		D,
        fecvigsql_z 	{
          fecvigsqlaa_z 	i,
          fecvigsqlmm_z 	i,
          fecvigsqldd_z 	i,
          		}
        feculp_z	{
          feculpaa_z		i,
          feculpmm_z		i,
          feculpdd_z		i,
          		}
        fecalts_z	{
          fecaltsaa_z		i,
          fecaltsmm_z		i,
          fecaltsdd_z		i,
          		}
	nconcep_z		l,
	basekrd_z		i,
	topekrd_z		i,
	renkrd_z		i,
	col01_z			i,
	col02_z			i,
	col03_z			i,
	col04_z			i,
	col05_z			i,
	col06_z			i,
	col07_z			i,
	col08_z			i,
	col09_z			i,
        haciabus_z		s2,

* ---> Estas son las variables que se necesitan para usar esta funcion  <-- *
	pos_z             l,
	narts_z           i,
	tpmov_z          s2,
	bandc_z          s2,
	bandb_z          s2,
	band4_z          s2,
	bndf1_z          s2,
        mds_z		s2,
        elec_z		s2,
	ren_z             i,
	iii_z             i,
	pos1_z            l,
	col1_z            i,
	col2_z            i,
	tope1_z           i,
	base1_z           i,
	ren2_z            i,
	cols_z            i,
	ii_z              i,

	fech8_z			D,
        gpodiary_z		s14,
        gpo1_z			s3,
	rena_z			i,
	cola_z			i,
	renbase_z		i,
	colbase_z		i,
	ind1_z			i,
	ind2_z			i,
	ind3_z			i,
	ind4_z			i,
	termi_z			i,
	esp_z			i,
	exten_z			i,
	tam0			s0,;

mtam0&; tr; &f0; tu1; tr; ts0; (impre_z)=(1);
GABRE_TABLA;
Ff5; FO.anuminmax.ini~,r~; FGNoinianu; Fknemp_z,l; FC; >sinemp_z,#,fechoyaa_z;
z0,nemp_z,#; Ff5; FO.cias.ini~,r~; FG|; | Fknemp_z,l; . FC;
Ff1; >sinemp_z,#,cia_z;
f20; k1; P; n|; GNOCIA; . z0,nemp_z,#; (nemp_z)=(razon_cia,#); GPAN;
(renbase_z)=(12); (colbase_z)=(4); 
(anu_z)=(fechoyaa_z); (fechoymm_z)=(1); (fechoydd_z)=(1); (gpo1_z)=($%%,2);
qD,1,fechoy_z,inianu_z,; &binianu_z; &p4fecinianu_z; (factor_z)=(.9);
(arch_z)=($altainv0.tex,12);

{ 
  GMENS1; GSELEC1;
)
gFin;

[MENS1;
GST; \Seleccione:`C`odigo `K`ardex Es`t`adisticas Descripci`o`n `F`in\;
GST2; \`D`espliega Ent/Sal Obser`v`aciones `E`xistentes\;
R;

[SELEC1;
?G[Cbusinv, [Kkardex, [Testadis, [Odescri, [FFin,
  [cbusinv, [kkardex, [testadis, [odescri, [fFin,
  [Aantcod, [Ssigcod, [Dentsals, [Vobsinv, [Eexisten,
  [aantcod, [ssigcod, [dentsals, [vobsinv, [eexisten;
R;  

[obsinv;
(progra_z)=($vpg4s /programas/vps/inven/capobsinv.vp  ,41);
(codref_z)=(codigo_z,#);
tS7,0,0,23,80; tf; x(soli_z); tf; tR7,0,0,23,80; tS0; R;
R;

[existen;
(codest_z)=(codigo_z,#);
GST; \Teclee el Anu de Estadisticas:\; t0R; ianu_z,MIE4,MIS4;
tS1,10,0,13,80; tf; tp;
t@0,0; tB40,4;

[cdp1;   t@1,1; \Codigo:\; t0retorna; icodest_z,13;
[iogmio; t@2,1; \`I`ndividual o de `G`rupo ? <I/G>:\; t0cdp1; iindogrpomi,1;

tS6,0,0,23,80; tf;
t@0,0;
t@renaa_z,0; \`ALMACEN:` \;
f2; k3; P; 
(ncolsexis)=(9);
{ n+;
  !(ncolsexis)4($76)>|; (ncolsexis)=(9); l;
  |
    (pmialmac) = (clave_alm,#); \|\; ppmialmac,3; s1; (ncolsexis)=(ncolsexis)(4)+;
  . 
  f2; a;  
)
  
  \|\; 
*
  panu_z,MIS4; ta1; t@1,0;
  
!(iog_z)0($I,1)>|; (codigo_z)=(codest_z,#); (cia_z)=(1); f26; k1; P; n|;. (codf26_z)=(codf26,#); (desc26_z)=(desc26,#); (grpf26_z)=(grpf26,#); pcodf26_z,14; pdesc26_z,30; .
\ Grupo:\; pgrpf26_z,14; ta0; tp;
!(iog_z)0($I,1)>|;
  (renaa_z)=(renbase_z); (renbase_z)=(3);
  GDESPEXINUBI; (renbase_z)=(renaa_z); (renaa_z)=(2)(nrens_z)+;
|
  (renaa_z)=(2);
.
t@renaa_z,0; \`ALMACEN                |Ene|Feb|Mar|Abr|May|Jun|Jul|Ago|Sep|Oct|Nov|Dic|Total`\;

*

(basest_z)=(renaa_z)(1)+; (renest_z)=(basest_z);
(topest_z)=(18); (ind1_z)=(totxmes_z&);
z0,totxmes_z[ind1_z],24; z0,nlineas_z,#; (maxest_z)=(topest_z)(basest_z)-;
*
  !(iog_z)0($I,1)>|; f7; k1; P; .
  !(iog_z)0($G,1)>|; f7; k2; P; .
*
f17; k1; P;
f17; k2; P;
{ n+;
  !(nlineas_z)1(maxest_z)>|;
    GST; \Presione <S> Para Continuar...\; y|;. z0,nlineas_z,#;
  .
  !(renest_z)1(topest_z)>|; t@basest_z,0; td; (renest_z)=(topest_z); .
  t@renest_z,0; palm_ind1,5; (alm_z)=(alm_ind1,#);
  f8; !(tpestad_z)0($45)>|; k3; | k1; .
  P; n|; GNOPVT; . pptovta_ind1,18; \|\; z0,tothor_z,#; (mes_z)=(1);
  (ind2_z)=(totxpvt_z&); z0,totxpvt_z[ind2_z],24; z0,mes_ind2,l;
  !(iog_z)0($I,1)>|; f6; k1; P; .
  !(iog_z)0($G,1)>|; f6; k2; P; .
  { n+; 
    !(unids_ind2)5($0)>|;
      (tothor_z)=(tothor_z)(unids_ind2)+;
      (ind1_z)=(totxmes_z&)(mes_ind2)(1)-(2)*+;
      (totxmes_z[ind1_z])=(totxmes_z[ind1_z])(unids_ind2)+;
      (ind2_z)=(totxpvt_z&)(mes_ind2)(1)-(2)*+;
      (totxpvt_z[ind2_z])=(totxpvt_z[ind2_z])(unids_ind2)+;
    .
    f6; a;
  )
  (mes_z)=(1);
  { !(mes_z)1($12)>+;
    (ind2_z)=(totxpvt_z&)(mes_z)(1)-(2)*+;
    (unids_ind2)=(totxpvt_z[ind2_z]);
    !(unids_ind2)5($0)>|; punids_ind2,MIS3; | s3; . \|\;
    (mes_z)=(mes_z)(1)+;
  )
  ta1; ptothor_z,MDS3; ta0; tp; (renest_z)=(renest_z)(1)+;
  (nlineas_z)=(nlineas_z)(1)+;
  f7; a;
)
t@renest_z,0; ta1; \Total General\; s10; \|\; z0,tothor_z,#;
(mes_z)=(1);
{ !(mes_z)1($12)>+;
  (ind1_z)=(totxmes_z&)(mes_z)(1)-(2)*+; (unids_ind2)=(totxmes_z[ind1_z]);
  !(unids_ind2)5($0)>|; punids_ind2,MIS3; | s3; . \|\;
  (tothor_z)=(tothor_z)(unids_ind2)+;
  (mes_z)=(mes_z)(1)+;
)
ta1; ptothor_z,MDS3;
GST; \Presione <S> Para Continuar...\;  y|; gguardpant; .
[retorna; gfinest; tS0; R;
tS0; ganu; R;




R;

[businv;
GST; \Teclee el Codigo del Articulo a buscar...\; t0R; tL00; icodigo_z,13;
z0,codigo_inv,l; f1; k1; P;
n|;
  (bandb_z)=($I,1); (codbus_z)=(codigo_z,#);
  Gbusca2; z0,codigo_inv,l; f1; k1; P; nR;
.
GDESPINV;
R;

[antcod; (hacia_z)=($A,1); GMUEVETE; R;
[sigcod; (hacia_z)=($S,1); GMUEVETE; R;

[MUEVETE;
z0,codigo_ind9,l; f9; !(hacia_z)0($A,1)>|; k1; | k2; . P; n|;.
!(codigo_ind9)2($ ,1)>|; GST; `7; \No existe anterior...\; Z1; R; .
(codigo_z)=(codigo_ind9,#); z0,codigo_inv,l; f1; k1; P; nR; GDESPINV;
R;

[descri;
GST; \Teclee la descripcion del Articulo a buscar...\; t0R; tL01; idescri_z,30;
(bandb_z)=($D,1); Gbusca2; z0,codigo_inv,l; f1; k1; P; nR; GDESPINV;
R;

[entsals;
tS1,10,0,13,80; tf; tp;
t@2,0;
\`-------------Entradas------------------` `------------- Salidas ----------------`\;
(basekrd_z)=(3); (topekrd_z)=(12); (col01_z)=(1);
(renkrd_z)=(basekrd_z); f14; k1; P;
{ n+;
  t@renkrd_z,col01_z; pespor_ind14,MIS2; (espor_z)=(espor_ind14);
  z0,ptovta_ind1,l; f8;  k2; P; n|;. s1; pptovta_ind1,30;
  z0,canti_ind15,l; f15; k1; P; n|;. s1; pcanti_ind15,MLS4;
  f14; a; GSUMAREN;
)
(col01_z)=(40); (renkrd_z)=(basekrd_z); f14; k2; P;
{ n+;
  t@renkrd_z,col01_z; pespor_ind14,MIS2; (espor_z)=(espor_ind14);
  z0,ptovta_ind1,l; f8;  k2; P; n|;. s1; pptovta_ind1,30;
  z0,canti_ind15,l; f15; k2; P; n|;. s1; pcanti_ind15,MLS4;
  f14; a; GSUMAREN;
)
GST01; \Presione <S> Para Continuar...\; y|;.
tS0;
R;

[kardex;
(goal_z)=($A,1); tS1,10,0,13,80; tf; tp;
(col01_z)=(0); (col02_z)=(46); (col03_z)=(11); (col04_z)=(17); (col05_z)=(36);
(col06_z)=(50); (col07_z)=(56); (col08_z)=(67); (col09_z)=(55);
{
  t@2,0; te;
  \`Fecha_Entr` `Entda` `Proveedor                   ` `Fol` `Serie` `Fecha_Sale` `Comprador`\;
  *Fecha_Entr|Entda|Proveedor                   |Fol|Serie|Fecha_Sale|Comprador*
  GST01; \Teclee el Almacen:\; t0+; ialm_z,4;
  f2; k1; P; n|; (bandb_z)=($A,1); Gbusca2; f2; k1; P; nR; tS1; .
  GST01; \Primer Folio:\; t0+; iprfol_z,MLE3,MLS3;
  f4; k1; P; n|; GST; `7; \No tiene movimientos este Almacen...\; Z1; g-; .
  t@0,0; \Almacen:\; ta1; palm_z,5; ta0; s1; ta1; pnombre_alm,31; ta0; tp;
  f4; { !(folio_mva)3(prfol_z)>+; a; n+; )
  (basekrd_z)=(3); (topekrd_z)=(12); (renkrd_z)=(basekrd_z);
  GMUSTRALOSMIOS;
)
tS0;
R;

[MUSTRALOSMIOS;
EK0; GKprog2; Gpdnkrd; z32,bandkrdx_z,#;
{
  GMENSKR01; GSELKR01; !(bandkrdx_z)0($S,1)>+;
)
EK0; GKprog1;
R;

[MENSKR01;
GST01; \Seleccione:`A`nterior `S`iguiente `P`.Ant P.S`i`g `U`ltimo `D`etalles `H`istoria `R`egresa\;
R;

[SELKR01;
?G[Aantkrd, [Ssigkrd, [Ppupkrd, [Ipdnkrd, [Uultkrd, [Dverdet, [Rregkrd,
  [aantkrd, [ssigkrd, [ppupkrd, [ipdnkrd, [uultkrd, [dverdet, [rregkrd,
  [Himphis,
  [himphis;
R;

[antkrd;
GDESPRENKDX; f4; b; n|; a; nR; GDESPMIRENKDX; R; .
GRESTAREN; GDESPMIRENKDX;
R;

[sigkrd;
GDESPRENKDX; f4; a; n|; b; nR; GDESPMIRENKDX; R; .
GSUMAREN; GDESPMIRENKDX;
R;

[pupkrd;
(ind1_z)=(topekrd_z)(basekrd_z)-;
{ !(ind1_z)2($1)>+;
  GDESPRENKDX; f4; b; n|; a; n+; g+; .
  GRESTAREN; (ind1_z)=(ind1_z)(1)-;
)
GDESPMIRENKDX;
R;

[pdnkrd;
(ind1_z)=(topekrd_z)(basekrd_z)-;
{ !(ind1_z)2($1)>+;
  GDESPRENKDX; f4; a; n|; b; n+; g+; .
  GSUMAREN; (ind1_z)=(ind1_z)(1)-;
)
GDESPMIRENKDX;
R;

[ultkrd;
{ 
  GDESPRENKDX; f4; a; n|; b; n+; g+; . GSUMAREN;
)
GDESPMIRENKDX;
R;

[SUMAREN;
(renkrd_z)=(renkrd_z)(1)+;
!(renkrd_z)1(topekrd_z)>|; t@basekrd_z,0; td; (renkrd_z)=(topekrd_z); .
R;

[RESTAREN;
(renkrd_z)=(renkrd_z)(1)-;
!(renkrd_z)2(basekrd_z)>|; t@basekrd_z,0; ti; (renkrd_z)=(basekrd_z); .
R;

[DESPMIRENKDX; ta1; GDESPRENKDX; ta0; tp; R;
[DESPRENKDX;
qD,1,fecha_mva,fecent_z,; (nconcep_z)=(nompro_mva); f5; k1; P; n|; GNOCON; .
t@renkrd_z,col01_z; pfecent_z,+10; !(modent_mva)0($S,1)>|; \*\; .
t@renkrd_z,col02_z; pfolio_mva,MLS3;
t@renkrd_z,col03_z; pnentrada_mva,MLS5; t@renkrd_z,col04_z; pconcepto_cpm,28;
!(folviene_mva)1($0)>|;
  t@renkrd_z,col05_z; s1; pvienede_mva,4; pfolviene_mva,MLS3;
.
t@renkrd_z,col06_z; pserie_mva,20; t@0,col06_z; pserie_mva,20;
!(salio_mva)0($S,1)>|;
  t@renkrd_z,col09_z; !(modsal_mva)0($S,1)>|; \*\; | s1; .
  qD,1,fechasal_mva,fecsal_z,; t@renkrd_z,col07_z; pfecsal_z,+10;
  !(folrec_mva)0($0)>|;
    (nconcep_z)=(compro_mva); f5; k1; P; n|; GNOCON; . t@renkrd_z,col08_z;
    pconcepto_cpm,12;
  |
    t@renkrd_z,col08_z; pvahacia_mva,5; pfolrec_mva,MLS3;
  .
.
R;

[verdet;
ta0; tS5,10,0,13,80; z0,bandet_z,#;
tf; tn; tP/programas/vps/inven/detalle1.s~; tM; tp;
tL/programas/vps/inven/detalle1.pos~; GDESPMIDET;
{
  GMENSDET; GSELDET;
  !(bandet_z)0($S,1)>+;
)
tS1; tL/programas/vps/inven/altainv.pos~;
R;

[MENSDET;
GSTATDET; \Seleccione:`A`nterior `S`iguiente `R`egresa `O`rigen `D`estino\;
R;

[SELDET;
?G[Aantdet, [Ssigdet, [Rregdet, [Dvahacia, [Ovienede,
  [aantdet, [ssigdet, [rregdet, [dvahacia, [ovienede;
R;

[regdet; (bandet_z)=($S,1); R;
[sigdet; f4; a; n|; b; nR; R;. GDESPMIDET; R;
[antdet; f4; b; n|; a; nR; R;. GDESPMIDET; R;

[vahacia;
(folio_z)=(folrec_mva); (alm2_z)=(vahacia_mva,#); f4; k2; P;
nR; GDESPMIDET;
R;

[vienede;
(folio_z)=(folviene_mva); (alm2_z)=(vienede_mva,#); f4; k2; P;
nR; GDESPMIDET;
R;

[DESPMIDET;
tL00; palmac_mva,4; tL01; pfolio_mva,MLS4; tL02; pserie_mva,20;
tL03; pprove_mva,4; (nconcep_z)=(nompro_mva); f5; k1; P; n|; GNOCON; .
tL04; pconcepto_cpm,30; (tipomov_z)=(entrapor_mva); f10; k1; P; n|; GNOTPM; .
tL05; pentosalx_ind10,24; tL06; pnentrada_mva,MLS6;
qD,1,fecha_mva,fecent_z,; tL07; pfecent_z,+10; tL08; pmodent_mva,1;
tL09; pcosto_mva,MDS12;
!(folviene_mva)5($0)>|;
  tL16; pvienede_mva,4; tL17; pfolviene_mva,MLS4;
|
  tL16; s4; tL17; s4;
.
!(salio_mva)0($S,1)>|;
  (tipomov_z)=(salepor_mva); f10; k1; P; n|; GNOTPM; .
  tL10; pentosalx_ind10,24;
  tL11; pnsalida_mva,MLS6;
  qD,1,fechasal_mva,fecsal_z,; tL12; pfecsal_z,+10;
  tL13; pmodsal_mva,1; (nconcep_z)=(compro_mva); f5; k1; P; n|; GNOCON; .
  tL14; pconcepto_cpm,30;
  (tipomov_z)=(pueblo_mva); f10; k2; P; n|; GNOTPM; .
  tL15; pentosalx_ind10,25; tL23; pptvta_mva,4; tL24; pvend_mva,3;
  !(folrec_mva)5($0)>|;
    tL18; pvahacia_mva,4; tL19; pfolrec_mva,MLS4;
  |
    tL18; s4; tL19; s4;
  .
|
  tL10; s30; tL11; s6; tL12; s10; tL13; s1; tL14; s30; tL15; s25; tL18; s4;
  tL19; s4;
.
qD,1,fecentori_mva,fecha_z,; tL20; pfecha_z,+10;
qD,1,fecvencto_mva,fecha_z,; tL21; pfecha_z,+10;
tL22; pentcan_mva,1;
R;

[STATDET; t@11,1; s70; t@11,1; ta1; tan; ta0; tp; R;

[imphis;
(folio_z)=(folio_mva); (serie_z)=(serie_mva,#);
GST01; \Por `F`olio o por `S`erie :\; t0R; ifos_z,1;
!(fos_z)5($F,1)(fos_z)5($S,1)&>imphis;
!(fos_z)0($F,1)>|;
  [aot; GST01; \Hacia `A`delante o A`t`ras:\; t0R; ihacia_z,1;
  !(hacia_z)5($A,1)(hacia_z)5($T,1)&>aot;
.
tc; Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
(cod2_z)=(codigo_z,#); (alm2_z)=(alm_z,#); (fol2_z)=(folio_z);
z0,exist_z,#;
!(fos_z)0($F,1)>|; f4; k3; P; | f4; k4; P; .
{ n+;
  GIMPRIREN;
  !(hacia_z)0($A,1)>|;
    !(salio_mva)5($S,1)>+; (alm2_z)=(vahacia_mva,#); (fol2_z)=(folrec_mva);
  .
  !(hacia_z)0($T,1)>|;
    (alm2_z)=(vienede_mva,#); (fol2_z)=(folviene_mva);
  .
  !(fos_z)0($F,1)>|; f4; k3; P; n+; | f4; a; .
)
Ff4; \Total de Movimientos:\; pexist_z,MIS5; l; l;
FC; Ff1; tr; tS0; GSalir; tS1,10,0,13,80;
R;

[Enc;
tc; Ff4; GFONT14; Fslexten_z,nemp_z; (esp_z)=(80)(exten_z)-(2)/;
sesp_z; pnemp_z,0; l;
Fslexten_z,dir_cia; (esp_z)=(80)(exten_z)-(2)/(20)-;
!(esp_z)2($0)>|; z0,esp_z,#; . sesp_z; pdir_cia,0; l;
GFONT13; \impihisto \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; Fc60,\Historia de Movimientos Pag:~; Fp%d~; l;
tc; Ff4; GFONT17; \Codigo:\; pcodigo_z,#; pdescri_inv,#;
\ Tipo:\; ptipo_inv,0; \ Linea:\; plinea_inv,0; l;
!(fos_z)0($F,1)>|;
  \Partiendo de \; palm_z,0; \ Folio:\; pfolio_z,MLS6;
  !(hacia_z)0($A,1)>|; \ Hacia Adelante \; .
  !(hacia_z)0($T,1)>|; \ Hacia Atras \; .
|
  \En orden de Fecha de Entrada por la Serie:\; pserie_z,0;
.
l; GFONT13; c=130; l;
\Alm.|Fecha_Entr|Entrda|     Proveedor                |Fol|    Serie           |Fecha_Sale |Comprador\; l;
Ft;

[Pie; Fe;

[IMPRIREN;
Ff4;
qD,1,fecha_mva,fecent_z,; (nconcep_z)=(nompro_mva); f5; k1; P; n|; GNOCON; .
palmac_mva,4; \|\; pfecent_z,+10; \|\; !(modent_mva)0($S,1)>|; \*\; | s1; .
pnentrada_mva,MLS5; \|\;
!(folviene_mva)1($0)>|;
  pconcepto_cpm,22; s1; pvienede_mva,4; pfolviene_mva,MLS3;
|
  pconcepto_cpm,30;
.
\|\; pfolio_mva,MLS3; \|\; pserie_mva,20; \|\;
!(salio_mva)0($S,1)>|;
  !(modsal_mva)0($S,1)>|; \*\; | s1; .
  qD,1,fechasal_mva,fecsal_z,; pfecsal_z,+10; \|\;
  (nconcep_z)=(compro_mva); f5; k1; P; n|; GNOCON; .
  !(folrec_mva)0($0)>|;
    pconcepto_cpm,30;
  |
    pconcepto_cpm,22; s1; pvahacia_mva,4; pfolrec_mva,MLS3;
  .
.
(exist_z)=(exist_z)(1)+;
l;
R;

[regkrd; (bandkrdx_z)=($S,1); R;

[altas; R;
GST; \Teclee el Codigo del Articulo a agregar...\; t0R; tL00; icodigo_z,13;
f1; k1; P; n|; | GDESPINV; R; .
(esalta_z)=($S,1); GPIDATS; z0,esalta_z,#; !(band_z)5($S,1)>R;
z0,codigo_inv,l; (codigo_inv)=(codigo_z,#); GMEM_A_ARCH;
&a; &cfecha_z; qD,2,fecalts_z,fecha_z,;
f1; QNOPDAGF1; k5; P$; f1; k1; P; nNOPDAGF1;
f10; k3; P;
n|;
  GST; `7; \No existe en grupo, lo agrego\;
  f10; k4; P$;
|
  GST; `7; \Si Existe, ahora lo modifico\;
  f10; k5; P$;
.
GGRABA_CAMPRE; GDESPINV;
R;

[NOPDAGF1; GST; `7; \No pude agregar registro en inven...\; Z1; R;

[cambios; R;
GST; \Teclee el Codigo del Articulo a Modificar...\; t0R; tL00; icodigo_z,13;
f1; k1; P;
n|; (bandb_z)=($I,1); (codbus_z)=(codigo_z,#); Gbusca2; f1; k1; P; nR; .
GDESPINV; GPIDATS; !(band_z)5($S,1)>R;
f1; QNOPDMDF1; k6; P$; f1; k1; P; nNOPDMDF1;
f10; k3; P; n|; f10; k4; P$; | f10; k5; P$; . GDESPINV;
R;

[campre; R;
(antprecel_z)=(precelec_inv); (antprelis_z)=(precio_inv); (campre_z)=($S,1);
[emp2; GST; \Teclee el Empaque...\; t0R; tL06; iempaqe_z,10;
[pvt2; GST; \Teclee el Precio de Venta MDS Iva incluido...\; t0emp2;
tL09; iprecio_z,MDE12,MDS12;
!(precio_z)0($0)>|; (mds_z)=($N,1); | (mds_z)=($M,1); .
(precelec_z)=(precio_z)(factor_z)*;
[prl2; GST; \Teclee el Precio de Venta SUCS.59-63-65 Iva Incluido...\;
t0pvt2; tL36; iprecelec_z,MDE12,MDS12;
!(precelec_z)0($0)>|; (elec_z)=($N,1); | (elec_z)=($E,1); .
[fvg; GST; \Teclee la Fecha de Inicio de Vigencia:\; t0prl2;
tL41; &a; &cfecvig_z; ifecvig_z,+10; !(fecvig_z)0($-1)>fvg;
qD,2,fecvigsql_z,fecvig_z,;
GST; \Estan Correctos los cambios ? <S/N>:\; y|; | R; .
f1; k4; P$; (campre_z)=($S,1); GGRABA_CAMPRE; z0,campre_z,#;
f1; k1; P; nR; GDESPTARJ;
R;

[GRABA_CAMPRE;
&a; &cfecha_z; qD,2,feculp_z,fecha_z,;
* --> Busco la Modificacion, Si lo encuento lo modifico, si no lo encuentro
	lo agrego <--- *
f12; k1; P;
n|;
  z0,codigo_iup,l; (codigo_iup)=(codigo_z,#); (fecha_iup)=(feculp_z,#);
  (precmds_iup)=(precio_z); (precelec_iup)=(precelec_z);
  (empqe_iup)=(empaqe_z,#); (cia_iup)=(cia_z,#);
  qD,2,fecinivig_iup,fecvig_z,; f12; QNOPDAG_INVULP; k2; P$;
|
  (precmds_iup)=(precio_z); (precelec_iup)=(precelec_z);
  (empqe_iup)=(empaqe_z,#); qD,2,fecinivig_iup,fecvig_z,;
  f12; QNOPDMD_INVULP; k3; P$;
.
* --> Ya no se borran las observaciones z0,conse_z,#; f16; k2; P$; <--- *
!(campre_z)0($S,1)>|;
  (conse_z)=(conse_z)(1)+;  z0,observs_z,#;
  z0,serie_z,#; >dsantprelis_z,serie_z,MDS12a;
  q+,observs_z,"CAMB.PREC: (Antes) P.Lista:",serie_z,;
  z0,serie_z,#; >dsantprecel_z,serie_z,MDS12a; 
  q+,observs_z," 63,65:",serie_z,;
  f16; QNOPDAG_OBSERV; k3; P$;
.
z0,serie_z,#; >dsprecio_z,serie_z,MDS12a; (conse_z)=(conse_z)(1)+;
z0,observs_z,#; q+,observs_z,"CAMB.PREC:(Ahora)P.L:",serie_z,;
z0,serie_z,#; >dsprecelec_z,serie_z,MDS12a;
q+,observs_z," 63,65:",serie_z,;
z0,serie_z,#; >isfecvigsqlaa_z,serie_z,%4d~; q+,observs_z," Vig:",serie_z,;
z0,serie_z,#; >isfecvigsqlmm_z,serie_z,%02d~; q+,observs_z,"-",serie_z,;
z0,serie_z,#; >isfecvigsqldd_z,serie_z,%02d~; q+,observs_z,"-",serie_z,;
f16; QNOPDAG_OBSERV; k3; P$;
R;

[NOPDAG_INVULP; GST; `7; \No pude agregar registro en invulpre...\; Z1; R;
[NOPDMD_INVULP; GST; `7; \No pude modificar registro en invulpre...\; Z1; R;
[NOPDAG_OBSERV; GST; `7; \No pude agregar registro en observs\; Z1; R;

[NOPDMDF1; GST; `7; \No pude modificar registro en inven...\; Z1; R;

[MEM_A_ARCH;
(descri_inv)=(descri_z,#); (tipo_inv)=(tipo_z,#); (cod2_inv)=(cod2_z,#);
(linea_inv)=(linea_z,#); (empaqe_inv)=(empaqe_z,#); (minimo_inv)=(minimo_z);
(maximo_inv)=(maximo_z); (precio_inv)=(precio_z); (piva_inv)=(piva_z);
(costos_inv)=(costos_z); (coston_inv)=(coston_z); (cia_inv)=(cia_z);
(prove_inv)=(prove_z,#); (mds_inv)=(mds_z,#); (elec_inv)=(elec_z,#);
(precelec_inv)=(precelec_z);
R;

[PIDATS;
z43,band_z,#;
{ [des; GST; \Teclee la Descripcion...\; t0+; tL01; idescri_z,30;
  [tip; GST; \Teclee el Tipo del Articulo...\; t0des; tL02; itipo_z,3;
  [cd2; GST; \Teclee el Codigo Auxiliar...\; t0tip; tL03; icod2_z,13;
  [pro; GST; \Teclee el Proveedor...\; t0cd2; tL04; iprove_z,4;
  [lin; GST; \Teclee la Linea...\; t0pro; tL05; ilinea_z,4;
  [emp; GST; \Teclee el Empaque...\; t0lin; tL06; iempaqe_z,10;
  [min; GST; \Teclee la Cantidad Minima que debe haber en inventario...\;
  t0emp; tL07; iminimo_z,MIE4,MIS4;
  [max; GST; \Teclee la Cantidad Maxima que debe haber en inventario...\;
  t0min; tL08; imaximo_z,MIE4,MIS4;
  [pvt; GST; \Teclee el Precio de Venta MDS Iva incluido...\; t0max;
  tL09; iprecio_z,MDE12,MDS12;
  !(precio_z)0($0)>|; (mds_z)=($N,1); | (mds_z)=($M,1); .
  !(esalta_z)0($S,1)>|; (precelec_z)=(precio_z)(factor_z)*; .
  [prl; GST; \Teclee el Precio de Venta SUCS.59-63-65 Iva Incluido...\;
  t0pvt; tL36; iprecelec_z,MDE12,MDS12;
  !(precelec_z)0($0)>|; (elec_z)=($N,1); | (elec_z)=($E,1); .
  [piv; GST; \Teclee la tasa de Iva...\; t0pvt; tL10; ipiva_z,MFE5,MFS5;
  [cos; GST; \Teclee el Costo Si...\; t0piv; tL11; icostos_z,MDE12,MDS12;
  [con; GST; \Teclee el Costo No...\; t0cos; tL12; icoston_z,MDE12,MDS12;
*
  [mds; GST; \Este articulo lo maneja MDS ? <M/N>:\; tL34; imds_z,1;
  !(mds_z)5($N,1)(mds_z)5($M,1)&>mds;
  [ele; GST; \Este articulo lo maneja SUCS.59-63-65 ? <E/N>:\;
  tL35; ielec_z,1; !(elec_z)5($E,1)(elec_z)5($N,1)&>ele;
*
  [gpd; GST; \Seleccione el grupo de Diary...\; t0con; tL37; igpodiary_z,13;
  f11; k1; P;
  n|;
    (gpo1_z)=(gpodiary_z,1); (bandb_z)=($G,1); Gbusca2; f11; k1; P;
    n|; GST; `7; \Grupo Inexistente...\; Z1; ggpd; .
  .
  tL37; pgpodiary_z,13;
  GST; \Estan correctos los datos ? <S/N>:\; y|; (band_z)=($S,1); g+; .
)
R;

[DESPINV;
GDESPTARJ; GDESPEXINUBI;
R;

[DESPTARJ;

z0,mifecha_z,#;
(mifechauxmm_z)=(1);
(mifechauxdd_z)=(1); 
qD,1,mifechaux,mifecha_z;

(univend_z)=(salvtas_inv)(salvtan_inv)+(salfons_inv)+(salfonn_inv)+;
qD,1,fecalta_inv,fecha_z,; &bfecha_z; &p4fecalta_z; &a; &cfechb_z;
qD,2,mifechaux1,fecha_z;

!(fecalta_z)2(fecinianu_z,#)>|; (fecha_z)=(inianu_z); .

!(mifechaux)2(mifechaux1,#)>|;
 (diasdif_z)=(fechb_z)(fecha_z)-(86400)/;
|
 (diasdif_z)=(fechb_z)(mifecha_z)-(86400)/;
.
!(diasdif_z)5($0)>|; (maximo_z)=(univend_z)(diasdif_z)/(75)*; .


  GST; \Dias dif\; pdiasdif_z,MIS5; s1; pfecha_z,+10; s1; pmifecha_z,+10; y|;.
  

tL00; pcodigo_inv,13; tL01; pdescri_inv,30; tL02; ptipo_inv,3;
tL03; pcod2_inv,13; tL04; pprove_inv,4; tL05; plinea_inv,4;
tL06; pempaqe_inv,10; tL07; pminimo_inv,MIS4;
(exist_z)=(existes_inv)(existen_inv)+;
!(exist_z)4(maximo_z)>|; ta1; .
tL08; pmaximo_z,MIS4; ta0; tp;
(mds_z)=(mds_inv,#); (elec_z)=(elec_inv,#);
* tL34; pmds_inv,1; tL35; pelec_inv,1; *
tL33; pfecha_z,+10;
tL09; pprecio_inv,MDS12; tL36; pprecelec_inv,MDS12; tL10; ppiva_inv,MFS5;
tL11; pcostos_inv,MDS12; tL12; pcoston_inv,MDS12;   tL13; pinicials_inv,MDS6;
tL14; pentcoms_inv,MDS6; tL15; pentcans_inv,MDS6;   tL16; pentesps_inv,MDS6;
(totents_z)=(entcoms_inv)(entcans_inv)+(entesps_inv)+; tL17; ptotents_z,MDS6;
tL18; psalvtas_inv,MDS6; tL19; psalfons_inv,MDS6; tL20; psalesps_inv,MDS6;
tL21; psalmays_inv,MDS6;
(totents_z)=(totents_z)(salvtas_inv)-(salfons_inv)-(salesps_inv)-(salmays_inv)-(inicials_inv)+;
tL22; ptotents_z,MDS6;

tL23; pinicialn_inv,MDS6; tL24; pentcomn_inv,MDS6; tL25; pentcann_inv,MDS6;
tL26; pentespn_inv,MDS6;
(totents_z)=(entcomn_inv)(entcann_inv)+(entespn_inv)+; tL27; ptotents_z,MDS6;
tL28; psalvtan_inv,MDS6; tL29; psalfonn_inv,MDS6; tL30; psalespn_inv,MDS6;
tL31; psalmayn_inv,MDS6;
(totents_z)=(totents_z)(salvtan_inv)-(salfonn_inv)-(salespn_inv)-(salmayn_inv)-(inicialn_inv)+;
tL32; ptotents_z,MDS6; z0,entosalx_ind10,#;
f10; k3; P; n|;. (gpodiary_z)=(entosalx_ind10,13); tL37; pgpodiary_z,13;
z0,mubmds_z,#; z0,mubelc_z,#;
!(precio_inv)5($0)>|; (mubmds_z)=(100)(1)(coston_inv)(precio_inv)/-*; .
!(precelec_inv)5($0)>|; (mubelc_z)=(100)(1)(coston_inv)(precelec_inv)/-*; .
tL38; pmubmds_z,MFS5; tL39; pmubelc_z,MFS5;
z0,ultcamp_ind16,l; f16; k1; P; n|;. (feculp_z)=(ultcamp_ind16,#);
z0,codigo_iup,l; f12; k1; P; n|;.
qD,1,fecha_iup,feculcamp_z,; qD,1,fecinivig_iup,fecvig_z,;
tL40; pfeculcamp_z,+10; tL41; pfecvig_z,+10;
GARCH_A_MEM;
R;

[DESPEXINUBI;
(rena_z)=(renbase_z); (cola_z)=(colbase_z);
(nrens_z)=(4); z0,totents_z,#; f2; k2; P;
{ n+;
  (renb_z)=(rena_z)(1)+; t@rena_z,cola_z; pclave_alm,4;
  (alm_z)=(clave_alm,#);
  f3; k1; P; n|; z0,codigo_exi,l; .
  (existes_exi)=(existes_exi)(existen_exi)+;
  t@renb_z,cola_z; ta1; pexistes_exi,MDS4; ta0; tp;
  (totents_z)=(totents_z)(existes_exi)+;
  f2; a; (cola_z)=(cola_z)(5)+;
  !(cola_z)1($72)>|; 
    (rena_z)=(rena_z)(2)+; (cola_z)=(colbase_z); (nrens_z)=(nrens_z)(2)+;
  .
)
(cola_z)=(72); t@rena_z,cola_z; \Total\;
(renb_z)=(rena_z)(1)+; t@renb_z,cola_z; ta1; ptotents_z,MDS6; ta0; tp;
(rena_z)=(renbase_z)(1)-; (cola_z)=(colbase_z)(1)-;
t@rena_z,cola_z; tB76,nrens_z;
R;

[ARCH_A_MEM;
(descri_z)=(descri_inv,#); (tipo_z)=(tipo_inv,#); (cod2_z)=(cod2_inv,#);
(linea_z)=(linea_inv,#); (empaqe_z)=(empaqe_inv,#); (minimo_z)=(minimo_inv);
(maximo_z)=(maximo_inv); (precio_z)=(precio_inv); (piva_z)=(piva_inv);
(costos_z)=(costos_inv); (coston_z)=(coston_inv); (cia_z)=(cia_inv);
(prove_z)=(prove_inv,#); (precelec_z)=(precelec_inv);
R;

[estadis;
(codest_z)=(codigo_z,#);
[anu; GST; \Teclee el Anu de Estadisticas:\; t0R; ianu_z,MIE4,MIS4;
[guardpant; tS1,10,0,13,80; tf; tp;
t@0,0; tB40,11;
t@1,1; \`15` Salidas Especiales\;
t@2,1; \`20` Salidas x Venta\;
t@3,1; \`25` Entradas x Cancel\;
t@4,1; \`30` Entradas Especiales\;
t@5,1; \`45` Salidas Mayoreo\;
t@6,1; \`75` Entradas x Compra\;
[suo; t@7,1; \Su Opcion:\; t0restpant; itpestad_z,MIE2,MIS2;
(tpestad2_z)=(tpestad_z);
!(tpestad_z)0($20)>|; (tpestad2_z)=(35); .
!(tpestad_z)0($25)>|; (tpestad2_z)=(40); .
[iog; t@8,1; \`I`ndividual o de `G`rupo ? <I/G>:\; t0suo; iiog_z,1;
!(iog_z)5($I,1)(iog_z)5($G,1)&>iog;
!(iog_z)0($I,1)>|; [cdp; t@9,1; \Codigo:\; t0iog; icodest_z,13; .
tS6,0,0,23,80; tf;
t@0,0;
!(tpestad_z)0($15)>|; \Estadistica de Salidas Especiales de \; .
!(tpestad_z)0($20)>|; \Estadistica de Salidas x Venta de \; .
!(tpestad_z)0($25)>|; \Estadistica de Entradas x Cancelaciones de \; .
!(tpestad_z)0($30)>|; \Estadistica de Entradas Especiales \; .
!(tpestad_z)0($45)>|; \Estadistica de Salidas Mayoreo \; .
!(tpestad_z)0($75)>|; \Estadistica de Entradas  x Compra \; .
panu_z,MIS4; ta1; t@1,0;
!(iog_z)0($I,1)>|; (codigo_z)=(codest_z,#); (cia_z)=(1); f26; k1; P; n|;. (codf26_z)=(codf26,#); (desc26_z)=(desc26,#); (grpf26_z)=(grpf26,#); pcodf26_z,14; pdesc26_z,30; .
\ Grupo:\; pgrpf26_z,14; ta0; tp;
!(iog_z)0($I,1)>|;
  (renaa_z)=(renbase_z); (renbase_z)=(3);
  GDESPEXINUBI; (renbase_z)=(renaa_z); (renaa_z)=(2)(nrens_z)+;
|
  (renaa_z)=(2);
.
t@renaa_z,0; \`ALMACEN                |Ene|Feb|Mar|Abr|May|Jun|Jul|Ago|Sep|Oct|Nov|Dic|Total`\;
(basest_z)=(renaa_z)(1)+; (renest_z)=(basest_z);
(topest_z)=(18); (ind1_z)=(totxmes_z&);
z0,totxmes_z[ind1_z],24; z0,nlineas_z,#; (maxest_z)=(topest_z)(basest_z)-;
!(iog_z)0($I,1)>|; f7; k1; P; .
!(iog_z)0($G,1)>|; f7; k2; P; .
{ n+;
  !(nlineas_z)1(maxest_z)>|;
    GST; \Presione <S> Para Continuar...\; y|;. z0,nlineas_z,#;
  .
  !(renest_z)1(topest_z)>|; t@basest_z,0; td; (renest_z)=(topest_z); .
  t@renest_z,0; palm_ind1,5; (alm_z)=(alm_ind1,#);
  f8; !(tpestad_z)0($45)>|; k3; | k1; .
  P; n|; GNOPVT; . pptovta_ind1,18; \|\; z0,tothor_z,#; (mes_z)=(1);
  (ind2_z)=(totxpvt_z&); z0,totxpvt_z[ind2_z],24; z0,mes_ind2,l;
  !(iog_z)0($I,1)>|; f6; k1; P; .
  !(iog_z)0($G,1)>|; f6; k2; P; .
  { n+; 
    !(unids_ind2)5($0)>|;
      (tothor_z)=(tothor_z)(unids_ind2)+;
      (ind1_z)=(totxmes_z&)(mes_ind2)(1)-(2)*+;
      (totxmes_z[ind1_z])=(totxmes_z[ind1_z])(unids_ind2)+;
      (ind2_z)=(totxpvt_z&)(mes_ind2)(1)-(2)*+;
      (totxpvt_z[ind2_z])=(totxpvt_z[ind2_z])(unids_ind2)+;
    .
    f6; a;
  )
  (mes_z)=(1);
  { !(mes_z)1($12)>+;
    (ind2_z)=(totxpvt_z&)(mes_z)(1)-(2)*+;
    (unids_ind2)=(totxpvt_z[ind2_z]);
    !(unids_ind2)5($0)>|; punids_ind2,MIS3; | s3; . \|\;
    (mes_z)=(mes_z)(1)+;
  )
  ta1; ptothor_z,MDS3; ta0; tp; (renest_z)=(renest_z)(1)+;
  (nlineas_z)=(nlineas_z)(1)+;
  f7; a;
)
t@renest_z,0; ta1; \Total General\; s10; \|\; z0,tothor_z,#;
(mes_z)=(1);
{ !(mes_z)1($12)>+;
  (ind1_z)=(totxmes_z&)(mes_z)(1)-(2)*+; (unids_ind2)=(totxmes_z[ind1_z]);
  !(unids_ind2)5($0)>|; punids_ind2,MIS3; | s3; . \|\;
  (tothor_z)=(tothor_z)(unids_ind2)+;
  (mes_z)=(mes_z)(1)+;
)
ta1; ptothor_z,MDS3;
GST; \Presione <S> Para Continuar...\;  y|; gguardpant; .
[finest; tS0;
R;
[restpant; tS0; ganu; R;

* ------------  -->   Rutina de Busquedas   <---- -------------- *
[DESPTITULO;
t@1,1;
!(bandb_z)0($I,1)(bandb_z)0($D,1)|>|; \Listado de Articulos\; .
!(bandb_z)0($A,1)>|; \Listado de Almacenes\; .
!(bandb_z)0($G,1)>|; \Listado de Grupos Diary\; .
R;

[SALDEBUS;
!(bandb_z)0($I,1)(bandb_z)0($D,1)|>|; (codigo_z)=(codigo_inv,#); .
!(bandb_z)0($A,1)>|; (alm_z)=(clave_alm,#); .
!(bandb_z)0($G,1)>|; (gpodiary_z)=(grupo_gpd,#); .
R;

[BUSCAINI;
!(bandb_z)0($I,1)>|; f1; k3; P; .
!(bandb_z)0($D,1)>|; f1; k2; P; .
!(bandb_z)0($A,1)>|; f2; k2; P; .
!(bandb_z)0($G,1)>|; f11; k2; P; .
R;

[SELARCH;
!(bandb_z)0($N,1)(bandb_z)0($D,1)|>|; f1; .
!(bandb_z)0($A,1)>|; f2; .
!(bandb_z)0($G,1)>|; f11; .
R;

[DESPRENOR;
t@ren_z,col1_z;
!(bandb_z)0($I,1)(bandb_z)0($D,1)|>|;
  pcodigo_inv,13; s1; pdescri_inv,30;
.
!(bandb_z)0($A,1)>|;
  pclave_alm,4; s1; pnombre_alm,30;
.
!(bandb_z)0($G,1)>|;
  pgrupo_gpd,13; s1; pdescri_gpd,30;
.
R;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

#ibusca.i;
#iimpri.i;
#isacaf.i;

[antpagkd; Gpupkrd; ];
[sigpagkd; Gpdnkrd; ];
[antrenkd; Gantkrd; ];
[sigrenkd; Gsigkrd; ];
[ultrenkd; Gultkrd; ];

[nvoreg; R;

[Kprog1;
(bandprog_z)=($1,1);
R;

[Kprog2;
(bandprog_z)=($2,1);
KPU,antpagkd,PD,sigpagkd,UA,antrenkd,DA,sigrenkd,END,ultrenkd;
R;

[Kprog4;
(bandprog_z)=($2,1);
R;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #iinven.i;
k0; ot,"inven",;
k1; kp,"codigo = ? and cia=?",codigo_z,#,1,cia_z,;
k2; kp,"descri like ?+'%' and cia=? order by descri",descri_z,#,1,cia_z,;
k3; kp,"codigo like ?+'%' and cia=? order by codigo",codbus_z,#,1,cia_z,;
k4; kq,"update inven set precio=?,precelec=?,empaqe=? where codigo = ? and cia=?",
	precio_z,precelec_z,empaqe_z,#,1,codigo_z,#,1,cia_z,;
k5; kq,"insert into inven (codigo,cod2,descri,tipo,prove,linea,empaqe,minimo,
	maximo,precio,piva,costos,coston,fecalta,cia,mds,elec,precelec,
        inicials,entcoms,entcans,entesps,salvtas,salfons,salesps,salmays,existes,
        inicialn,entcomn,entcann,entespn,salvtan,salfonn,salespn,salmayn,existen,
        cosinicials,cosentcoms,cosentcans,cosentesps,cossalvtas,cossalfons,
        cossalesps,cossalmays,cosexistes,
        cosinicialn,cosentcomn,cosentcann,cosentespn,cossalvtan,cossalfonn,
        cossalespn,cossalmayn,cosexisten)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)",
        codigo_z,#,1,cod2_z,#,1,descri_z,#,1,tipo_z,#,1,prove_z,#,1,
        linea_z,#,1,empaqe_z,#,1,minimo_z,maximo_z,precio_z,piva_z,costos_z,
        coston_z,fecalts_z,#,3,cia_z,mds_z,#,1,elec_z,#,1,precelec_z,;
k6; kq,"update inven set cod2=?,descri=?,tipo=?,prove=?,linea=?,
	empaqe=?,minimo=?,maximo=?,precio=?,piva=?,costos=?,coston=?,
        mds=?,elec=?,precelec=? where codigo=? and cia=?",
        cod2_z,#,1,descri_z,#,1,tipo_z,#,1,prove_z,#,1,
        linea_z,#,1,empaqe_z,#,1,minimo_z,maximo_z,precio_z,piva_z,costos_z,
        coston_z,mds_z,#,1,elec_z,#,1,precelec_z,
        codigo_z,#,1,cia_z,;

f2; #ialmacen.i;
k0; ot,"almacen",;
k1; kp,"clave=? and cia=?",alm_z,#,1,cia_z,;
k2; kp,"cia=? order by ordiary,clave",cia_z,;
k3; kq,"select * from almacen where cia=? or (clave<>'ET' and clave<>'IB' and clave<>'BO' and clave<>'ME') order by ordiary,clave",cia_z,;

f3; #iexist.i;
k0; ot,"exist",;
k1; kp,"codigo=? and alm=? and cia=?",codigo_z,#,1,alm_z,#,1,cia_z,;

f4; #imovart.i;
k0; ot,"movart",;
k1; kp,"codigo=? and almac=? and cia=? order by folio",
	codigo_z,#,1,alm_z,#,1,cia_z,;
k2; kp,"codigo=? and almac=? and folio=? and cia=?",
	codigo_z,#,1,alm2_z,#,1,folio_z,cia_z,;
k3; kp,"codigo=? and almac=? and folio=? and cia=?",
	codigo_z,#,1,alm2_z,#,1,fol2_z,cia_z,;
k4; kp,"codigo=? and serie=? and cia=? order by fecha,almac,folio",
	codigo_z,#,1,serie_z,#,1,cia_z,;

f5; #iconceps.i;
k0; ot,"conceps",;
k1; kp,"ncon=?",nconcep_z,;

f6; M
	mes_ind2		i,
	unids_ind2		i,;
k0; ot,"estadis",;
k1; kq,"select mes,unidades from estadis where
	codigo like ? and (tipo=? or tipo=?) and alm=? and anu=? and cia=?",
	codest_z,#,1,tpestad_z,tpestad2_z,alm_z,#,1,anu_z,cia_z,;
k2; kq,"select mes,unidades from estadis,relgpodiary where
	grupo=? and estadis.codigo=relgpodiary.codigo and (tipo=? or tipo=?)
	and alm=? and anu=? and estadis.cia=relgpodiary.cia
        and estadis.cia=?",
	gpodiary_z,#,1,tpestad_z,tpestad2_z,alm_z,#,1,anu_z,cia_z,;

f7; M	alm_ind1		s5,;
k0; ot,"estadis",;
k1; kq,"select unique alm from estadis where
	codigo like ? and (tipo=? or tipo=?) and anu=? and cia=?",
	codest_z,#,1,tpestad_z,tpestad2_z,anu_z,cia_z,;
k2; kq,"select unique alm from estadis,relgpodiary where
	estadis.codigo=relgpodiary.codigo and grupo=? and (tipo=? or tipo=?)
	and anu=? and estadis.cia=relgpodiary.cia and estadis.cia=?",
	gpodiary_z,#,1,tpestad_z,tpestad2_z,anu_z,cia_z,;

k3; kq,"select unique alm from estadis,relgpodiary where
	estadis.codigo=relgpodiary.codigo and grupo=? and (tipo=? or tipo=?)
	and anu=? and estadis.cia=relgpodiary.cia and estadis.cia=?",
	gpodiary_z,#,1,tpestad_z,tpestad2_z,anu_z,cia_z,;

f8; M
	ptovta_ind1		s31,;
k0; ot,"ptovta",;
k1; kq,"select nombre from ptovta where clave=? and cia=?",alm_z,#,1,cia_z,;
k2; kq,"select substring(descri,1,30) from conseinv where numtip=?",espor_z,;
k3; kq,"select substring(nombre,1,30) from mayoris where codigo=? and cia=?",
	alm_z,#,1,cia_z,;

f9; M
	codigo_ind9		s14,;
k0; ot,"inven",;
k1; kq,"select max(codigo) from inven where codigo < ? and cia=?",
	codigo_z,#,1,cia_z,;
k2; kq,"select min(codigo) from inven where codigo > ? and cia=?",
	codigo_z,#,1,cia_z,;

f10; M
	entosalx_ind10		s41,;
k0; ot,"conseinv",;
k1; kq,"select descri from conseinv where numtip=? and cia=?",
	tipomov_z,cia_z,;
k2; kq,"select nombre from poblacs where numero=?",
	tipomov_z,;
k3; kq,"select grupo from relgpodiary where codigo=? and cia=?",
	codigo_z,#,1,cia_z,;
k4; kq,"insert into relgpodiary (grupo,codigo,cia) values (?,?,?)",
	gpodiary_z,#,1,codigo_z,#,1,cia_z,;
k5; kq,"update relgpodiary set grupo=? where  codigo=? and cia=?",
	gpodiary_z,#,1,codigo_z,#,1,cia_z,;

f11; #igpodiary.i;
k0; ot,"gpodiary",;
k1; kp,"grupo=? and cia=?",gpodiary_z,#,1,cia_z,;
k2; kp,"grupo like ?+'%' and cia=?",gpo1_z,#,1,cia_z,;

f12; #iinvulpre.i;
k0; ot,"invulpre",;
k1; kp,"codigo=? and fecha=? and cia=?",
	codigo_z,#,1,feculp_z,#,3,cia_z,;
k2; kq,"insert into invulpre (codigo,fecha,precmds,precelec,empqe,observs,
	cia,fecinivig) values (?,?,?,?,?,?,?,?)",
        codigo_iup,#,1,fecha_iup,#,3,precmds_iup,precelec_iup,
        empqe_iup,#,1,observs_iup,#,1,cia_iup,fecinivig_iup,#,3,;
k3; kq,"update invulpre set precmds=?,precelec=?,
	empqe=?,observs=?,fecinivig=? where codigo=? and fecha=? and cia=?",
        precmds_iup,precelec_iup,empqe_iup,#,1,observs_iup,#,1,
        fecinivig_iup,#,3,
        codigo_iup,#,1,fecha_iup,#,3,cia_iup,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;

f14; M
	espor_ind14		i,;
k0; ot,"movart",;
k1; kq,"select unique entrapor from movart where codigo=? and cia=?",
	codigo_z,#,1,cia_z,;
k2; kq,"select unique salepor from movart where codigo=? and cia=?
	and salio='S'",
	codigo_z,#,1,cia_z,;

f15; M
	canti_ind15		l,;
k0; ot,"movart",;
k1; kq,"select count(*) from movart where codigo=? and entrapor=? and cia=?",
	codigo_z,#,1,espor_z,cia_z,;
k2; kq,"select count(*) from movart where codigo=? and salepor=? and cia=?",
	codigo_z,#,1,espor_z,cia_z,;

f16; M
	ultcamp_ind16	{
          ultcampaa_ind16		i,
          ultcampmm_ind16		i,
          ultcampdd_ind16		i,
          		}
        tam_ind16			s0,;
k0; ot,"invulpre",;
k1; kq,"select max(fecha) from invulpre where codigo=? and cia=?",
	codigo_z,#,1,cia_z,;
k2; kq,"delete from observent where tipo='I' and codigo=? and fecha=?
	and observs like 'CAMB.PREC%' and cia=?",
        codigo_z,#,1,feculp_z,#,3,cia_z,;
k3; kq,"insert into observent (tipo,alm,numero,fecha,conse,observs,cia,codigo)
	values ('I','',0,?,?,?,?,?)",
        feculp_z,#,3,conse_z,observs_z,#,1,cia_z,codigo_z,#,1,;


f17; M
	cve16_inv		s5,
        tam_ind17		s0,;
      
k0; ot,"almacen",;
k1; kq,"select unique(clave) from almacen where clave<>'SE' and clave<>'ST' and cia=? order by nombre,clave",cia_z,;

f18; M	codigo_ind4		s14,;
k0; ot,"invtmp",;
k1; kq,"delete from invtmp",;
k2; kq,"insert into invtmp
	(codigo,descri,costos,linea,piva,precio,
        empaqe,tipo,cod2)
        select inven.codigo,inven.descri,inven.costos,inven.linea,inven.piva,
	inven.precio,inven.empaqe,lineas.orden,substring(inven.codigo,1,2)
        from inven,lineas where
	inven.cia=? and lineas.numero=inven.linea",
	cia_z,;


f20; #iciasinv.i;
k0; ot,"ciasinv",;
k1; kp,"cia=?",cia_z,;

f26; M

       codf26                  s14,
       desc26                  s31,
       grpf26                  s14,
       tam_ind26      	       s0,;

k0; ot,"invulpre",;
k1; kq,"select codigo,descri,cod2 from inven where codigo=? and cia=?",
	codigo_z,#,1,cia_z,;
R;

*
Ff4; GFONT14; Fslexten_z,nemp_z; (esp_z)=(80)(exten_z)-(2)/; sesp_z; pnemp_z,0; l;
Fslexten_z,dir_cia; (esp_z)=(80)(exten_z)-(2)/(20)-;
!(esp_z)2($0)>|; z0,esp_z,#; . sesp_z; pdir_cia,0; l;
*

[PAN; 
Ff1; GST; tf; tn;
tP/programas/vps/inven/altainv.s~;
tL/programas/vps/inven/altainv.pos~;
* Subrutina para dibujar la clasica caja del programa principal *
t@2,0; tB80,18; t@0,0; tB80,23;
^=direc_z,#); z0,modul_z,#;
(modul_z)=($Mantenimiento Inventarios,25); (modul2_z)=($INV-MDS,7);
Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
(esp_z)=(80)(exten_z)-(2)/; Ff1; t@1,esp_z; pnemp_z,0;
Fslexten_z,modul_z; (esp_z)=(79)(exten_z)-; t@0,esp_z; pmodul_z,0; ta0; tp;
Fslexten_z,modul2_z; (esp_z)=(78)(exten_z)-; t@1,esp_z; pmodul2_z,0;
R;

[R; R; [E; ];
[ST; t@20,1; ta0; s78; t@20,1; ta1; ta=; ta0; tp; R;
[ST2; t@21,1; ta0; s78; t@21,1; ta1; ta=; ta0; tp; R;

[ST01; t@1,0; tl; ta1; ta=; ta0; tp; R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[ERROR1; GST; `7; \No pude agregar registro en mantos.v ...\; gFin1;
[ERROR4; GST; `7; \No pude agregar registro \; pteruser_z,0; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;
[Noinianu; Ff1; GST; `7; \archivo .anuminmax.ini incompleto o inexistente...\; gFin1;
[NOCIA; z0,razon_cia,l; (razon_cia)=($CIA INEXISTENTE,15); R;
[NOCON; z0,concepto_cpm,l; (concepto_cpm)=($INEXISTENTE,11); R;
[NOTPM; z0,entosalx_ind10,l; (entosalx_ind10)=($INEXISTENTE,11); R;
[NOPVT; z0,ptovta_ind1,#; (ptovta_ind1)=($INEXISTENTE,11); R;

[Fin1; y|;.
[Fin; t@23,0; te; };
