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
	version_z		s20,
	bandimp_z		s3,
	sff_z			s2,
	
* --> Variables que deben existir   <------ *
	impre_z			i,
	font_z			i,
	micar_z			s3,
	carac_z			i,
	maxcol_z		i,
	maxrow_z		i,
	renst_z			i,
	antdia_z       		i,
	
	
	ter_z            s2,
	fech9_z     {
	  dias2_z       s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
	bandman_z        s1,
	band_z           s1,
	bandh_z          s1,
	toa_z		s2,
	milinea_z	s100,
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
	letven_z		l,
	plazo_z			d,
	saldo_z			d,
	abonos_z		d,
        cargos_z		d,
	salvig_z		d,
	saldia_z		d,
        carxdia_z		d,
        aboxdia_z		d,
        clixdia_z		i,
	diacli_z		i,
	codcli_z		s11,
	solovtasant_z		s2,
	prpob_z			s26,
	ulpob_z			s26,
        idcli_z			l,
	
	prdia_z			i,
	uldia_z			i,
	letpag_z		i,
	clis_z			i,
	ii_z			i,
	fevtas_z		D,
	fecha_z			D,
	fecini_z	{
	  feciniaa_z		i,
	  fecinimm_z		i,
	  fecinidd_z		i,
	  		}
        fvtasant_z	{
          fvtasantaa_z		i,
          fvtasantmm_z		i,
          fvtasantdd_z		i,
                        }

	fech8_z           D,
	faboini_z		D,
	fabofin_z		D,
	fecaboini_z	{
	  fecaboiniaa_z		i,
	  fecaboinimm_z		i,
	  fecaboinidd_z		i,
	                }
	fecabofin_z	{
	  fecabofinaa_z		i,
	  fecabofinmm_z		i,
	  fecabofindd_z		i,
	                }
	elimconabo_z		s2,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;

mtam0&; tr;
q+,version_z,"V:2.00 EA",;
Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; GABRE_TABLA; (prdia_z)=(1); (uldia_z)=(31); (arch_z)=($repclivi.tex,12);
(impre_z)=(1); GTOMA_PARAMETROS;

[fec; t@5,3; \Fecha Base:\; t0Fin; &a; &cfecha_z; ifecha_z,+10;
!(fecha_z)0($-1)>fec; qD,2,fecini_z,fecha_z,;
[prd; t@6,3; \Cartera del Dia:\; t0fec; t@6,20; iprdia_z,MIE2,MIS2;
[uld; t@6,40; \Al Dia:\; t@6,50; t0prd; iuldia_z,MIE2,MIS2;
[prc; t@7,3; \Del Codigo:\; t@7,20; t0uld; iprtda_z,MIE2,MIS2;
[ulc; t@7,40; \ Al Codigo:\; t@7,60; iultda_z,MIE2,MIS2;
[toa; t@8,3; \Reporte de clientes con pagos `A`delantados o `T`odos ? <A/T>:\;
itoa_z,1; !(toa_z)5($T,1)(toa_z)5($A,1)&>toa;
[prp; t@9,3;  \Poblacion Inicial:\; t0toa; iprpob_z,25;
[ulp; t@10,3; \Poblacion Final  :\; t0prp; iulpob_z,25;
[sva; t@11,3; \Desea que no se impriman Clientes c/fecha posterior a fecha dada? <S/N>\;
t0toa; isolovtasant_z,1; !(solovtasant_z)5($S,1)(solovtasant_z)5($N,1)&>sva;
(fevtas_z)=(fecha_z);
!(solovtasant_z)0($S,1)>|;
  [fecba; t@12,3; \Ventas con fecha menor o igual a:\; t0sva; 
  (fevtas_z)=(fecha_z); t@12,50; ifevtas_z,+10; !(fevtas_z)0($-1)>fecba;
.
qD,2,fvtasant_z,fevtas_z,;
[sinabo; t@13,3; 
\Eliminar clientes que tengan abonos en rango de fechas dado? <S/N>\;
t0sva; ielimconabo_z,1; !(elimconabo_z)5($S,1)(elimconabo_z)5($N,1)&>sinabo;
!(elimconabo_z)0($S,1)>|;
  [fabi; t@14,3; \Fecha Inicial Abono:\; t0sinabo; (faboini_z)=(fecha_z);
  t@14,40; ifaboini_z,+10; !(faboini_z)0($-1)>fabi;
  [fabf; t@15,3; \Fecha Final   Abono:\; t0fabi; (fabofin_z)=(faboini_z);
  t@15,40; ifabofin_z,+10; !(fabofin_z)0($-1)>fabf;
  qD,2,fecaboini_z,faboini_z,; qD,2,fecabofin_z,fabofin_z,;
.
GGRABA_PARAMETROS;
GST; \Estan correctos los datos ? <S/N> : \;
y|; | gsinabo; .

tS1,7,0,12,80; tc;
(antdia_z)=(-1);
f1; k2; P$; k3; P$;
f1; k1; P;
{ n+;
  Ff1; \Leyendo:\; pnumcli_cli,0; s1; pnombre_cli,0; l;
  (diacli_z)=(fechavtadd_cli);
  !(poblac_cli)2(prpob_z,#)|(poblac_cli)1(ulpob_z,#)>|; f1; a; g-; .
  * --> Voy a Checar si es Total o Adelantados <--  *
  z0,abonos_mvc,#; (codcli_z)=(numcli_cli,#); (idcli_z)=(idcli_cli);
  (saldo_z)=(cargos_cli); f2; k1; P;  n|;. 
  z0,letpag_z,#; z0,letven_z,#; (plazo_z)=(1); 
  (saldo_z)=(saldo_z)(abonos_mvc)-;
  !(saldo_z)2($1)>|; f1; a; g-; .
  !(qom_cli)0($C,1)>|; (plazo_z)=(1); .
  !(qom_cli)0($Q,1)>|; (plazo_z)=(15.2); .
  !(qom_cli)0($M,1)>|; (plazo_z)=(30.4); .
  !(canle1_cli)5($0)>|;
    qD,1,fechavta_cli,fech8_z,;
    !(canle1_cli)0($0)>|; (canle1_cli)=(1); . 
    (letpag_z)=(abonos_mvc)(enganc_cli)-(servic_cli)-(canle1_cli)/;
    (letven_z)=(fecha_z)(fech8_z)-(86400)/(plazo_z)/;
  .
  !(toa_z)0($A,1)>|;
    (ii_z)=(letpag_z)(letven_z)-;
    !(ii_z)2($1)>|; f1; a; g-; .
  .
  
  !(diacli_z)5(antdia_z)>|;
    !(band_z)5($S,1)>|;
      (antdia_z)=(diacli_z);
      Ff4; FO(arch_z),w~; FP66,60,Enc,Pie; (band_z)=($S,1);
    |
      GSUBTDIA; (antdia_z)=(diacli_z); GSUBENC;
    .
  .
  GIMPRI;
  f1; a;
)
!(band_z)5($S,1)>|;
  (antdia_z)=(diacli_z);
  Ff4; FO(arch_z),w~; FP66,60,Enc,Pie; (band_z)=($S,1);
.
GSUBTDIA; GULIN;
f1; k2; P$;
Ff4; FC; Ff1; tf; tr; tS0; GSalir;
gFin;

[TOMA_PARAMETROS;
tc; xcrea_param.bat .repclivi.ini ~;
Ff5; FO.repclivi.ini~,r~;
(ind1_z)=(1);
{ 
  Ff5; FG+; z0,milinea_z,#; Fkmilinea_z,l; 
  !(ind1_z)0($1)>|; >similinea_z,#,prdia_z;      . 
  !(ind1_z)0($2)>|; >similinea_z,#,uldia_z;      . 
  !(ind1_z)0($3)>|; >similinea_z,#,prtda_z;      . 
  !(ind1_z)0($4)>|; >similinea_z,#,ultda_z;      . 
  !(ind1_z)0($5)>|; (toa_z)=(milinea_z,1);         .
  !(ind1_z)0($6)>|; (solovtasant_z)=(milinea_z,1); .
  !(ind1_z)0($7)>|; (elimconabo_z)=(milinea_z,1);  .
  !(ind1_z)0($8)>|; (prpob_z)=(milinea_z,25);  .
  !(ind1_z)0($9)>|; (ulpob_z)=(milinea_z,25);  .
  (ind1_z)=(ind1_z)(1)+;
)
Ff5; FC; Ff1; tr;
R;

[GRABA_PARAMETROS;
tc;
Ff5; FO.repclivi.ini~,w~;
pprdia_z,MIS2;    l;
puldia_z,MIS2;    l;
pprtda_z,MIS2;    l;
pultda_z,MIS2;    l;
ptoa_z,0;         l;
psolovtasant_z,0; l;
pelimconabo_z,0; l;
pprpob_z,0; l;
pulpob_z,0; l;
Ff5; FC; Ff1; tr;
R;

[Enc;
Ff3; FT; FGNodatos; Ff4; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \repclivi \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8;
s1; phora_z,#; s1; FW3; l;
Fc70,\Relacion de Clientes Vigentes al ~; pfecha_z,+10; \ Pag:\; Fp%d~; l;
\Del dia:\; pprdia_z,MIS2; \ Al Dia:\; puldia_z,MIS2; 
\ Del Codigo:\; pprtda_z,MIS2; \ Al  Codigo:\; pultda_z,MIS2; l;
\De Poblacion:\; pprpob_z,0; \ A Poblacion:\; pulpob_z,0; l;
!(toa_z)0($A,1)>|;
  \SOLO CLIENTES CON PAGOS ADELANTADOS\; l;
.
GSUBENC;
Ft;

[SUBENC;
Ff4; \Clientes del Dia:\; pantdia_z,MIS2; l; GFONT13; GFONT19;
\Codigo     Nombre                                    Cargos       Abonos Imp. x Letra Pagdo        Saldo\; GFONT20; l;
*1234567890 12345678901234567890123456789012341 123456789012 123456789012 123456789012 12345 123456789012 *
R;

[Pie; Fe;

[IMPRI;
z0,abonos_mvc,#; (codcli_z)=(numcli_cli,#); (idcli_z)=(idcli_cli);
(saldo_z)=(cargos_cli); 
!(elimconabo_z)0($S,1)>|;
  z0,abonos_mvc,#; f2; k2; P; n|;. !(abonos_mvc)5($0)>R;
.

f2; k1; P; n|;. z0,letpag_z,#; (saldo_z)=(saldo_z)(abonos_mvc)-;
!(saldo_z)2($1)>R;
!(canle1_cli)5($0)>|;
  (letpag_z)=(abonos_mvc)(enganc_cli)-(servic_cli)-(canle1_cli)/;
.
Ff4; pnumcli_cli,10; s1; pnombre_cli,34; pstatus_cli,1; s1;
pcargos_cli,MDS12; s1; pabonos_mvc,MDS12; s1; pcanle1_cli,MDS12; s1;
pletpag_z,MIS2; \/\; pnulet1_cli,MIS2; s1; psaldo_z,MDS12; l; 
(clixdia_z)=(clixdia_z)(1)+; 
(saldia_z)=(saldia_z)(saldo_z)+;
(carxdia_z)=(carxdia_z)(cargos_cli)+;
(aboxdia_z)=(aboxdia_z)(abonos_mvc)+;
R;

[ULIN;
Ff4; \Total de Clientes Vigentes:\; pclis_z,MIS5; s15; pcargos_z,MDS12; s1;
pabonos_z,MDS12; s20; psalvig_z,MDS12; l;
R;

[SUBTDIA;
Ff4; \Dia:\; pantdia_z,MIS2; \   Total de Clientes \; 
pclixdia_z,MIS5; s15; pcarxdia_z,MDS12; s1; paboxdia_z,MDS12; 
s20; psaldia_z,MDS12; l; l;
(clis_z)=(clis_z)(clixdia_z)+;     z0,clixdia_z,#; 
(abonos_z)=(abonos_z)(aboxdia_z)+; z0,aboxdia_z,#;
(cargos_z)=(cargos_z)(carxdia_z)+; z0,carxdia_z,#;
(salvig_z)=(salvig_z)(saldia_z)+;  z0,saldia_z,#;
R;

[MANDAELFNT; f5; k1; P; nR; GSACAF; R;

#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
* Buffer definitions for table clientes *
f1; M
	numcli_cli  		s11,
        dia_cli			l,
        fechavta_cli	{
          fechavtaaa_cli	i,
          fechavtamm_cli	i,
          fechavtadd_cli	i,
        		}
	nombre_cli  		s35,
	poblac_cli		s26,
	status_cli		s2,
	qom_cli  		s2,
	enganc_cli  		d,
	nulet1_cli  		i,
	canle1_cli  		d,
	servic_cli  		d,
	cargos_cli  		d,
	idcli_cli		l,
	tam_cli			s0,;
k0; ot,"clientes",;
k1; kq,"select numcli,idpoblac,fechavta,nombre,poblac,status,
	qom,enganc,nulet1,canle1,servic,cargos,idcli
        from car_rutamortmp a join clientes b on a.idruta = b.idcli
        order by idpoblac, conse, numcli",;
k2; kq,"delete from car_rutamortmp where iddesruta = -1",;
k3; kq,"insert into car_rutamortmp (iddesruta, idruta, idpoblac, kilom, cia)
	select -1, idcli, dayofmonth(fechavta), 0, 0
	from clientes
        where 
        poblac between ? and ? and 
        fechavta <= ? and
        ( round(cargos - abonos, 2) > 1   or 
        ( round(cargos - abonos, 2) <= 1 and fecsal > ?) )
        and tienda between ? and ? and DAYOFMONTH(fechavta) between ? and ?",
        prpob_z,#,1,ulpob_z,#,1,fvtasant_z,#,3,fecini_z,#,3,
        prtda_z,ultda_z,prdia_z,uldia_z,;

f2; M
	abonos_mvc		d,;
k0; ot,"mvcli2",;
k1; kq,"select sum(import) from mvcli2 where
    idcli=? and fechamov <= ?",
    idcli_z,fecini_z,#,3,;
k2; kq,"select sum(import) from mvcli2 where
    idcli=? and fechamov between ? and ?",
    idcli_z,fecaboini_z,#,3,fecabofin_z,#,3,;
    
f5; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;
#i/programas/lib/colores.i;


[PAN; 
Ff1; Gtomamaxrc; Gdefine_colores; Gamarillo_negro; 
GST; tf; tn; #iprog1.i;
^=direc_z,#); z0,modul_z,#;
(modul_z)=($Captura Poliza Cobranza,23); (modul2_z)=($FBIcppc,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
