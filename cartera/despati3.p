* Programa que sirve para Hacer el Despacho Fiscal
  DRBR 16-Feb-2010
  Modificado para seprar las ventas 2010 y posteriores
  DRBR 6-Dic-2007
  Modificado para separar las ventas de 2007 y anteriores y 2008 y posteriores
  DRBR 22-Dic-1992
  Modificado para hacer el despacho de los clientes que corresponda su codigo
  con el codigo de la tienda para separar el despacho de Ricardo Castro de el
  de Alfonso Castro.
  DRBR 01-Feb-1993
  ---------------------------------------------------------------------------
  Modificado para que automaticamente saque las polizas de los pesos nuevos
  y viejos y haga la otra poliza de los clientes de Ricardo Castro Pesos Nuevos
  y Pesos Viejos
  DRBR 22-May-1993
  ----------------------------------------------------------------------------
  Modificado para que solo tome como largo plazo los clientes con fecha de
  venta de agosto 1 o mas de 1993
  DRBR 13-Ago-1993
*

#i/programas/lib/funkey.i;
#dMIE %-2d~; #dMDS %,14.2f~; #dMDS10 %,10.2f~; #dMDS12 %,12.2f~;
#dMIS02 %02d~; #dMDS12a %-,12.2f~; #dMIS2 %2d~;  #dMLS10 %ld~; #dMDS2 %2.0f~;
#dMLS6 %6ld~;
#dMIS4 %04d~;

f0; M
        version_z	s20,
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
        maxcol_z		i,
        maxrow_z		i,
        renst_z			i,
        sff_z			s2,
        striva_z		s3,
        tdaex1_z		s3,
        tdaex2_z		s3,
	conanalisis_z           s2,
	codcli_z   {
	  tdacli_z       s2,
	  feccli_z   {
	    aacli_z      s2,
	    mmcli_z      s2,
	    ddcli_z      s2,
	             }
	  consec_z       s3,
	           }
	impre_z        	i,
	font_z         	i,
	micar_z		s3,
	carac_z		i,
	ter_z            s4,
	fechpol_z  {
	  fech_z         s6,
	  tien_z         s3,
	           }
	tda_z      {
	  tda1_z         s1,
	  tda2_z         s1,
	           }
	fech1_z         s26,
	mone_z           s3,
	col_z            s3,
	bandimp_z	s3,
	fech8_z           D,
	fech9_z     {
	  dias_z        s16,
	  hora_z         s5,
	  resto_z        s5,
	            }
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
        msg_z			s100,
	arch_z      {
	  nomar_z        s4,
	  nter_z         s4,
	  reser_z        s5,
	            }
	fecpol_z	{
	  fecpolaa_z		i,
	  fecpolmm_z		i,
	  fecpoldd_z		i,
	  		}
        strfecha_z		s20,
        idcli_z			l,
        nconcep_z		l,
        codcar_z		i,
        strcodcar_z		s3,
        nombrepol_z		s21,
        nclis_z			i,
	band_z           	s3,
	mibd_z			s80,
        enc_z			s80,
        tiplazo_z		s2,
	bandespa_z		i,
	totimp_z		d,
	milin_z			s100,
       
	piva_z           	d,
	bonif_z           	d,
	recar_z           	d,
	impor_z          	d,
        import_z		d,
        efectivo_z		d,
        totbonif_z		d,
        totrecar_z		d,
        totneto_z		d,
	neto_z            	d,
	impcp_z           	d,
	boncp_z           	d,
	reccp_z           	d,
	implp_z           	d,
	bonlp_z           	d,
	reclp_z           	d,
        facmcia_z		d,
        impmcia_z		d,
        boncorresp_z		d,
        impfint_z		d,
        netocia_z		d,
        totimpmcia_z		d,
        subtimpmcia_z		d,
        totimpfint_z		d,
        subtimpfint_z		d,
        totmcia_z		d,
        totfmto_z		d,
        totbcor_z		d,
        porc1_z			d,
	fecha_z           	D,
	anu_z			l,
        anuini_z		i,
        anufin_z		i,
        mesini_z		i,
        mesfin_z		i,
	ind1_z            	i,
	ind2_z            	i,
	ntda_z            	i,
	termi_z           	i,
	esp_z             	i,
	exten_z           	i,
	ii_z			i,
	tam0             	s0,;
