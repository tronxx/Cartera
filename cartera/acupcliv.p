* Programa que sirve para generar el acumulado de polizas
  DRBR 19 de Noviembre de 1997
*

#dMIS02 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS7 %7.3f~; #dMIS5 %5d~;
#dMIS04x %04xd~;
#i/programas/lib/funkey.i;

f0; M
	impre_z			i,
	font_z			i,
	micar_z			s3,
	carac_z			i,
	ter_z            	s2,
	fech9_z     {
	  dias2_z       	s16,
	  hora_z         	s6,
	  resto_z        	s5,
	            }
	bandman_z        	s1,
	band_z           	s1,
	bandh_z          	s1,
	nemp_z			s80,
	direc_z			s50,
	modul_z			s30,
	modul2_z		s10,
	usuarios_z      	s80,
	teruser_z       	s80,
	mibd_z          	s80,
	nombuse_z       	s15,
	clause_z        	s10,
	bandf1_z	 	s1,
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
	fecpol_z	{
	  fecpolaa_z		i,
	  fecpolmm_z		i,
	  fecpoldd_z		i,
	  		}
	fecha_z			D,
	fechb_z			D,
	prtda_z			s3,
	ultda_z			s3,
	tda_z			s3,
	son_z			s2,
	totimp_z			d,
	corpl15_z			d,
	larpl15_z			d,
	efecti_z			d,
	ival10_z			d,
	totiva10_z			d,
	cpl_z				d,
	lpl_z				d,
	imp_z				d,
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	bandimp_z		s1,
	salpa_z			s1,
	porc1_z			d,

	fech8_z           D,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;

mtam0&;
Ff5; FO.impri.ini~,r~; FG|; | Fknemp_z,l; >sinemp_z,#,impre_z; . FC;
Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
ttttermi_z; GPAN; GABRE_TABLA; (arch_z)=($acupcliv.tex,12);
* >istermi_z,arch_z,MIS04x; *

