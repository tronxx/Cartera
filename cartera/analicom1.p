* Programa que sirve para hacer el reporte de los clientes analitico de ventas
  DRBR 24 de Septiembre de 1997
*

#dMIS02 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS5 %5.2f~; #dMDS9 %-9.2f~;
#dMIE2 %2d~;   #dMIS3X %03dx~; #dMIS3 %3d~; #dMFS6 %6.2f~;
#i/programas/lib/funkey.i;

f0; M
	impre_z			i,
	font_z			i,
	micar_z			s3,
	carac_z			i,
	
	ter_z            s2,
	fech9_z     {
	  dias2_z       s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
	bandman_z        s1,
	band_z           s1,
	bandh_z          s1,

	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,

	nemp_z		s80,
	direc_z		s50,
	modul_z		s30,
	modul2_z	s10,
	usuarios_z      s80,
	teruser_z       s80,
	mibd_z          s80,
	nombuse_z       s15,
	clause_z        s10,
	voc_z			s2,
	sqlcmd_z		s100,
	milinea_z		s100,
	clientes_z		s20,
	mvcli_z			s20,
	tbdircl_z		s20,
	solicit_z		s20,
	
	bandf1_z	 s1,
	bandimp_z		s1,
	saldo_z		d,

	fech8_z           D,
	fecha_z			D,
	fechb_z			D,
	cop_z			s2,
	codcli_z		s11,

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
	tdaini_z		i,
	tdault_z		i,
	anttda_z		i,
	tda_z			s3,
	ubica_z			s4,
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
	codcomis_z		d,
	ubicomis_z		d,
	totcomis_z		d,
	codtotcrd_z		d,
	codtoteng_z		d,
	porc_z			d,
	antprom_z		s4,
	
	ubitotlis_z		d,
	ubitotcrd_z		d,
	ubitoteng_z		d,

	tottotlis_z		d,
	tottotcrd_z		d,
	tottoteng_z		d,

	codvtacp_z		d,
	codvtalp_z		d,
	codvtacc_z		d,
	codengcp_z		d,
	codenglp_z		d,

	ubivtacp_z		d,
	ubivtalp_z		d,
	ubivtacc_z		d,
	ubiengcp_z		d,
	ubienglp_z		d,

	totvtacp_z		d,
	totvtalp_z		d,
	totvtacc_z		d,
	totengcp_z		d,
	totenglp_z		d,

	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;

mtam0&; tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; (arch_z)=($analicom.tex,12); ttttermi_z; (impre_z)=(1); (piva_z)=(15);

[fei; t@5,3; \Fecha Inicial: \; t0Fin; &a; &cfecha_z; ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
[feu; t@5,40; \Fecha Final :\; t0fei; (fechb_z)=(fecha_z); ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
[prt; t@6,3; \Del Codigo:\; t0feu; t@6,20; itdaini_z,MIE2,MIS2;
[ult; t@6,40; \Al Codigo:\; t0prt; t@6,60; itdault_z,MIE2,MIS2;
[cop; t@7,3; \Deseas Reporte de `C`alle `P`iso `T`odo <C/P/T> ?: \; t0ult; icop_z,1;
!(cop_z)5($C,1)(cop_z)5($P,1)(cop_z)5($T,1)&&>cop;
[cov; t@8,3; \Deseas Reporte de `V`entas o `C`artera ? <V/C> :\;
t0cop; ivoc_z,1; !(voc_z)5($C,1)(voc_z)5($V,1)&>cov;

* Modificacion

[pro; t@9,3; \Promotor Inicial:\;
t0pro; ivoc_z,1; !(voc_z)5($C,1)(voc_z)5($V,1)&>cov;

[prt; t@6,3; \Del Codigo:\; t0feu; t@6,20; itdaini_z,MIE2,MIS2;
[ult; t@6,40; \Al Codigo:\; t0prt; t@6,60; itdault_z,MIE2,MIS2;



GST; \Estan correctos los datos ? <S/N> : \; y|; | gcop; .
GABRE_TABLA;

f1;
!(cop_z)0($T,1)>|; k1; .
!(cop_z)0($C,1)>|; k2; .
!(cop_z)0($P,1)>|; k3; .
P;
{ n+;
  tr; Ff1; t@10,3; \Leyendo:\; pnumcli_cli,#; s1; pnombre_cli,#;
  !(ubiage_cli)5(ubica_z,#)>|;
    !(band_z)5($S,1)>|;
      (ubica_z)=(ubiage_cli,#); (antprom_z)=(jefgpo_cli,#);
      tc; Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
    |
      !(ubica_z)0($CA,2)>|; GSUBTPROM; . GSUBTUBI; (ubica_z)=(ubiage_cli,#);
      (antprom_z)=(jefgpo_cli,#); GSUBENCUBI;
    .
  .
  !(jefgpo_cli)5(antprom_z,#)(ubica_z)0($CA,2)&>|;
    GSUBTPROM; (antprom_z)=(jefgpo_cli,#); GSUBENCPROM;
  .
  GIMPRI;
  f1; a;
)
!(band_z)5($S,1)>Fin;
GSUBTPROM; GSUBTUBI; GULIN; Ff4; FC; tr; GSalir;
gFin;
R;

[Enc;
tc; Ff3; FT; FGNodatos; Ff4; GFONT11; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \analicom \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1;
phora_z,#; s1; FW3; l;
Fc55,\Analitico Comisiones de Ventas del ~; pfecha_z,+10; \ Al \; pfechb_z,+10;
\ Pag:\; Fp%d~; GFONT12; l;
!(voc_z)0($V,1)>|;
  \REPORTE CLIENTES VENTAS\;
|
  \REPORTE CLIENTES CARTERA\;
.
l;
GSUBENCUBI; (band_z)=($S,1);
Ft;

[Pie; Fe;

[SUBENCUBI;
tc; Ff4; \Ubicacion:\; GFONT15; pubica_z,#; s1; 
!(ubica_z)0($CA,2)>|;
  \CALLE\; l; GSUBENCPROM;
|
  f3; k1; P; n|; GNOUBI; . pnombre_ubi,#; l; GSUBENCGRAL;
.
R;

[SUBENCPROM;
tc; Ff4;
\Promotor:\; GFONT15; pantprom_z,#;
s1; f4; k1; P; n|; GNOPROM; . pnombre_prm,#; l; GSUBENCGRAL;
R;

[SUBENCGRAL;
tc; Ff4;
\Nombre_del_Cliente                             Precio_Lista Vnd     Comision %Comis Plz TC\; l;
R;

[IMPRI;
tc; Ff4; pnombre_cli,0; pstatus_cli,0; s1; pnumcli_cli,0; s1; pprecon_cli,MDS12;
s1; pagente_cli,0; s1; pcomisi_cli,MDS12;
!(precon_cli)5($0)>|; (porc_z)=(comisi_cli)(precon_cli)/(100)*; .
s1; pporc_z,MFS6; s1; pnulet1_cli,MIS2; pqom_cli,0; s1; pticte_cli,0; l;
!(comis2_cli)5($0)>|;
  s60; pagent2_cli,0; s1; pcomis2_cli,MDS12; s1;
  !(precon_cli)5($0)>|; (porc_z)=(comis2_cli)(precon_cli)/(100)*; .
  pporc_z,MFS6; l;
.
 
(codtotlis_z)=(codtotlis_z)(precon_cli)+;
(codcomis_z)=(codcomis_z)(comisi_cli)+(comis2_cli)+;
(ubitotlis_z)=(ubitotlis_z)(precon_cli)+;
(ubicomis_z)=(ubicomis_z)(comisi_cli)+(comis2_cli)+;
R;

[SUBTPROM;
tc; Ff4; s6; \Total de este Promotor  :\; s16; pcodtotlis_z,MDS12; s5;
pcodcomis_z,MDS12; l; l;
z0,codtotlis_z,#; z0,codcomis_z,#;
R;

[NOPDAGF6; tr; Ff1; GST; `7; \No pude agregar registro en edorescar...\; y|;. R;
[NOPDAGF5; tr; Ff1; GST; `7; \No pude agregar registro en resanali...\; y|;. R;
[NOPDMDF5; tr; Ff1; GST; `7; \No pude Modificar registro en resanali...\; y|;. R;

[SUBTUBI;
tc; Ff4; s6; \Total de esta Ubicacion :\; s16; pubitotlis_z,MDS12; s5;
pubicomis_z,MDS12; l; l;
(tottotlis_z)=(tottotlis_z)(ubitotlis_z)+; z0,ubitotlis_z,#; z0,codtotlis_z,#; 
(totcomis_z)=(totcomis_z)(ubicomis_z)+;    z0,ubicomis_z,#;  z0,codcomis_z,#;
R;

[ULIN;
tc; Ff4; s6; \Total General           :\; s16; ptottotlis_z,MDS12;
s5; ptotcomis_z,MDS12; l;
R;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

#isacaf.i;
#iimpri.i;

[TOMAALTAS;
!(voc_z)0($V,1)>|;
  Ff6; FOaltas.ini~,r~;
|
  Ff6; FOcartera.ini~,r~;
.
{ Ff6; FG+; z0,milinea_z,#; Fkmilinea_z,l;
  !(milinea_z)0($clientes:,9)>|; Ff6; FG+; Fkclientes_z,l;	g-; .
  !(milinea_z)0($mvcli:,6)>|;    Ff6; FG+; Fkmvcli_z,l;    	g-; .
  !(milinea_z)0($dircli:,7)>|;   Ff6; FG+; Fktbdircl_z,l;   	g-; .
  !(milinea_z)0($solicit:,8)>|;  Ff6; FG+; Fksolicit_z,l;  	g-; .
)
R;

[ABRE_TABLA;
GTOMAALTAS;
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #iclientes.i;
k0; ot,clientes_z,;
k1; kp,"fechavta between ? and ? and tienda between ? and ? order by ubiage,jefgpo,numcli",
    fecini_z,#,3,fecult_z,#,3,tdaini_z,tdault_z,;

k2; kp,"fechavta between ? and ? and tienda between ? and ? and ubiage = 'CA' order by ubiage,jefgpo,numcli",
    fecini_z,#,3,fecult_z,#,3,tdaini_z,tdault_z,;

k3; kp,"fechavta between ? and ? and tienda between ? and ? and ubiage <> 'CA' order by ubiage,jefgpo,numcli",
    fecini_z,#,3,fecult_z,#,3,tdaini_z,tdault_z,;

f2; #itiendas.i;
k0; ot,"tiendas",;
k1; kp,"codigo=?",tda_z,#,1,;

f3; #iubivta.i;
k0; ot,"ubivta",;
k1; kp,"codcar='00' and ubica=?",ubica_z,#,1,;


f4; #ipromotor.i;
k0; ot,"promotor",;
k1; kp,"clave=? ",antprom_z,#,1,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

[PAN; 
Ff1; GST; tf; tn; #iprog1.i; ^=direc_z,#); z0,modul_z,#;
(modul_z)=($Analitico de Ventas,19); (modul2_z)=($CAR-MDS,7);
Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
(esp_z)=(80)(exten_z)-(2)/; Ff1; t@1,esp_z; pnemp_z,0;
Fslexten_z,modul_z; (esp_z)=(79)(exten_z)-; t@0,esp_z; pmodul_z,0; ta0; tp;
Fslexten_z,modul2_z; (esp_z)=(78)(exten_z)-; t@1,esp_z; pmodul2_z,0;
R;

[R; R; [E; ];
[ST; t@21,1; ta0; s78; t@21,1; ta1; ta=; ta0; tp; R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[ERROR1; GST; `7; \No pude agregar registro en mantos.v ...\; gFin1;
[ERROR4; GST; `7; \No pude agregar registro \; pteruser_z,0; gFin1;
[NOPROM; z0,nombre_prm,#; (nombre_prm)=($INEXISTENTE,11); R;
[NOUBI; z0,nombre_ubi,#; (nombre_ubi)=($INEXISTENTE,11); R;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };

