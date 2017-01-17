* Programa que sirve para hacer el reporte de los clientes analitico de ventas
  DRBR 24 de Septiembre de 1997
*

#dMIS02 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS5 %5.2f~; #dMDS9 %-9.2f~;
#dMIE2 %-2d~;  #dMIS3X %03dx~; #dMIS3 %3d~;
#dMIS4 %4d~;
#i/programas/lib/funkey.i;

f0; M
        version_z		s21,
	impre_z			i,
	font_z			i,
	micar_z			s3,
	carac_z			i,
        sff_z			s2,
        contc_z			s2,
        maxrow_z		i,
        maxcol_z		i,
        renst_z			i,
        tarea_z			i,
        idtarea_z		l,
        iddesruta_z		l,
	
	fech9_z     {
	  dias2_z       s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
	bandman_z        s2,
	band_z           s2,
	bandh_z          s2,

	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
        milin_z			s100,

	nemp_z			s80,
	direc_z			s50,
	modul_z			s30,
	modul2_z		s10,
	usuarios_z      	s80,
	teruser_z       	s80,
	mibd_z          	s80,
	nombuse_z       	s15,
	clause_z        	s10,
	voc_z			s2,
        tasiva_z		s5,
	sqlcmd_z		s100,
	milinea_z		s100,
	clientes_z		s20,
	mvcli_z			s20,
	tbdircl_z		s20,
	solicit_z		s20,
	tipostat_z		s2,
	status1_z		s2,
	status2_z		s2,
	
	bandf1_z	 	s2,
	bandimp_z		s2,
        impopcion_z		s2,
        impagente_z		s2,
        impticte_z		s2,
	saldo_z			d,

	fech8_z           	D,
	fecha_z			D,
	fechb_z			D,
        fechd_z			D,
        feche_z			D,
        bandprog_z		s2,
	cop_z			s2,
	codcli_z		s11,
        fot_z			s2,
        anu_z			i,

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
        fecsig_z       {
          fecsigaa_z            i,
          fecsigmm_z            i,
          fecsigdd_z            i,
                        }
	tdaini_z		i,
	tdault_z		i,
	anttda_z		i,
        idcli_z			l,
	tda_z			s3,
	ubica_z			s4,
        prubi_z			s4,
        ulubi_z			s4,
        informe_z		s2,
	piva_z			d,
	clica_z			i,
	clipi_z			i,
	porutf_z		d,
	aua_z			d,
	aub_z			d,
	enganc_z		d,
	meses_z			i,
	clicon_z		i,
	clicrd_z		i,
	codtotlis_z		d,
	codtotcrd_z		d,
	codtoteng_z		d,
	codtotsrv_z		d,
	
	ubitotlis_z		d,
	ubitotcrd_z		d,
	ubitoteng_z		d,
	ubitotsrv_z		d,

	tottotlis_z		d,
	tottotcrd_z		d,
	tottoteng_z		d,
	tottotsrv_z		d,

	codvtacp_z		d,
	codvtalp_z		d,
	codvtacc_z		d,
	codengcp_z		d,
	codenglp_z		d,
	codsrvcp_z		d,
	codsrvlp_z		d,
	codsrvcc_z		d,

	ubivtacp_z		d,
	ubivtalp_z		d,
	ubivtacc_z		d,
	ubiengcp_z		d,
	ubienglp_z		d,
	ubisrvcp_z		d,
	ubisrvlp_z		d,
	ubisrvcc_z		d,

	totvtacp_z		d,
	totvtalp_z		d,
	totvtacc_z		d,
	totengcp_z		d,
	totenglp_z		d,
	totsrvcp_z		d,
	totsrvlp_z		d,
	totsrvcc_z		d,

	vtactopl_z		d,
        vtalarpl_z		d,
        engctopl_z		d,
        englarpl_z		d,
        prtasa_z		d,
        ultasa_z		d,
        clienca_z		l,
        clienpi_z      		l,

	pos_z			l,
	narts_z			i,
	tpmov_z			s1,
	bandc_z			s1,
	bandb_z			s1,
	band4_z			s1,
	bndf1_z			s1,
        haciabus_z		s2,
	ren_z			i,
	iii_z			i,
	pos1_z			l,
	col1_z			i,
	col2_z			i,
	tope1_z			i,
	base1_z			i,
	ren2_z			i,
	cols_z			i,

	ii_z            	i,
	ind1_z            	i,
	ind2_z            	i,
	termi_z           	i,
	esp_z             	i,
	exten_z           	i,
	tam0             	s0,;

mtam0&; 
q+,version_z,"V:2.01 DL",;
* --> Control de Versiones
  DL : Diciembre 11 de 2014. Se modifica para que se pueda generar el reporte
  de ventas status 1 o status 2 o Todas
  2.01 Se modifica para que se pueda bloquear que no afecte 
  al estado de resultados
*
Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; (arch_z)=($analivta.tex,12); ttttermi_z; (impre_z)=(1); (piva_z)=(16);
GABRE_TABLA;

&a; &cfeche_z; qD,2,fecsig_z,feche_z,; GPRIMERO_DE_MES_ANTER; 
qD,1,fecsig_z,fechd_z,; ttttarea_z; (idtarea_z)=(tarea_z);
GTOMA_PARAMETROS;
tL02; ptdaini_z,MIS2;
>istdaini_z,tda_z,MIS02; f2; k1; P; 
n|; | tL13; pnombre_tda,15; .

tL03; ptdault_z,MIS2;
>istdault_z,tda_z,MIS02; f2; k1; P; 
n|; | tL14; pnombre_tda,15; .

tL04; pprubi_z,2;
tL05; pulubi_z,2;
tL06; pcop_z,1;
tL07; pvoc_z,1;
tL08; pfot_z,1;
tL09; ptasiva_z,2;
tL10; pimpagente_z,1;
tL11; pimpticte_z,1;
tL12; pimpopcion_z,1;
tL15; pcontc_z,1;
tL19; ptipostat_z,1;
tL20; pinforme_z,1;

[fei; t0Fin; tL00; (fecha_z)=(fechd_z); ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
(fecsig_z)=(fecini_z,#); GULTIMO_DE_MES; qD,1,fecsig_z,feche_z,;
[feu; t0fei; tL01; (fechb_z)=(feche_z); ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
[prt; t0feu; tL02; itdaini_z,MIE2,MIS02; 
>istdaini_z,tda_z,MIS02; 
f2; k1; P;
n|;
  (bandb_z)=($T,1); Gbusca2;
  f2; k1; P; n|; GST; \Codigo Inexistente...\; Z1; gprt; .
.
>sitda_z,#,tdaini_z; tL02; ptdaini_z,MIS02; tL13; pnombre_tda,15;
[ult; t0prt; tL03; itdault_z,MIE2,MIS02;
>istdault_z,tda_z,MIS02;
f2; k1; P;
n|;
  (bandb_z)=($T,1); Gbusca2;
  f2; k1; P; n|; GST; \Codigo Inexistente...\; Z1; gprt; .
.
>sitda_z,#,tdault_z; tL03; ptdault_z,MIS02; tL14; pnombre_tda,15;

[pru; t0ult; tL04; iprubi_z,2; 
[ulu; t0pru; tL05; iulubi_z,2;
[cop; t0ulu; tL06; icop_z,1;
!(cop_z)5($C,1)(cop_z)5($P,1)(cop_z)5($T,1)&&>cop;
[cov; t0cop; tL07; ivoc_z,1; !(voc_z)5($C,1)(voc_z)5($V,1)&>cov;
[fot; t0ulu; tL08; ifot_z,1; 
!(fot_z)5($T,1)(fot_z)5($F,1)&(fot_z)5($I,1)&(fot_z)5($O,1)&(fot_z)5($C,1)&(fot_z)5($V,1)&>fot;
[piv; t0fot; tL09; itasiva_z,2;
!(tasiva_z)0($XX,2)>|;
  (prtasa_z)=(0); (ultasa_z)=(99);
|
  >sdtasiva_z,#,prtasa_z; (ultasa_z)=(prtasa_z);
.
[iag; t0piv; tL10; iimpagente_z,1;
!(impagente_z)5($S,1)(impagente_z)5($N,1)&>iag;
[itc; t0iag; tL11; iimpticte_z,1;
!(impticte_z)5($S,1)(impticte_z)5($N,1)&>itc;
[iop; t0itc; tL12; iimpopcion_z,1;
!(impopcion_z)5($S,1)(impopcion_z)5($N,1)&>iop;
[ctc; t0iop; tL15; icontc_z,1;
!(contc_z)5($S,1)(contc_z)5($E,1)&(contc_z)5($T,1)&>ctc;
[tps; t0ctc; tL19; itipostat_z,1; 
!(tipostat_z)5($1,1)(tipostat_z)5($2,1)&(tipostat_z)5($T,1)&>tps;
(status1_z)=($x,1); (status2_z)=($x,1); 

!(tipostat_z)0($1,1)(tipostat_z)0($T,1)|>|; (status1_z)=($*,1); .
!(tipostat_z)0($2,1)(tipostat_z)0($T,1)|>|; (status2_z)=($ ,1); . 
GCREA_VENTANA_BUS_GRANDE;
tS2; 
t@3,3; \ Cuando es reporte de informe los datos \;
t@4,3; \ del estado de resultados se borran \;
t@5,3; \ y se graban los datos de este reporte \;
[inf; t@7,3; \ Es un reporte de Informe ? <S/N>:\; t0Fin; iinforme_z,1;
!(informe_z)5($S,1)(informe_z)5($N,1)&>inf;
tS0; tL20; pinforme_z,1;
GST; \Estan correctos los datos ? <S/N> : \; y|; | gctc; .
tS1,0,0,23,80; tc;
GGRABA_PARAMETROS;
Ff1; \Eliminare temporales...\;  l;
!(informe_z)0($S,1)>|; f6; k2; P$; .
\Elimine los temporales 1...\; l;
f5; k3; P$;
Ff1; \Elimne los temporales  2...\; l;
\Seleccion Hecha...\;
f8; k1; P$;

z0,iddesruta_ruttmp,l; f8; k3; P; n|;. (iddesruta_z)=(iddesruta_ruttmp)(1)+;
!(fot_z)0($T,1)(fot_z)0($O,1)|>|;
  !(contc_z)0($T,1)(contc_z)0($E,1)|>|;
    (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
    (idpoblac_ruttmp)=(1); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
    (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
    (idpoblac_ruttmp)=(2); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
    (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
    (idpoblac_ruttmp)=(3); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
    (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
    (idpoblac_ruttmp)=(4); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
  .
  !(contc_z)0($T,1)(contc_z)0($S,1)|>|;
    (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
    (idpoblac_ruttmp)=(8); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
    (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
    (idpoblac_ruttmp)=(9); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
    (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
    (idpoblac_ruttmp)=(10); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
    (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
    (idpoblac_ruttmp)=(12); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
    (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
    (idpoblac_ruttmp)=(13); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
  .
.
!(fot_z)0($F,1)(fot_z)0($O,1)|>|;
  (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
  (idpoblac_ruttmp)=(5); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
.
!(fot_z)0($I,1)(fot_z)0($O,1)|>|;
  (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
  (idpoblac_ruttmp)=(6); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
.
!(fot_z)0($C,1)(fot_z)0($O,1)|>|;
  (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
  (idpoblac_ruttmp)=(7); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
.
!(fot_z)0($V,1)(fot_z)0($O,1)|>|;
  (iddesruta_ruttmp)=(iddesruta_z); (idruta_ruttmp)=(idtarea_z); 
  (idpoblac_ruttmp)=(11); f8; k2; P$; (iddesruta_z)=(iddesruta_z)(1)+;
.

f1;
!(cop_z)0($T,1)>|; k1; .
!(cop_z)0($C,1)>|; k2; .
!(cop_z)0($P,1)>|; k3; .
P;
{ n+;
  Ff1; \Leyendo:\; pnumcli_cli,0; s1; pnombre_cli,0; l;
  !(ubiage_cli)5(ubica_z,#)>|;
    !(band_z)5($S,1)>|;
      (ubica_z)=(ubiage_cli,#); (anttda_z)=(tienda_cli);
      Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
    |
      GSUBTCOD; GSUBTUBI; (ubica_z)=(ubiage_cli,#);
      (anttda_z)=(tienda_cli); GSUBENCUBI;
    .
  .
  !(tienda_cli)5(anttda_z)>|; GSUBTCOD; (anttda_z)=(tienda_cli); GSUBENCOD; .
  GIMPRI;
  f1; a;
)
f8; k1; P$;
!(band_z)5($S,1)>Fin;
GSUBTCOD; GSUBTUBI; GULIN; Ff4; FC; tf; tr; tv1; tS0; GSalir;
gFin;
R;

[TOMA_PARAMETROS;
x echo 1 >>.analivta.ini ~;
z0,ii_z,#;
Ff5; FO.analivta.ini~,r~;
{ Ff5; FG+; 
  z0,milin_z,#; Fkmilin_z,l;
  !(ii_z)0($00)>|; >similin_z,#,tdaini_z;     .
  !(ii_z)0($01)>|; >similin_z,#,tdault_z;     .
  !(ii_z)0($02)>|; (cop_z)=(milin_z,1);       .
  !(ii_z)0($03)>|; (voc_z)=(milin_z,1);       .
  !(ii_z)0($04)>|; (prubi_z)=(milin_z,2);     .
  !(ii_z)0($05)>|; (ulubi_z)=(milin_z,2);     .
  !(ii_z)0($06)>|; (fot_z)=(milin_z,1);       .
  !(ii_z)0($07)>|; (tasiva_z)=(milin_z,2);    .
  !(ii_z)0($08)>|; (impagente_z)=(milin_z,1); .
  !(ii_z)0($09)>|; (impticte_z)=(milin_z,1);  .
  !(ii_z)0($10)>|; (impopcion_z)=(milin_z,1); .
  !(ii_z)0($11)>|; (contc_z)=(milin_z,1);     .
  !(ii_z)0($12)>|; (tipostat_z)=(milin_z,1);  .
  !(ii_z)0($13)>|; (informe_z)=(milin_z,1);   .
  (ii_z)=(ii_z)(1)+;
)
Ff5; FC; Ff1;
R;

[GRABA_PARAMETROS;
Ff5; FO.analivta.ini~,w~;
ptdaini_z,MIS2; l;
ptdault_z,MIS2; l;
pcop_z,0; l;
pvoc_z,0; l;
pprubi_z,0; l;
pulubi_z,0; l;
pfot_z,0; l;
ptasiva_z,0; l;
pimpagente_z,0; l;
pimpticte_z,0; l;
pimpopcion_z,0; l;
pcontc_z,0; l;
ptipostat_z,0; l;
pinforme_z,0; l;
Ff5; FC; Ff1;
R;



[Enc;
Ff3; FT; FGNodatos; Ff4; GFONT11; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \analivta \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1;
phora_z,#; s1; FW3; l;
\Analitico Ventas del \; pfecha_z,+10; \ Al \; pfechb_z,+10;
!(tasiva_z)0($XX,2)>|;
  \ Todas tasas Iva \;
|
  \ Iva al \; ptasiva_z,0; \%\;
.
\ Pag:\; Fp%d~; l;
!(voc_z)0($V,1)>|;
  \REPORTE CLIENTES VENTAS\;
|
  \REPORTE CLIENTES CARTERA\;
.
l;
!(fot_z)0($F,1)>|; Fc80,\REPORTE CLIENTES FONACOT~; .
!(fot_z)0($I,1)>|; Fc80,\REPORTE CLIENTES FONACOT~; .
!(fot_z)0($T,1)>|; Fc80,\REPORTE CLIENTES TRADICIONALES~; .
!(fot_z)0($O,1)>|; Fc80,\REPORTE CLIENTES FONACOT, FIDE Y TRADICIONALES~; .
l;
GSUBENCUBI; (band_z)=($S,1);
Ft;

[Pie; Fe;

[SUBENCUBI;
Ff4; \Ubicacion:\; GFONT15; pubica_z,#; s1; 
!(ubica_z)0($CA,2)>|;
  \CALLE\;
|
  f3; k1; P; n|; GNOUBI; . pnombre_ubi,#;
.
l;
GSUBENCOD;
R;

[SUBENCOD;
Ff4; 
!(anttda_z)2($10)>|; >isanttda_z,tda_z,MIS02; | >isanttda_z,tda_z,MIS2; .
\Tienda:\; GFONT15; ptda_z,#; s1; f2; k1; P; n|; GNOTDA; . pnombre_tda,#; l;
GFONT13;
\__Codigo__ Nombre_del_Cliente                   \;
\Prm \;
!(impagente_z)0($S,1)>|; \Vnd \; .
\Precio_Lista Total_Factur     Enganche %U.Fi Plazo\;
!(impticte_z)0($S,1)>|;  \TC \; .
!(impopcion_z)0($S,1)>|; \O \;  .
\    Servicio\;
l;
R;

*
1234567890 12345678901234567890123456789012341 123 123 123456789012 123456789012 123456789012 12345 12
*

[IMPRI;
(meses_z)=(nulet1_cli)(nulet2_cli)+;
!(qom_cli)0($Q,1)>|; (meses_z)=(meses_z)(2)/; .
(aua_z)=(canle1_cli)(bonifi_cli)-(nulet1_cli)*(canle2_cli)(bonifi_cli)-(nulet2_cli)*+;
(aub_z)=(precon_cli)(piva_cli)(100)/(1)+*(enganc_cli)-; z0,porutf_z,#;
@aub_z,10; @aua_z,10;
!(aub_z)5($0)>|; (porutf_z)=(aua_z)(aub_z)/(1)-(100)*; .
!(meses_z)5($0)>|; (porutf_z)=(porutf_z)(meses_z)/; .
(codcli_z)=(numcli_cli,#); (idcli_z)=(idcli_cli); z0,enganc_z,#;
(enganc_ind9)=(0); f9; k1; P; n|;. (enganc_z)=(enganc_ind9);
Ff4; pnumcli_cli,10; s1; pnombre_cli,34; s1; pstatus_cli,1; 
s1; pjefgpo_cli,3; s1; 
!(impagente_z)0($S,1)>|; pagente_cli,3; s1; .
pprecon_cli,MDS12; s1; pcargos_cli,MDS12; s1; penganc_z,MDS12; s1; 
pporutf_z,MFS5; s1; pnulet1_cli,MIS2; s1; pqom_cli,1; 
!(impticte_z)0($S,1)>|; s1; pticte_cli,2; .
!(impopcion_z)0($S,1)>|; s1; poperac_cli,1; .
s1; pservic_cli,MDS12;
l;
(codtotlis_z)=(codtotlis_z)(precon_cli)+; (codtotcrd_z)=(codtotcrd_z)(cargos_cli)+;
(codtoteng_z)=(codtoteng_z)(enganc_z)+;
(codtotsrv_z)=(codtotsrv_z)(servic_cli)+;
!(qom_cli)0($C,1)>|;
  (codvtacc_z)=(codvtacc_z)(cargos_cli)+; (clicon_z)=(clicon_z)(1)+;
  (codsrvcc_z)=(codsrvcc_z)(servic_cli)+;
|
  (clicrd_z)=(clicrd_z)(1)+;
  !(tiplazo_cli)0($L,1)>|;
    (codvtalp_z)=(codvtalp_z)(cargos_cli)+;
    (codenglp_z)=(codenglp_z)(enganc_z)+;
    (codsrvlp_z)=(codsrvlp_z)(servic_cli)+;
  |
    (codvtacp_z)=(codvtacp_z)(cargos_cli)+;
    (codengcp_z)=(codengcp_z)(enganc_z)+;
    (codsrvcp_z)=(codsrvcp_z)(servic_cli)+;
  .
  !(ubiage_cli)0($CA,2)>|;
    (clica_z)=(clica_z)(1)+;
  |
    (clipi_z)=(clipi_z)(1)+;
  .
.
R;

[SUBTCOD;
Ff4; s25; !(impagente_z)0($S,1)>|; s4; .
panttda_z,MIS2; \ Total de esta Tienda   :\; pcodtotlis_z,MDS12; 
s1; pcodtotcrd_z,MDS12; s1; pcodtoteng_z,MDS12; 
s12; 
!(impticte_z)0($S,1)>|; s3; .
!(impopcion_z)0($S,1)>|; s2; .
pcodtotsrv_z,MDS12;
l;
\            \; \      Ventas|\;\   Enganches|\; \    Servicio|\; l;
\Corto Plazo:\; pcodvtacp_z,MDS12; \|\; pcodengcp_z,MDS12; \|\; pcodsrvcp_z,MDS12; l;
\Largo Plazo:\; pcodvtalp_z,MDS12; \|\; pcodenglp_z,MDS12; \|\; pcodsrvlp_z,MDS12; l;
\Contado    :\; pcodvtacc_z,MDS12; \|\; s12; \|\; pcodsrvcc_z,MDS12; 

l; l;

f5; k1; P;
n|;
  z0,tarea_ran,l; (tarea_ran)=(termi_z); (cod_ran)=(anttda_z);
  (clicon_ran)=(clicon_ran)(clicon_z)+;
  (clicrd_ran)=(clicrd_ran)(clicrd_z)+;
  (engctopl_ran)=(engctopl_ran)(codengcp_z)+;
  (englarpl_ran)=(englarpl_ran)(codenglp_z)+;
  (vtactopl_ran)=(vtactopl_ran)(codvtacp_z)+;
  (vtalarpl_ran)=(vtalarpl_ran)(codvtalp_z)+;
  f5; QNOPDAGF5; k4; P$;
|
  (clicon_ran)=(clicon_ran)(clicon_z)+;
  (clicrd_ran)=(clicrd_ran)(clicrd_z)+;
  (engctopl_ran)=(engctopl_ran)(codengcp_z)+;
  (englarpl_ran)=(englarpl_ran)(codenglp_z)+;
  (vtactopl_ran)=(vtactopl_ran)(codvtacp_z)+;
  (vtalarpl_ran)=(vtalarpl_ran)(codvtalp_z)+;
  f5; QNOPDMDF5; k5; P$;
.
Ff1; \Ejecuto f7 k1 \; l;
f7; k1; P;
{ n+;
  z0,vtactopl_z,#; z0,vtalarpl_z,#; z0,engctopl_z,#; z0,englarpl_z,#;
  z0,clica_z,#; z0,clipi_z,#;
  !(tiplazo_ind7)0($L,1)>|;
     (vtalarpl_z)=(cargos_ind7);
  |
     (vtactopl_z)=(cargos_ind7);
  .
  !(ubiage_ind7)0($CA,2)>|;
    (clienca_z)=(cuantos_ind7);
  |
    (clienpi_z)=(cuantos_ind7);
  .
  (piva_z)=(piva_ind7);
  Ff1; \Codigo:\; pcodigo_ind7,MIS2; \ Piva:\; ppiva_z,MFS5;
  \ Qom:\; pqom_ind7,0; \ Nulets:\; pnulets_ind7,MIS2;
  \ Ubiage:\; pubiage_ind7,0; l;
  \ Cargos:\; pcargos_ind7,MDS12; \ Prelis:\; pprelis_ind7,MDS12;
  \ Cuantos:\; pcuantos_ind7,MLS4; l;
  (anu_z)=(anucartera_ind7);
  !(informe_z)0($S,1)>|;
    f6; k1; P;
    n|;
      z0,fecha_edc,l; (fecha_edc)=(fecult_z,#); (cod_edc)=(tda_z,#);
      (tasiva_edc)=(piva_z); (anter_edc)=(anu_z);
      (vtasctopl_edc)=(vtactopl_z); (vtaslarpl_edc)=(vtalarpl_z);
      (engctopl_edc)=(engctopl_z); (englgopl_edc)=(englarpl_z);
      (clicrdca_edc)=(clienca_z); (clicrdpi_edc)=(clienpi_z);
      Ff1; \Ejecuto f6 k4 \; l;
      f6; QNOPDAGF6; k4; P$;
    |
      Ff1; \Ejecuto f6 k5 \; l;
      f6; k5; P$;
    .
  .
  f7; a;
)
Ff1; \Ejecuto f7 k2 \; l;
f7; k2; P;
Ff1; \Ya esta Ejecutado f7 k2 \; l;
{ n+;
  z0,vtactopl_z,#; z0,vtalarpl_z,#; z0,engctopl_z,#; z0,englarpl_z,#;
  z0,clienca_z,#; z0,clienpi_z,#;
  !(tiplazo_ind7)0($L,1)>|;
     (englarpl_z)=(cargos_ind7);
  |
     (engctopl_z)=(cargos_ind7);
  .

  (piva_z)=(piva_ind7);
  (anu_z)=(anucartera_ind7);
  !(informe_z)0($S,1)>|; 
    f6; k1; P;
    n|;
      z0,fecha_edc,l; (fecha_edc)=(fecult_z,#); (cod_edc)=(tda_z,#);
      (tasiva_edc)=(piva_z); (anter_edc)=(anu_z); f6; QNOPDAGF6; k4; P$;
    .
    f6; k5; P$;
  .
  f7; a;
)

(ubitotlis_z)=(ubitotlis_z)(codtotlis_z)+; z0,codtotlis_z,#;
(ubitotcrd_z)=(ubitotcrd_z)(codtotcrd_z)+; z0,codtotcrd_z,#;
(ubitoteng_z)=(ubitoteng_z)(codtoteng_z)+; z0,codtoteng_z,#;
(ubivtacp_z)=(ubivtacp_z)(codvtacp_z)+; z0,codvtacp_z,#;
(ubivtalp_z)=(ubivtalp_z)(codvtalp_z)+; z0,codvtalp_z,#;
(ubivtacc_z)=(ubivtacc_z)(codvtacc_z)+; z0,codvtacc_z,#;
(ubiengcp_z)=(ubiengcp_z)(codengcp_z)+; z0,codengcp_z,#;
(ubienglp_z)=(ubienglp_z)(codenglp_z)+; z0,codenglp_z,#;
(ubisrvcp_z)=(ubisrvcp_z)(codsrvcp_z)+; z0,codsrvcp_z,#;
(ubisrvlp_z)=(ubisrvlp_z)(codsrvlp_z)+; z0,codsrvlp_z,#;
(ubisrvcc_z)=(ubisrvcc_z)(codsrvcc_z)+; z0,codsrvcc_z,#;

(ubitotsrv_z)=(ubitotsrv_z)(codtotsrv_z)+; z0,codtotsrv_z,#;
z0,clicon_z,#; z0,clicrd_z,#;
z0,clica_z,#; z0,clipi_z,#;
R;

[NOPDAGF6; Ff1; \No pude agregar registro en edorescar...\; l; R;
[NOPDAGF5; Ff1; \No pude agregar registro en resanali...\; l; R;
[NOPDMDF5; Ff1; \No pude Modificar registro en resanali...\; l; R;

[SUBTUBI;
Ff4; s25; !(impagente_z)0($S,1)>|; s4; .
pubica_z,2; \ Total de esta Ubicacion:\; pubitotlis_z,MDS12; s1; 
pubitotcrd_z,MDS12; s1; pubitoteng_z,MDS12; 
s12; 
!(impticte_z)0($S,1)>|; s3; .
!(impopcion_z)0($S,1)>|; s2; .
pubitotsrv_z,MDS12;
l;
\            \; \      Ventas|\;\   Enganches|\; \    Servicio|\; l;
\Corto Plazo:\; pubivtacp_z,MDS12; \|\; pubiengcp_z,MDS12; \|\; pubisrvcp_z,MDS12; l;
\Largo Plazo:\; pubivtalp_z,MDS12; \|\; pubienglp_z,MDS12; \|\; pubisrvlp_z,MDS12; l;
\Contado    :\; pubivtacc_z,MDS12; \|\; s12; \|\; pubisrvcc_z,MDS12;
l; l;

(tottotlis_z)=(tottotlis_z)(ubitotlis_z)+; z0,ubitotlis_z,#;
(tottotcrd_z)=(tottotcrd_z)(ubitotcrd_z)+; z0,ubitotcrd_z,#;
(tottoteng_z)=(tottoteng_z)(ubitoteng_z)+; z0,ubitoteng_z,#;
(totvtacp_z)=(totvtacp_z)(ubivtacp_z)+; z0,ubivtacp_z,#;
(totvtalp_z)=(totvtalp_z)(ubivtalp_z)+; z0,ubivtalp_z,#;
(totvtacc_z)=(totvtacc_z)(ubivtacc_z)+; z0,ubivtacc_z,#;
(totengcp_z)=(totengcp_z)(ubiengcp_z)+; z0,ubiengcp_z,#;
(totenglp_z)=(totenglp_z)(ubienglp_z)+; z0,ubienglp_z,#;
(totsrvlp_z)=(totsrvlp_z)(ubisrvlp_z)+; z0,ubisrvlp_z,#;
(totsrvcp_z)=(totsrvcp_z)(ubisrvcp_z)+; z0,ubisrvcp_z,#;
(totsrvcc_z)=(totsrvcc_z)(ubisrvcc_z)+; z0,ubisrvcc_z,#;
(tottotsrv_z)=(tottotsrv_z)(ubitotsrv_z)+; z0,ubitotsrv_z,#;
R;

[ULIN;
Ff4; s28; !(impagente_z)0($S,1)>|; s4; .
\Total General          :\; ptottotlis_z,MDS12; s1; ptottotcrd_z,MDS12; s1;
ptottoteng_z,MDS12; 
s12; 
!(impticte_z)0($S,1)>|; s3; .
!(impopcion_z)0($S,1)>|; s2; .
ptottotsrv_z,MDS12;
l;
\            \; \      Ventas|\;\   Enganches|\; \    Servicio|\; l;
\Corto Plazo:\; ptotvtacp_z,MDS12; \|\; ptotengcp_z,MDS12; \|\; ptotsrvcp_z,MDS12; l;
\Largo Plazo:\; ptotvtalp_z,MDS12; \|\; ptotenglp_z,MDS12; \|\; ptotsrvlp_z,MDS12; l;
\Contado    :\; ptotvtacc_z,MDS12; \|\; s12; \|\; ptotsrvcc_z,MDS12;
l; l;


z0,totenglp_z,#; z0,totengcp_z,#; z0,totvtalp_z,#; z0,totvtacp_z,#;
z0,clicon_z,#; z0,clicrd_z,#;
s25; \    Tabla de Clientes         \; l;
\__________________________________________________________________________________________\; l;
GFONT19; \|Codigo       |Cont|Cred|Eng.Cto.Plaz|Eng.Lar.Plaz|Total Enganc|Vta.Cto.Plaz|Vta.Lar.Plaz|\; GFONT20; l;
f5; k2; P;
{ n+;
  (anttda_z)=(cod_ran); 
  !(anttda_z)2($10)>|; 
    >isanttda_z,tda_z,MIS02; 
  | 
    >isanttda_z,tda_z,MIS2;
  .
  \|\; ptda_z,2; s1; f2; k1; P; n|; GNOTDA; . pnombre_tda,10; \|\;
  pclicon_ran,MIS4; \|\; pclicrd_ran,MIS4; \|\;
  (clicon_z)=(clicon_z)(clicon_ran)+; (clicrd_z)=(clicrd_z)(clicrd_ran)+;
  pengctopl_ran,MDS12; \|\; (totengcp_z)=(totengcp_z)(engctopl_ran)+;
  (ubiengcp_z)=(engctopl_ran);
  penglarpl_ran,MDS12; \|\; (totenglp_z)=(totenglp_z)(englarpl_ran)+;
  (ubiengcp_z)=(ubiengcp_z)(englarpl_ran)+;
  pubiengcp_z,MDS12; \|\; pvtactopl_ran,MDS12; \|\;
  (totvtacp_z)=(totvtacp_z)(vtactopl_ran)+;
  pvtalarpl_ran,MDS12; \|\; l; (totvtalp_z)=(totvtalp_z)(vtalarpl_ran)+;
  f5; a;
)
(ubiengcp_z)=(totengcp_z)(totenglp_z)+;
\|-------------|----|----|------------|------------|------------|------------|------------|\; l;
GFONT19; \|Total        |\; pclicon_z,MIS4; \|\; pclicrd_z,MIS4; \|\;
ptotengcp_z,MDS12; \|\; ptotenglp_z,MDS12; \|\; pubiengcp_z,MDS12; \|\; ptotvtacp_z,MDS12;
\|\; ptotvtalp_z,MDS12; \|\; GFONT20; l;
f5; k3; P$;  
R;

#ibusca.i;

[SALDEBUS;
!(bandb_z)0($T,1)>|; (tda_z)=(codigo_tda,#); .
!(bandprog_z)0($1,1)>|; GKprog1; .
R;

[DESPTITULO;
t@1,1;
!(bandb_z)0($T,1)>|; \Listado de Codigos Cartera\; .
R;

[BUSCAINI;
!(bandb_z)0($T,1)>|; f2; k2; P; .
R;

[SELARCH;
!(bandb_z)0($T,1)>|; f2; .
R;

[DESPRENOR;
!(bandb_z)0($T,1)>|;
  t@ren_z,col1_z; pcodigo_tda,2; s1; pnombre_tda,31;
.
R;

[nvoreg; R;


[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

[Kprog1; R;
[Kprog2; R;
[Kprog4; R;

#isacaf.i;
#iimpri.i;

[TOMAALTAS;
!(voc_z)0($V,1)>|;
  Ff6; FOaltas.ini~,r~;
|
  Ff6; FOcartera.ini~,r~;
.
{ Ff6; FG+; z0,milinea_z,#; Fkmilinea_z,l;
  !(milinea_z)0($clientes:,9)>|; Ff6; FG+; Fkclientes_z,l; g-; .
  !(milinea_z)0($mvcli:,6)>|;    Ff6; FG+; Fkmvcli_z,l;    g-; .
  !(milinea_z)0($dircli:,7)>|;   Ff6; FG+; Fktbdircl_z,l;   g-; .
  !(milinea_z)0($solicit:,8)>|;  Ff6; FG+; Fksolicit_z,l;  g-; .
)
R;

[ABRE_TABLA;
GTOMAALTAS;
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
Ff1; GST; pmibd_z,0;
f1; M
	numcli_cli              s11,
        tienda_cli              i,
        fechavta_cli            {
          fechavtaYear_cli        i,
          fechavtaMon_cli         i,
          fechavtaDay_cli         i,
          			}
        status_cli              s2,
        nombre_cli              s35,
        qom_cli                 s2,
        ticte_cli               s3,
        letra1_cli              d,
        enganc_cli              d,
        nulet1_cli              i,
        canle1_cli              d,
        nulet2_cli              i,
        canle2_cli              d,
        bonifi_cli              d,
        servic_cli              d,
        precon_cli              d,
        cargos_cli		d,
        piva_cli		d,
        ubiage_cli		s3,
        jefgpo_cli		s4,
        agente_cli		s4,
        idcli_cli		l,
        operac_cli		s2,
        tiplazo_cli		s2,
        tam_cli			s0,;
k0; ot,clientes_z,;
k1; kq,"select a.numcli,a.tienda,a.fechavta,a.status,a.nombre,a.qom,
	a.ticte,a.letra1,a.enganc,a.nulet1,a.canle1,a.nulet2,a.canle2,
        a.bonifi,a.servic,a.precon,a.cargos,a.piva,a.ubiage,a.jefgpo,
        a.agente,a.idcli,a.operac, f.tiplazo
        from car_rutamortmp b join car_tipocardet c
        on b.idpoblac = c.idtipocardet join clientes a on c.ticte = a.ticte
        join car_corlarpzodet d on a.qom = d.qom and a.nulet1 = d.nulets
        join car_corlarpzo f on d.idcorlarpzo = f.idcorlarpzo
        join car_anuscartera e on
        ( year(a.fechavta) >= e.anuini and year(a.fechavta) <= e.anufin)
        and d.idanucartera = e.idanucartera
        
        where a.fechavta between ? and ? and tienda between ? and ?
        and ubiage between ? and ? and piva between ? and ? and b.idruta=?
        and ( a.status = ? or a.status = ? )
        order by ubiage,tienda,numcli,fechavta",
        fecini_z,#,3,fecult_z,#,3,tdaini_z,tdault_z,prubi_z,#,1,ulubi_z,#,1,
        prtasa_z,ultasa_z,idtarea_z,status1_z,#,1,status2_z,#,1,;
k2; kq,"select a.numcli,a.tienda,a.fechavta,a.status,a.nombre,a.qom,
	a.ticte,a.letra1,a.enganc,a.nulet1,a.canle1,a.nulet2,a.canle2,
        a.bonifi,a.servic,a.precon,a.cargos,a.piva,a.ubiage,a.jefgpo,
        a.agente,a.idcli,a.operac
        from car_rutamortmp b join car_tipocardet c
        on b.idpoblac = c.idtipocardet join clientes a on c.ticte = a.ticte
        where a.fechavta between ? and ? and tienda between ? and ?
        and ubiage = 'CA' and piva between ? and ? and b.idruta=?
        and ( a.status = ? or a.status = ? )
        order by ubiage,tienda,numcli,fechavta",
        fecini_z,#,3,fecult_z,#,3,tdaini_z,tdault_z,prtasa_z,ultasa_z,
        idtarea_z,status1_z,#,1,status2_z,#,1,;
k3; kq,"select a.numcli,a.tienda,a.fechavta,a.status,a.nombre,a.qom,
	a.ticte,a.letra1,a.enganc,a.nulet1,a.canle1,a.nulet2,a.canle2,
        a.bonifi,a.servic,a.precon,a.cargos,a.piva,a.ubiage,a.jefgpo,
        a.agente,a.idcli,a.operac
        from car_rutamortmp b join car_tipocardet c
        on b.idpoblac = c.idtipocardet join clientes a on c.ticte = a.ticte
        where a.fechavta between ? and ? and tienda between ? and ?
        and ubiage <> 'CA' and ubiage between ? and ? 
        and piva between ? and ? and b.idruta=?
        and ( a.status = ? or a.status = ? )
        order by ubiage,tienda,numcli,fechavta",
        fecini_z,#,3,fecult_z,#,3,tdaini_z,tdault_z,prubi_z,#,1,ulubi_z,#,1,
        prtasa_z,ultasa_z,idtarea_z,status1_z,#,1,status2_z,#,1,;

f2; #itiendas.i;
k0; ot,"tiendas",;
k1; kp,"codigo=?",tda_z,#,1,;
k2; kp,"codigo <> ? order by codigo",tda_z,#,1,;

f3; #iubivta.i;
k0; ot,"ubivta",;
k1; kp,"codcar='00' and ubica=?",ubica_z,#,1,;

f4; #imvcli2.i;
k0; ot,mvcli_z,;
k1; kp,"idcli=? and  ace='P'",idcli_z,;

f5; #iresanali.i;
k0; ot,"resanali",;
k1; kp,"tarea=? and cod=?",termi_z,anttda_z,;
k2; kp,"tarea=? order by cod",termi_z,;
k3; kq,"delete from resanali where tarea=?",termi_z,;
k4; kq,"insert into resanali
	(tarea,cod,clicon,clicrd,engctopl,englarpl,vtactopl,vtalarpl)
        values (?,?,?,?,?,?,?,?)",
        tarea_ran,cod_ran,clicon_ran,clicrd_ran,engctopl_ran,englarpl_ran,
        vtactopl_ran,vtalarpl_ran,;
k5; kq,"update resanali set clicon=?,clicrd=?,engctopl=?,englarpl=?,
	vtactopl=?,vtalarpl=? where tarea=? and cod=?",
        clicon_ran,clicrd_ran,engctopl_ran,englarpl_ran,
        vtactopl_ran,vtalarpl_ran,termi_z,anttda_z,;

f6; #iedorescar.i;
k0; ot,"edorescar",;
k1; kp,"fecha=? and cod=? and tasiva=? and anter=?",
	fecult_z,#,3,tda_z,#,1,piva_z,anu_z,;
k2; kq,"update edorescar set vtasctopl=0,vtaslarpl=0,engctopl=0,englgopl=0,
	clicrdca=0,clicrdpi=0 where fecha=?",
        fecult_z,#,3,;
k3; kq,"update edorescar set vtasctopl=vtasctopl+?,vtaslarpl=vtaslarpl+?,
	engctopl=engctopl+?,englgopl=englgopl+?,clicrdca=clicrdca+?,
        clicrdpi=clicrdpi+? where fecha=? and cod=? and tasiva=? and anter=?",
        codvtacp_z,codvtalp_z,codengcp_z,codenglp_z,clica_z,clipi_z,
        fecult_z,#,3,tda_z,#,1,piva_z,anu_z,;
k4; kq,"insert into edorescar (fecha,tasiva,cod,vtasctopl,vtaslarpl,engctopl,
	englgopl,polizasctopl,polizaslarpl,cancelctopl,cancellarpl,
        incobctopl,incoblarpl,totcarctopl,totcarlarpl,clivig,clisdos,
        clicrdca,clicrdpi,clicanca,clicanpi,vigprlis,clisdprlis, anter)
	values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        fecha_edc,#,3,tasiva_edc,cod_edc,#,1,vtasctopl_edc,
        vtaslarpl_edc,engctopl_edc,englgopl_edc,polizasctopl_edc,
        polizaslarpl_edc,cancelctopl_edc,cancellarpl_edc,incobctopl_edc,
        incoblarpl_edc,totcarctopl_edc,totcarlarpl_edc,clivig_edc,
        clisdos_edc,clicrdca_edc,clicrdpi_edc,clicanca_edc,clicanpi_edc,
        vigprlis_edc,clisdprlis_edc,anter_edc,;
k5; kq,"update edorescar set vtasctopl=vtasctopl+?, vtaslarpl=vtaslarpl+?,
	engctopl=engctopl+?, englgopl=englgopl+?,
        clicrdca=clicrdca+?, clicrdpi=clicrdpi+?
        where fecha=? and cod=? and tasiva=? and anter=?",
	vtactopl_z,vtalarpl_z,engctopl_z,englarpl_z,clienca_z,clienpi_z,
	fecult_z,#,3,tda_z,#,1,piva_z,anu_z,;

f7; M
	codigo_ind7		i,
        qom_ind7		s2,
        ubiage_ind7		s3,
        nulets_ind7		i,
        piva_ind7		d,
        anucartera_ind7		l,
        tiplazo_ind7		s2,
        cargos_ind7		d,
        prelis_ind7		d,
        servic_ind7		d,
        cuantos_ind7		l,
        tam_ind7		s0,;
k0; ot,"clientes",;
k1; kq,"select tienda, a.qom, ubiage, nulet1, piva, e.anucartera, f.tiplazo,
	sum(cargos), sum(precon), sum(servic), count(*)
	from clientes a 
        join car_corlarpzodet d on a.qom = d.qom and a.nulet1 = d.nulets
        join car_corlarpzo f on d.idcorlarpzo = f.idcorlarpzo
        join car_anuscartera e on
        ( year(a.fechavta) >= e.anuini and year(a.fechavta) <= e.anufin)
        and d.idanucartera = e.idanucartera
	where fechavta between ? and ?
        and tienda = ? and ubiage=?
	and a.qom <> 'C' 
        and ( a.status = ? or a.status = ? )
        group by tienda, a.qom, ubiage, nulet1, piva, e.anucartera, f.tiplazo",
        fecini_z,#,3,fecult_z,#,3,anttda_z,ubica_z,#,1,
        status1_z,#,1,status2_z,#,1,;
k2; kq,"select tienda, a.qom, ubiage, nulet1, piva, e.anucartera, f.tiplazo,
	sum(import), sum(import), sum(servic), count(*)
	from clientes a join mvcli2 b on a.idcli = b.idcli
        join car_corlarpzodet d on a.qom = d.qom and a.nulet1 = d.nulets
        join car_corlarpzo f on d.idcorlarpzo = f.idcorlarpzo
        join car_anuscartera e on
        ( year(a.fechavta) >= e.anuini and year(a.fechavta) <= e.anufin)
        and d.idanucartera = e.idanucartera
        where fechavta between ? and ?
        and tienda = ? and ubiage=?
	and a.qom <> 'C'
        and ace = 'P'
        and ( a.status = ? or a.status = ? )
        group by tienda, a.qom, ubiage, nulet1, piva, e.anucartera, f.tiplazo",
        fecini_z,#,3,fecult_z,#,3,anttda_z,ubica_z,#,1,
        status1_z,#,1,status2_z,#,1,;

f8; #icar_rutamortmp.i;
k0; ot,"car_rutamortmp",;
k1; kq,"delete from car_rutamortmp where idruta=?",idtarea_z,;
k2; kq,"insert into car_rutamortmp (iddesruta,idruta,idpoblac,kilom,cia)
	values (?,?,?,?,?)",
        iddesruta_ruttmp,idruta_ruttmp,idpoblac_ruttmp,kilom_ruttmp,
        cia_ruttmp,;
k3; kq,"select * from car_rutamortmp where iddesruta = 
	( select max(iddesruta) from car_rutamortmp)",;

f9; M
	enganc_ind9		d,
        tam_ind9		s0,;
k0; ot,"mvcli2",;
k1; kq,"select sum(import) from mvcli2 where idcli=? and  ace='P'",idcli_z,;

f10; #icar_anuscartera.i;
k0; ot,"car_anuscartera",;
k1; kp,"anuini <= ? and anufin >= ?",anu_z,anu_z,;


f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;
#i/programas/lib/fechas.i;

[PAN; 
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro;
GST; tf; tn; 
tP/programas/vps/cartera/analivta.s~;
tL/programas/vps/cartera/analivta.pos~;
#iprog1.i; ^=direc_z,#); z0,modul_z,#;
(modul_z)=($Analitico de Ventas,19); (modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[ERROR1; GST; `7; \No pude agregar registro en mantos.v ...\; gFin1;
[ERROR4; GST; `7; \No pude agregar registro \; pteruser_z,0; gFin1;
[NOTDA; z0,nombre_tda,#; (nombre_tda)=($INEXISTENTE,11); R;
[NOUBI; z0,nombre_ubi,#; (nombre_ubi)=($INEXISTENTE,11); R;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