mtam0&; 
q+,version_z,"V:2.04 EA",;
* ---> Control de Versiones -------------
  2.02 10-Oct-204 
  Se modificar para agregar un subtotal x Código de cartera del cliente
  2.03 15-Ene-2015
  Se modifica para que tenga un calculo de financiamiento diferente
  Cuando sea Saldo:
  ( ( nulet1 x ( canle1 - b.bonifi) ) - ( precon x (piva / 100 + 1) - enganc ) ) / nulet1
  Cuando sea Completo es el mismo dato anterior pero proporcional a las letras pagadas
  ( ( nulet1 x ( canle1 - b.bonifi) ) - ( precon x (piva / 100 + 1) - enganc ) ) / nulet1 x ( impor / canle1)
  2.04 27-Ene-2015
  Se modifica para que tenga un calculo de financiamiento diferente
  Cuando sea Saldo:
  ( ( nulet1 x ( canle1 - b.bonifi) ) - ( precon x (piva / 100 + 1) - enganc ) ) / nulet1
  Cuando sea Completo es el mismo dato anterior pero proporcional a las letras pagadas
  ( ( nulet1 x ( canle1 - b.bonifi) ) - ( precon x (piva / 100 + 1) - enganc ) ) / nulet1 x ( impor / canle1)

*
  
