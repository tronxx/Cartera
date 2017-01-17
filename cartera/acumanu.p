* Programa genera reporte de resultados sobre ventas a precio de lista s/iva
  DRBR 16-Mar-1993
  ---------------------------------------------------------------------
  Modificado para que tome las fechas de acumulados del acumulao
  DRBR 14-Ago-1993
  ---------------------------------------------------------------------
  Modificado para que imprima los lugares que ocupan en ventas
  DRBR 26-Abr-1994
  ---------------------------------------------------------------------
  Ahora es un programa de Linux con todas sus consecuencias
  DRBR 16-Feb-1998
*

#dMDS10 %,10.2f~; #dMDSF %5.1f~; #dMDS14 %,14.2f~; #dMIS2 %2d~; #dMDS12 %,12.2f~;
#dMDS11 %,11.1f~;


f0; M
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
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
	bandimp_z		s1,
	mibd_z			s80,
	
	ter_z            s2,
	antzon_z         s3,
	antda_z          s4,
	antnom_z        s16,
	fech8_z           D,
	fech9_z     {
	  dias_z        s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
	fecha_z           D,
	fechb_z           D,
	fechc_z				D,
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
	mesini_z	{
	  mesiniaa_z			i,
	  mesinimm_z			i,
	  mesinidd_z			i,
	  		}
	mesfin_z	{
	  mesfinaa_z			i,
	  mesfinmm_z			i,
	  mesfindd_z			i,
	  		}
	fecpuen_z	{
	  fecpuenaa_z			i,
	  fecpuenmm_z			i,
	  fecpuendd_z			i,
	  		}
	ploc_z				s2,
	prmes_z				i,
	ulmes_z				i,
	subzona_z			s4,
        voc_z				s2,
	
	muybru_z          d,
	subtvta_z         d,
	subtcan_z         d,
	subtfon_z         d,
	vtabru_z          d,
	vtafon_z          d,
	tothor_z          d,
	cancel_z          d,
	vtanet_z          d,
	vtabruz_z         d,
	vtafonz_z         d,
	cancelz_z         d,
	vtanetz_z         d,
	vtabrut_z         d,
	vtafont_z         d,
	cancelt_z         d,
	vtanett_z         d,
	porc1_z           d,
	porc2_z           d,
	porc3_z           d,
	porc4_z           d,
	porc5_z           d,
	peor_z           s2,
	posicion_z        i,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;
mtam0&; tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; ts0;
(impre_z)=(1); GPAN; GABRE_TABLA; (arch_z)=($vtaneta0.tex,12);

[fei; t@5,3; \Teclee la Fecha Inicial : \; t0Fin; &a; &cfecha_z;
ifecha_z,+10; !(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
[feu; t@6,3; \Teclee la Fecha Final   : \; t0fei; (fechb_z)=(fecha_z);
ifechb_z,+10; !(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
[loc; t@7,3; \Reporte de Precio `L`ista o `C`redito ? <L/C> :\; iploc_z,1;
!(ploc_z)5($L,1)(ploc_z)5($C,1)&>loc;
GST; \Estan correctos los datos ? <S/N> : \; y|; | gfeu; .
GST; \Primero se Recorren las Tiendas para determinar el total ...\;
tS1,10,0,10,80; tv0; tc;
f4; k3; P$; f3; k2; P$;
f3; k1; P;
{ n+;
  Ff1; \Leyendo : \; pzona_ind1,0; s1; psubzona_ind1,0; s1; pvoc_ind1,0; s1;
  z0,fecini_tmpztd,l;
  (prmes_z)=(fecinimm_z); (ulmes_z)=(fecultmm_z); (voc_z)=(voc_ind1,#);
  (antzon_z)=(zona_ind1,#); (subzona_z)=(subzona_ind1,#);
  (mesini_z)=(fecini_z,#); (mesinidd_z)=(1);
  { !(prmes_z)1(ulmes_z)>+;
    (mesfin_z)=(mesini_z,#);
    (mesfindd_z)=(28); qD,1,mesfin_z,fechc_z,;
    {
      (fechc_z)=(fechc_z)(86400)+; qD,2,fecpuen_z,fechc_z,;
      Ff1; pfecpuenaa_z,MIS2; \-\; pfecpuenmm_z,MIS2; \-\; pfecpuendd_z,MIS2; \:\;
      !(fecpuenmm_z)5(mesfinmm_z)>+; (mesfindd_z)=(fecpuendd_z);
    )
    Ff1; pmesiniaa_z,MIS2; \-\; pmesinimm_z,MIS2; \-\; pmesinidd_z,MIS2; \:\;
    pmesfinaa_z,MIS2; \-\; pmesfinmm_z,MIS2; \-\; pmesfindd_z,MIS2; l;
    z0,fecini_ztd,l; f2; k1; P; n|;.
    (vtafon_tmpztd)=(vtafon_tmpztd)(vtafon_ztd)+;
    (vtaprcon_tmpztd)=(vtaprcon_tmpztd)(vtaprcon_ztd)+;
    (vtaprcrd_tmpztd)=(vtaprcrd_tmpztd)(vtaprcrd_ztd)+;
    (porcen2_tmpztd)=(porcen2_tmpztd)(porcen2_ztd)+;
    (totno_tmpztd)=(totno_tmpztd)(totno_ztd)+;
    (totsi_tmpztd)=(totsi_tmpztd)(totsi_ztd)+;
    (contado_tmpztd)=(contado_tmpztd)(contado_ztd)+;
    (contcom_tmpztd)=(contcom_tmpztd)(contcom_ztd)+;
    (meses05_tmpztd)=(meses05_tmpztd)(meses05_ztd)+;
    (meses06_tmpztd)=(meses06_tmpztd)(meses06_ztd)+;
    (meses08_tmpztd)=(meses08_tmpztd)(meses08_ztd)+;
    (meses10_tmpztd)=(meses10_tmpztd)(meses10_ztd)+;
    (meses13_tmpztd)=(meses13_tmpztd)(meses13_ztd)+;
    (clienpc_tmpztd)=(clienpc_tmpztd)(clienpc_ztd)+;
    (clienar_tmpztd)=(clienar_tmpztd)(clienar_ztd)+;
    (cliencr_tmpztd)=(cliencr_tmpztd)(cliencr_ztd)+;
    (credsi_tmpztd)=(credsi_tmpztd) (credsi_ztd)+;
    (credno_tmpztd)=(credno_tmpztd)(credno_ztd)+;
    (costovtas_tmpztd)=(costovtas_tmpztd)(costovtas_ztd)+;
    (comision_tmpztd)=(comision_tmpztd)(comision_ztd)+;
    (servic_tmpztd)=(servic_tmpztd)(servic_ztd)+;
    (engctopl_tmpztd)=(engctopl_tmpztd)(engctopl_ztd)+;
    (englarpl_tmpztd)=(englarpl_tmpztd)(englarpl_ztd)+;
    (engctoplsi_tmpztd)=(engctoplsi_tmpztd)(engctoplsi_ztd)+;
    (engctoplno_tmpztd)=(engctoplno_tmpztd)(engctoplno_ztd)+;
    (englarplsi_tmpztd)=(englarplsi_tmpztd)(englarplsi_ztd)+;
    (englarplno_tmpztd)=(englarplno_tmpztd)(englarplno_ztd)+;
    (contadosi_tmpztd)=(contadosi_tmpztd)(contadosi_ztd)+;
    (contadono_tmpztd)=(contadono_tmpztd)(contadono_ztd)+;
    (credprcrdsi_tmpztd)=(credprcrdsi_tmpztd)(credprcrdsi_ztd)+;
    (credprcrdno_tmpztd)=(credprcrdno_tmpztd)(credprcrdno_ztd)+;
    (vtacrdlplsi_tmpztd)=(vtacrdlplsi_tmpztd)(vtacrdlplsi_ztd)+;
    (vtacrdcplsi_tmpztd)=(vtacrdcplsi_tmpztd)(vtacrdcplsi_ztd)+;
    (vtacrdlplno_tmpztd)=(vtacrdlplno_tmpztd)(vtacrdlplno_ztd)+;
    (vtacrdcplno_tmpztd)=(vtacrdcplno_tmpztd)(vtacrdcplno_ztd)+;
    (dosporfon_tmpztd)=(dosporfon_tmpztd)(dosporfon_ztd)+;
    (comfon_tmpztd)=(comfon_tmpztd)(comfon_ztd)+;
    (mesini_z)=(fecpuen_z,#);
    (prmes_z)=(prmes_z)(1)+;
  )
  (fecini_tmpztd)=(fecini_z,#); (fecfin_tmpztd)=(fecult_z,#);
  (zona_tmpztd)=(antzon_z,#); (subzona_tmpztd)=(subzona_z,#);
  (lotf_tmpztd)=(ploc_z,#); (voc_tmpztd)=(voc_z,#);
  (nombre_tmpztd)=(nombre_ztd,#);
  Ff1; \Ahora los Grabo:\; pnombre_ztd,0; l;
  f4; k2; P$;
  f3; a;
)
f2; k2; P$;
gFin;

[Enc;
tc; Ff3; FT; FGNodatos; Ff4; GFONT14; Fc80,3; l; Ff3; FGNodatos; Ff4;
GFONT13; \vtanetanu \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1;
phora_z,#; s1; FW3; l;
GFONT15; Fc40,\INFORME DIRECCION~; GFONT16; l;
GFONT15; s4; \VENTAS DEL \; pfecha_z,+8; \ AL \; pfechb_z,+8; GFONT16; l;
GFONT15; Fc40,\INFORME DE VENTAS~; GFONT16; l;
GFONT15; Fc30,\ACUMULADOS EN PRECIO ~;
!(ploc_z)0($L,1)>|; \ LISTA \; | \CREDITO\; . GFONT16; l;
GFONT17; \RESULTADOS S/VENTAS PRECIO LISTA S/IVA\; GFONT18; GFONT12; l; l;
GSUBENC;
Ft;

[Pie; Fe;

[SUBENC;
f1; k1; P; n|; GNOZONA; .
tc; Ff4; GFONT15; s8; pantzon_z,#; s1; pnombre_zon,#; GFONT16; l;
\                    Vtas Brutas   %   Vtas Brutas   %    Total Vtas Cancelacio- Total Vtas\; l;
\                      Menudeo           FONACOT            Brutas   nes           Netas\; l; l;
*12-123456789012345 12345678901 12345 12345678901 12345 12345678901 12345678901 12345678901*
R;

[IMPRI; R;

[SUBTZON;
(vtanetz_z)=(vtabruz_z)(vtafonz_z)+(cancelz_z)-;
z0,porc1_z,#; z0,porc2_z,#; z0,porc3_z,#; z0,porc4_z,#; z0,porc5_z,#;
(tothor_z)=(vtabruz_z)(vtafonz_z)+;
!(tothor_z)5($0)>|;
  (porc2_z)=(vtafonz_z)(tothor_z)/(100)*;
  (porc3_z)=(vtabruz_z)(tothor_z)/(100)*;
.
tc; Ff4; s20; c-11; s1; c-5; s1; c-11; s1; c-5; s1; c-11; s1; c-11; s1; c-11; l;
s20; pvtabruz_z,MDS11; s1; pporc3_z,MDSF; s1; pvtafonz_z,MDS11; s1;
pporc2_z,MDSF; s1; ptothor_z,MDS11; s1; pcancelz_z,MDS11; s1;
pvtanetz_z,MDS11; l; l;
(subtvta_z)=(subtvta_z)(vtabruz_z)+; (subtcan_z)=(subtcan_z)(cancelz_z)+;
(subtfon_z)=(subtfon_z)(vtafonz_z)+;
z0,vtabruz_z,#; z0,cancelz_z,#; z0,vtafonz_z,#;
R;

[SUBTVTA;
z0,porc2_z,#; z0,porc3_z,#; z0,porc4_z,#; z0,porc5_z,#;
(vtanetz_z)=(subtvta_z)(subtfon_z)+(subtcan_z)-;
(tothor_z)=(subtvta_z)(subtfon_z)+;
!(tothor_z)5($0)>|;
  (porc2_z)=(subtvta_z)(tothor_z)/(100)*;
  (porc3_z)=(subtfon_z)(tothor_z)/(100)*;
.
tc; Ff4; s20; c-11; s1; c-5; s1; c-11; s1; c-5; s1; c-11; s1; c-11; s1; c-11; l;
Ff4; GFONT17; \    SUB TOTAL       \; psubtvta_z,MDS11; s1; pporc2_z,MDSF; s1;
psubtfon_z,MDS11; s1; pporc3_z,MDSF; s1; ptothor_z,MDS11; s1; psubtcan_z,MDS11;
s1; pvtanetz_z,MDS11; GFONT18; l;
R;

[ULIN;
z0,porc2_z,#; z0,porc3_z,#; z0,porc4_z,#; z0,porc5_z,#;
(tothor_z)=(vtabru_z)(vtafon_z)+;
!(tothor_z)5($0)>|;
  (porc2_z)=(vtabru_z)(tothor_z)/(100)*;
  (porc3_z)=(vtafon_z)(tothor_z)/(100)*;
.
tc; Ff4; GFONT17; \    GRAN TOTAL      \; pvtabru_z,MDS11; s1; pporc2_z,MDSF; s1;
pvtafon_z,MDS11; s1; pporc3_z,MDSF; s1; pmuybru_z,MDS11; s1; pcancel_z,MDS11;
s1; pvtanet_z,MDS11; GFONT18; l;
R;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;
#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1; 
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #izonas.i;
k0; ot,"zonas",;
k1; kp,"zona=?",antzon_z,#,1,;

f2; #izontda.i;
k0; ot,"zontda",;
k1; kp,"fecini=? and fecfin=? and lotf=? and zona=? and subzona=? and voc=?",
    mesini_z,#,3,mesfin_z,#,3,ploc_z,#,1,antzon_z,#,1,
    subzona_z,#,1,voc_z,#,1,;
k2; kq,"insert into zontda (fecini,fecfin,lotf,zona,subzona,voc,nombre,
	vtafon,vtaprcon,vtaprcrd,porcen2,totno,totsi,contado,contcom,
        meses05,meses06,meses08,meses10,meses13,clienpc,clienar,cliencr,
        credsi,credno,costovtas,comision,servic,ranking,peor,engctopl,
        englarpl,engctoplsi,engctoplno,englarplsi,englarplno,contadosi,
        contadono,credprcrdsi,credprcrdno,vtacrdlplsi,vtacrdcplsi,
        vtacrdlplno,vtacrdcplno,dosporfon,comfon)
        select fecini,fecfin,lotf,zona,subzona,voc,nombre,
	vtafon,vtaprcon,vtaprcrd,porcen2,totno,totsi,contado,contcom,
        meses05,meses06,meses08,meses10,meses13,clienpc,clienar,cliencr,
        credsi,credno,costovtas,comision,servic,ranking,peor,engctopl,
        englarpl,engctoplsi,engctoplno,englarplsi,englarplno,contadosi,
        contadono,credprcrdsi,credprcrdno,vtacrdlplsi,vtacrdcplsi,
        vtacrdlplno,vtacrdcplno,dosporfon,comfon from zontdatmp",;

f3; M
	zona_ind1		s3,
	subzona_ind1		s4,
        voc_ind1		s2,;
k0; ot,"zontda",;
k1; kq,"select unique zona,subzona,voc from zontda where lotf=?
	and fecini between ? and ?
	order by zona,subzona",ploc_z,#,1,fecini_z,#,3,fecult_z,#,3,;
k2; kq,"delete from zontda where fecini=? and fecfin=? and lotf=?",
	fecini_z,#,3,fecult_z,#,3,ploc_z,#,1,;

f4; #izontdatmp.i;
k0; ot,"zontdatmp",;
k1; kp,"fecini=? and fecfin=? and lotf=? and zona=? and subzona=? and voc=?",
	fecini_z,#,3,fecult_z,#,3,ploc_z,#,1,antzon_z,#,1,subzona_z,#,1,
        voc_z,#,1,;
k2; kq,"insert into zontdatmp (fecini,fecfin,lotf,zona,subzona,voc,nombre,
	vtafon,vtaprcon,vtaprcrd,porcen2,totno,totsi,contado,contcom,
        meses05,meses06,meses08,meses10,meses13,clienpc,clienar,cliencr,
        credsi,credno,costovtas,comision,servic,ranking,peor,engctopl,
        englarpl,engctoplsi,engctoplno,englarplsi,englarplno,contadosi,
        contadono,credprcrdsi,credprcrdno,vtacrdlplsi,vtacrdcplsi,
        vtacrdlplno,vtacrdcplno,dosporfon,comfon)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,
        ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        fecini_tmpztd,#,3,fecfin_tmpztd,#,3,lotf_tmpztd,#,1,
        zona_tmpztd,#,1,subzona_tmpztd,#,1,voc_tmpztd,#,1,
        nombre_tmpztd,#,1,vtafon_tmpztd,vtaprcon_tmpztd,vtaprcrd_tmpztd,
        porcen2_tmpztd,totno_tmpztd,totsi_tmpztd,contado_tmpztd,
        contcom_tmpztd,meses05_tmpztd,meses06_tmpztd,meses08_tmpztd,
        meses10_tmpztd,meses13_tmpztd,clienpc_tmpztd,clienar_tmpztd,
        cliencr_tmpztd,credsi_tmpztd,credno_tmpztd,costovtas_tmpztd,
        comision_tmpztd,servic_tmpztd,ranking_tmpztd,peor_tmpztd,#,1,
        engctopl_tmpztd,englarpl_tmpztd,engctoplsi_tmpztd,
        engctoplno_tmpztd,englarplsi_tmpztd,englarplno_tmpztd,
        contadosi_tmpztd,contadono_tmpztd,credprcrdsi_tmpztd,
        credprcrdno_tmpztd,vtacrdlplsi_tmpztd,vtacrdcplsi_tmpztd,
        vtacrdlplno_tmpztd,vtacrdcplno_tmpztd,dosporfon_tmpztd,
        comfon_tmpztd,;
k3; kq,"delete from zontdatmp where fecini=? and fecfin=? and lotf=?",
	fecini_z,#,3,fecult_z,#,3,ploc_z,#,1,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

[PAN; 
Ff1; GST; tf; tn;
ta0; #iprog1.i; ^=direc_z,#); Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
(esp_z)=(80)(exten_z)-(2)/; Ff1; t@1,esp_z; pnemp_z,0; t@2,2; \vtaneta\;
Fslexten_z,modul_z; (esp_z)=(79)(exten_z)-; t@0,esp_z; pmodul_z,0; ta0; tp;
Fslexten_z,modul2_z; (esp_z)=(78)(exten_z)-; t@1,esp_z; pmodul2_z,0;
R;

[R; R; [E; ];
[ST; t@21,1; ta0; s78; t@21,1; ta1; ta=; ta0; tp; R;
[NOZONA; (nombre_zon)=($INEXISTENTE    ,15); R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };

