* Programa que sirve para generar el reporte de Servicio
  DRBR 29-Oct-1993
*

#dMLS5 %5ld~; #dMLS3 %3ld~; #dMLS6 %6ld~; #dMIS4 %4d~; #dMFS7 %7.1f~; #dMFS5 %5.1f~;
#dMIE2 %-2d~; #dMIS2 %2d~;

f0; M
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
	priubi_z		i,
	ultubi_z		i,
	impre_z			i,
	totdias_z		i,
	diamay_z		i,
	diamen_z		i,
	resuel_z		i,
	visitad_z		i,
	solxent_z		i,
	font_z			i,
	carac_z			i,
	promed_z		d,
	tres_z			i,
	media_z			d,
	media2_z		d,
	tres2_z			i,
	micar_z			s3,
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	bandimp_z		s2,
	ter_z            s2,
	fech9_z     {
	  dias_z        s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
	fech8_z           D,
	fecha_z           D,
	fechb_z           D,
	enc_z			s2,
	fechc_z			D,
	fechd_z			D,
        taller_z		s4,
	tipo_z			s2,
	band_z			s2,
	linea_z			s5,
	ubica_z			i,
	reporte_z		l,
	tothor_z		i,
	nelem_z			i,
	misrep_z		l,
	mibd_z			s80,
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
	diasdif_z         l,
	fech1_z          s9,
	fech2_z          s9,
	fech3_z          s9,
	fech4_z		s9,
	tran_z           s2,
	antip_z          s2,
	nomcli_z    {
	  nombre_z      s34,
	  sino_z         s1,
	            }
	dias2_z           l,
	tpr_z			s2,
	nrep1_z           l,
	nrep_z            l,
	entaller_z        l,
	altaller_z        l,
	sinaccion_z       l,
	total_z           l,
	prirep_z          l,
	ultrep_z          l,
	tran15d_z         l,
	tran16d_z         l,
	entalm_z          l,
	entcli_z          l,
	resalm_z          l,
	rescli_z          l,
	res15d_z          l,
	res16d_z          l,
	tranalm_z         l,
	trancli_z         l,
	trans15d_z        l,
	trans16d_z        l,
	entranalm_z       l,
	entrancli_z       l,
	solsdev_z         l,
	repvisi_z         l,
	totrepen_z		l,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;
mtam0&; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr;
(impre_z)=(1); GPAN; (arch_z)=($represue.tex,12);

[feu; t@5,40; \Fecha Corte: \; t0Fin; &a; &cfechb_z; ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,; &bfechb_z; &p4fech2_z;
[ubi; t@6,3; \Ubicacion:\; t@6,20; t0feu; iubica_z,MIE2,MIS2;
t@7,3; \Reportes En Taller `M`as 15 dias:\;
GST; \Estan Correctos los Datos ? <S/N> : \; y|; | gubi; .
GABRE_TABLA;

tS1,7,0,12,80; tc;
(tipo_z)=($0,1); f2; k2; P$; f1; k2; P;
{ n+;
  Ff1; \Leyendo : \; pnumero_rep,MLS6; s1; pcodcli_rep,0; l;
  qD,1,fectal_rep,fechc_z,;
  (dias2_z)=(fechb_z)(fechc_z)-(86400)/(1)+; (tipo_z)=($4,1);
  !(dias2_z)2($16)>|; f1; a; g-; .
  GAGREGAENIND;
  f1; a;
)
GREPOR;
gFin;


[AGREGAENIND;
* --> Tipo 0 son los reportes Resueltos  <---- *
z0,tipo_indrep,l; (tipo_indrep)=(tipo_z,#); (numrep_indrep)=(numero_rep);
(ubica_indrep)=(ubica_rep); (linea_indrep)=(linea_rep,#);
(diasres_indrep)=(dias2_z);
f2; QNOPDAGF2; k3; P$;
R;

[NOPDAGF2; GST; `7; \No pude agregar registro en indrep...\; Z2; R;

[REPOR;
GANALITICO;
Ff4; FC; Ff1; tf; tr; tS0;
gSalir;
R;

[INFORME; R;

[Enc;
Ff3; FT; FGNodatos; Ff4; GFONT14; GFONT11; Fc80,3; l; Ff3; FGNodatos; Ff4; 
GFONT13; \repentall \; GFONT14; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1;
phora_z,#; s1; FW3; l; GFONT12;
\Listado de Reportes En Taller con mas de 15 Dias Al \; pfechb_z,+10;
GFONT17; GFONT18; \ Pag: \; Fp%d~; GFONT12; l;
!(enc_z)0($1,1)>|; GSUBENC;  .
(band_z)=($S,1);
Ft;

[Pie; Fe;

[ANALITICO;
(enc_z)=($1,1);
f2; k1; P;
{ n+;
  Ff1; \Leyendo : \; ptipo_indrep,0; s1; pnumrep_indrep,MLS6; l;
  !(tipo_indrep)5(antip_z,#)>|;
    !(band_z)5($S,1)>|;
      (antip_z)=(tipo_indrep,#); (linea_z)=(linea_indrep,#);
      Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
    |
      GSUBTLIN; GSUBTIP; l; (linea_z)=(linea_indrep,#); (antip_z)=(tipo_indrep,#);
      GSUBENC;
    .
  .
  !(linea_indrep)5(linea_z,#)>|; GSUBTLIN; (linea_z)=(linea_indrep,#); GSUBENCLIN; .
  (ubica_z)=(ubica_indrep); (reporte_z)=(numrep_indrep);
  f1; k1; P; n|; | GIMPRI; .
  f2; a;
)
GSUBTLIN; GSUBTIP; GULIN;
R;

[SUBENC;
Ff4; GFONT14; GFONT15; 
!(antip_z)0($0,1)>|; Fc40,\REPORTES RESUELTOS~; .
!(antip_z)0($1,1)>|; Fc40,\REPORTES SIN ACCION~; .
!(antip_z)0($2,1)>|; Fc40,\REPORTES VISITADOS~; .
!(antip_z)0($3,1)>|; Fc40,\REPORTES AL TALLER~; .
!(antip_z)0($4,1)>|; Fc40,\REPORTES EN TALLER~; .
!(antip_z)0($5,1)>|; Fc40,\REPORTES SOLUCIONADOS POR ENTREGAR~; .
GFONT16; GFONT13; l; GSUBENCLIN;
R;

[SUBENCLIN;
Ff4; l;
\Linea:\; GFONT15; plinea_z,0; s1; f3; k1; P; n|; GNOLIN; .
pdescri_lrep,0; GFONT16; l;
\Numero __Fecha_ ----------- Nombre  --------------- --------- Articulo \;
\----------- --------- Defecto -------------------- \;
!(antip_z)0($0,1)>|; \Solucion  Taller       Dias Rep \; .
!(antip_z)0($1,1)>|; \Poblacion ---------\; .
!(antip_z)0($2,1)>|; \Poblacion ---------\; .
!(antip_z)0($3,1)>|; \Recibido ----------\; .
!(antip_z)0($4,1)>|; \Al Taller -------    Dias Taller\; .
!(antip_z)0($5,1)>|; \Del Tal. Poblacion\; .

l;
R;

[IMPRI;
(nomcli_z)=(cliente_rep,#); qD,1,fecha_rep,fechc_z,;
Ff4; pnumero_rep,MLS5; s1; pfechc_z,+10; s1; pcodcli_rep,0; s1; pnombre_z,32; 
s1; partic_rep,31; s1; psintom1_rep,31; s1;
qD,1,fecha_rep,fechd_z,; (dias2_z)=(fechb_z)(fechd_z)-(86400)/(1)+;
!(antip_z)0($0,1)>|;
  qD,1,fecres_rep,fechc_z,;
  pfechc_z,+10; (dias2_z)=(fechc_z)(fechd_z)-(86400)/(1)+;
  z0,taller_ind4,l; f4; k1; P; n|;.
  s1; ptaller_ind4,3; s1; pnombre_ind4,10;
.
!(antip_z)0($1,1)>|; ppobla_rep,18; .
!(antip_z)0($2,1)>|; ppobla_rep,18; .
!(antip_z)0($5,1)>|;
  qD,1,fecdvt_rep,fechc_z,; pfechc_z,+10; s1; ppobla_rep,9;
.
!(antip_z)0($3,1)>|; qD,1,fecrec_rep,fechc_z,; pfechc_z,+10; .
!(antip_z)0($4,1)>|;
  qD,1,fectal_rep,fechc_z,; pfechc_z,+10;
  (dias2_z)=(fechb_z)(fechc_z)-(86400)/(1)+;
  (taller_z)=(talser_rep,#); z0,taller_ind4,l; f4; k1; P; n|;.
  s1; ptaller_ind4,3; s1; pnombre_ind4,10;
.
s1; pdias2_z,MLS3; l; (nrep_z)=(nrep_z)(1)+; (nrep1_z)=(nrep1_z)(1)+;
(misrep_z)=(misrep_z)(1)+;
R;

[SUBTLIN;
Ff4; l; \Numero de Reportes en esta Linea: \; pmisrep_z,MLS5; l; z0,misrep_z,#;
R;

[SUBTIP;
Ff4;    \Numero de Reportes       : \; pnrep1_z,MLS5; z0,nrep1_z,#; l;
R;

[ULIN;
Ff4; l; \Numero Total de Reportes : \; pnrep_z,MLS5; l;
R;

[MANDAELFNT; f13; k1; P; nR; GSACAF; R;
#isacaf.i;
#iimpri.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1; 
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #ireportes.i;
k0; ot,"reportes",;
k1; kp,"ubica=? and numero=?",ubica_z,reporte_z,;
k2; kp,"fecha < ?
	and (status='N' or (status='S' and fecres > ?))
        and taller='S' and fectal < ?
        and (devolt='N' or (devolt='S' and fecdvt > ?))
        and ubica=?",
        fecult_z,#,3,fecult_z,#,3,fecult_z,#,3,fecult_z,#,3,ubica_z,;
        
f2; #iindrep.i;
k0; ot,"indrep",;
k1; kp," tipo <> '' order by tipo,linea,ubica,diasres desc,numrep",;
k2; kq,"delete from indrep",;
k3; kq,"insert into indrep (tipo,ubica,numrep,linea,diasres)
	values (?,?,?,?,?)",
        tipo_indrep,#,1,ubica_indrep,numrep_indrep,linea_indrep,#,1,
        diasres_indrep,;

f3; #ilinrep.i;
k0; ot,"linrep",;
k1; kp,"numero=?",linea_z,#,1,;

f4; M
	taller_ind4		s4,
        nombre_ind4		s51,
        fecha_ind14 	{
          fechaaa_ind14		i,
          fechamm_ind14		i,
          fechadd_ind14		i,
        		}
        tam_ind14		s0,;
k0; ot,"renposer",;
k1; kq,"select atie2,nombre,fecha from renposer join tallser on atie2=clave
	where movto='T' and reporte=? and ubica=? and movto='T' order by fecha desc",
	reporte_z,ubica_z,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

[PAN; 
Ff1; GST; tf; tn;
ta0; #iprog1.i; ^=direc_z,#); Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
z0,modul_z,#; (modul_z)=($Listado Reportes Taller,23); (modul2_z)=($CAR-MDS,7);
(esp_z)=(80)(exten_z)-(2)/; Ff1; t@1,esp_z; pnemp_z,0;
Fslexten_z,modul_z; (esp_z)=(79)(exten_z)-; t@0,esp_z; pmodul_z,0; ta0; tp;
Fslexten_z,modul2_z; (esp_z)=(78)(exten_z)-; t@1,esp_z; pmodul2_z,0;
R;

[R; R; [E; ];
[ST; t@21,1; ta0; s78; t@21,1; ta1; ta=; ta0; tp; R;
[ERROR3; Ff1; GST; `7; \No pude agregar registro en "revrep.v" ...\; gFin1;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[NOLIN; z0,descri_lrep,#; (descri_lrep)=($INEXISTENTE,11); R;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

*   -->  Variables y Rutina para Reportes Multiples en variables   <--    *

[Fin1; y|;.
[Fin; t@23,0; te; };
