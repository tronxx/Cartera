* Programa que sirve para generar el reporte de Relacion de Articulos Cancelados
  DRBR 27-Ene-1998
*

#dMIS02 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFS2 %2.0f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~;  #dMLS4 %4ld~;  #dMFS5 %5.2f~; #dMDS9 %-9.2f~;
#dMIS4 %4d~;
#i/programas/lib/funkey.i;

f0; M
	sff_z			s2,
	maxrow_z		i,
        maxcol_z		i,
        renst_z			i,
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
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	            
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
        anu_z			i,
	codcan_z		d,
	codfac_z		d,
	imprec_z		d,
	impfac_z		d,
	totimp_z		d,
	totfac_z		d,
	adeud_z			d,
	totade_z		d,
	implis_z		d,
	pzopli_z		d,
	pzofac_z		d,
	pzoade_z		d,
	pzodoc_z		d,
	totpli_z		d,
	totdoc_z		d,
        html_z			s2,
        antipo_z		s5,
        
	antubi_z		s3,
	bandimp_z		s3,
	codcli_z		s11,
	antcod_z		s3,
	cod_z			s3,
	tda_z			s3,
	piva_z			d,
	fecha_z			D,
	fechb_z			D,
	fechc_z			D,
	fechd_z			D,
	feche_z			D,
	ltas_z			i,
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
	feccan_z	{
	  feccanaa_z		i,
	  feccanmm_z		i,
	  feccandd_z		i,
	  		}
        fecsig_z       {
          fecsigaa_z            i,
          fecsigmm_z            i,
          fecsigdd_z            i,
                        }
                        
	prubi_z			s3,
	ulubi_z			s3,

	fech8_z           	D,
	num_z			i,
	ctopl_z			d,
	larpl_z			d,
	meses_z			i,
	diaspla_z		f,
        idcli_z			l,
        antidcli_z		l,
        idfac_z			l,
	fech1_z			s8,
	fech2_z			s8,
        ii_z			i,
        iii_z			i,
	ind1_z            	i,
	ind2_z            	i,
	termi_z           	i,
	esp_z             	i,
	exten_z           	i,
	tam0             	s0,;

mtam0&; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
GPAN; GABRE_TABLA; z0,arch_z,#; (arch_z)=($incobxpo.tex,12); (impre_z)=(1);

&a; &cfeche_z; qD,2,fecsig_z,feche_z,; GPRIMERO_DE_MES_ANTER; 
qD,1,fecsig_z,fechd_z,; (tda_z)=($IN,2);