[fei; &a; &cfecha_z; t@5,3; \Fecha Inicial:\; t0Fin; t@5,20; ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
[feu; (fechb_z)=(fecha_z); t@5,40; \Fecha Inicial:\; t0fei; t@5,60; ifechb_z,+10;
!(fechb_z)0($-1)>fei; qD,2,fecfin_z,fechb_z,;
[prt; t@6,3; \De la Tienda:\; t0feu; iprtda_z,2;
[ult; t@6,40; \A la Tienda:\; t0prt; iultda_z,2;
[son; t@7,3; \Deseas Acumulados de `S`i `N`o o `T`odo <S/N/T>:\; t0ult; ison_z,1;
!(son_z)5($S,1)(son_z)5($N,1)(son_z)5($T,1)&&>son;
[spa; t@8,3; \Deseas salto de Pagina por tienda ? <S/N> : \; t0son; isalpa_z,1;
!(salpa_z)5($S,1)(salpa_z)5($N,1)&>spa;
GST; \Estan correctos los datos ? <S/N> : \; y|; | gspa; .

z0,tda_z,#; tS1,10,1,8,70; tv0; tc;
f1; k1; P;
{ n+;
  Ff1; pfechaDay_pol,MIS2; \-\; pfechaMon_pol,MIS02; \-\;
  pfechaYear_pol,MIS02; s1; ptda_pol,0; l;
  !(tda_pol)5(tda_z,#)>|;
    !(band_z)5($S,1)>|;
       (tda_z)=(tda_pol,#); Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
    |
       GULIN; (tda_z)=(tda_pol,#); Ff4; !(salpa_z)0($S,1)>|; GFONT30; | l; GSUBENC; .
    .
  .
  GIMPRI;
  f1; a;
)
tr; tf; tS0;
!(band_z)0($S,1)>|;
  tc; GULIN; tr; GSalir;
.
gFin;

[Enc;
Ff3; FT; FGNodatos; Ff4; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \acupcliv \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; l;
\Acumulado de Polizas del \; pfecha_z,+10; \ Al \; pfechb_z,+10;
\ De :\; pprtda_z,0; \ A \; pultda_z,0; \ Pag:\; Fp%d~; l;
!(son_z)0($S,1)>|; \ CLIENTES SI \; .
!(son_z)0($N,1)>|; \ CLIENTES NO \; .
!(son_z)0($T,1)>|; \ CLIENTES SI y NO \; .
l; GSUBENC; (band_z)=($S,1);
Ft;

[SUBENC;
Ff4; \Tienda:\; ptda_z,0; s1; f3; k1; P; n|; GNOTDA; . pnombre_tda,0; l;
\          |-------- 15 % IVA    -----------------|10% de IVA -|  Total\; l;
\--Fecha---|largo Plazo |Corto Plazo |Tot.15% IVA.|Largo Plazo |  General\; l;
*1234567890 123456789012 123456789012 123456789012 123456789012 123456789012 123456789012 123456789012*
R;

[IMPRI;
(fecpol_z)=(fecha_pol,#); z0,efecti_z,#;
tc; Ff4; pfecpoldd_z,MIS2; \/\; pfecpolmm_z,MIS02; \/\; pfecpolaa_z,MIS02;
z0,importe_rpo,#;
!(son_z)0($S,1)>|; f2; k1; .
!(son_z)0($N,1)>|; f2; k4; .
!(son_z)0($T,1)>|; f2; k7; .
P; n|;. (ival10_z)=(importe_rpo);
z0,importe_rpo,#;
!(son_z)0($S,1)>|; f2; k2; .
!(son_z)0($N,1)>|; f2; k5; .
!(son_z)0($T,1)>|; f2; k8; .
P; n|;. (cpl_z)=(importe_rpo);
z0,importe_rpo,#;
!(son_z)0($S,1)>|; f2; k3; .
!(son_z)0($N,1)>|; f2; k6; .
!(son_z)0($T,1)>|; f2; k9; .
P; n|;.
(lpl_z)=(importe_rpo)(cpl_z)-(ival10_z)-;
(imp_z)=(importe_rpo);
(efecti_z)=(lpl_z)(cpl_z)+;

\|\; plpl_z,MDS12; \|\; pcpl_z,MDS12; \|\; pefecti_z,MDS12; \|\;
pival10_z,MDS12; \|\; pimp_z,MDS12; \|\; l;
(larpl15_z)=(larpl15_z)(lpl_z)+;
(corpl15_z)=(corpl15_z)(cpl_z)+;
(totiva10_z)=(totiva10_z)(ival10_z)+;
(totimp_z)=(totimp_z)(imp_z)+;
R;

[ULIN;
(efecti_z)=(larpl15_z)(corpl15_z)+;
tc; Ff4; \ Totales : \; plarpl15_z,MDS12; \|\; pcorpl15_z,MDS12; \|\;
pefecti_z,MDS12; \|\; ptotiva10_z,MDS12; \|\; ptotimp_z,MDS12; \|\; l; l;
z0,larpl15_z,#; z0,corpl15_z,#; z0,totiva10_z,#; z0,totimp_z,#;
R;

[Pie; Fe;

#iimpri.i;
#isacaf.i;
[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #ipolizas.i;
k0; ot,"polizas",;
k1; kp,"fecha between ? and ? and tda between ? and ? order by tda,fecha",
    fecini_z,#,3,fecfin_z,#,3,prtda_z,#,1,ultda_z,#,1,;

f2; M
	importe_rpo		d,
	import2_rpo		d,
	tam_rpo			s0,;
k0; ot,"renpol2",;
* --> k1 suma el 10%  SI <---- *
k1; kq,"select sum(renpol2.impor) from renpol2,clientes where 
	renpol2.fecha=? and renpol2.tda=? and renpol2.idcli=clientes.idcli and
	clientes.piva=10.00 and sino='*'",
	fecpol_z,#,3,tda_z,#,1,;
* --> k2 suma Corto plazo al 15%  SI <---- *
k2; kq,"select sum(renpol2.impor) from renpol2,clientes where 
	renpol2.fecha=? and renpol2.tda=? and renpol2.idcli=clientes.idcli
        and clientes.piva=15.00 and
	(
	  (clientes.qom='M' and clientes.nulet1 <= 12) or
	  (clientes.qom='Q' and clientes.nulet1 <= 24)
	)  and sino='*'",
	fecpol_z,#,3,tda_z,#,1,;
* --> k3 suma El Total de la Poliza SI <---- *
k3; kq,"select sum(impor) from renpol2 where fecha=? and tda=?  and sino='*'",
	fecpol_z,#,3,tda_z,#,1,;

* --> k1 suma el 10%  NO <---- *
k4; kq,"select sum(renpol2.impor) from renpol2,clientes where 
	renpol2.fecha=? and renpol2.tda=? and renpol2.idcli=clientes.idcli
        and  clientes.piva=10.00 and	sino<>'*'",
	fecpol_z,#,3,tda_z,#,1,;
* --> k2 suma Corto plazo al 15%   NO <---- *
k5; kq,"select sum(renpol2.impor) from renpol2,clientes where 
	renpol2.fecha=? and renpol2.tda=? and renpol2.idcli=clientes.idcli
        and clientes.piva=15.00 and
	(
	  (clientes.qom='M' and clientes.nulet1 <= 12) or
	  (clientes.qom='Q' and clientes.nulet1 <= 24)
	)  and sino<>'*'",
	fecpol_z,#,3,tda_z,#,1,;
* --> k3 suma El Total de la Poliza NO  <---- *
k6; kq,"select sum(impor) from renpol2 where fecha=? and tda=?  and sino<>'*'",
	fecpol_z,#,3,tda_z,#,1,;

* --> k1 suma el 10%  <---- *
k7; kq,"select sum(renpol2.impor) from renpol2,clientes where 
	renpol2.fecha=? and renpol2.tda=? and renpol2.idcli=clientes.idcli
        and clientes.piva=10.00 ",
	fecpol_z,#,3,tda_z,#,1,;
* --> k2 suma Corto plazo al 15%  <---- *
k8; kq,"select sum(renpol2.impor) from renpol2,clientes where 
	renpol2.fecha=? and renpol2.tda=? and renpol2.idcli=clientes.idcli
        and clientes.piva=15.00 and
	(
	  (clientes.qom='M' and clientes.nulet1 <= 12) or
	  (clientes.qom='Q' and clientes.nulet1 <= 24)
	)",
	fecpol_z,#,3,tda_z,#,1,;
* --> k3 suma El Total de la Poliza  <---- *
k9; kq,"select sum(impor) from renpol2 where fecha=? and tda=?",
	fecpol_z,#,3,tda_z,#,1,;

f3; #itiendas.i;
k0; ot,"tiendas",;
k1; kp,"codigo=?",tda_z,#,1,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;

R;

[PAN; 
Ff1; GST; tf; tn; #iprog1.i; ^=direc_z,#); z0,modul_z,#;
(modul_z)=($Acumulado de Polizas,20); (modul2_z)=($CAR-MDS,7);
Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
(esp_z)=(80)(exten_z)-(2)/; Ff1; t@1,esp_z; pnemp_z,0;
Fslexten_z,modul_z; (esp_z)=(79)(exten_z)-; t@0,esp_z; pmodul_z,0; ta0; tp;
Fslexten_z,modul2_z; (esp_z)=(78)(exten_z)-; t@1,esp_z; pmodul2_z,0;
R;

[R; R; [E; ];
[ST; t@21,1; ta0; s78; t@21,1; ta1; ta=; ta0; tp; R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[NOTDA; z0,nombre_tda,#; (nombre_tda)=($INEXISTENTE,11); R;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[ERROR1; GST; `7; \No pude agregar registro en mantos.v ...\; gFin1;
[ERROR4; GST; `7; \No pude agregar registro \; pteruser_z,0; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };

