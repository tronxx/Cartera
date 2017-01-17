* Programa que sirve para dar de alta a los clientes
  DRBR 24 de Septiembre de 1997
*

#dMIS2 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS5 %,5d~;   #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS6 %6.2f~; #dMDS7 %,7.0f~;
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
	carac_z			i,
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	bandimp_z		s3,
        ticte_z			s3,
        prpob_z			s26,
        ulpob_z			s26,
	enc_z			i,
        numclis_z		i,
        totlis_z		d,
        totfac_z		d,
        saldo_z			d,
        nclis_z			l,

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
        codtda_z		s3,
	prtda_z			i,
	ultda_z			i,
        cia_z			i,
	
	fecha_z			D,
	fechb_z			D,
        fechc_z			D,
        fechd_z			D,
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
	voc_z			s2,
	pol_z			s2,
        html_z			s2,
	
	fech8_z           	D,
	ind1_z            	i,
	ind2_z            	i,
	termi_z           	i,
	esp_z             	i,
	exten_z           	i,
	tam0             	s0,;

mtam0&; (impre_z)=(1);
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
GPAN; GABRE_TABLA; (arch_z)=($carpobla.tex,12);

&a; &cfechc_z; (prtda_z)=(1); (ultda_z)=(95);

[fei; t@5,3; \Fecha Inicial:\; t0Fin; (fecha_z)=(fechc_z); ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
[prt; t0fei; t@6,3; \Del Codigo:\; t@6,20; iprtda_z,MIE2,MIS2;
[ult; t0prt; t@6,40; \Al Codigo:\; t@6,60; iultda_z,MIE2,MIS2;
[prp; t0ult; t@8,3; \Poblacion Inicial: \; iprpob_z,25;
[ulp; t0prp; t@9,3; \Poblacion Final  : \; iulpob_z,25;
GST; \Estan correctos los datos ? <S/N> : \; y|; | gult; .

tS1,8,0,11,80; tv0; tc;

[reporte;
GREP_TEXTO;
Ff4; FC; Ff1; tf; tr; tS0; GSalir;
gFin;
R;

[REP_TEXTO;
(enc_z)=(1);
!(html_z)0($S,1)>|;
  (arch_z)=($carpobl.html,12); Ff4; FO(arch_z),w~; GENC_HTML;
|
  Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
.
f1; k1; P;
{ n+;
  Ff1; \Imprimiendo:\; ppoblac_ind2,0; l;
  GIMPRI1;
  f1; a;
)
GULIN1;
R;

[SUBENC1;
Ff4;
!(html_z)5($S,1)>|; GFONT17; . 
\Cartera por Poblacion al \; pfecha_z,+10; \ Pag:\; Fp%d~; l;
!(html_z)0($S,1)>|; \<center><B>\; | GFONT15; .
Fc40,\TABLA DE CARTERA X POBLACION~; 
!(html_z)0($S,1)>|; \<BR>\; . l;
\Del Codigo:\; pprtda_z,MIS2; \ Al Codigo: \; pultda_z,MIS2;
!(html_z)0($S,1)>|; \<BR>\; . l;
\Poblacion Inicial:\; pprpob_z,0; \ Poblacion Final: \; pulpob_z,0;
!(html_z)0($S,1)>|; \</center><BR><table border=1>\; | GFONT16; . l;
!(html_z)5($S,1)>|; GFONT18; GFONT12; c_91; l; GFONT19; \|\; | \<tr><th>\; .
\Poblacion           \; !(html_z)0($S,1)>|; \</th><th>\; | \|\; .
\Codigo                 \; !(html_z)0($S,1)>|; \</th><th>\; | \|\; .
\Precio Lista\; !(html_z)0($S,1)>|; \</th><th>\; | \|\; .
\Total Factur\; !(html_z)0($S,1)>|; \</th><th>\; | \|\; .
\       Saldo\; !(html_z)0($S,1)>|; \</th><th>\; | \|\; .
\N.Cli\; !(html_z)0($S,1)>|; \</th></tr>\; | \|\; GFONT20; .
l;
R;

[IMPRI1;
Ff4; 
(numclis_z)=(nclis_ind2); >istienda_ind2,codtda_z,MIS2; 
z0,tienda_ind3,l; f3; k1; P; n|;.
!(html_z)0($S,1)>|; \<tr><td>\; | \|\; . 
ppoblac_ind2,20;  !(html_z)0($S,1)>|; \</td><td>\; | \|\; . 
pcodtda_z,0; s1; pnombre_ind3,20; !(html_z)0($S,1)>|; \</td><td align="right">\; | \|\; . 
pprecon_ind2,MDS12; !(html_z)0($S,1)>|; \</td><td align="right">\; | \|\; . 
ptotfac_ind2,MDS12; !(html_z)0($S,1)>|; \</td><td align="right">\; | \|\; . 
psaldo_ind2,MDS12;  !(html_z)0($S,1)>|; \</td><td align="right">\; | \|\; . 
pnumclis_z,MIS5;    !(html_z)0($S,1)>|; \</td></tr>\; | \|\; . 
(totlis_z)=(totlis_z)(precon_ind2)+;
(totfac_z)=(totfac_z)(totfac_ind2)+;
(saldo_z)=(saldo_z)(saldo_ind2)+;
(nclis_z)=(nclis_z)(nclis_ind2)+;
l;
R;

[ULIN1;
Ff4; 
!(html_z)5($S,1)>|; GSACALIN; GFONT19; .
!(html_z)0($S,1)>|; \<tr><td>\; | \|\; . 
\Total General       \; !(html_z)0($S,1)>|; \</td><td>\; | \|\; . 
s23; !(html_z)0($S,1)>|; \</td><td align="right">\; | \|\; . 
ptotlis_z,MDS12; !(html_z)0($S,1)>|; \</td><td align="right">\; | \|\; . 
ptotfac_z,MDS12; !(html_z)0($S,1)>|; \</td><td align="right">\; | \|\; . 
psaldo_z,MDS12;  !(html_z)0($S,1)>|; \</td><td align="right">\; | \|\; . 
pnclis_z,MIS5;   !(html_z)0($S,1)>|; \</td></tr>\; | \|\; GFONT20; . 
R;

[SACALIN;
\|____________________|_______________________|\;
\____________|____________|____________|_____|\; l;
R;

* --------------------   --> Reporte en HTML <--  ------------------  *

[ENC_HTML;
Ff4;
\<!doctype html public "-//w3c//dtd html 4.0 transitional//en">\; l;
\<html><body>\; l;
\<center><font size=+2><B><I>\; pnemp_z,0; \</I></B></font><br>\; l;
Ff3; FT; FGNodatos; Ff3; FGNodatos; Ff4;
\<font size=-2>capoblac </font>\; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; \<br>\; l;
GSUBENC1;
R;

[NOPDAGF1; GST; `7; \No pude agregar registro en acumpob...\; Z1; R;

[Enc;
Ff3; FT; FGNodatos; GFONT14; Ff4; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \carpoblac \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; GFONT12; l;
!(enc_z)0($1)>|; GSUBENC1; .
Ft;

[Pie;
Ff4; 
!(html_z)0($S,1)>|; GSACALIN; .
Fe;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *

f1; M
	poblac_ind2		s26,
        tienda_ind2		i,
        precon_ind2		d,
        totfac_ind2		d,
        saldo_ind2		d,
        nclis_ind2		l,
	tam_ind2		s0,;
k0; ot,"clientes",;
k1; kq,"select poblac, tienda, sum(precon), sum(cargos), 
	sum(cargos - abonos), count(numcli)
        from clientes where tienda between ? and ? and poblac between ? and ? 
        and fechavta <= ?
        and ( cargos > abonos or ( cargos <= abonos and fecsal > ?) )
        group by poblac, tienda",
        prtda_z,ultda_z,prpob_z,#,1,ulpob_z,#,1,fecini_z,#,3,fecini_z,#,3,;

f3; M
	tienda_ind3		s3,
        nombre_ind3		s21,
        tam_ind3		s0,;
k0; ot,"tiendas",;
k1; kq,"select codigo, nombre from tiendas where codigo= ?",codtda_z,#,1,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;

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