[fei; t@5,3; \Fecha Inicial :\; t0Fin; (fecha_z)=(fechd_z); ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
&bfecha_z; &p4fech2_z; z0,num_z,#;
(fecsig_z)=(fecini_z,#); GULTIMO_DE_MES; qD,1,fecsig_z,feche_z,;

[feu; t@6,3; \Fecha Final   :\; t0fei; (fechb_z)=(feche_z); ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
[pol; t@7,3; \Analitico de Poliza:\; itda_z,2; f2; k1; P;
n|; GST; `7; \Tienda Inexistente...\; Z1; gpol; . s1; pnombre_tda,0;
GST; \Estan correctos los datos ? <S/N> : \; y|; | gfei; .

tS1,0,0,23,80;
tv0; tc; 
f9; k1; P$; 
f5; k1; P;
{ n+;
  GACUMULA;
  f5; a;
)

Ff4; FO(arch_z),w~; FP66,60,Enc,Pie; (band_z)=($S,1);
f3; k1; P;
{ n+;
  Ff1; \Leyendo:\; pidcli_rpo,MLS6; s1; pnum_z,MIS4; l;
  GIMPRI;
  (antidcli_z)=(idcli_rpo);
  f3; a;
)
GULIN; Ff4; FC; Ff1; tr; tf; tS0; GSalir;
gFin;

[ACUMULA;
(idcli_z)=(idcli_ind6); f7; k1; P; nR;
Ff1; \Leyendo:\; pnumcli_cli,0; s1; pnombre_cli,0; l;
(feccan_z)=(fecha_ind6,#); z0,importe_mvc,#; f6; k1; P; n|;.
!(qom_cli)0($Q,1)>|; (diaspla_z)=(15.2); | (diaspla_z)=(30.4); .
qD,1,fechavta_cli,fechc_z,; qD,1,feccan_z,fechd_z,;
(ltas_z)=(fechd_z)(fechc_z)-(86400)/(diaspla_z)/;
!(ltas_z)1(nulet1_cli)>|; (ltas_z)=(nulet1_cli); .
!(ltas_z)2($0)>|; z0,ltas_z,#; .
(adeud_z)=(enganc_cli)(servic_cli)+(canle1_cli)(ltas_z)*+(importe_mvc)-;
(totimp_z)=(totimp_z)(importe_ind6)+;
(impfac_z)=(impfac_z)(cargos_cli)+;
(implis_z)=(implis_z)(precon_cli)+;
(totade_z)=(totade_z)(adeud_z)+;
(idfac_z)=(idfac_z)(1)+; 
z0,idfac_ind9,l; (idfac_ind9)=(idfac_z); (idcli_ind9)=(idcli_ind6);
(cargos_ind9)=(cargos_cli); (prelis_ind9)=(precon_cli);
(adeudo_ind9)=(adeud_z); (importe_ind9)=(importe_ind6); f9; k2; P$;
R;

[Enc;
Ff3; FT; FGNodatos; Ff4; GFONT11; Fc80,3; l; Ff3; FGNodatos; Ff4;
&a; &cfech8_z; &p3fech9_z; GFONT13; \incobxpob \; GFONT14; pfech8_z,+8; s1;
phora_z,#; s1; FW3; l; GFONT17;
\Clientes de :\; ptda_z,0; s1; pnombre_tda,0; \ Del \; pfecha_z,+10;
\ Al \; pfechb_z,+10; GFONT18; \ Pag:\; Fp%d~; l;
\__________________________\;
\____________________________________________________\; l;
\|  Poblacion              |\;
\  Importe   |  Adeudo    |Precio Lista|Tot.Facturcn|\; l;
\|_________________________|\;
\____________|____________|____________|____________|\; l;
Ft;

[Pie; Fe;

[IMPRI;
Ff4; \|\; ppoblac_ind5,25; \|\; 
pimpor_ind5,MDS12;  \|\; padeud_ind5,MDS12;  \|\; 
pprelis_ind5,MDS12; \|\; ptotfac_ind5,MDS12; \|\; l;
R;

[NOPDAGF8; GST; `7; \No pude agregar registro en edorescar...\; Z1; R;

[ULIN;
Ff4;
\|_________________________|\;
\____________|____________|____________|____________|\; l;
s20; \Total:|\; ptotimp_z,MDS12; \|\; ptotade_z,MDS12; \|\; 
pimplis_z,MDS12; \|\; pimpfac_z,MDS12; \|\; l;
s20; \      |____________|____________|____________|____________|\; l;
R;

[MANDAELFNT; f4; k1; P; nR; GSACAF; R;

#iimpri.i;
#isacaf.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #irenpol2.i;
k0; ot,"renpol2",;
k1; kp,"fecha between ?  and ? and impor <> 0 and tda=? order by fecha,idcli",
	fecini_z,#,3,fecult_z,#,3,tda_z,#,1,;

f2; #itiendas.i;
k0; ot,"tiendas",;
k1; kp,"codigo=?",tda_z,#,1,;

f3; M
        poblac_ind5		s26,
        impor_ind5		d,
        adeud_ind5		d,
        prelis_ind5		d,
        totfac_ind5		d,
        tam_ind5		s0,;
k0; ot,"cancel",;
k1; kq,"select poblac, sum(iva), sum(neto), sum(descu), sum(importe)
        from facturmentmp a 
        join clientes b on a.idcli = b.idcli
        group by poblac",;


f4; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;

f5; M
	idcli_ind6		l,
        fecha_ind6	{
          fechaaa_ind6		i,
          fechamm_ind6		i,
          fechadd_ind6		i,
        		}
        importe_ind6		d,
	tam_ind6		s0,;
k0; ot,"renpol2",;
k1; kq,"select idcli, fecha, sum(impor) from renpol2 
	where fecha between ?  and ? and impor <> 0 and tda=? 
        group by idcli, fecha",
	fecini_z,#,3,fecult_z,#,3,tda_z,#,1,;

f6; M
	importe_mvc		d,
	tam_mvc			s0,;
k0; ot,"mvcli2",;
k1; kq,"select sum(import) from mvcli2 where idcli=? and fechamov <?",
    idcli_z,feccan_z,#,3,;
    
f7; #iclientes.i;
k0; ot,"clientes",;
k1; kp,"idcli=?",idcli_z,;

f9; M
	idfac_ind9		l,
	idcli_ind9		l,
        cargos_ind9		d,
        prelis_ind9		d,
        adeudo_ind9		d,
        importe_ind9		d,
        tam_ind9		s0,;
k0; ot,"facturmentmp",;
k1; kq,"delete from facturmentmp",;
k2; kq,"insert into facturmentmp (idfac, idcli, importe, descu, neto, iva)
	values (?, ?, ?, ?, ?, ?)",
        idfac_ind9,idcli_ind9,cargos_ind9,prelis_ind9,adeudo_ind9,
        importe_ind9,;

R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;
#i/programas/lib/fechas.i;

[PAN;
Ff1; tf; tn; Gdefine_colores; Gamarillo_negro; Gtomamaxrc;
ta0; #iprog1.i; ^=direc_z,#); 
q+,modul_z,"Analitico Incobrables",; (modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;
[NOCOD; z0,nombre_tda,#; (nombre_tda)=($INEXISTENTE,11); R;

[Fin1; y|;.
[Fin; t@23,0; te; };
