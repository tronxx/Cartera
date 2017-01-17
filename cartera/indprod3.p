* Programa que sirve para Generar el Indice de Productividad de Cobratarios
  DRBR 4 de Febrero de 1998
*

#dMIS02 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMFS6 %6.2f~; #dMLS4 %4ld~; #dMFS5 %5.2f~; #dMDS9 %-9.2f~;
#i/programas/lib/funkey.i;

f0; M
	maxcol_z		i,
        maxrow_z		i,
        renst_z			i,
        sff_z			s2,
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
	ter_z            s2,
	fech9_z     {
	  dias2_z       s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
	bandman_z        s1,
	band_z           s1,
	bandh_z          s1,
	enc_z			i,
	nemp_z		s80,
	direc_z		s50,
	modul_z		s30,
	modul2_z	s10,
	usuarios_z      s80,
	teruser_z       s80,
	mibd_z          s80,
	nombuse_z       s15,
	clause_z        s10,
	bandf1_z	 s1,
	saldo_z		d,
	
	bandimp_z		s1,
	fecha_z			D,
	fechb_z			D,
	pol_z			s3,
	prpol_z			s3,
	ulpol_z			s3,
	cobr_z			s4,
	relacion_z		d,
	cobrado_z		d,
	porcen_z		d,
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
	fechmov_z	{
	  fechmovaa_z		i,
	  fechmovmm_z		i,
	  fechmovdd_z		i,
	  		}

	fech8_z           	D,
	nelem_z			i,
	ancho_z			i,
	espa2_z			i,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;

mtam0&; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; GABRE_TABLA; (arch_z)=($indprodu.tex,12); (impre_z)=(1);

[fei; t@5,3; \Fecha Inicial:\; t0Fin; &a; &cfecha_z; ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
[feu; t@5,40; \Fecha Final:\; t0fei; (fechb_z)=(fecha_z); ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
[tda; t@6,3; \De la Poliza:\; t0feu; iprpol_z,2;
[ulp; t@6,40; \A la Poliza:\; t0tda; iulpol_z,2;
GST; \Estan correctos los datos ? <S/N> :\; y|; | gtda; .

tS1,7,0,12,80; tv0; tc;
(enc_z)=(1); f8; k1; P;
{ n+;
  (pol_z)=(poliza_pol,#); GIMPRISOLO;
  f8; a;
)
(enc_z)=(2); GIMPRIRESUMEN;
Ff4; FC; Ff1; tr; tS0; GSalir;
gFin;
R;

[IMPRISOLO;
!(band_z)5($S,1)>|;
  Ff4; FO(arch_z),w~; FP66,60,Enc,Pie; (band_z)=($S,1);
|
  Ff4; GFONT30;
.
f3; k1; P;
{ n+;
  GIMPRI;
  GCORTA;
  f3; a;
)
GULIN;
R;

[IMPRIRESUMEN;
!(band_z)5($S,1)>|;
  Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;  (band_z)=($S,1);
|
  Ff4; GFONT30;
.
f3; k2; P;
{ n+;
  GIMPRI;
  f3; a;
)
GULIN;
R;

[Enc;
Ff3; FT; FGNodatos; Ff4; GFONT14; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \indprod \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1;
phora_z,#; s1; FW3; l;
Fc45,\Analisis de Indice de Productividad del ~; pfecha_z,+10; \ Al \;
pfechb_z,+10; \ Pag:\; Fp%d~; l; GFONT15;
!(enc_z)0($1)>|;
  \Informe de :\; ppol_z,0; f6; k1; P; n|; GNOTDA; .
  s1; pnombre_tda,0;
|
  \Inform de Acumulado de \; pprpol_z,0; \ A:\; pulpol_z,0; 
.
GFONT16; GFONT13; l;
z0,nelem_z,#;
!(enc_z)0($1)>|; f7; k1; P; .
!(enc_z)0($2)>|; f7; k2; P; .
{ n+; (nelem_z)=(nelem_z)(1)+; f7; a; )
(espa2_z)=(132)(nelem_z)(2)+(12)*-(2)/; !(espa2_z)2($0)>|; z0,espa2_z,#; .
(ancho_z)=(nelem_z)(1)+(13)*(11)+;
sespa2_z; c_ancho_z; l;
sespa2_z; \|RELACIONAD|\; 
!(enc_z)0($1)>|; f7; k1; P; .
!(enc_z)0($2)>|; f7; k2; P; .
{ n+;
  ppromo_3acu,0; s1; (cobr_z)=(promo_3acu,#); f2; k1; P; n|; GNOPROM; .
  pnombre_prm,8; \|\;
  f7; a;
)
\      Total |\; l;
sespa2_z; \|Cobrado   |\; (ind1_z)=(nelem_z)(1)+;
{ !(ind1_z)4($0)>+; \            |\; (ind1_z)=(ind1_z)(1)-; ) l;
sespa2_z; GFONT19; \|%Productiv|\; (ind1_z)=(nelem_z)(1)+;
{ !(ind1_z)4($0)>+; \            |\; (ind1_z)=(ind1_z)(1)-; ) GFONT20; l;
Ft;

[Pie; GCORTA; Fe;

[CORTA;
Ff4;
sespa2_z; \|__________|\; (ind1_z)=(nelem_z)(1)+;
{ !(ind1_z)4($0)>+; \____________|\; (ind1_z)=(ind1_z)(1)-; ) l;
R;

[IMPRI;
z0,relacion_z,#; z0,cobrado_z,#;
Ff4; sespa2_z; \|\; s10; \|\; (fechmov_z)=(fechas_acu1,#);
!(enc_z)0($1)>|; f7; k1; P; .
!(enc_z)0($2)>|; f7; k2; P; .
{ n+;
  (cobr_z)=(promo_3acu,#); z0,cobrado_2acu,l; 
  !(enc_z)0($1)>|; f4; k4; P; n|;. .
  !(enc_z)0($2)>|; f4; k3; P; n|;. .
  n|;.
   Ff1; \Leyendo:\; pfechmovaa_z,MIS2; \-\;
  pfechmovmm_z,MIS2; \-\; pfechmovdd_z,MIS2; s1; pcobr_z,0; s1; ppol_z,0; l;
  Ff4; prelacdo_2acu,MDS12; \|\;
  (relacion_z)=(relacion_z)(relacdo_2acu)+;
  f7; a;
)
Ff4; prelacion_z,MDS12; \|\; l;
sespa2_z; \|\; pfechasdd_acu1,MIS2; \-\; pfechasmm_acu1,MIS2; \-\;
pfechasaa_acu1,MIS2; \|\;
!(enc_z)0($1)>|; f7; k1; P; .
!(enc_z)0($2)>|; f7; k2; P; .
{ n+;
  (cobr_z)=(promo_3acu,#); z0,cobrado_2acu,l;
  !(enc_z)0($1)>|; f4; k4; P; .
  !(enc_z)0($2)>|; f4; k3; P; .
  n|;.
  Ff1; \Leyendo:\; pfechmovaa_z,MIS2; \-\;
  pfechmovmm_z,MIS2; \-\; pfechmovdd_z,MIS2; s1; ppromo_3acu,0; l;
  Ff4; pcobrado_2acu,MDS12; \|\; (cobrado_z)=(cobrado_z)(cobrado_2acu)+;
  f7; a;
)
Ff4; pcobrado_z,MDS12; \|\; l;
sespa2_z; GFONT19; \|\; s10; \|\;

!(enc_z)0($1)>|; f7; k1; P; .
!(enc_z)0($2)>|; f7; k2; P; .
{ n+;
  (cobr_z)=(promo_3acu,#); z0,cobrado_2acu,l;
  !(enc_z)0($1)>|; f4; k4; P; .
  !(enc_z)0($2)>|; f4; k3; P; .
  n|;.
  Ff1; \Leyendo:\; pfechmovaa_z,MIS2; \-\;
  pfechmovmm_z,MIS2; \-\; pfechmovdd_z,MIS2; s1; ppromo_3acu,0; l;
  z0,porcen_z,#;
  !(relacdo_2acu)5($0)>|; (porcen_z)=(cobrado_2acu)(relacdo_2acu)/(100)*; .  
  Ff4; s3; pporcen_z,MFS6; \%  |\;
  f7; a;
)
!(relacion_z)5($0)>|; (porcen_z)=(cobrado_z)(relacion_z)/(100)*; .
Ff4; s3; pporcen_z,MFS6; \%  |\; GFONT20; l;
R;

[ULIN;
z0,relacion_z,#; z0,cobrado_z,#;
Ff4; sespa2_z; \| Totales  |\;
!(enc_z)0($1)>|; f7; k1; P; .
!(enc_z)0($2)>|; f7; k2; P; .
{ n+;
  (cobr_z)=(promo_3acu,#); z0,cobrado_2acu,l;
  !(enc_z)0($1)>|; f4; k1; P; .
  !(enc_z)0($2)>|; f4; k2; P; .
  n|;.
  Ff4; prelacdo_2acu,MDS12; \|\; (relacion_z)=(relacion_z)(relacdo_2acu)+;
  f7; a;
)
Ff4; prelacion_z,MDS12; \|\; l;
sespa2_z; \|          |\;
!(enc_z)0($1)>|; f7; k1; P; .
!(enc_z)0($2)>|; f7; k2; P; .
{ n+;
  (cobr_z)=(promo_3acu,#); z0,cobrado_2acu,l;
  !(enc_z)0($1)>|; f4; k1; P; .
  !(enc_z)0($2)>|; f4; k2; P; .
  n|;.
  Ff4; pcobrado_2acu,MDS12; \|\; (cobrado_z)=(cobrado_z)(cobrado_2acu)+;
  f7; a;
)
Ff4; pcobrado_z,MDS12; \|\; l;
sespa2_z; GFONT19; \|\; s10; \|\;
!(enc_z)0($1)>|; f7; k1; P; .
!(enc_z)0($2)>|; f7; k2; P; .
{ n+;
  (cobr_z)=(promo_3acu,#); z0,cobrado_2acu,l;
  !(enc_z)0($1)>|; f4; k1; P; .
  !(enc_z)0($2)>|; f4; k2; P; .
  n|;.
  z0,porcen_z,#;
  !(relacdo_2acu)5($0)>|; (porcen_z)=(cobrado_2acu)(relacdo_2acu)/(100)*; .  
  Ff4; s3; pporcen_z,MFS6; \%  |\;
  f7; a;
)
!(relacion_z)5($0)>|; (porcen_z)=(cobrado_z)(relacion_z)/(100)*; .
Ff4; s3; pporcen_z,MFS6; \%  |\; GFONT20; l; l;
(cobr_z)=(promo_3acu,#); z0,cobrado_2acu,l;
!(enc_z)0($1)>|; f4; k5; P; .
!(enc_z)0($2)>|; f4; k6; P; .
n|;.
\Cobranza No Relacionada :\; pcobrado_2acu,MDS12;
(cobrado_z)=(cobrado_z)(cobrado_2acu)+;
!(relacion_z)5($0)>|; (porcen_z)=(cobrado_z)(relacion_z)/(100)*; .
\ Total Cobrado:\; pcobrado_z,MDS12;  pporcen_z,MFS6; \% Prod.Global\; l;
R;

[MANDAELFNT; f5; k1; P; nR; GSACAF; R;

#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #icomiscob.i;
k0; ot,"comiscob",;
k1; kp,"fecha=? and poliza=? and promo=?",
    fechmov_z,#,3,pol_z,#,1,cobr_z,#,1,;

f2; #ipromotor.i;
k0; ot,"promotor",;
k1; kp,"clave=?",cobr_z,#,1,;

f3; M
	fechas_acu1	{
	  fechasaa_acu1		i,
	  fechasmm_acu1		i,
	  fechasdd_acu1		i,
	  		}
	 tam_acu1		s0,;
k0; ot,"comiscob",;
k1; kq,"select unique fecha from comiscob where fecha between ? and ?
    and poliza=? and rel <> 0",
    fecini_z,#,3,fecult_z,#,3,pol_z,#,1,;
k2; kq,"select unique fecha from comiscob where fecha between ? and ?
    and poliza between ? and ? and rel <> 0",
    fecini_z,#,3,fecult_z,#,3,prpol_z,#,1,ulpol_z,#,1,;

f4; M
	cobrado_2acu		d,
	relacdo_2acu		d,
	tam_2acu		s0,;
k0; ot,"comiscob",;
k1; kq,"select sum(imp),sum(rel) from comiscob where fecha between ? and ?
    and promo=? and poliza=?",
    fecini_z,#,3,fecult_z,#,3,cobr_z,#,1,pol_z,#,1,;
k2; kq,"select sum(imp),sum(rel) from comiscob where fecha between ? and ?
    and promo=? and poliza between ? and ?",
    fecini_z,#,3,fecult_z,#,3,cobr_z,#,1,prpol_z,#,1,ulpol_z,#,1,;
k3; kq,"select sum(imp),sum(rel) from comiscob where fecha =?
    and promo=? and poliza between ? and ?",
    fechmov_z,#,3,cobr_z,#,1,prpol_z,#,1,ulpol_z,#,1,;
k4; kq,"select imp,rel from comiscob where fecha=? and promo=? and poliza=?",
    fechmov_z,#,3,cobr_z,#,1,pol_z,#,1,;
k5; kq,"select sum(imp),sum(rel) from comiscob where fecha between ? and ?
    and poliza=? and rel = 0 and promo not in
    (select unique promo from comiscob where fecha between ? and ?
      and poliza=? and rel <> 0
    )",
    fecini_z,#,3,fecult_z,#,3,pol_z,#,1,
    fecini_z,#,3,fecult_z,#,3,pol_z,#,1,;
k6; kq,"select sum(imp),sum(rel) from comiscob where fecha between ? and ?
    and poliza between ? and ? and rel=0 and promo not in
    (select unique promo from comiscob where fecha between ? and ?
      and poliza between ? and ? and rel <> 0
    )",
    fecini_z,#,3,fecult_z,#,3,prpol_z,#,1,ulpol_z,#,1,
    fecini_z,#,3,fecult_z,#,3,prpol_z,#,1,ulpol_z,#,1,;

    
f5; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;

f6; #itiendas.i;
k0; ot,"tiendas",;
k1; kp,"codigo=?",pol_z,#,1,;

f7; M
	promo_3acu		s4,
	nombre_3acu		s31,;
	
k0; ot,"comiscob",;
k1; kq,"select unique promo from comiscob where fecha between ? and ?
    and poliza=? and rel <> 0 order by promo",
    fecini_z,#,3,fecult_z,#,3,pol_z,#,1,;
k2; kq,"select unique promo from comiscob where fecha between ? and ?
    and poliza between ? and ? and rel <> 0 order by promo",
    fecini_z,#,3,fecult_z,#,3,prpol_z,#,1,ulpol_z,#,1,;
    
f8; M
	poliza_pol		s3,
	tam_pol			s0,;
k0; ot,"renpol",;
k1; kq,"select unique poliza from comiscob where fecha between ? and ?
    and poliza between ? and ? and (rel <> 0 or imp <> 0)",
    fecini_z,#,3,fecult_z,#,3,prpol_z,#,1,ulpol_z,#,1,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;

[PAN; 
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro; 
GST; tf; tn; #iprog1.i;
^=direc_z,#); z0,modul_z,#;
(modul_z)=($Impresion Indice Produc,23); (modul2_z)=($FBIcppc,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[NOTDA; z0,nombre_tda,#; (nombre_tda)=($INEXISTENTE,11); R;
[NOPROM; z0,nombre_prm,#; (nombre_prm)=($INEXISTENTE,11); R;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
