* Programa que sirve para generar el reporte de ventas FONACOT
  DRBR 02-Abr-1998
*

#dMIE2 %-2d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS5 %5.2f~; #dMDS9 %-9.2f~; #dMLS7 %7ld~;
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
	saldo_z		d,
	
	prtda_z			i,
	ultda_z			i,
	fecha_z			D,
	fechb_z			D,
	fechc_z			D,
	fechd_z			D,
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
	totcia_z		d,
	totfon_z		d,
	totabf_z		d,
	totffo_z		d,
	finfon_z		d,
	abonfon_z		d,
	tda_z			i,
	num_z			i,
	cia_z			s36,
	antcia_z		s36,
	
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
	codcli_z		s11,

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
GPAN; GABRE_TABLA; (arch_z)=($anciafon.tex,12); (impre_z)=(1);

[fei; t@5,3; \Fecha Inicial:\; t0Fin; &a; &cfecha_z; ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
[feu; t@5,40; \Fecha Final:\; t0fei; (fechb_z)=(fecha_z); ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
GST; \Estan correctos los datos ? <S/N> :\; y|; | gfeu; .
tS1,0,0,23,80; tc; tv0;
Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
f1; k1; P; n|; | (antcia_z)=(cia_cli,#); .
{ n+;
  Ff1; \Leyendo:\; pcia_cli,0; pnumcli_cli,0; s1; pnombre_cli,0; l;
  GIMPRI;
  f1; a;
)
GULIN;
Ff3; FC; Ff4; FC; Ff1; tr; tf; tS0; GSalir;
gFin;
  
[Enc;
tc; Ff3; FT; FGNodatos; Ff4; GFONT14; GFONT11; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \anciafon \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; l;
GFONT17; Fc60,\RELACION DE VENTAS FONACOT del ~; pfecha_z,+10;
\ Al \; pfechb_z,+10; GFONT18; \ Pag:\; Fp%d~; GFONT13; l;
c_109; l; GFONT19;
\|-------- Compania------------------|  Codigo  |-------- Cliente-------------------|P.List.S/IVA|Total_x_Cia |\;
GFONT20; l;
* 12345678901234567890123456789012345 1234567890 12345678901234567890123456789012345 123456789012*
Ft;

[CORTLIN;
\|___________________________________|__________|___________________________________|____________|____________|\; l;
R;

[Pie; GCORTLIN; Fe;

[IMPRI;

tc; Ff4; \|\;
!(num_z)0($0)>|; pcia_cli,35; | s35; .
\|\; pnumcli_cli,10; \|\; pnombre_cli,0; pstatus_cli,0; \|\;
pprecon_cli,MDS12; \|\;
(totfac_z)=(totfac_z)(precon_cli)+; (num_z)=(num_z)(1)+;
(totcia_z)=(totcia_z)(precon_cli)+;
f1; a; n|; z0,cia_cli,#; .
!(cia_cli)5(antcia_z,#)>|;
  ptotcia_z,MDS12; z0,totcia_z,#; z0,num_z,#; (antcia_z)=(cia_cli,#);
|
  s12; 
.
\|\; l;
f1; b; nR;
R;

* --> Esta es una parte de impri, va antes de todo <---
!(cia_cli)5(antcia_z,#)>|;
  !(num_z)1($1)>|;
    tc; Ff4;
    \|  Total Ventas Esta Cia            |\; s10; \|\; s35; \|\;
     ptotcia_z,MDS12; \|\; l; GCORTLIN;
  .
  z0,totcia_z,#; z0,num_z,#;
.
*

[ULIN;
tc; Ff4;
GCORTLIN;
s30; \Total Ventas Fonacot Sin IVA\; s38; \|\; ptotfac_z,MDS12; \|\; l;
s96; \|____________|\; l;
R;

!(num_z)1($1)>|;
  tc; Ff4;
  \|  Total Ventas Esta Cia            |\; s10; \|\; s35; \|\;
   ptotcia_z,MDS12; \|\; l; z0,totcia_z,#; z0,num_z,#; GCORTLIN;
   
.

[NOPDAGF5; GST; `7; \No pude agregar registro en edofon...\; Z1; R;
[NOPDMDF5; GST; `7; \No pude modificar registro en edofon...\; Z1; R;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; M
	cia_cli			s36,
	numcli_cli		s11,
	nombre_cli		s35,
	status_cli		s2,
	precon_cli		d,
	tam_cli			s0,;
k0; ot,"clientes",;
k1; kq,"select dircli2.nomav,clientes.numcli,clientes.nombre,clientes.status,
    clientes.precon from clientes,dircli2 where
    fechavta between ? and ? and ticte='FN' and clientes.idcli=dircli2.idcli
    order by dircli2.nomav,clientes.numcli",
    fecini_z,#,3,fecult_z,#,3,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;

R;

[PAN; 
Ff1; GST; tf; tn; #iprog1.i;
^=direc_z,#); z0,modul_z,#;
(modul_z)=($Acumulado Punto de Venta,24); (modul2_z)=($CAR-MDS,7);
Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
(esp_z)=(80)(exten_z)-(2)/; Ff1; t@1,esp_z; pnemp_z,0;
Fslexten_z,modul_z; (esp_z)=(79)(exten_z)-; t@0,esp_z; pmodul_z,0; ta0; tp;
Fslexten_z,modul2_z; (esp_z)=(78)(exten_z)-; t@1,esp_z; pmodul2_z,0;
R;

[R; R; [E; ];
[ST; t@21,1; ta0; s78; t@21,1; ta1; ta=; ta0; tp; R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
