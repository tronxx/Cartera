* Programa que sirve para generar el reporte de acumuldos por punto de venta
  DRBR 02-Abr-1998
*

#dMIE2 %-2d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS5 %5.2f~; #dMDS9 %-9.2f~;
#i/programas/lib/funkey.i;

f0; M
	ter_z            s2,
        maxcol_z		i,
        maxrow_z		i,
        renst_z			i,
        sff_z			s2,
	fech9_z     {
	  dias2_z       s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
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
        foi_z		s2,
	saldo_z		d,
	
	prtda_z			i,
	ultda_z			i,
	totclis_z		l,
	fecha_z			D,
	fechb_z			D,
	fechd_z			D,
	feche_z			D,
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
	totprl_z		d,
	totfac_z		d,
	totfon_z		d,
	tda_z			i,
	ubi_z			s3,
	
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	impre_z			i,
	font_z			i,
	micar_z			s3,
	carac_z			i,
	bandimp_z		s3,

	fech8_z           	D,
        ii_z			i,
        iii_z			i,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;

mtam0&; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; GABRE_TABLA; (arch_z)=($conxpvta.tex,12); (impre_z)=(1);

&a; &cfeche_z; qD,2,fecult_z,feche_z,; (fecsig_z)=(fecult_z,#);
GPRIMERO_DE_MES_ANTER; qD,1,fecsig_z,fechd_z,;

[fei; t@5,3; \Fecha Inicial:\; t0Fin; (fecha_z)=(fechd_z); ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
(fecsig_z)=(fecini_z,#); GULTIMO_DE_MES; qD,1,fecsig_z,fechd_z,;
[feu; t@5,40; \Fecha Inicial:\; t0fei; (fechb_z)=(fechd_z); ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
[prt; t@6,3; \Del Codigo:\; t0feu; t@6,20; iprtda_z,MIE2,MIS2;
[ult; t@6,40; \Al Codigo:\; t0prt; t@6,60; iultda_z,MIE2,MIS2;
[foi; t@7,3; \Reporte de `F`onacot Ime`v`i F`I`DE `T`radicional `C`elular ? <F/I/T/V>:\; 
t0ult; ifoi_z,1; 
!(foi_z)5($F,1)(foi_z)5($I,1)&(foi_z)5($T,1)&(foi_z)5($C,1)&(foi_z)5($V,1)&>foi;
GST; \Estan correctos los datos ? <S/N> :\; y|; | gult; .

tS1,0,0,23,80; tc;
Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
f1; k1; P;
{ n+;
  Ff1; \Leyendo:\; pubivta_ind1,0; l;
  GIMPRI;
  f1; a;
)
GULIN;
Ff3; FC; Ff4; FC; Ff1; tf; tr; tS0; GSalir;
gFin;
  
[Enc;
Ff3; FT; FGNodatos; Ff4; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \conxpvta \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; l;
Fc40,\Reporte de Ventas del ~; pfecha_z,+10; \ Al \; pfechb_z,+10; 
\ Del codigo:\; pprtda_z,MIS2; \ Al :\; pultda_z,MIS2; l;
GFONT17; Fc80,\ACUMULADOS POR PUNTO DE VENTA~; GFONT18; \ Pag:\; Fp%d~; l;
GFONT19; s30;
!(foi_z)0($F,1)>|; \Ventas    FONACOT   \; .
!(foi_z)0($I,1)>|; \Ventas      FIDE    \; .
!(foi_z)0($C,1)>|; \Ventas   CELULARES  \; .
!(foi_z)0($T,1)>|; \Ventas TRADICIONALES\; .
!(foi_z)0($V,1)>|; \Ventas     IMEVI    \; .
s30; GFONT20; l;
GFONT19; \|     Punto de Venta              |Precio_Lista|Total_Factur|\;
!(foi_z)0($F,1)>|; \Fact.FONACOT|\; .
!(foi_z)0($V,1)>|; \Factur.IMEVI|\; .
\Ctes|\; 
GFONT20; l;
* 12 123456789012345678901234567890 123456789012 123456789012 123456789012*
Ft;

[Pie; Fe;

[IMPRI;
(ubi_z)=(ubivta_ind1,#); f3; k1; P; n|; GNOUBI; .
Ff4;
\|\; pubi_z,2; s1; pnombre_ubi,30; \|\; pprelis_ind1,MDS12;
\|\; ptotfac_ind1,MDS12; \|\; 
!(foi_z)0($F,1)(foi_z)0($V,1)|>|; pfacfon_ind1,MDS12; \|\; . 
pcuantos_ind1,MLS4; \|\; 
l;
(totprl_z)=(totprl_z)(prelis_ind1)+; (totfac_z)=(totfac_z)(totfac_ind1)+;
(totfon_z)=(totfon_z)(facfon_ind1)+; (totclis_z)=(totclis_z)(cuantos_ind1)+;
R;

[ULIN;
\|_________________________________|____________|____________|\;
!(foi_z)0($F,1)(foi_z)0($V,1)|>|; \____________|\; . \____|\; l;
GFONT19; \|       Totales Generales:        |\; ptotprl_z,MDS12; \|\; 
ptotfac_z,MDS12; \|\; 
!(foi_z)0($F,1)(foi_z)0($V,1)|>|; ptotfon_z,MDS12; \|\; . 
ptotclis_z,MLS4; \|\;
GFONT20; l;
R;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; M
	ubivta_ind1		s3,
	prelis_ind1		d,
	totfac_ind1		d,
	facfon_ind1		d,
	cuantos_ind1		l,
	tam_ind1		s0,;

k0; ot,"clientes",;
k1; kq,"select a.ubiage, sum(a.precon),sum(a.cargos),sum(a.canle2), count(*)
	from car_tipocar b join car_tipocardet c on b.idtipocar = c.idtipocar
        join clientes a on c.ticte = a.ticte
        where a.fechavta between ? and ? and tienda between ? and ?
        and b.tipocar = ? group by ubiage",    
        fecini_z,#,3,fecult_z,#,3,prtda_z,ultda_z,foi_z,#,1,;

f2; M
	prelis_ind2		d,
	totfac_ind2		d,
	facfon_ind2		d,
	tam_ind2		s0,;
k0; ot,"clientes",;
k1; kq,"select sum(precon),sum(cargos),sum(canle2) from clientes
    where fechavta between ? and ? and tienda=? and ubiage=?",
    fecini_z,#,3,fecult_z,#,3,tda_z,ubi_z,#,1,;

f3; #iubivta.i;
k0; ot,"ubivta",;
k1; kp,"codcar='XX' and ubica=?",ubi_z,#,1,;
    
f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;

R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/fechas.i;
#i/programas/lib/status.i;

[PAN; 
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro; GST; tf; tn; #iprog1.i;
^=direc_z,#); z0,modul_z,#;
(modul_z)=($Acumulado Punto de Venta,24); (modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[NOUBI; z0,nombre_ubi,#; (nombre_ubi)=($I N E X I S T E N T E         ,30);
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
