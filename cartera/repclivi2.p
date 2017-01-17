* Programa que sirve para generar el reporte de clientes vigentes
  DRBR 24 de Septiembre de 1997
*

#dMIE2 %-2d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS5 %5.2f~; #dMDS9 %-9.2f~;
#dMIS5 %,5d~;
#i/programas/lib/funkey.i;

f0; M
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	bandimp_z		s1,
	
* --> Variables que deben existir   <------ *
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
	prtda_z			i,
	ultda_z			i,
	saldo_z			d,
	abonos_z		d,
	codcli_z		s11,
        idcli_z			l,
	
	prdia_z			i,
	uldia_z			i,
	letpag_z		i,
	clis_z			i,
	fecha_z			D,
	fecini_z	{
	  feciniaa_z		i,
	  fecinimm_z		i,
	  fecinidd_z		i,
	  		}

	fech8_z           D,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;

mtam0&; tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; GABRE_TABLA; (prdia_z)=(1); (uldia_z)=(31); (arch_z)=($repclivi.tex,12);
(impre_z)=(1);

[fec; t@5,3; \Fecha Base:\; t0Fin; &a; &cfecha_z; ifecha_z,+10;
!(fecha_z)0($-1)>fec; qD,2,fecini_z,fecha_z,;
[prd; t@6,3; \Cartera del Dia:\; t0fec; t@6,20; iprdia_z,MIE2,MIS2;
[uld; t@6,40; \Al Dia:\; t@6,50; t0prd; iuldia_z,MIE2,MIS2;
[prc; t@7,3; \Del Codigo:\; t@7,20; t0uld; iprtda_z,MIE2,MIS2;
[ulc; t@7,40; \ Al Codigo:\; t@7,60; iultda_z,MIE2,MIS2;
GST; \Estan correctos los datos ? <S/N> : \;
y|; | guld; .

tS1,7,0,12,80; tc;
tc; Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
f1; k1; P;
{ n+;
  Ff1; \Leyendo:\; pnumcli_cli,0; s1; pnombre_cli,0; l;
  GIMPRI;
  f1; a;
)
GULIN;
Ff4; FC; Ff1; tr; tf; tS0; GSalir;
gFin;

[Enc;
Ff3; FT; FGNodatos; Ff4; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \repclivi \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; l;
Fc70,\Relacion de Clientes Vigentes al ~; pfecha_z,+10; \ Pag:\; Fp%d~; l; l;
\Codigo     Nombre                              Letrs Importe_C/Lt       Saldo\; l;
*1234567890 12345678901234567890123456789012341 123456789012*
Ft;

[Pie; Fe;

[IMPRI;
z0,abonos_mvc,#; (codcli_z)=(numcli_cli,#); (idcli_z)=(idcli_cli);
(saldo_z)=(cargos_cli); f2; k1; P;
n|;. z0,letpag_z,#; (saldo_z)=(saldo_z)(abonos_mvc)-;
!(saldo_z)2($1)>R;
!(canle1_cli)5($0)>|;
  (letpag_z)=(abonos_mvc)(enganc_cli)-(servic_cli)-(canle1_cli)/;
.
tc; Ff4; pnumcli_cli,0; s1; pnombre_cli,0; pstatus_cli,0; s1;
pletpag_z,MIS2; \/\; pnulet1_cli,MIS2; s1; pcanle1_cli,MDS12; s1;
psaldo_z,MDS12; l; (clis_z)=(clis_z)(1)+;
R;

[ULIN;
tc; Ff4; \Total de Clientes Vigentes:\; pclis_z,MIS5; l;
R;

[MANDAELFNT; f5; k1; P; nR; GSACAF; R;

#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
* Buffer definitions for table clientes *
f1; M
numcli_cli  s11,
nombre_cli  s35,
status_cli	s2,
qom_cli  s2,
enganc_cli  d,
nulet1_cli  i,
canle1_cli  d,
servic_cli  d,
cargos_cli  d,
idcli_cli	l,
tam_cli		s0,;
 * 41 columns (size for buffer = 292)*

k0; ot,"clientes",;
k1; kq,"select numcli,nombre,status,qom,enganc,nulet1,canle1,servic,cargos,idcli
    from clientes where fechavta <= ? and (cargos-abonos) > 1 and
    DAYOFMONTH(fechavta) between ? and ? and tienda between ? and ?
    order by numcli",
    fecini_z,#,3,prdia_z,uldia_z,prtda_z,ultda_z,;

f2; M
	abonos_mvc		d,;
k0; ot,"mvcli2",;
k1; kq,"select sum(import) from mvcli2 where
    idcli=? and fechamov <= ?",
    idcli_z,fecini_z,#,3,;
    
f5; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

[PAN; 
Ff1; GST; tf; tn; #iprog1.i;
^=direc_z,#); z0,modul_z,#;
(modul_z)=($Captura Poliza Cobranza,23); (modul2_z)=($FBIcppc,7);
Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
(esp_z)=(80)(exten_z)-(2)/; Ff1; t@1,esp_z; pnemp_z,0;
Fslexten_z,modul_z; (esp_z)=(79)(exten_z)-; t@0,esp_z; pmodul_z,0; ta0; tp;
Fslexten_z,modul2_z; (esp_z)=(78)(exten_z)-; t@1,esp_z; pmodul2_z,0;
R;

[R; R; [E; ];
[ST; t@21,1; ta0; s78; t@21,1; ta1; ta=; ta0; R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
