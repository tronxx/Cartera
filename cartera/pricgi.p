* Programa que sirve para generar el reporte de acumuldos por punto de venta
  DRBR 02-Abr-1998
*

#dMIE2 %-2d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS5 %5.2f~; #dMDS9 %-9.2f~;
#i/programas/lib/funkey.i;

f0; M
	ter_z            s2,
	fech9_z     {
	  dias2_z       s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
	bandman_z        s1,
	band_z           s1,
	bandh_z          s1,
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
	import_z		d,
	prelis_z		d,
	prefac_z		d,
	
	prtda_z			i,
	ultda_z			i,
	fecha_z			D,
	fechb_z			D,
	fechc_z			D,
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
	anuini_z	{
	  anuiniaa_z		i,
	  anuinimm_z		i,
	  anuinidd_z		i,
	  		}
	anufin_z	{
	  anufinaa_z		i,
	  anufinmm_z		i,
	  anufindd_z		i,
	  		}
	totfac_z		d,
	totlis_z		d,
	impnet_z		d,
	impor_z			d,
	bonif_z			d,
	enc_z			i,
	mesini_z		i,
	mesfin_z		i,
	tda_z			i,
	nelem_z			i,
	ptovta_z		s4,
	
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
	bandimp_z		s1,
	lotf_z			s2,
	voc_z			s2,
	zona_z			s3,
	antzon_z		s3,
	subzon_z		s4,
	mes_z			i,
	coc_z			s2,
	son_z			s2,
	fot_z			s2,
	prlismes_z		d30,
	totfames_z		d30,

	fech8_z           D,
	ind1_z            i,
	ind2_z            i,
	ind3_z			i,
	ind4_z			i,
	min_z			i,
	max_z			i,
	totelem_z		i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;

mtam0&; tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; GABRE_TABLA; (arch_z)=($vtanufn2.tex,12); (impre_z)=(1);

Ff1;
f1; k1; P;
(nelem_z)=(0);
\<TABLE>\; l;
{ n+;
   \<TR>\; l;
      \<TD>\; pptovta_ind1,0; \</TD>\; l;
   \</TR>\; l;
   (nelem_z)=(nelem_z)(1)+;
)
\</TABLE>\; l;

Hfb; \<p>Total: \; pnelem_z,%,8d~; \ records\; HfB; l;
gFin;

[MANDAELFNT; f13; k1; P$; nR; GSACAF; R;

#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *

f1; M
	ptovta_ind1		s3,
	tam_ind1		s0,;

k0; ot,"zontda",;
k1; kq,"select unique subzona from zontda where vtafon <> 0
	and fecfin between ? and ? order by subzona",
	fecini_z,#,3,fecult_z,#,3,;

f2; M
	prelis_ind2		d,
	totfac_ind2		d,
	tam_ind2		s0,;
k0; ot,"zontda",;
k1; kq,"select sum(vtafon),sum(vtafon) from zontda
	where subzona=? and fecini=? and fecfin=? and voc='V' and lotf='L'",
	ptovta_z,#,1,anuini_z,#,3,anufin_z,#,3,;
k2; kq,"select sum(vtafon),sum(vtafon) from zontda
	where subzona=? and fecini=? and fecfin=? and voc='V' and lotf='C'",
	ptovta_z,#,1,anuini_z,#,3,anufin_z,#,3,;
k3; kq,"select sum(impor),sum(rob) from renpol where fecha between ? and ?
	and tda='FN'",
	anuini_z,#,3,anufin_z,#,3,;

f3; M
	nombre_ind3		s31,
	tam_ind3		s0,;
k0; ot,"zontda",;
k1; kq,"select nombre from ubivta where
    tienda=? and ubica=? ",
    tda_z,ptovta_z,#,1,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;

R;

[PAN; 
Ff1; GST; tf; tn; #iprog1.i;
^=direc_z,#); z0,modul_z,#;
(modul_z)=($Imprime Acumualdos Anuales,26); (modul2_z)=($CAR-MDS,7);
Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
(esp_z)=(80)(exten_z)-(2)/; Ff1; t@1,esp_z; pnemp_z,0;
Fslexten_z,modul_z; (esp_z)=(79)(exten_z)-; t@0,esp_z; pmodul_z,0; ta0; tp;
Fslexten_z,modul2_z; (esp_z)=(78)(exten_z)-; t@1,esp_z; pmodul2_z,0;
R;

[R; R; [E; ];
[ST; t@21,1; ta0; s78; t@21,1; ta1; ta=; ta0; tp; R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[NOSUBZON; z0,nombre_ind3,#; (nombre_ind3)=($INEXISTENTE,11); R;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