z0,nemp_z,#; Ff5; FO.impri.ini~,r~; FG|; | Fknemp_z,l; >sinemp_z,#,impre_z; . FC;
z0,nemp_z,#; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; ts0; tr;
(tdaex1_z)=($MZ,2); (tdaex2_z)=($MS,2);
GTOMA_PARAMETROS; GPAN; GABRE_TABLA; GKprog1;
(nomar_z)=($desp,4); (nter_z)=($0000,4); (reser_z)=($.tex,4);
GST; \Presione <F3> P/Definir Polizas que Excluyan Recargos, <F4> Para Ver\;
t@8,3; \Ex:R:\; ptdaex1_z,0; s1; ptdaex2_z,0;
[fec; t@5,3; \Teclee la Fecha : \; t0Fin; &a; &cfecha_z; ifecha_z,+10;
!(fecha_z)0($-1)>fec; qD,2,fecpol_z,fecha_z,;
[tda; t@6,3; \Teclee la Tienda : \; t0fec; itien_z,2;
f2; k1; P; n|; GST; `7; \Tienda Inexistente ... Intente de Nuevo ...\; gtda; .
(nombrepol_z)=(nombre_tda,#); s1; pnombrepol_z,#;
f3; k1; P; n|; GST; `7; \Poliza Inexistente:\; Z1; .
GST; \Estan Correctos los datos ? <S/N> : \; y|; | gtda; .

z0,strfecha_z,#; 
z0,fech1_z,#; >isfecpolaa_z,fech1_z,MIS4;  q+,strfecha_z,fech1_z,;
z0,fech1_z,#; >isfecpolmm_z,fech1_z,MIS02; q+,strfecha_z,fech1_z,;
z0,fech1_z,#; >isfecpoldd_z,fech1_z,MIS02; q+,strfecha_z,fech1_z,;
GST; \Fecha:\; pstrfecha_z,0; \: Tda1:\; ptdaex1_z,0; \: Tda2:\; ptdaex2_z,0; \:\; 
&bfecha_z; &p1fech_z; &p3fech1_z; 

tS1,0,0,23,80; tv0; tc;
GGENERADESPACHO;
Ff4; FC; Ff1; tr; tf; tS0; t0Fin;
GMANDA_IMP;
gFin;

[TOMA_PARAMETROS;
x crea_param.bat .despati2.ini ~;
Ff5; FO.despati2.ini~,r~; z0,tdaex1_z,#; z0,tdaex2_z,#;
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (tdaex1_z)=(milin_z,2);
FGlistos_parametros; z0,milin_z,#; Fkmilin_z,l; (tdaex2_z)=(milin_z,2);
[listos_parametros;
Ff5; FC; Ff1;
R;

[GRABA_PARAMETROS;
Ff5; FO.despati2.ini~,w~;
ptdaex1_z,0; l;
ptdaex2_z,0; l;
Ff5; FC; Ff1;
R;

[GENERADESPACHO;
f7; k1; P;
{ n+;
  (piva_z)=(piva_ind7); (tiplazo_z)=(tiplazo_ind7,#); (anu_z)=(anu_ind7);
  (codcar_z)=(tienda_ind7); >iscodcar_z,strcodcar_z,MIS02;
  Ff1; \Voy a Generar de :\; pcodcar_z,MIS02; s1; ppiva_z,MDS2; 
  \ Plazo:\; ptiplazo_z,0; 
  \ Anu:\; panu_z,MLS6; l;
  GIMPRI1;
  f7; a;
)
GSUBTOT2;
R;

[IMPRI1;
z0,nclis_z,#;
Ff1; \Voy a Ejecutar f4 k2 \; l;
f4; k2; P;
Ff1; \Ya ejecute f4 k2 \; l;
{ n+;
  (idcli_z)=(idcli_rpo);
  f1; k1; P; n|; (status_cli)=(sino_rpo,#); . (codcli_z)=(numcli_cli,#);
  Ff1; \Leyendo : \; pstatus_cli,0; s1; pidcli_cli,MLS10; s1; pnumcli_cli,0; 
  s1; pqom_cli,0; s1; pnulet1_cli,%2d~; l;
  !(status_cli)0($*,1)>|; GIMPRIMELOS; .
  f4; a;
)
!(nclis_z)1($0)>|; GSUBTOT; .
R;

[Enc;
Ff3; FT; FGNodatos; Ff4; GFONT14; GFONT12; Fc80,3; l; Ff3; FGNodatos; Ff4;
&a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1; phora_z,#; s1; FW3; l;
\Poliza de Cobranza de : \; GFONT17; ptien_z,0; s1; pnombrepol_z,0;
\ del Dia : \; pfech1_z,15; GFONT18; \ Pagina : \; Fp%d~; l; GSUBENC;
(band_z)=($S,1);
Ft;

[SUBENC;
Ff4;
f2; k2; P; n|;. 
z0,enc_z,#;
!(tiplazo_z)0($C,1)>|; q+,enc_z,"Corto Plazo ",; .
!(tiplazo_z)0($L,1)>|; q+,enc_z,"Largo Plazo ",; .
q+,enc_z,descri_ind7,;
>dspiva_z,striva_z,MDS2;
q+,enc_z," Iva al ",striva_z,"%",;
GFONT17; 
\Cartera:\; * pstrcodcar_z,0; s1; * pnombre_tda,0; s1;
penc_z,0; GFONT18; l; 
c_79; l;
GFONT19; GFONT13;
\N O M B R E                            |\;
\TM|\;
\  BONIFIC.|\;
\  RECARGOS|\;
\  Documentos|\;
\       SALDO|\;
\   Mercancia|\;
\Bonif.Corres|\;
GFONT20; l;
R;

[Pie; Fe;

[IMPRIMELOS;
!(band_z)5($S,1)>|; 
  Ff4; FO(arch_z),w~; FP66,60,Enc,Pie;
| 
  !(nclis_z)0($0)>|; Ff4; l; GSUBENC; .
.
(nclis_z)=(nclis_z)(1)+;
!(strfecha_z)3($20100301,8)(tipo_rpo)0($AR,2)&>|;
  !(tien_z)0(tdaex1_z,#)(tien_z)0(tdaex2_z,#)|>|; z0,rob_rpo,#; .
.
Ff4; 
pfeccli_z,6; \|\; (nconcep_z)=(concep_rpo);
z0,concepto_cpm,l; f5; k1; P; n|;.
pnombre_cli,16; \|\; 
pconcepto_cpm,15; \|\; 
ptipo_rpo,2; \|\;
(neto_z)=(neto_z)(impor_rpo)+;
!(tipo_rpo)0($AB,2)>|;
  prob_rpo,MDS10; \|\; s10; (bonif_z)=(bonif_z)(rob_rpo)+;
  (netocia_z)=(impor_rpo)(rob_rpo)-;
|
  s10; \|\; prob_rpo,MDS10; (recar_z)=(recar_z)(rob_rpo)+;
  (netocia_z)=(impor_rpo);
.
\|\; 
pimpor_rpo,MDS12; \|\; 
psalcli_rpo,MDS12; \|\;
z0,impfint_z,#;
!(ace_rpo)0($S,1)(ace_rpo)0($C,1)|>|;
  (impfint_z)=(canle1_cli)(bonifi_cli)-(nulet1_cli)*;
  (impfint_z)=(impfint_z)(precon_cli)(piva_cli)(100)/(1)+*(enganc_cli)--;
  (impfint_z)=(impfint_z)(nulet1_cli)/;
  (boncorresp_z)=(bonifi_cli);
  (ii_z)=(impor_rpo)(canle1_cli)/;
  (porc1_z)=(canle1_cli)(ii_z)*; 
  !(porc1_z)2(impor_rpo)>|; (ii_z)=(ii_z)(1)+; .
  (impfint_z)=(ii_z)(impfint_z)*; 
  (boncorresp_z)=(ii_z)(boncorresp_z)*; 
.
(impmcia_z)=(impor_rpo)(boncorresp_z)-(impfint_z)-;
pimpmcia_z,MDS12;    \|\;
pimpfint_z,MDS12;    \|\;
l;
(subtimpmcia_z)=(subtimpmcia_z)(impmcia_z)+;
(subtimpfint_z)=(subtimpfint_z)(impfint_z)+;
R;


[SUBTOT;
Ff4;
(import_z)=(neto_z)(bonif_z)-(recar_z)+;
penc_z,42; \|\; 
pbonif_z,MDS10; \|\; 
precar_z,MDS10; \|\; 
pneto_z,MDS12; \|\; 
pimport_z,MDS12; \|\;
psubtimpmcia_z,MDS12; \|\;
psubtimpfint_z,MDS12; \|\;
l;
(totimpmcia_z)=(totimpmcia_z)(subtimpmcia_z)+; z0,subtimpmcia_z,#;
(totimpfint_z)=(totimpfint_z)(subtimpfint_z)+; z0,subtimpfint_z,#;
(totbonif_z)=(totbonif_z)(bonif_z)+;           z0,bonif_z,#; 
(totrecar_z)=(totrecar_z)(recar_z)+;           z0,recar_z,#; 
(totneto_z)=(totneto_z)(neto_z)+;              z0,neto_z,#;
R;

[SUBTOT2;
Ff4;
(import_z)=(totneto_z)(totbonif_z)-(totrecar_z)+;
l; s30; \Total_Global:\; 
ptotbonif_z,MDS10; s1; 
ptotrecar_z,MDS10; s1;
ptotneto_z,MDS12; s1; 
pimport_z,MDS12; \|\;
ptotimpmcia_z,MDS12; \|\;
ptotimpfint_z,MDS12; \|\;
l; l;
GTABLA_PLAZOIVA;
R;

[TABLA_PLAZOIVA;
z0,impor_z,#; z0,recar_z,#; z0,bonif_z,#;
Ff4; GFONT13;
c_21;
\ __________________________________________________________________________\;
c_13; 
c_26; l;
GFONT19;
\|Cartera             |\;
\                      |\;
\Importe Docs|\;
\Bonificacion|\;
\   Recargos |\;
\   Efectivo |\; 
\   Mercancia|\;
\ Bon.Corresp|\;
\ Financiamto|\;
GFONT20; l;
*   Imp: 123456789012 123456789012 123456789012 123456789012 123456789012 123456789012 123456789012 123456789012 123456789012 *
z0,totmcia_z,#;
z0,totfmto_z,#;
z0,totbcor_z,#;

f7; k1; P;
{ n+;
  (piva_z)=(piva_ind7); (tiplazo_z)=(tiplazo_ind7,#); (anu_z)=(anu_ind7);
  (codcar_z)=(tienda_ind7);
  GIMPRIRENTABLA;
  f7; a;
)
\|\; c_20; \|\;
\______________________|\;
\____________|\;
\____________|\;
\____________|\;
\____________|\;
\____________|\;
\____________|\;
\____________|\; l;
GFONT19; 
\|\; s20; \|\;
\ Total General        |\; 
pimpor_z,MDS12;      \|\;
pbonif_z,MDS12;      \|\; 
precar_z,MDS12;      \|\; 
(efectivo_z)=(impor_z)(bonif_z)-(recar_z)+;
pefectivo_z,MDS12;   \|\; 
ptotimpmcia_z,MDS12; \|\;
ptotbcor_z,MDS12;    \|\;
ptotimpfint_z,MDS12; \|\;
GFONT20; l;
R;

[IMPRIRENTABLA;
z0,impcp_z,#; z0,boncp_z,#; z0,reccp_z,#; z0,boncorresp_z,#;
(codcar_z)=(tienda_ind7); >iscodcar_z,strcodcar_z,MIS02;
(impfint_z)=(impfin_ind7);
(boncorresp_z)=(boncor_ind7);
(impmcia_z)=(impor_ind7)(boncor_ind7)-(impfin_ind7)-;
!(tien_z)0(tdaex1_z,#)(tien_z)0(tdaex2_z,#)|>|; z0,recar_ind7,#; .
\|\;
f2; k2; P; n|;.  pnombre_tda,20; \|\;
ptiplazo_ind7,0; s1; ppiva_z,MDS2; \% \; pdescri_ind7,16; \|\; 
pimpor_ind7,MDS12;   \|\; 
pbonif_ind7,MDS12;   \|\; 
precar_ind7,MDS12;   \|\; 
(efectivo_z)=(impor_ind7)(bonif_ind7)-(recar_ind7)+;
pefectivo_z,MDS12;   \|\;
pimpmcia_z,MDS12;    \|\;
pboncorresp_z,MDS12; \|\;
pimpfint_z,MDS12;    \|\;
l;
(impor_z)=(impor_z)(impor_ind7)+;        z0,impcp_z,#;
(bonif_z)=(bonif_z)(bonif_ind7)+;        z0,boncp_z,#;
(recar_z)=(recar_z)(recar_ind7)+;        z0,reccp_z,#;
(totmcia_z)=(totmcia_z)(impmcia_z)+;
(totfmto_z)=(totfmto_z)(impfint_z)+;
(totbcor_z)=(totbcor_z)(boncorresp_z)+;
R;

[MANDAELFNT; f13; k1; P; n|; z0,impre_fnt,l; . GSACAF; R;

#isacaf.i;
#iimpri.i;
#imandaimp.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1; 
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #iclientes.i;
k0; ot,"clientes",;
k1; kp,"idcli= ?",idcli_z,;

f2; #itiendas.i;
k0; ot,"tiendas",;
k1; kp,"codigo=?",tien_z,#,1,;
k2; kp,"codigo=?",strcodcar_z,#,1,;

f3; #ipolizas.i;
k0; ot,"polizas",;
k1; kp,"fecha=? and tda=?",fecpol_z,#,3,tien_z,#,1,;

f4; #irenpol2.i;
k0; ot,"renpol2",;
k1; kp,"fecha=? and tda=? order by conse",fecpol_z,#,3,tien_z,#,1,;
k2; kq,"select a.* 
        from renpol2 a join clientes b on a.idcli = b.idcli
        join car_corlarpzodet d on b.qom = d.qom and b.nulet1 = d.nulets
        join car_corlarpzo c on d.idcorlarpzo = c.idcorlarpzo
        join car_anuscartera e on
        ( year(b.fechavta) >= e.anuini and year(b.fechavta) <= e.anufin)
        and d.idanucartera = e.idanucartera
        where a.fecha = ? and tda = ? and piva = ?
        and e.anucartera=? and tiplazo=? and b.status ='*' and b.tienda = ?",
        fecpol_z,#,3,tien_z,#,1,piva_z,anu_z,tiplazo_z,#,1,codcar_z,;

f5; #iconceps.i;
k0; ot,"conceps",;
k1; kp,"ncon=?",nconcep_z,;

f6; M
	piva_ind6		d,
	tiplazo_ind6		s2,
        anu_ind6		l,
        tipo_ind6		s3,
        impor_ind6		d,
        rob_ind6		d,
        tam_ind6		s0,;
k0; ot,"renpol2",;
k1; kq,"select piva, tiplazo, anucartera, tipo, sum(impor), sum(rob)
        from renpol2 a join clientes b on a.idcli = b.idcli
        join car_corlarpzodet d on b.qom = d.qom and b.nulet1 = d.nulets
        join car_corlarpzo c on d.idcorlarpzo = c.idcorlarpzo
        join car_anuscartera e on
        ( year(b.fechavta) >= e.anuini and year(b.fechavta) <= e.anufin)
        and d.idanucartera = e.idanucartera
        where a.fecha = ? and tda = ? and status='*' and piva=? and tiplazo=?
        and anucartera=?
        group by piva, tiplazo, anucartera, tipo",
        fecpol_z,#,3,tien_z,#,1,piva_z,tiplazo_z,#,1,anu_z,;
k2; kq,"select piva, tiplazo, tipo, year(b.fechavta) as anu, sum(impor), sum(rob)
        from renpol2 a join clientes b on a.idcli = b.idcli
        join car_corlarpzodet d on b.qom = d.qom and b.nulet1 = d.nulets
        join car_corlarpzo c on d.idcorlarpzo = c.idcorlarpzo
        where a.fecha = ? and tda = ? and piva = ? and status='*'
        and  year(b.fechavta) between ? and ? and tiplazo = ?
        group by piva, tiplazo, tipo, anu",
        fecpol_z,#,3,tien_z,#,1,piva_z,anuini_z,anufin_z,
        tiplazo_z,#,1,;

f7; M
        tienda_ind7		i,
	piva_ind7		d,
	tiplazo_ind7		s2,
	anu_ind7		l,
	descri_ind7		s31,
        impor_ind7		d,
        bonif_ind7		d,
        recar_ind7		d,
        impfin_ind7		d,
        boncor_ind7		d,
        tam_ind7		s0,;
k0; ot,"renpol2",;
k1; kq,"select b.tienda, piva, tiplazo, anucartera, e.descri, sum(impor), 
        sum( case tipo when 'AR' then 0   else rob end) as bonif,
        sum( case tipo when 'AR' then rob else 0   end) as recar,
        sum(
          (case ace
           when 'S' then
            ( ( nulet1 * ( canle1 - b.bonifi) ) - ( precon * (piva / 100 + 1) - enganc ) ) / nulet1 * ceiling(impor / canle1)
            when 'C' then
            ( ( nulet1 * ( canle1 - b.bonifi) ) - ( precon * (piva / 100 + 1) - enganc ) ) / nulet1 * ceiling(impor / canle1)
             else 0 end
          )
        ) as finmto,
        sum(
          (case ace
           when 'S' then
            ( b.bonifi *  ceiling(impor / canle1) )
            when 'C' then
            ( b.bonifi *  ceiling(impor / canle1) )
             else 0 end
          )
        ) as boncorr
        from renpol2 a join clientes b on a.idcli = b.idcli
        join car_corlarpzodet d on b.qom = d.qom and b.nulet1 = d.nulets
        join car_corlarpzo c on d.idcorlarpzo = c.idcorlarpzo
        join car_anuscartera e on
        d.idanucartera = e.idanucartera and
        ( year(b.fechavta) >= e.anuini and year(b.fechavta) <= e.anufin)
        where a.fecha = ? and tda = ? and status='*'
        group by b.tienda, piva, tiplazo, anucartera,e.descri",
        fecpol_z,#,3,tien_z,#,1,;
k3; kq,"select b.tienda, piva, tiplazo, anucartera, e.descri, sum(impor), sum(rob)
        from renpol2 a join clientes b on a.idcli = b.idcli
        join car_corlarpzodet d on b.qom = d.qom and b.nulet1 = d.nulets
        join car_corlarpzo c on d.idcorlarpzo = c.idcorlarpzo
        join car_anuscartera e on
        ( year(b.fechavta) >= e.anuini and year(b.fechavta) <= e.anufin)
        and d.idanucartera = e.idanucartera
        where a.fecha = ? and tda = ? and status='*'
        group by b.tienda, piva, tiplazo, anucartera,e.descri",
        fecpol_z,#,3,tien_z,#,1,;
k2; kq,"select b.tienda, piva, sum(impor), sum(rob)
        from renpol2 a join clientes b on a.idcli = b.idcli
        where a.fecha = ? and tda = ? and status='*'
        group by b.tienda, piva",fecpol_z,#,3,tien_z,#,1,;


f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;

[Kprog1;
KF3,pidetdas,F4,muestrapzas;
R;

[pidetdas; GPIDETDAS; ];
[muestrapzas; GMUESTRAPZAS; ];

[MUESTRAPZAS; t@8,3; \Ex:R:\; ptdaex1_z,0; s1; ptdaex2_z,0; R;


[PIDETDAS;
GST; \Poliza1 (MS):\; t0R; itdaex1_z,2;
GST; \Poliza2 (MZ):\; t0R; itdaex2_z,2;
GST; \Polizas a Excluir son:\; ptdaex1_z,0; \ Y \; ptdaex2_z,0; \ Correcto ? <S/N>:\;
y|; | gPIDETDAS; . tc; GGRABA_PARAMETROS; tr;
R;

[PAN; 
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro; tf; tn;
ta0; #iprog1.i; ^=direc_z,#); Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
(modul_z)=($Impresion de Despacho,21); (modul2_z)=($CAR-MDS,7); 
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[NOCLI; z32,nombre_cli,#; (nombre_cli)=($I N E X I S T E N T E,21); R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;


[Fin1; y|;.
[Fin; t@23,0; te; };
