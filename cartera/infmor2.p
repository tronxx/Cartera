* Programa que sirve para Generar el reporte de Informe de Clientes
  DRBR 31-Marzo-1998
*

#dMIS3 %3d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMDS6 %,6.0f~;
#dMFS7 %7.2f~; #dMFS4 %4.1f~; #dMDS10 %,10.0f~;
#dMIS2 %2d~;  #dMLS6 %,6ld~; #dMLS4 %4ld~; #dMFS5 %5.2f~; #dMDS9 %-9.2f~;
#dMIS02 %02d~; #dMIS6 %,6d~; #dMDS12a %,12.0f~;
#i/programas/lib/funkey.i;

f0; M
	sff_z			s2,
  version_z   s21,
	maxcol_z		i,
	maxrow_z		i,
        renst_z			i,
	impre_z			i,
	font_z			i,
	micar_z			s3,
	carac_z			i,
	ren_z			i,
	ter_z            s2,
	bandimp_z		s2,
	importe_z		d,
	impanuant_z		d,
	subzon_z		d,
	prom1subzon_z		d,
	prom2subzon_z		d,
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
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
  tit_z           s100,
	bandf1_z	 s1,
	antlit_z		s31,
	zona_z			i,
	liti_z			s2,
	itc_z			  s2,
	buslit1_z			  s2,
	buslit2_z			  s2,
	buslit3_z			  s2,
	zonacar_z		s3,
        fecanuant_z	{
          fecanuantaa_z		i,
          fecanuantmm_z		i,
          fecanuantdd_z		i,
        		}
        fecsig_z	{
          fecsigaa_z		i,
          fecsigmm_z		i,
          fecsigdd_z		i,
        		}
	
	fecort_z	{
	  fecortaa_z		i,
	  fecortmm_z		i,
	  fecortdd_z		i,
	  		}
	fecma_z		{
	  fecmaaa_z		i,
	  fecmamm_z		i,
	  fecmadd_z		i,
	  		}
	fecm2_z		{
	  fecm2aa_z		i,
	  fecm2mm_z		i,
	  fecm2dd_z		i,
	  		}
	fecha_z			D,
	fechb_z			D,
	fechc_z			D,
	fechd_z			D,
	tothor_z		d,
	esp2_z			i,
	nelem_z			i,
	tda_z			s3,
	totcod_z		d,
	salcli_z		d,
	adeud_z			d,
	codcli_z		s11,
	fech1_z			s8,
	fech2_z			s8,
	antzona_z		i,
	mesan0_z		d,
	mesan1_z		d,
	mesan2_z		d,
	anuan0_z		d,
	porc1_z			d,
	porc2_z			d,
        porc3_z			d,
        porc4_z			d,
        porc5_z			d,
	prom0_z			d,
	prom1_z			d,
	prom2_z			d,
	prom3_z			d,
	prom4_z			d,
        morca_z			d,
        morpi_z			d,
        totmorca_z		d,
        totmorpi_z		d,
        sdotot_z		d,
        saldo_z			d,
	enc_z			i,
	cod_z			i,
        iii_z			i,
        ancho_z			i,
	poblac_z       		s26,

        ndatos_z       		i,
        inicia_z		i,
        termin_z		i,
        ntablas_z		i,
        tablaac_z		i,
        ncolxtab_z		i,
        
        iddesruta_z		l,
        idruta_z		l,
        inttda_z		l,
        intzona_z		l,
        cia_z			l,

	fech8_z           	D,
	ind1_z            	i,
	ind2_z            	i,
        ind3_z			i,
        ind4_z			i,
        ii_z			i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;

mtam0&;
q+,version_z,"V 2.0 FJ",; 
* --- Control de Versiones
   2016-Oct-12 Se modifica para que la leyenda ea de 00 a 45, de 46 a 90 y de 91 o más
   días morosos V 2.0 FJ
* 
Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; GABRE_TABLA; (arch_z)=($infmor00.tex,12); (impre_z)=(1);
&a; &cfecha_z; qD,2,fecsig_z,fecha_z,; 
(ind1_z)=(-1); GSUMA_IND1_MESES; GULTIMO_DE_MES; qD,1,fecsig_z,fecha_z,;
(fechc_z)=(fecha_z);
ttiii_z; (idruta_z)=(iii_z); 

[fec; t@5,3; \Fecha Corte:\; t0Fin; (fecha_z)=(fechc_z); ifecha_z,+10;
!(fecha_z)0($-1)>fec; qD,2,fecort_z,fecha_z,; &bfecha_z; &p4fech1_z;
* --> Tomo la Fecha de corte del Mes anterior <-- *
(fecmaaa_z)=(fecortaa_z); (fecmamm_z)=(fecortmm_z); (fecmadd_z)=(1);
qD,1,fecma_z,fechb_z,; (fechb_z)=(fechb_z)(86400)-;
qD,2,fecma_z,fechb_z,;

* --> Calculo la Fecha de 2 meses antes <--- *
(fecm2aa_z)=(fecmaaa_z); (fecm2mm_z)=(fecmamm_z); (fecm2dd_z)=(1);
qD,1,fecm2_z,fechc_z,; (fechc_z)=(fechc_z)(86400)-;
qD,2,fecm2_z,fechc_z,;
(fecsigaa_z)=(fecortaa_z)(1)-; (fecsigmm_z)=(fecortmm_z); (fecsigdd_z)=(1);
GULTIMO_DE_MES; (fecanuant_z)=(fecsig_z,#);
qD,1,fecanuant_z,fechd_z,;


t@18,3; \1 Mes Ant:\; pfechb_z,+10; \ -2 Mes Ant:\; pfechc_z,+10;
\ -Anu Ant:\; pfechd_z,+10;
[lit; t@6,3; \Cartera `N`ormal o `L`itigio ? <N/L>:\; (liti_z)=($N,1);  iliti_z,1;
!(liti_z)5($L,1)(liti_z)5($N,1)&>lit;

(buslit2_z)=($x,1); (buslit3_z)=($x,1);
!(liti_z)0($L,1)>|;
  [itc; t@7,3; \Litigio `I`rrecuperable `C`obrable `T`otal <I/C/T>:\; t0lit; iitc_z,1;
  !(itc_z)5($I,1)(itc_z)5($C,1)&(itc_z)5($T,1)&>itc;   
  !(itc_z)0($I,1)>|; (buslit1_z)=($I,1); .
  !(itc_z)0($C,1)>|; (buslit1_z)=($C,1); (buslit2_z)=($L,1); .
  !(itc_z)0($T,1)>|; 
    (buslit1_z)=($L,1); (buslit2_z)=($C,1); (buslit3_z)=($I,1); 
  .
|
  (buslit1_z)=($N,1); (buslit2_z)=($x,1); (buslit3_z)=($x,1);
.
GST; \Estan correctos los datos ? <S/N> :\; y|; | gfec; .

tS1,10,0,10,80; tc;
(enc_z)=(1);
f6; k1; P;
{ n+;
  Ff1; \Leyendo:\; pzona_ind1,MIS2; l;
  GIMPRIMELO;
  f6; a;
)
(enc_z)=(2); GIMPRIMELO;
(enc_z)=(3); Ff4; GFONT30; GIMPRIME_ACUM_X_POB;
Ff4; FC; Ff1; tf; tr; tS0; GSalir;
gFin;

[IMPRIMELO;
(zona_z)=(zona_ind1);
!(band_z)5($S,1)>|;
  Ff4; FO(arch_z),w~; FP66,60,Enc,Pie; (band_z)=($S,1);
|
  Ff4; GFONT30;
.
z0,de00a30_maifm,l; f3;
!(enc_z)0($1)>|; k1; .
!(enc_z)0($2)>|; k2; .
P; n|;.
z0,de00a30_2maifm,l; f4;
!(enc_z)0($1)>|; k1; .
!(enc_z)0($2)>|; k2; .
P; n|;.
z0,de00a30_3maifm,l; f5;
!(enc_z)0($1)>|; k1; .
!(enc_z)0($2)>|; k2; .
P; n|;.

z0,de00a30_anuant,l; f11;
!(enc_z)0($1)>|; k1; .
!(enc_z)0($2)>|; k2; .
P; n|;.

(mesan2_z)=(de00a30_2maifm)(de31a60_2maifm)+(de61a99_2maifm)+;
(mesan1_z)=(de00a30_maifm)(de31a60_maifm)+(de61a99_maifm)+;
(mesan0_z)=(de00a30_3maifm)(de31a60_3maifm)+(de61a99_3maifm)+;
(anuan0_z)=(de00a30_anuant)(de31a60_anuant)+(de61a99_anuant)+;

GFONT12;
s17; pfechc_z,+10; s3; pfechb_z,+10; s11; pfecha_z,+10; s11; \Part.   M.A.  A.A.\; l;
z0,porc1_z,#; z0,porc2_z,#; z0,porc3_z,#; z0,porc4_z,#; z0,porc5_z,#;
!(de00a30_2maifm)5($0)>|;
  (porc1_z)=(de00a30_maifm)(de00a30_2maifm)-(de00a30_2maifm)/(100)*;
.
!(de00a30_maifm)5($0)>|;
  (porc2_z)=(de00a30_3maifm)(de00a30_maifm)-(de00a30_maifm)/(100)*;
.
\De  0-45      :\; pde00a30_2maifm,MDS12; s1; pde00a30_maifm,MDS12; s1;
pporc1_z,MFS7; \%\; pde00a30_3maifm,MDS12; s1; pporc2_z,MFS7; \% \;
!(mesan0_z)5($0)>|; (porc3_z)=(de00a30_3maifm)(mesan0_z)/(100)*; .
!(mesan1_z)5($0)>|; (porc4_z)=(de00a30_maifm)(mesan1_z)/(100)*; .
!(anuan0_z)5($0)>|; (porc5_z)=(de00a30_anuant)(anuan0_z)/(100)*; .
pporc3_z,MFS5; \% \;  pporc4_z,MFS5; \% \; pporc5_z,MFS5; \%\; l;

z0,porc1_z,#; z0,porc2_z,#; z0,porc3_z,#; z0,porc4_z,#; z0,porc5_z,#;
!(de31a60_2maifm)5($0)>|;
  (porc1_z)=(de31a60_maifm)(de31a60_2maifm)-(de31a60_2maifm)/(100)*;
.
!(de31a60_maifm)5($0)>|;
  (porc2_z)=(de31a60_3maifm)(de31a60_maifm)-(de31a60_maifm)/(100)*;
.
\De 45-90      :\; pde31a60_2maifm,MDS12; s1; pde31a60_maifm,MDS12; s1;
pporc1_z,MFS7; \%\; pde31a60_3maifm,MDS12; s1; pporc2_z,MFS7; \% \;
!(mesan0_z)5($0)>|; (porc3_z)=(de31a60_3maifm)(mesan0_z)/(100)*; .
!(mesan1_z)5($0)>|; (porc4_z)=(de31a60_maifm)(mesan1_z)/(100)*; .
!(anuan0_z)5($0)>|; (porc5_z)=(de31a60_anuant)(anuan0_z)/(100)*; .
pporc3_z,MFS5; \% \;  pporc4_z,MFS5; \% \; pporc5_z,MFS5; \%\; l;

z0,porc1_z,#; z0,porc2_z,#; z0,porc3_z,#; z0,porc4_z,#; z0,porc5_z,#;
!(de61a99_2maifm)5($0)>|;
  (porc1_z)=(de61a99_maifm)(de61a99_2maifm)-(de61a99_2maifm)/(100)*;
.
!(de61a99_maifm)5($0)>|;
  (porc2_z)=(de61a99_3maifm)(de61a99_maifm)-(de61a99_maifm)/(100)*;
.
\De 91 y mas   :\; pde61a99_2maifm,MDS12; s1; pde61a99_maifm,MDS12; s1;
pporc1_z,MFS7; \%\; pde61a99_3maifm,MDS12; s1; pporc2_z,MFS7; \% \;
!(mesan0_z)5($0)>|; (porc3_z)=(de61a99_3maifm)(mesan0_z)/(100)*; .
!(mesan1_z)5($0)>|; (porc4_z)=(de61a99_maifm)(mesan1_z)/(100)*; .
!(anuan0_z)5($0)>|; (porc5_z)=(de61a99_anuant)(anuan0_z)/(100)*; .
pporc3_z,MFS5; \% \;  pporc4_z,MFS5; \% \; pporc5_z,MFS5; \%\; l;
s15; c-76; l;
z0,porc1_z,#; z0,porc2_z,#;
!(mesan2_z)5($0)>|;
  (porc1_z)=(mesan1_z)(mesan2_z)-(mesan2_z)/(100)*;
.
!(mesan1_z)5($0)>|;
  (porc2_z)=(mesan0_z)(mesan1_z)-(mesan1_z)/(100)*;
.
\   Totales    :\; pmesan2_z,MDS12; s1; pmesan1_z,MDS12; s1;
pporc1_z,MFS7; \%\; pmesan0_z,MDS12; s1; pporc2_z,MFS7; \%\; 
s8; panuan0_z,MDS12; l;
GFONT11; l; l;
z0,porc1_z,#; z0,porc2_z,#;
!(clientes_2maifm)5($0)>|;
  (porc1_z)=(clientes_maifm)(clientes_2maifm)-(clientes_2maifm)/(100)*;
.
!(clientes_maifm)5($0)>|;
  (porc2_z)=(clientes_3maifm)(clientes_maifm)-(clientes_maifm)/(100)*;
.

\Total Clientes:\; s6; pclientes_2maifm,MDS6; s7; pclientes_maifm,MDS6; s1;
pporc1_z,MFS7; \%\; s6; pclientes_3maifm,MDS6; s1; pporc2_z,MFS7; \%\; l;

z0,porc1_z,#; z0,porc2_z,#;
!(diasmor_2maifm)5($0)>|;
  (porc1_z)=(diasmor_maifm)(diasmor_2maifm)-(diasmor_2maifm)/(100)*;
.
!(diasmor_maifm)5($0)>|;
  (porc2_z)=(diasmor_3maifm)(diasmor_maifm)-(diasmor_maifm)/(100)*;
.

\Dias Morosos  :\; s6; pdiasmor_2maifm,MDS6; s7; pdiasmor_maifm,MDS6; s1;
pporc1_z,MFS7; \%\; s6; pdiasmor_3maifm,MDS6; s1; pporc2_z,MFS7; \%\; l;

z0,porc1_z,#; z0,porc2_z,#;
!(docvenc_2maifm)5($0)>|;
  (porc1_z)=(docvenc_maifm)(docvenc_2maifm)-(docvenc_2maifm)/(100)*;
.
!(docvenc_maifm)5($0)>|;
  (porc2_z)=(docvenc_3maifm)(docvenc_maifm)-(docvenc_maifm)/(100)*;
.

\Docts Vencidos:\; s6; pdocvenc_2maifm,MDS6; s7; pdocvenc_maifm,MDS6; s1;
pporc1_z,MFS7; \%\; s6; pdocvenc_3maifm,MDS6; s1; pporc2_z,MFS7; \%\; l;

z0,porc1_z,#; z0,porc2_z,#; z0,prom0_z,#; z0,prom1_z,#; z0,prom2_z,#;
!(docvenc_2maifm)5($0)>|; (prom2_z)=(diasmor_2maifm)(docvenc_2maifm)/; .
!(docvenc_maifm)5($0)>|;  (prom1_z)=(diasmor_maifm)(docvenc_maifm)/; .
!(docvenc_3maifm)5($0)>|; (prom0_z)=(diasmor_3maifm)(docvenc_3maifm)/; .

!(prom2_z)5($0)>|;
  (porc1_z)=(prom1_z)(prom2_z)-(prom2_z)/(100)*;
.
!(prom1_z)5($0)>|;
  (porc2_z)=(prom0_z)(prom1_z)-(prom1_z)/(100)*;
.

\Prom.Dia/Docto:\; pprom2_z,MDS12; s1; pprom1_z,MDS12; s1;
pporc1_z,MFS7; \%\; pprom0_z,MDS12; s1; pporc2_z,MFS7; \%\; l; l;

z0,porc1_z,#; z0,porc2_z,#;
!(clientes_2maifm)5($0)>|;
  (porc1_z)=(clientes_maifm)(clientes_2maifm)-(clientes_2maifm)/(100)*;
.
!(clientes_maifm)5($0)>|;
  (porc2_z)=(clientes_3maifm)(clientes_maifm)-(clientes_maifm)/(100)*;
.

\Acum. Clientes:\; s6; pclientes_2maifm,MDS6; s7; pclientes_maifm,MDS6; s1;
pporc1_z,MFS7; \%\; s6; pclientes_3maifm,MDS6; s1; pporc2_z,MFS7; \%\; l;

z0,porc1_z,#; z0,porc2_z,#;
!(docvenc_2maifm)5($0)>|;
  (porc1_z)=(docvenc_maifm)(docvenc_2maifm)-(docvenc_2maifm)/(100)*;
.
!(docvenc_maifm)5($0)>|;
  (porc2_z)=(docvenc_3maifm)(docvenc_maifm)-(docvenc_maifm)/(100)*;
.

\Acum.Doctos   :\; s6; pdocvenc_2maifm,MDS6; s7; pdocvenc_maifm,MDS6; s1;
pporc1_z,MFS7; \%\; s6; pdocvenc_3maifm,MDS6; s1; pporc2_z,MFS7; \%\; l; l;

z0,porc1_z,#; z0,porc2_z,#; z0,prom0_z,#; z0,prom1_z,#; z0,prom2_z,#;
!(clientes_2maifm)5($0)>|; (prom2_z)=(mesan2_z)(clientes_2maifm)/; .
!(clientes_maifm)5($0)>|;  (prom1_z)=(mesan1_z)(clientes_maifm)/; .
!(clientes_3maifm)5($0)>|; (prom0_z)=(mesan0_z)(clientes_3maifm)/; .

!(prom2_z)5($0)>|;
  (porc1_z)=(prom1_z)(prom2_z)-(prom2_z)/(100)*;
.
!(prom1_z)5($0)>|;
  (porc2_z)=(prom0_z)(prom1_z)-(prom1_z)/(100)*;
.

\Prom.Imp.x Cte:\; pprom2_z,MDS12; s1; pprom1_z,MDS12; s1;
pporc1_z,MFS7; \%\; pprom0_z,MDS12; s1; pporc2_z,MFS7; \%\; l;

z0,porc1_z,#; z0,porc2_z,#; z0,prom0_z,#; z0,prom1_z,#; z0,prom2_z,#;
!(docvenc_2maifm)5($0)>|; (prom2_z)=(mesan2_z)(docvenc_2maifm)/; .
!(docvenc_maifm)5($0)>|;  (prom1_z)=(mesan1_z)(docvenc_maifm)/; .
!(docvenc_3maifm)5($0)>|; (prom0_z)=(mesan0_z)(docvenc_3maifm)/; .

!(prom2_z)5($0)>|;
  (porc1_z)=(prom1_z)(prom2_z)-(prom2_z)/(100)*;
.
!(prom1_z)5($0)>|;
  (porc2_z)=(prom0_z)(prom1_z)-(prom1_z)/(100)*;
.

\Prom.Imp.xDoct:\; pprom2_z,MDS12; s1; pprom1_z,MDS12; s1;
pporc1_z,MFS7; \%\; pprom0_z,MDS12; s1; pporc2_z,MFS7; \%\; l;

z0,porc1_z,#; z0,porc2_z,#; z0,prom0_z,#; z0,prom1_z,#; z0,prom2_z,#;
!(clientes_2maifm)5($0)>|; (prom2_z)=(docvenc_2maifm)(clientes_2maifm)/; .
!(clientes_maifm)5($0)>|;  (prom1_z)=(docvenc_maifm)(clientes_maifm)/; .
!(clientes_3maifm)5($0)>|; (prom0_z)=(docvenc_3maifm)(clientes_3maifm)/; .

!(prom2_z)5($0)>|;
  (porc1_z)=(prom1_z)(prom2_z)-(prom2_z)/(100)*;
.
!(prom1_z)5($0)>|;
  (porc2_z)=(prom0_z)(prom1_z)-(prom1_z)/(100)*;
.

\Prom.Doc.x Cte:\; pprom2_z,MDS12; s1; pprom1_z,MDS12; s1;
pporc1_z,MFS7; \%\; pprom0_z,MDS12; s1; pporc2_z,MFS7; \%\; l; GFONT13; l;
* --> Para poner la zona en enteros voy a grabarlo en car_rutamortmp
  DRBR 7-May-2010
*
GGRABA_RUTAMORTMP;
z0,nelem_z,#;

!(enc_z)0($1)>|; f9; k1; .
!(enc_z)0($2)>|; f9; k2; .
(antzona_z)=(-1);
P; 
{ n+; 
  (nelem_z)=(nelem_z)(1)+; !(antzona_z)0($-1)>|; (antzona_z)=(zona_ind5); .
  !(enc_z)0($1)>|; 
    !(antzona_z)5(zona_ind5)>|; (nelem_z)=(nelem_z)(1)+; .
  .
  (antzona_z)=(zona_ind5);
  f9; a; 
)
!(nelem_z)4($0)>R; * --> No tengo Datos, no puedo Generar Tabla *

(ncolxtab_z)=(8);
(ntablas_z)=(nelem_z)(2)+(ncolxtab_z)/;
(ind1_z)=(ntablas_z)(ncolxtab_z)*;
(ind2_z)=(nelem_z)(2)+;
!(ind1_z)2(ind2_z)>|; 
  (ntablas_z)=(ntablas_z)(1)+;
  (ncolxtab_z)=(nelem_z)(2)+(ntablas_z)/;
  (ind1_z)=(ntablas_z)(ncolxtab_z)*(2)+; 
  (ind2_z)=(nelem_z)(2)+;
  !(ind1_z)2(ind2_z)>|; (ncolxtab_z)=(ncolxtab_z)(1)+; .
.
(tablaac_z)=(0);
{ !(tablaac_z)3(ntablas_z)>+;
  (inicia_z)=(tablaac_z)(ncolxtab_z)*(1)+;
  (termin_z)=(inicia_z)(ncolxtab_z)+(1)-;
  !(termin_z)1(nelem_z)>|; (termin_z)=(nelem_z); .
  (ndatos_z)=(termin_z)(inicia_z)-(1)+;
  GGENERATABLA;
  (tablaac_z)=(tablaac_z)(1)+;
)
R;

[GENERATABLA;
Ff4;
!(ncolxtab_z)2($5)>|; (ancho_z)=(90); | (ancho_z)=(132); .
(exten_z)=(ndatos_z)(4)+(13)*;
z0,esp2_z,#;
*
(esp2_z)=(ancho_z)(exten_z)-(2)/; !(esp2_z)2($0)>|; z0,esp2_z,#; .
*
!(ancho_z)0($90)>|; GFONT12; GFONT14; | GFONT11; GFONT13; .
sesp2_z; c_12; (ind3_z)=(1); (antzona_z)=(-1);
f9;
!(enc_z)0($1)>|; k1; .
!(enc_z)0($2)>|; k2; .
P;
{ n+;
  !(antzona_z)0($-1)>|; (antzona_z)=(zona_ind5); .
  !(ind3_z)3(inicia_z)(ind3_z)4(termin_z)&>|;
    !(enc_z)0($1)>|;
      !(antzona_z)5(zona_ind5)>|; c_13; .
    .
    c_13; 
  .
  (antzona_z)=(zona_ind5);
  (ind3_z)=(ind3_z)(1)+;
  f9; a;
)
!(enc_z)0($1)>|;
  !(ind3_z)3(inicia_z)(ind3_z)4(termin_z)&(ind3_z)3(nelem_z)|>|;
      c_13;
  .
.
!(termin_z)3(nelem_z)>|; c_28; . l;
sesp2_z; GFONT19; \|\; s12; \|\; (ind3_z)=(1);
f9;
!(enc_z)0($1)>|; k1; .
!(enc_z)0($2)>|; k2; .
(antzona_z)=(-1);
P;
{ n+;
  !(antzona_z)0($-1)>|; (antzona_z)=(zona_ind5); .
  !(ind3_z)3(inicia_z)(ind3_z)4(termin_z)&>|;
    !(enc_z)0($1)>|;
      !(antzona_z)5(zona_ind5)>|; GSUBENC_ZONA; .
    .
    pcod_ind5,MIS2; s1; GNOTDA;
    !(enc_z)0($1,1)>|; >iscod_ind5,tda_z,MIS02; f7; k2; P; n|;. .
    !(enc_z)0($2,1)>|; (cod_z)=(cod_ind5); f7; k1; P; n|;. .
    pnomzona_ind6,9; \|\;
  .
  (antzona_z)=(zona_ind5);
  (ind3_z)=(ind3_z)(1)+;
  f9; a;
)
!(enc_z)0($1)>|;
  !(ind3_z)3(inicia_z)(ind3_z)4(termin_z)&(termin_z)3(nelem_z)|>|; 
    GSUBENC_ZONA; 
  .
.
!(termin_z)3(nelem_z)>|; 
  \   Total    | \; pfechd_z,+10; \ |\; 
. 
GFONT20; l;
(ren_z)=(01); GIMPRIME_RENGLON;
(ren_z)=(02); GIMPRIME_RENGLON;
(ren_z)=(03); GIMPRIME_RENGLON;
(ren_z)=(04); GIMPRIME_RENGLON;
(ren_z)=(05); GIMPRIME_RENGLON; 
(ren_z)=(06); GIMPRIME_RENGLON;
(ren_z)=(07); GIMPRIME_RENGLON;
(ren_z)=(08); GIMPRIME_RENGLON;
(ren_z)=(09); GIMPRIME_RENGLON;
(ren_z)=(10); GIMPRIME_RENGLON;
(ren_z)=(11); GIMPRIME_RENGLON;
R;

[SUBENC_ZONA;
>isantzona_z,zonacar_z,MIS02; f7; k3; P; n|;.
pnomzona_ind6,12; \|\;
R;

[IMPRIME_RENGLON;
sesp2_z; 
!(ren_z)0($01)>|; \|De 00 a 45  |\; .
!(ren_z)0($02)>|; \|De 46 a 90  |\; .
!(ren_z)0($03)>|; GFONT19; \|Mas de 90   |\; .
!(ren_z)0($04)>|; GFONT19; \|  Total     |\; .
!(ren_z)0($05)>|; \|Total Client|\; .
!(ren_z)0($06)>|; \|Dias Morosos|\; .
!(ren_z)0($07)>|; \|Doctos Venc.|\; .
!(ren_z)0($08)>|; GFONT19; \|Prom.Dia/Doc|\; .
!(ren_z)0($09)>|; \|Prom.Imp/Cte|\; .
!(ren_z)0($10)>|; \|Prom.Imp/Doc|\; .
!(ren_z)0($11)>|; GFONT19; \|Prom.Doc/Cte|\; .
(antzona_z)=(-1); (ind3_z)=(1); z0,tothor_z,#; f9;
!(enc_z)0($1)>|; k1; .
!(enc_z)0($2)>|; k2; .
z0,importe_z,#; z0,impanuant_z,#; z0,prom0_z,#; 
z0,prom1_z,#; z0,prom2_z,#; z0,prom3_z,#; z0,prom4_z,#;
z0,subzon_z,#; z0,prom1subzon_z,#; z0,prom2subzon_z,#;
P;
{ n+; 
  !(antzona_z)0($-1)>|; (antzona_z)=(zona_ind5); .
  !(ind3_z)3(inicia_z)(ind3_z)4(termin_z)&>|; 
    !(enc_z)0($1)>|;
      !(antzona_z)5(zona_ind5)>|; 
        GIMPRIME_IMPSUBZON;
      .
    .
  .
  !(antzona_z)5(zona_ind5)>|; 
     z0,subzon_z,#; z0,prom1subzon_z,#; z0,prom2subzon_z,#;
     (antzona_z)=(zona_ind5); 
  .
  (cod_z)=(cod_ind5); z0,de00a30_3maifm,l; f5;
  !(enc_z)0($1)>|; k3; .
  !(enc_z)0($2)>|; k4; .
  P; n|;. 
  !(ren_z)0($1)>|; (importe_z)=(de00a30_3maifm); (impanuant_z)=(de00a30_anuant); .
  !(ren_z)0($2)>|; (importe_z)=(de31a60_3maifm); (impanuant_z)=(de31a60_anuant); .
  !(ren_z)0($3)>|; (importe_z)=(de61a99_3maifm); (impanuant_z)=(de61a99_anuant); .
  !(ren_z)0($4)>|; 
    (importe_z)=(de00a30_3maifm)(de31a60_3maifm)+(de61a99_3maifm)+;
    (impanuant_z)=(de00a30_anuant)(de31a60_anuant)+(de61a99_anuant)+;
  .
  !(ren_z)0($5)>|; 
    (importe_z)=(clientes_3maifm); (impanuant_z)=(clientes_anuant);
  .
  !(ren_z)0($6)>|; 
    (importe_z)=(diasmor_3maifm); (impanuant_z)=(diasmor_anuant);
  .
  !(ren_z)0($7)>|;
    (importe_z)=(docvenc_3maifm); (impanuant_z)=(docvenc_anuant);
  .
  !(ren_z)0($8)>|;
    !(docvenc_3maifm)5($0)>|; (importe_z)=(diasmor_3maifm)(docvenc_3maifm)/; .
    !(docvenc_anuant)5($0)>|; (impanuant_z)=(diasmor_anuant)(docvenc_anuant)/; .
    (prom1_z)=(prom1_z)(diasmor_3maifm)+;
    (prom2_z)=(prom2_z)(docvenc_3maifm)+;
    (prom1subzon_z)=(prom1subzon_z)(diasmor_3maifm)+;
    (prom2subzon_z)=(prom2subzon_z)(docvenc_3maifm)+;
    (prom3_z)=(diasmor_anuant);
    (prom4_z)=(docvenc_anuant);
  .
  !(ren_z)0($9)>|;
    (importe_z)=(de00a30_3maifm)(de31a60_3maifm)+(de61a99_3maifm)+;
    (impanuant_z)=(de00a30_anuant)(de31a60_anuant)+(de61a99_anuant)+;
    (prom1_z)=(prom1_z)(importe_z)+;
    (prom2_z)=(prom2_z)(clientes_3maifm)+;
    (prom3_z)=(impanuant_z);
    (prom4_z)=(clientes_anuant);
    (prom1subzon_z)=(prom1subzon_z)(importe_z)+;
    (prom2subzon_z)=(prom2subzon_z)(clientes_3maifm)+;
    !(clientes_3maifm)5($0)>|; (importe_z)=(importe_z)(clientes_3maifm)/; .
    !(clientes_anuant)5($0)>|; (impanuant_z)=(impanuant_z)(clientes_anuant)/; .
  .
  !(ren_z)0($10)>|;
    (importe_z)=(de00a30_3maifm)(de31a60_3maifm)+(de61a99_3maifm)+;
    (impanuant_z)=(de00a30_anuant)(de31a60_anuant)+(de61a99_anuant)+;
    (prom1_z)=(prom1_z)(importe_z)+;
    (prom2_z)=(prom2_z)(docvenc_3maifm)+;
    (prom1subzon_z)=(prom1subzon_z)(importe_z)+;
    (prom2subzon_z)=(prom2subzon_z)(docvenc_3maifm)+;
    (prom3_z)=(impanuant_z);
    (prom4_z)=(docvenc_anuant);
    !(docvenc_3maifm)5($0)>|; (importe_z)=(importe_z)(docvenc_3maifm)/; .
    !(docvenc_anuant)5($0)>|; (impanuant_z)=(impanuant_z)(docvenc_anuant)/; .
  .
  !(ren_z)0($11)>|;
    (prom1_z)=(prom1_z)(docvenc_3maifm)+;
    (prom2_z)=(prom2_z)(clientes_3maifm)+;
    (prom3_z)=(docvenc_anuant);
    (prom4_z)=(clientes_anuant);
    (prom1subzon_z)=(prom1subzon_z)(docvenc_3maifm)+;
    (prom2subzon_z)=(prom2subzon_z)(clientes_3maifm)+;
    !(clientes_3maifm)5($0)>|; 
      (importe_z)=(docvenc_3maifm)(clientes_3maifm)/; 
    .
    !(clientes_anuant)5($0)>|; 
      (impanuant_z)=(docvenc_anuant)(clientes_anuant)/; 
    .
  .
  !(ind3_z)3(inicia_z)(ind3_z)4(termin_z)&>|; 
    !(ren_z)0($5)(ren_z)0($6)|(ren_z)0($7)|>|;
      pimporte_z,MDS12a;
    |
      pimporte_z,MDS12; 
    .
    \|\; 
  .
  (subzon_z)=(subzon_z)(importe_z)+;
  !(ind3_z)4(termin_z)>|;
    (tothor_z)=(tothor_z)(importe_z)+;
  .
  (ind3_z)=(ind3_z)(1)+; 
  f9; a;
)
!(enc_z)0($1)>|;
  !(ind3_z)3(inicia_z)(ind3_z)4(termin_z)&(termin_z)3(nelem_z)|>|; 
    GIMPRIME_IMPSUBZON;
  .
.
!(termin_z)3(nelem_z)>|;
  GCALCU_PROMTOTAL; GCALCU_PROMANUA;
  !(ren_z)0($5)(ren_z)0($6)|(ren_z)0($7)|>|;
    ptothor_z,MDS12a; \|\; pimpanuant_z,MDS12a;
  |
    ptothor_z,MDS12; \|\; pimpanuant_z,MDS12; 
  .
  \|\; 
.
!(ren_z)0($03)(ren_z)0($04)|(ren_z)0($08)|(ren_z)0($11)|>|; 
  GFONT20; 
.
l;
R;

[CALCU_PROMSUBZON;
!(ren_z)0($8)(ren_z)0($9)|(ren_z)0($10)|(ren_z)0($11)|>|;
  z0,subzon_z,#;
  !(prom2subzon_z)5($0)>|;
    (subzon_z)=(prom1subzon_z)(prom2subzon_z)/;
  .
.
R;

[IMPRIME_IMPSUBZON;
GCALCU_PROMSUBZON;
!(ren_z)0($5)(ren_z)0($6)|(ren_z)0($7)|>|;
  psubzon_z,MDS12a; 
|
  psubzon_z,MDS12; 
.
\|\; 
z0,subzon_z,#; z0,prom1subzon_z,#; z0,prom2subzon_z,#;
R;

[CALCU_PROMTOTAL;
!(ren_z)0($8)(ren_z)0($9)|(ren_z)0($10)|(ren_z)0($11)|>|;
  z0,tothor_z,#;
  !(prom2_z)5($0)>|;
    (tothor_z)=(prom1_z)(prom2_z)/;
  .
.
R;

[CALCU_PROMANUA;
!(ren_z)0($8)(ren_z)0($9)|(ren_z)0($10)|(ren_z)0($11)>|;
  z0,impanuant_z,#;
  !(prom3_z)5($0)>|;
    (impanuant_z)=(prom3_z)(prom4_z)/;
  .
.
R;

[Enc;
Ff3; FT; FGNodatos; Ff4; GFONT13; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT11; GFONT13; \infmor2 \; GFONT14; &a; &cfech8_z; &p3fech9_z; 
pfech8_z,+10; s1; phora_z,#; s1; FW3; l;
GFONT15; Fc40,\Informe de Morosos~; GFONT16; \ Pag:\; Fp%d~; l;
GFONT15; \Analisis segun activacion al \; pfecha_z,+10; GFONT16; l;
z0,tit_z,#;
!(liti_z)0($L,1)>|; 
  q+,tit_z,"CARTERA DE CLIENTES EN LITIGIO",;
  !(itc_z)0($C,1)>|; q+,tit_z," COBRABLES",; .  
  !(itc_z)0($I,1)>|; q+,tit_z," IRRECUPERABLES",; .  
  !(itc_z)0($T,1)>|; q+,tit_z," TOTALES",; .  
.
!(liti_z)0($N,1)>|; q+,tit_z,"CARTERA DE CLIENTES NORMALES (NO EN LITIGIO)",; .
Fslexten_z,tit_z; (esp_z)=(80)(exten_z)-(2)/; !(esp_z)2($0)>|; (esp_z)=(0); .
sesp_z; ptit_z,0; l;  
GSUBENC;
Ft;


[SUBENC;
Ff4;
!(enc_z)0($1)>|;
  GFONT15; pzona_z,MIS2; f1; k1; P; n|; GNOREP; . s1; pzona_rpm,0; GFONT16; l;
.
!(enc_z)0($2)>|;
  GFONT15; \ACUMULADO DE TODAS LAS ZONAS\; GFONT16;  l;
.
!(enc_z)0($3)>|;
  \ACUMULADO X POBLACION DE TODAS LAS ZONAS\; l;
  GFONT13; c_130; GFONT19; l;
  \|Poblacion              |\;
  \Mor. Calle|\;
  \ %% |\;
  \Mor.  Piso|\;
  \ %% |\;
  \Morosos A1|\;
  \ %% |\;
  \Morosos A2|\;
  \ %% |\;
  \Morosos A3|\;
  \ %% |\;
  \     Total|\; 
  \     Saldo|\; 
  GFONT20; l;
  * 12345678901234567890123 123456789012 1234 123456789012 1234 123456789012 1234 1234567890*
.
R;

[Pie; 
!(enc_z)0($3)>|; GPIE_TABLA; .
Fe;

[PIE_TABLA;
Ff4;
\|_______________________|\;
(ind1_z)=(5);
{ !(ind1_z)2($1)>+;  \__________|\;  \____|\;  (ind1_z)=(ind1_z)(1)-; )
\__________|__________|\; l;
R;


*1234567890 123456789012 1234567890127 1234567 123456789012 1234567*

[IMPRIME_ACUM_X_POB;
z0,prom0_z,#; z0,prom1_z,#; z0,prom2_z,#;
f10; k1; P;
{ n+;
  Ff1; \Leyendo:\; ppoblac_ind10,0; l;
  (tothor_z)=(impa1_ind10)(impa2_ind10)+(impa3_ind10)+;
  z0,porc1_z,#; z0,porc2_z,#; z0,porc3_z,#; z0,porc4_z,#; z0,porc5_z,#;
  (poblac_z)=(poblac_ind10,#);
  z0,de00a30_3maifm,l; f5; k5; P; n|;. (morca_z)=(de00a30_3maifm);
  (saldo_z)=(saldo_3maifm);
  z0,de00a30_3maifm,l; f5; k6; P; n|;. (morpi_z)=(de00a30_3maifm);
  (saldo_z)=(saldo_z)(saldo_3maifm)+;
  !(tothor_z)5($0)>|;
    (porc1_z)=(impa1_ind10)(tothor_z)/(100)*; 
    (porc2_z)=(impa2_ind10)(tothor_z)/(100)*; 
    (porc3_z)=(impa3_ind10)(tothor_z)/(100)*; 
    (porc4_z)=(morca_z)(tothor_z)/(100)*; 
    (porc5_z)=(morpi_z)(tothor_z)/(100)*; 
  .
  Ff4; \|\; ppoblac_ind10,23; \|\; 
  !(morca_z)5($0)>|;
    pmorca_z,MDS10; \|\; 
    !(porc4_z)3($99.9)>|; \100 \; | pporc4_z,MFS4; .
  |
    s10; \|\; s4;
  .
  \|\;
  !(morpi_z)5($0)>|;
    pmorpi_z,MDS10; \|\; 
    !(porc5_z)3($99.9)>|; \100 \; | pporc5_z,MFS4; .
  |
    s10; \|\; s4;
  .
  \|\;
  !(impa1_ind10)5($0)>|;
    pimpa1_ind10,MDS10; \|\; 
    !(porc1_z)3($99.9)>|; \100 \; | pporc1_z,MFS4; . 
  |
    s10; \|\; s4;
  .
  \|\;
  !(impa2_ind10)5($0)>|;
    pimpa2_ind10,MDS10; \|\; 
    !(porc2_z)3($99.9)>|; \100 \; | pporc2_z,MFS4; .
  |
    s10; \|\; s4;
  .
  \|\;
  !(impa3_ind10)5($0)>|;
    pimpa3_ind10,MDS10; \|\; 
    !(porc3_z)3($99.9)>|; \100 \; | pporc3_z,MFS4; .
  |
    s10; \|\; s4;
  .
  \|\; ptothor_z,MDS10; \|\;   psaldo_z,MDS10; \|\; l;
  (prom0_z)=(prom0_z)(impa1_ind10)+;
  (prom1_z)=(prom1_z)(impa2_ind10)+;
  (prom2_z)=(prom2_z)(impa3_ind10)+;
  (sdotot_z)=(sdotot_z)(saldo_z)+;
  (totmorca_z)=(totmorca_z)(morca_z)+;
  (totmorpi_z)=(totmorpi_z)(morpi_z)+;
  f10; a;
)
(tothor_z)=(prom0_z)(prom1_z)+(prom2_z)+;
Ff4; GFONT19; \|        Total General  |\;
ptotmorca_z,MDS10; \|\; GCALCU_PORMORCA; GIMPRIPORC; \|\;
ptotmorpi_z,MDS10; \|\; GCALCU_PORMORPI; GIMPRIPORC; \|\;
pprom0_z,MDS10; \|\; GCALCU_PORPROM0; GIMPRIPORC; \|\;
pprom1_z,MDS10; \|\; GCALCU_PORPROM1; GIMPRIPORC; \|\;
pprom2_z,MDS10; \|\; GCALCU_PORPROM2; GIMPRIPORC; \|\;
ptothor_z,MDS10; \|\; psdotot_z,MDS10; \|\; GFONT20; l;
R;

[IMPRIPORC; !(porc1_z)3($99.9)>|; \100 \; | pporc1_z,MFS4; . R;
[CALCU_PORPROM0;
z0,porc1_z,#; !(tothor_z)5($0)>|; (porc1_z)=(prom0_z)(tothor_z)/(100)*; .
R;
[CALCU_PORPROM1;
z0,porc1_z,#; !(tothor_z)5($0)>|; (porc1_z)=(prom1_z)(tothor_z)/(100)*; .
R;
[CALCU_PORPROM2;
z0,porc1_z,#; !(tothor_z)5($0)>|; (porc1_z)=(prom2_z)(tothor_z)/(100)*; .
R;

[CALCU_PORMORCA;
z0,porc1_z,#; !(tothor_z)5($0)>|; (porc1_z)=(totmorca_z)(tothor_z)/(100)*; .
R;
[CALCU_PORMORPI;
z0,porc1_z,#; !(tothor_z)5($0)>|; (porc1_z)=(totmorpi_z)(tothor_z)/(100)*; .
R;

[GRABA_RUTAMORTMP;
* --> Para poner la zona en enteros voy a grabarlo en car_rutamortmp
  DRBR 7-May-2010
*
f9; k4; P$; * --> Borro el dato anterior <-- *
z0,ultimo_ind11,l; f12; k1; P; n|;. (iddesruta_z)=(ultimo_ind11)(1)+;
f9; k5; P;
{ n+;
  Ff1; \Convirtiendo Zona:\; pzona_ind5,MIS2; s1; pcod_ind5,MIS2; l;
  >iscod_ind5,tda_z,MIS02; f8; k1; P; n|;.
  >sizoncar_tda,#,intzona_z; (inttda_z)=(cod_ind5);
  (iddesruta_z)=(iddesruta_z)(1)+; f10; k2; P$;
  f9; a;
)
R;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;

#iimpri.i;
#isacaf.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #irepmors.i;
k0; ot,"repmors",;
k1; kp,"numzon=?",zona_z,;

f2; #iinfmor.i;
k0; ot,"infmor",;
k1; kp,"zona=? and ( litigio=? or litigio=? or litigio=? ) 
    and fecha=? and clientes <> 0 and diasmor <> 0 order by cod",
    zona_z,buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,;
k2; kp,"( litigio=? or litigio=? or litigio=? ) and fecha=? 
    and clientes <> 0 and diasmor <> 0
    order by cod",
    buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,;

f3; M
	de00a30_maifm  d,
	de31a60_maifm  d,
	de61a99_maifm  d,
	clientes_maifm  d,
	diasmor_maifm  d,
	docvenc_maifm  d,;
	 * 11 columns (size for buffer = 44)*
k0; ot,"infmor",;
k1; kq,"select sum(de00a30),sum(de31a60),sum(de61a99),sum(clientes),
    sum(diasmor),sum(docvenc)
    from infmor where zona=? and ( litigio=? or litigio=? or litigio=? ) 
    and fecha=?",
    zona_z,buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecma_z,#,3,;
k2; kq,"select sum(de00a30),sum(de31a60),sum(de61a99),sum(clientes),
    sum(diasmor),sum(docvenc)
    from infmor where ( litigio=? or litigio=? or litigio=? ) and fecha=?",
    buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecma_z,#,3,;

f4; M
	de00a30_2maifm  d,
	de31a60_2maifm  d,
	de61a99_2maifm  d,
	clientes_2maifm  d,
	diasmor_2maifm  d,
	docvenc_2maifm  d,;
	 * 11 columns (size for buffer = 44)*
k0; ot,"infmor",;
k1; kq,"select sum(de00a30),sum(de31a60),sum(de61a99),sum(clientes),
    sum(diasmor),sum(docvenc)
    from infmor where zona=? and ( litigio=? or litigio=? or litigio=? ) 
    and fecha=?",
    zona_z,buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecm2_z,#,3,;
k2; kq,"select sum(de00a30),sum(de31a60),sum(de61a99),sum(clientes),
    sum(diasmor),sum(docvenc)
    from infmor where ( litigio=? or litigio=? or litigio=? ) and fecha=?",
    buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecm2_z,#,3,;

f5; M
	de00a30_3maifm  	d,
	de31a60_3maifm  	d,
	de61a99_3maifm  	d,
	clientes_3maifm  	d,
	diasmor_3maifm  	d,
	docvenc_3maifm  	d,
	saldo_3maifm		d,
	tam_3maifm		s0,;
	 * 11 columns (size for buffer = 44)*
k0; ot,"infmor",;
k1; kq,"select sum(de00a30),sum(de31a60),sum(de61a99),sum(clientes),
    sum(diasmor),sum(docvenc), sum(docvenc)
    from infmor where zona=? and ( litigio=? or litigio=? or litigio=? ) 
    and fecha=?",
    zona_z,buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,;
k2; kq,"select sum(de00a30),sum(de31a60),sum(de61a99),sum(clientes),
    sum(diasmor),sum(docvenc), sum(docvenc)
    from infmor where ( litigio=? or litigio=? or litigio=? ) and fecha=?",
    buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,;
k3; kq,"select sum(de00a30),sum(de31a60),sum(de61a99),sum(clientes),
    sum(diasmor),sum(docvenc), sum(docvenc)
    from infmor where zona=? and cod=? and 
    ( litigio=? or litigio=? or litigio=? ) and fecha=?",
    zona_z,cod_z,buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,;
k4; kq,"select sum(de00a30),sum(de31a60),sum(de61a99),sum(clientes),
    sum(diasmor),sum(docvenc), sum(docvenc)
    from infmor where zona=? and ( litigio=? or litigio=? or litigio=? ) 
    and fecha=?",
    cod_z,buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,;
k5; kq,"select sum(impa1 + impa2 + impa3), sum(impa1), sum(impa2), 
	sum(impa3), sum(impa1), sum(impa1), sum(saldo)
        from infmorpo where ( litigio=? or litigio=? or litigio=? ) 
        and fecha = ? and poblac = ? and ubiage = 'CA'",
        buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,poblac_z,#,1,;
k6; kq,"select sum(impa1 + impa2 + impa3), sum(impa1), sum(impa2), 
	sum(impa3), sum(impa1), sum(impa1), sum(saldo)
        from infmorpo where ( litigio=? or litigio=? or litigio=? ) 
        and fecha = ? and poblac = ? and ubiage <> 'CA'",
        buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,poblac_z,#,1,;


f6; M
	zona_ind1		i,
	tam_ind1		s0,;

k0; ot,"infmor",;
k1; kq,"select unique zona from infmor where fecha=? or fecha=? or fecha=?
    and ( litigio=? or litigio=? or litigio=? ) order by zona",
    fecort_z,#,3,fecma_z,#,3,fecm2_z,#,3,
    buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,;

f7; M
	nomzona_ind6		s31,
	tam_ind6		s0,;
k0; ot,"repmors",;
k1; kq,"select zona from repmors where numzon=?",cod_z,;
k2; kq,"select nombre from tiendas where codigo=?",tda_z,#,1,;
k3; kq,"select nombre from zonas where zona=?",zonacar_z,#,1,;

f8; #itiendas.i;
k0; ot,"tiendas",;
k1; kp,"codigo=?",tda_z,#,1,;

f9; M
        zona_ind5		i,
	cod_ind5		i,
	cuantos_ind5		l,
	tam_ind5		s0,;
k0; ot,"infmor",;
k1; kq,"select convert_smallint(b.kilom),cod,count(*) 
    from infmor a join car_rutamortmp b on a.cod = b.idpoblac
    where a.zona=? and ( litigio=? or litigio=? or litigio=? ) and fecha=?
    and clientes <> 0 and diasmor <> 0 and b.idruta=?
    group by b.kilom,cod",
    zona_z,buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,idruta_z,;
k2; kq,"select zona,zona,count(*) from infmor
    where ( litigio=? or litigio=? or litigio=? ) and fecha=?
    and clientes <> 0 and diasmor <> 0 
    group by zona,zona",
    buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,;
k4; kq,"delete from car_rutamortmp where idruta=?",idruta_z,;
k5; kq,"select zona,cod,count(*) from infmor
    where zona=? and ( litigio=? or litigio=? or litigio=? ) and fecha=?
    and clientes <> 0 and diasmor <> 0 
    group by zona,cod",
    zona_z,buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,;
 

f10; M
	poblac_ind10			s26,
	impa1_ind10			d,
	impa2_ind10			d,
	impa3_ind10			d,
	saldo_ind10			d,
        tam_ind10			s0,;
k0; ot,"infmorpo",;
k1; kq,"select poblac, sum(impa1) as a1, sum(impa2) as a2, sum(impa3) as a3, 
	sum(impa1 + impa2 + impa3) as tot, sum(saldo)
        from infmorpo where ( litigio=? or litigio=? or litigio=? ) 
        and fecha = ? group by poblac",
        buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecort_z,#,3,;
k2; kq,"insert into car_rutamortmp (iddesruta,idruta,idpoblac,kilom,cia)
    values (?,?,?,?,?)",
    iddesruta_z,idruta_z,inttda_z,intzona_z,cia_z,;

f11; M
	de00a30_anuant  d,
	de31a60_anuant  d,
	de61a99_anuant  d,
	clientes_anuant  d,
	diasmor_anuant  d,
	docvenc_anuant  d,;
	 * 11 columns (size for buffer = 44)*
k0; ot,"infmor",;
k1; kq,"select sum(de00a30),sum(de31a60),sum(de61a99),sum(clientes),
    sum(diasmor),sum(docvenc)
    from infmor where zona=? and ( litigio=? or litigio=? or litigio=? ) 
    and fecha=?",
    zona_z,buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecanuant_z,#,3,;
k2; kq,"select sum(de00a30),sum(de31a60),sum(de61a99),sum(clientes),
    sum(diasmor),sum(docvenc)
    from infmor where ( litigio=? or litigio=? or litigio=? ) and fecha=?",
    buslit1_z,#,1,buslit2_z,#,1,buslit3_z,#,1,fecanuant_z,#,3,;

f12; M
    ultimo_ind11		l,
    tam_ind11			s0,;
k0; ot,"car_rutamortmp",;
k1; kq,"select max(iddesruta) from car_rutamortmp where iddesruta > 0",;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;
#i/programas/lib/fechas.i;

[PAN;
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro; GST; tf; #iprog1.i;
^=direc_z,#); z0,modul_z,#;
q+,"Informe Morosos",; (modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[NOREP; z0,descri_rpm,0; (descri_rpm)=($INEXISTENTE,11); R;
[NOTDA; z0,nomzona_ind6,0; (nomzona_ind6)=($INEXISTENTE,11); R;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
