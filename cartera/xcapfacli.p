* Programa que sirve para Capturar las Facturas de los Clientes
  DRBR 28-Dic-1996
*

#dMDE10 %-10.0f~; #dMDE12 %-12.2f~; #dMIE5 %-5d~; #dMLE6 %-6d~; #dMFE %-6.2f~;
#dMDS10 %10.0f~;  #dMDS12 %,12.2f~; #dMIS5 %5d~;  #dMLS6 %6d~;  #dMFS %6.2f~;
#dMDS9 %,9.2f~;  #dMIS2 %2d~;  #dMLS10 %10ld~;  #dMIS4 %4d~;    #dMLS6A %1ld~;
#dMLE5 %-5ld~;   #dMIE2 %-2d~; #dMLE10 %-10ld~; #dMIS02 %02d~;
#dMLS5 %5ld~;    #dMLS06 %06ld~;
#dMDS12A %12.4f~; #dMFS6A %6.0f~;
#i/programas/lib/funkey.i;

f0; M
	nemp_z          	s80,
	direc_z         	s80,
	version_z		s20,
        sff_z			i,
        impre_z                 i,
        font_z                  i,
        micar_z                 s3,
        carac_z                 i,
        modul_z         	s40,
	modul2_z        	s10,
	logingerente_z		s16,
	paswdgte_z		s16,
	permisabrefac_z		l,
	fecstr_z		s15,
	fecfac_z		D,
	nvoren_z		s2,
	ter_z            	s2,
	stdrd_z			s2,
	spf_z			s2,
	fech9_z     {
	  dias_z        	s16,
	  hora2_z         	s5,
	  resto_z        	s5,
	            }
        fecult_z	{
          fecultaa_z		i,
          fecultmm_z		i,
          fecultdd_z		i,
          		}
	timofset_z		l,
	fech8_z           	D,
        fecha_z			D,
        fechb_z			D,
        fechc_z			D,
        fechd_z			D,
        feche_z			D,
	totfacli_z        	d,
	totimpfac_z		d,
	totivafac_z		d,
	totdesfac_z		d,
	ncli_z            	d,
        prec1_z			d,
        eng1_z			d,
        propfi_z		d,
	admin_z           	i,
	numpagos_z           	i,

        tpmov_z			s2,
        datosol_z		s66,
	compra_z		s200,
        compra2_z {
          compra2a_z		C200,
                  }
        strfolio_z    {
           strfolio2_z		C21,
                      }
        seriemotor_z		s31,
        pedimento_z		s31,
        aduana_z		s31,
        bandmoto_z		s2,
        idmvcli_z		l,
        conse_z			l,
        fechavta_z	{
          fechavtaaa_z		i,
          fechavtamm_z		i,
          fechavtadd_z		i,
                        }

        aux1_z			l,
        aux2_z			l,
        iddato_z		l,
        idconcep_z		l,
        fecaux_z	{
          fecauxaa_z		i,
          fecauxmm_z		i,
          fecauxdd_z		i,
                        }
        feccap_z	{
	  feccapaa_z 		i, 
	  feccapmm_z 		i, 
	  feccapdd_z 		i, 
	  feccaphor_z	 	i, 
	  feccapmin_z	 	i, 
	  feccapsec_z	 	i, 
	  feccapfra_z	 	l, 
			}
        archfac_z		s30,
        archuuid_z		s30,
        uuid_z			s66,
        iduuid_z		l,
        cmdfac_z		s80,
        strnumfac_z		s10,
	emailcli_z		s40,
        rfccli_z		s20,
        estado_z		s100,
        pais_z			s100,
        pobsuc_z		s100,
        poblac_z		s26,
        regimen_z		s100,
        siaux_z			s2,
        micol_z			i,
        miren_z			i,
        nvonumfac_z		l,
        maxrow_z		i,
        maxcol_z		i,
        renst_z			i,
	mibd_z			s80,
	mibdinv_z      		s80,
	mibdcartera_z  		s80,
	feccod_z		s2,
	calle_z			s31,
	numpred_z		s31,
	colonia_z		s31,
	codpost_z		s31,
	dircli_z		s31,
	dircli2_z		s31,
	nommes_z		s11,
	nombresuc_z		s31,
	codcartera_z		s3,
	importe_z	  	d,
	soli_z      {
	  progra_z      	s41,
	  codref_z      	s12,
	  tarea_z		s10,
	            }
	msg_z          		s100,
	msg1_z       {
	  par1_z         	s8,
	  par2_z         	s2,
	  par3_z         	s1,
	  par4_z         	s2,
	             }
	login_z			s16,
	clause_z		s16,

* ---> Variables de Memoria que deben existir  para Password <------ *
	fech3_z			s9,
	ind4_z			i,
	ind5_z			i,
	ind6_z			i,
	fech5_z     {
	  dsem_z         s4,
	  mes2_z         s4,
	  dia2_z         s3,
	  anu2_z         s5,
	  hora_z         s7,
	            }
        fechoys_z	{
          fechoysaa_z		s4,
          fechoysp1_z		s1,
          fechoysmm_z		s2,
          fechoysp2_z		s1,
          fechoysdd_z		s2,
          fechoysp3_z		s1,
        		}
	bandpas_z		s2,
	pass1_z			s20,
	pass2_z			s20,
	pass5_z			s20,
	pass3_z	{
	  pass3a_z			c20,
			}
	pass4_z		{
	  pass4a_z			c20,
			}
* <-------------- *

*   -->  Variables y Rutina para Reportes Multiples en variables   <--    *
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z			s13,
	args_z		{
          args1_z		s1,
          args2_z		s20,
        		}
        tipoffo_z		s2,
        ntipoffo_z		l,
        tipofac_z		l,
	nfac_z            	l,
        idcliendoso_z		l,
        idnombre_z		l,
        narts_z			i,
        bandc_z			s2,
        band4_z			s2,
	mes_z			i,
	bandf3_z		s2,
	bandimp_z		s2,
        bandrenf_z              s2,
        solocons_z		s2,
        idrenfac_z              l,
        idfac_z                 l,
	nargs_z           	i,
	band_z           	s2,
	nombre_z		s200,
	folio_z			l,
	mifac_z			l,
        antidcli_z		l,
        col_z			i,

        bandnom_z			s2,
        titven_z			s80,
        appat_z				s51,
        apmat_z				s51,
        nompil1_z			s51,
        nompil2_z			s51,
        REL_NOMCLI			l,
        REL_NOMAVA			l,
        REL_NOMFIDE			l,
	FAC_TRADICIONAL			l,
	FAC_FONACOT			l,
	NUM_IMPRESIONES_FAC		l,
	TIPO_TARJETA_CREDITO_FELIZ	l,
	TIPO_TARJETA_CREDITO_BANCARIA	l,
	idusuario_z		l,
	cuantasimpfac_z		l,

	codcli_z              	s11,  * Codigo del Cliente Fonacot       *
	seriefac_z              s6,  * Serie de la Factura de Fonacot  *
	nvaseriefac_z              s6,  * Serie de la Factura de Fonacot  *
	ultfac_z                l,  * Esta es mi ultima Factura        *
	pagcon_z                d,
	tasa_z                  d,  * tasa de Comision FONACOT         *
	import_z                d,  * Importe del Renglon              *
	subtot_z                d,  * Subtotal de la Factura           *
	iva_z                   d,  * Importe del Iva                  *
	total_z                 d,  * Total de la Factura              *
        impren_z                d,
        preciou_z               d,
        pdsc_z                  d,
        piva_z                  d,
        precmerc_z              d,
        fletes_z                d,
        idpob_z                 l,
        canti_z                 l,
        codigo_z                s14,
        concepto_z		s31,
        concep2_z		s31,
        serieart_z              s21,
        master_z		s2,
        iniciales_z		s5,
        sihaymod_z		s2,
        anter_z                 s2,
        sigte_z                 s2,
        bndf8_z                 s2,
        nconcep_z		l,
        nconcp1_z		l,
        nconcp2_z		l,
        nconcp3_z		l,
        bandf8_z                s2,
        col01_z                 i,
        col02_z                 i,
        col03_z                 i,
        col04_z                 i,
        rena_z                  i,
        renb_z                  i,
        tope_z                  i,
        base_z                  i,

* ---> Estas son las variables que se necesitan para usar esta funcion  <---- *
	bandb_z          	s2,
	prifac_z          	l,
        sqlcmd_z		s100,
	milinea_z		s100,
	clientes_z		s20,
	mvcli_z			s20,
	tbdircl_z		s20,
	solicit_z		s20,
	facfon_z		s20,
	renfacfon_z		s20,
	caroal_z		s20,
	misdatsol_z		s80,
        idcli_z			l,
        tope1_z			i,
        base1_z			i,
        bndf1_z			s2,
        bandprog_z		s2,
        haciabus_z		s2,
        usuario_z		s16,
	ren_z             	i,
	iii_z             	i,
	pos1_z            	l,
	col1_z            	i,
	col2_z            	i,
	xx_z              	i,
	yy_z              	i,
	ren2_z            	i,
	cols_z            	i,
	ii_z              	i,

	ind1_z            	i,
	ind2_z            	i,
	termi_z           	i,
	ntar_z		  	i,
	esp_z             	i,
	exten_z           	i,
        cia_z                   i,
        mimenu_z		i,
        diganufac_z		i,
	tam0             	s0,;
mtam0&; 
q+,version_z,"V:2.01 DJ",;
* --> Control de Versiones
Version 2.01 2014-10-03
Modificado para que se agregue a la colonia el nombre de la sucursal donde
entra en cartera a partir de 2014-oct-01 y si es de credito
 ----> Fin control de Version <----
*

tr;
(renfacfon_z)=($renfacfo,8); GTOMA_PARAMETROS; (mimenu_z)=(0);
Ff5; FO.impri.ini~,r~; FG|; | Fknemp_z,l; >sinemp_z,#,impre_z; . FC;
z0,nemp_z,#; Ff5; FO.cias.ini~,r~; FG|; | Fknemp_z,l; .
FC; Ff1; >sinemp_z,#,cia_z;
Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1;
z0,termi_z,#; >istermi_z,ter_z,%02d~; ts0; tttntar_z;
(arch_z)=($capfafon.tex,12); &cfecha_z; 
(col01_z)=(0); (col02_z)=(14); (col03_z)=(45); (col04_z)=(66);
(tope_z)=(23); (base_z)=(15); (idcliendoso_z)=(-10);
(tipofac_z)=(TIPO_FAC_VENTA); * TIPO_FACTURAS_VENTA *
GPAN; 
GABRE_TABLA; 
GDEFINE_REL_CLI;
GST; \:\; pargs_z,0; \:\;
$inargs_z;
!(nargs_z)2($2)>|;
  z0,codcli_z,#;
|
   !(nargs_z)1($1)>|; \1:\; $s1,codcli_z,#;   .
   !(nargs_z)1($2)>|; \2:\; $s2,login_z,#;  .
   !(nargs_z)1($3)>|; \3:\; $s3,solocons_z,#; .
.
!(codcli_z)1($ ,1)>|;
  f1; k1; P; n|; (bandb_z)=($C,1); Gbusca2; . f1; k1; P; n|;. (ncli_z)=(1);
  (idcli_z)=(idcli_cli);
  tL00; pnumcli_cli,0; tL01; pnombre_cli,0; tL02; pserie_faf,2;
  qD,1,fechavta_cli,fecha_z,; (fechavta_z)=(fechavta_cli,#);
  !(ticte_cli)0($FN,2)(ticte_cli)0($FI,2)|(ticte_cli)0($IM,2)|>|;
    (tipoffo_z)=($F,1); (ntipoffo_z)=(FAC_FONACOT);
  |
    (tipoffo_z)=($T,1); (ntipoffo_z)=(FAC_TRADICIONAL);
  .
  !(status_cli)0($ ,1)>|;
    z0,milinea_z,#; (milinea_z)=(seriefac_z,3); 
    z0,seriefac_z,#; q+,seriefac_z,milinea_z,"Z",;
  .
.
!(login_z)2($ ,1)>|; 
  GPIDEUSUARIO; !(band_z)5($S,1)>Fin; 
| 
  >sllogin_z,#,idusuario_z,; f16; k3; P;
  n|; GST; \Usuario Invalido...Presione <S> P/Continuar...\; y|;. gFin; .
.
(master_z)=(maestro_use,#); (idusuario_z)=(idusuario_use); 
(iniciales_z)=(iniciales_use,#); (siaux_z)=($S,1);

tL04; pfecha_z,+10;
(spf_z)=($|,1);
GDESPMISFACS; GBUSINIFAC;
{
  !(mimenu_z)0($0)>|; GMENS0; GSELEC0; .
  !(mimenu_z)0($1)>|; GMENS01; GSELEC01; .
)
gFin;

[PIDEUSUARIO; 
z0,band_z,#;
GST; \Teclee su Nombre de usuario:\; t0Fin; ttulogin_z; qu,login_z,;
ilogin_z,15; 
GST; \Teclee la Clave de Usuario : \; t0PIDEUSUARIO; z0,clause_z,#;
ts2; iclause_z,10; f16; k2; P;
n|; GST; \Usuario Inexistente...\; Z1; gPIDEUSUARIO; .
(band_z)=($S,1);
R;

[DESPMISFACS;
(bandf3_z)=($N,1); tL19; s12; tL20; s63; (mifac_z)=(nfac_faf); tL20;
z0,totfacli_z,#; z0,prifac_z,#; z0,ind1_z,#;
z0,ultfac_z,#; (micol_z)=(0); (miren_z)=(4);
!(caroal_z)0($A,1)>|; f10; k2; | f10; k1; . P;
{ n+; 
  (micol_z)=(micol_z)(11)+;
  !(ind1_z)0($0)(tipo_ind10)(FAC_TRADICIONAL)&>|; 
    (prifac_z)=(factur_ind10); (ind1_z)=(1); 
  .
  !(micol_z)2(maxcol_z)>|; 
    @totfac_ind10,100; t@miren_z,micol_z; pfactur_ind10,MLS10; 
  .
  (totfacli_z)=(totfacli_z)(totfac_ind10)+; (ultfac_z)=(factur_ind10); 
  (bandf3_z)=($S,1);
  f10; a;
)
(eng1_z)=(enganc_cli)(servic_cli)+;
(prec1_z)=(precon_cli)(piva_cli)(100)/(1)+*; @prec1_z,10;
(propfi_z)=(cargos_cli)(prec1_z)-(servic_cli)-;
!(propfi_z)2($1)>|; z0,propfi_z,#; .
tL37; ppropfi_z,MDS12;
(totfacli_z)=(totfacli_z)(propfi_z)+(servic_cli)+;
tL19; ptotfacli_z,MDS12;
R;

[NOPDMDF1; GST; `7; \No pude modificar \; pclientes_z,0; Z1; R;

[TOMA_PARAMETROS;
(ind1_z)=(1);
tc; xcrea_param.bat .capfacli.ini ~;
Ff5; FO.capfacli.ini~,r~;
{ 
  z0,milinea_z,#; Ff5; FG+; Fkmilinea_z,l; 
  !(ind1_z)0($1)>|; >similinea_z,#,diganufac_z;  .
  !(ind1_z)0($2)>|; (seriefac_z)=(milinea_z,5);  .
  !(ind1_z)0($3)>|; (pobsuc_z)=(milinea_z,60);   .
  !(ind1_z)0($4)>|; (pais_z)=(milinea_z,60);     .
  !(ind1_z)0($5)>|; (emailcli_z)=(milinea_z,40); .
  !(ind1_z)0($6)>|; (rfccli_z)=(milinea_z,20);   .
  !(ind1_z)0($7)>|; (regimen_z)=(milinea_z,100); .
  !(ind1_z)0($8)>|; (stdrd_z)=(milinea_z,1); .
  !(ind1_z)0($-9)>|; (feccod_z)=(milinea_z,1); . 
  * --> dejé bloqueado feccod p/q no lo lea <-- *
  (ind1_z)=(ind1_z)(1)+;
)
!(feccod_z)5($C,1)(feccod_z)5($P,1)&>|; 
  (feccod_z)=($C,1); 
.
Ff5; FC; Ff1; tr;
R;

[GRABA_PARAMETROS;
tc;
Ff5; FO.capfacli.ini~,w~;
pdiganufac_z,MIS4; l;
pseriefac_z,0; l;
ppobsuc_z,0; l;
ppais_z,0; l;
pemailcli_z,0; l;
prfccli_z,0; l;
pregimen_z,0; l;
pstdrd_z,0; l;
pfeccod_z,0; l;
Ff5; FC; Ff1; tr;
R;

[DESPLIEGA_PARAM;
tS1,0,0,23,80; tM;
(ind1_z)=(1);
{ !(ind1_z)1($10)>+;
  t@ind1_z,3;
  !(ind1_z)0($1)>|; \Digitos en Anu Factura (2012) :\; pdiganufac_z,MIS4; .
  !(ind1_z)0($2)>|; \Serie de Facturas             :\; pseriefac_z,0; .
  !(ind1_z)0($3)>|; \Poblacion Sucursal            :\; ppobsuc_z,0; .
  !(ind1_z)0($4)>|; \Pais Sucursal                 :\; ppais_z,0; .
  !(ind1_z)0($5)>|; \Email de Cte                  :\; pemailcli_z,0; .
  !(ind1_z)0($6)>|; \RFC del Cte General           :\; prfccli_z,0; .
  !(ind1_z)0($7)>|; \Regimen Fiscal de la Empresa  :\; pregimen_z,0; .
  !(ind1_z)0($8)>|; \Uso Dos Leyendas Standard     :\; pstdrd_z,0; .
  !(ind1_z)0($9)>|; \Fecha Factura Codigo/Personalizado:\; pfeccod_z,0; .
  (ind1_z)=(ind1_z)(1)+;
)
\Presione <S> P/Continuar\; y|;.
tS0;
R;

  
[BUSINIFAC;
f3; k1; P; nR; GDESPFAC;
R;

[MENS0;
GST; \`A`nterior `S`iguiente `N`uevo `R`englones `B`aja \;
\`I`mprime `D`espliega `C`ierra Sig.Men`u` `F`in\;
R;

[MENS01;
GST; \`P`arametros Cambia_`N`umfac `E`mision `M`ayoreo `A`brir `G`raba_uuid Sig.Men`u` `F`in\;
R;


[SELEC0;
?G[Aantfac, [Ssigfac, [Nnvafac, [Rrenfac, [Mmodfac, [Bbajfac, [Iimpfac,
  [aantfac, [ssigfac, [nnvafac, [rrenfac, [mmodfac, [bbajfac, [iimpfac,
  [FSalfac, [Dconfac, [Uotromen, [Ccierra,
  [fSalfac, [Dconfac, [uotromen, [ccierra;
R;

[SELEC01;
  ?G[Ppideparam, [Uotromen, [Ncambianumfac, [MMAYOREO, [Tafecta_art, 
    [ppideparam, [uotromen, [ncambianumfac, [mMAYOREO, [tafecta_art, 
    [GGRABA_UUID, [EPIDE_TIPO_FECHA_EMISION, [Aabrefac, [FSalfac,
    [gGRABA_UUID, [ePIDE_TIPO_FECHA_EMISION, [aabrefac, [fSalfac;
R;

[MAYOREO;
z0,msg_z,#; q+,msg_z,"Seguro de Querer Factura Mayoreo ? <S/N>:",;
GINPUT_SN; !(band_z)0($S,1)>|; (seriefac_z)=($MYFA,4); | gFin; .
R;

[abrefac;
f3; k2; P;
n|; GST; `7; \No Existe esa Factura...\; Z1; R; . GDESPFAC;
!(status_faf)5($C,1)>|;
  GST; \Esta factura no ha sido cerrada previamente... <S> P/Continuar\; y|;. R;
.
!(master_z)5($S,1)>|; GPIDE_PASSWD_USR; !(band_z)5($S,1)>R; .
GST; \Seguro de abrir esta factura? <S/N>:\;
y|; f3; k15; P$; f3; k2; P; nR; GDESPFAC; .
R;

[PIDE_PASSWD_USR;
z0,band_z,#; (permisabrefac_z)=(PERMI_GERENTE_ABRE_FACTURAS);
GST; \Teclee su Clave de Usuario:\; t0R; ilogingerente_z,15;
GST; \Teclee su Password:\; t0R; z0,paswdgte_z,#; ts2; ipaswdgte_z,15;
z0,ncon_cpm,l; f6; k6; P; n|;. !(concepto_cpm)0($T,1)>|; (band_z)=($S,1); .
R;
  
[afecta_art;
!(sihaymod_z)5($S,1)>|;
  GST; \Al salir se hara la afectación de los articulos... <S> P/Continuar\; y|;.
  (sihaymod_z)=($S,1);
|
  GST; \Ya estaba preparado p/efectuar afectación articulos <S> P/Continuar\; y|;.
.
R;

[otromen;
!(mimenu_z)0($1)>|; (mimenu_z)=(0); | (mimenu_z)=(1); .
R;

[OBTENDATO;
z0,idcli_mdsol,l; f14; k1; P; n|;. (idconcep_z)=(concep_mdsol);
z0,refyobs_rfsol,l; f15; k2; P; n|;.
R;

[OBTEN_EDOYPAIS;
z0,ulticon_ind6,l;  f7; k13; P; n|;. (iddato_z)=(ulticon_ind6);
z0,observ_ind5,#; f5; k3; P; n|;.
R;

[cierra;
!(status_faf)0($C,1)>|;
  GST; \Esta factura ha sido cerrada previamente... <S> P/Continuar\; y|;. R;
.
GCHECA_TOTALES;
!(band_z)5($S,1)>R;
GST; \Estoy en cerrar facturas\;
!(fechavtaaa_z)1($2012)(status_cli)0($*,1)&>|; 
  &a; &cfech8_z; (fechd_z)=(fech8_z);
  qD,4,feccap_z,fech8_z,; (timofset_z)=(3600)(feccaphor_z)(1)+*;
  qD,1,fechavta_cli,fech8_z,;
  * -> Le adelanto 1 hora x cualquier cosa <- *
  !(feccod_z)0($P,1)>|;
    (iii_z)=(fechd_z)(fech8_z)-(86400)/;
    !(iii_z)1($3)>|;
      * Primero lo divido en dias y le resto 3 *
      (conse_z)=(fechd_z)(86400)/(2)-; (conse_z)=(conse_z)(86400)*;
      (fech8_z)=(conse_z);
    .
    GST; t0R; GST; \Teclee la Fecha:\; ifech8_z,+10;
    !(fech8_z)0($-1)>|; GST; \Fecha Invalida...\; y|;. R;  .
  .
  qD,2,fecult_z,fech8_z,; qD,1,fecult_z,fech8_z,;
  (fech8_z)=(fech8_z)(timofset_z)+;  &a; &cfechc_z;
  * --> Voy a verificar que no sea fecha futura <-- *
  (iii_z)=(fechd_z)(fech8_z)-(86400)/;
  !(iii_z)2($0)>|; 
    GST; \No puede poner fechas futuras <S> P/Continuar\; y|;. R; 
  .
  (aux1_z)=(fech8_z); (aux2_z)=(fechc_z);
  !(aux1_z)1(aux2_z)>|; (fech8_z)=(fechc_z); .
  qD,4,feccap_z,fech8_z,; 
  qD,2,fecaux_z,fech8_z,; qD,1,fecaux_z,fech8_z,;
  qD,2,fecaux_z,fechd_z,; qD,1,fecaux_z,fechd_z,;
  (iii_z)=(fechd_z)(fech8_z)-(86400)/;
  !(iii_z)2($0)>|; 
    GST; \No puede poner fechas futuras <S> P/Continuar\; y|;. R; 
  .
  !(iii_z)1($3)>|; 
    GST; \No puede poner mas de 3 dias <S> P/Continuar\; y|;. R; 
  .
  GST; \Seguro de Cerrar con Fecha:\; pfeccapaa_z,MIS02; \-\; pfeccapmm_z,MIS02; \-\; 
  pfeccapdd_z,MIS02; s1;
  pfeccaphor_z,MIS02; \:\; pfeccapmin_z,MIS02; \:\; pfeccapsec_z,MIS02;
  \ ? <S/N>:\; y|; | R; .
  GMANDA_TIMBRAR; 
.
GGRABA_UUID_EN_CTE;
R;

[MANDA_TIMBRAR;
* --> Aqui voy a generar el archivo txt que tomara el conector <-- *
tS1,0,0,23,80; 
tc;
z0,ulticon_ind6,l; f7; k12; P; n|;. (idnombre_z)=(ulticon_ind6);
f5; k2; P; n|;. (nombre_z)=(observ_ind5,#);

(iddato_z)=(640); GOBTENDATO; (calle_z)=(refyobs_rfsol,#);
(iddato_z)=(641); GOBTENDATO; (numpred_z)=(refyobs_rfsol,#);
(iddato_z)=(642); GOBTENDATO; (colonia_z)=(refyobs_rfsol,#);
(iddato_z)=(643); GOBTENDATO; (codpost_z)=(refyobs_rfsol,#);
(codcartera_z)=(codcli_z,2); z0,nombresuc_z,#;
qD,1,fechavta_cli,fecfac_z,; &bfecfac_z; &p4fecstr_z;
!(fecstr_z)3($20141001,8)>|;
  !(qom_cli)5($C,1)>|;
    z0,ncon_cpm,l; f6; k7; P; n|;. (nombresuc_z)=(concepto_cpm,#);
    !(nombresuc_z)0($SUC.54,6)>|; z0,nombresuc_z,#; (nombresuc_z)=($SUC.54,6); .
    !(nombresuc_z)0($SUC.58,6)>|; z0,nombresuc_z,#; (nombresuc_z)=($SUC.58,6); .
    !(nombresuc_z)0($SUC.67,6)>|; z0,nombresuc_z,#; (nombresuc_z)=($SUC.67,6); .
  .
.
(precmerc_z)=(precon_cli)(piva_cli)(100)/(1)+*; @prec1_z,10;
(eng1_z)=(enganc_cli)(servic_cli)+;
(fletes_z)=(servic_cli)(piva_cli)(100)/(1)+/;
(propfi_z)=(cargos_cli)(precmerc_z)-(servic_cli)-;
(poblac_z)=(poblac_cli,#); z0,ulticon_ind6,l;  f7; k14; P; n|;.
(idpob_z)=(ulticon_ind6); (iddato_z)=(2); 
GOBTEN_EDOYPAIS; (estado_z)=(observ_ind5,65);
(idpob_z)=(iddato_z); (iddato_z)=(3); 
GOBTEN_EDOYPAIS; (pais_z)=(observ_ind5,65);

(numpagos_z)=(nulet1_cli); !(numpagos_z)2($1)>|; (numpagos_z)=(1); .
z0,strnumfac_z,#; >lsnfac_faf,strnumfac_z,MLS06;
z0,archfac_z,#; q+,archfac_z,serie_faf,strnumfac_z,".txt",;
z0,archuuid_z,#; q+,archuuid_z,serie_faf,strnumfac_z,".uuid.txt",;
Ff4; FO(archfac_z),w~;
f8; k1; P;
{ n+;
  (preciou_z)=(importe_rff);
  (nconcep_z)=(descri_rff); z0,concepto_cpm,l;
  f6; k1; P; n|;. (concepto_z)=(concepto_cpm,#); 
  (serieart_z)=(serie_rff,#);
  (codigo_z)=(codigo_rff,#);
  (piva_z)=(piva_rff);
  GIMPRIME_REN_LAYOUT;
  f8; a;
)
z0,serieart_z,#; z0,codigo_z,#; z0,concepto_z,#; 
q+,concepto_z,"PRODUCTOS FINANCIEROS",;
(preciou_z)=(propfi_z)(piva_cli)(100)/(1)+/; @preciou_z,100;
(piva_z)=(piva_cli);
GIMPRIME_REN_LAYOUT;
!(servic_cli)5($0)>|;
  z0,serieart_z,#; z0,codigo_z,#; z0,concepto_z,#; 
  q+,concepto_z,"TRANSPORTE MERCANCIAS",;
  (preciou_z)=(servic_cli)(piva_cli)(100)/(1)+/; @preciou_z,100;
  (piva_z)=(piva_cli);
  GIMPRIME_REN_LAYOUT;
.
FC;
z0,cmdfac_z,#; q+,cmdfac_z,"generafac.bat ",archfac_z," FACTURA",;
x(cmdfac_z);
Ff5; FO(archuuid_z),r~;
Ff5; FGFIN_TOMA_PARAMETROS; 
z0,milinea_z,#; Fkmilinea_z,l; (uuid_z)=(milinea_z,60);
[FIN_TOMA_PARAMETROS;
FC;
Ff1; tf; tr; tS0;
R;


[CALCU_FLOAT_SINESPACIOS;
(aux1_z)=(impren_z);
(aux2_z)=(impren_z)(aux1_z)-(100)*;
* paux1_z,MLS6A; \.\; paux2_z,MLS6A; *
pimpren_z,MDS12A;
R;

[IMPRIME_REN_LAYOUT;
pspf_z,0; 
pnfac_faf,MLS6A; pspf_z,0;
pserie_faf,0; pspf_z,0;
pnombre_z,0; pspf_z,0;
prfccli_z,0; pspf_z,0;
ppais_z,0; pspf_z,0;
pestado_z,0; pspf_z,0;
* Municipio del Cte * ppoblac_cli,0; pspf_z,0;
ppoblac_cli,0; pspf_z,0;
pcalle_z,0; pspf_z,0;
!(numpred_z)2($ ,1)>|; \0\; . pnumpred_z,0; pspf_z,0;
* num int.* \0\; pspf_z,0;
!(colonia_z)2($ ,1)>|; \0\; . pcolonia_z,0; s4; pnombresuc_z,0; pspf_z,0;
!(codpost_z)2($ ,1)>|; \97000\; . pcodpost_z,0; pspf_z,0;
!(feccod_z)0($S,1)>|;
  pfechaDay_faf,MIS02; pfechaMon_faf,MIS02; pfechaYear_faf,MIS02; 
|
  pfeccapdd_z,MIS02; pfeccapmm_z,MIS02; pfeccapaa_z,MIS02; 
.
\:\;
pfeccaphor_z,MIS02; \:\;
pfeccapmin_z,MIS02; \:\;
pfeccapsec_z,MIS02; pspf_z,0;
\PIEZA\; pspf_z,0;
\1\; pspf_z,0;
(impren_z)=(preciou_z); GCALCU_FLOAT_SINESPACIOS; pspf_z,0;
pconcepto_z,0;
!(serieart_z)1($ ,1)>|; \ Serie:\; pserieart_z,0; .
pspf_z,0; 
* Codigo de Articulo  * pspf_z,0;
(aux1_z)=(piva_rff); paux1_z,MLS6A; pspf_z,0;
* status * \TRUE\; pspf_z,0;
* Tasa de Descuento * \0\; pspf_z,0;
* Tasa IEPS * \0\; pspf_z,0;
* Tasa RET ISR * \0\; pspf_z,0;
* Tasa RET IVA* \0\; pspf_z,0;
* NOTAS * \OPERACION CON EL PUBLICO EN GENERAL\; pspf_z,0;
* MONEDA NOMBRE * \Pesos\; pspf_z,0;
* MONEDA SIMBOLO* \MXN\; pspf_z,0;
* Tipo de Cambio* \1\; pspf_z,0;
* Forma de Pago *
!(numpagos_z)1($1)>|;
  \Pago en parcialidades\; 
|
  \Pago en una sola exhibicion\;
.
pspf_z,0;
* Condiciones de Pago*
!(numpagos_z)1($1)>|;
  \CREDITO\; 
|
  \CONTADO\;
.
pspf_z,0;

* Metodo de Pago* \NO IDENTIFICADO\; pspf_z,0;
* Correo del Cliente* pemailcli_z,0; pspf_z,0;
!(stdrd_z)0($S,1)>|;
  pspf_z,0; pspf_z,0;
|
  * Leyenda1=Precio de Mercancias* 
  (impren_z)=(precmerc_z); GCALCU_FLOAT_SINESPACIOS; pspf_z,0;
  * Leyenda2=Precio de Fletes:*  
  (impren_z)=(servic_cli); GCALCU_FLOAT_SINESPACIOS; pspf_z,0;
  * Leyenda3=Productos Financieros: * 
  (impren_z)=(propfi_z); GCALCU_FLOAT_SINESPACIOS; pspf_z,0;
  * Leyenda4=N. de Letras y Tipo: * pnulet1_cli,MIS2; s1; pqom_cli,0; pspf_z,0;
  * Leyenda5=Precio de las Letras: * 
  (impren_z)=(canle1_cli); GCALCU_FLOAT_SINESPACIOS; pspf_z,0;
  * Leyenda6=Enganche * 
  (impren_z)=(eng1_z); GCALCU_FLOAT_SINESPACIOS; pspf_z,0;
  * Leyenda7=Leyenda Vacia * pspf_z,0;
.
* NumCta de pago* pspf_z,0;
* Lugar Expedicion * ppobsuc_z,0; pspf_z,0;
* Regimen * pregimen_z,0; pspf_z,0;
* Cuando es pago va el UUID * pspf_z,0;
* Cuando es pago va la Serie Folio Fiscal Original * pspf_z,0;
* Cuando es pago va Fecha del Folio Fiscal Original * pspf_z,0;
* Cuando es pago va El Total del Folio Fiscal Original * pspf_z,0;
l;
R;

[GRABA_UUID_EN_CTE;
z0,datosol_z,#; (datosol_z)=(uuid_z,#); f15; k1; P;
n|;
  z0,ulticon_ind6,l;
  f7; k11; P; n|;. (idconcep_z)=(ulticon_ind6)(1)+;
  (refyobs_rfsol)=(datosol_z,#); (nref_rfsol)=(idconcep_z);
  f15; k3; P$;
|
  (idconcep_z)=(nref_rfsol);
.
(iddato_z)=(651); f14; k1; P;
n|; f14; k2; P$; | f14; k3; P$; .
(iduuid_faf)=(idconcep_z); (fechayhora_faf)=(feccap_z,#);
(status_faf)=($C,1);
!(caroal_z)0($A,1)>|;
  f3; k6; P$;
|
  f3; k7; P$;
.
R;

[GRABA_UUID;
GST; \Teclee el Uuid:\; t0R; iuuid_z,#;
GST; \Seguro de grabar el uuid:\; puuid_z,0; \ <S/N>:\;
y|; GGRABA_UUID_EN_FAC; GDESPFAC; .
R;

[GRABA_UUID_EN_FAC;
z0,datosol_z,#; (datosol_z)=(uuid_z,#); f15; k1; P;
n|;
  z0,ulticon_ind6,l;
  f7; k11; P; n|;. (idconcep_z)=(ulticon_ind6)(1)+;
  (refyobs_rfsol)=(datosol_z,#); (nref_rfsol)=(idconcep_z);
  f15; k3; P$;
|
  (idconcep_z)=(nref_rfsol);
.
(iduuid_z)=(idconcep_z);
(iddato_z)=(651); f14; k1; P;
n|; f14; k2; P$; | f14; k3; P$; .
(iduuid_faf)=(idconcep_z);
GST; \Grabando:\; piduuid_z,MLS6; \ En idfac:\; pidfac_z,MLS6; y|;.
f3; k14; P$;
R;

[pideparam;
GDESPLIEGA_PARAM;
GST; \Cuantos Digitos imprimo en el anu de la factura ? \; t0R;
idiganufac_z,MIE2,MIS2; !(diganufac_z)2($0)(diganufac_z)1($4)|>pideparam;
GST; \Teclee la Serie de las Facturas:\; t0R; iseriefac_z,5;
GST; \Teclee la Poblacion de la Sucursal:\; t0R; ipobsuc_z,30;
GST; \Teclee El Pais de la Sucursal:\; t0R; ipais_z,30;
GST; \Teclee El Email del Cte General:\; t0SAL_PIDEPARAM; tu0; iemailcli_z,30; tu1;
GST; \Teclee El RFC del Cte General:\; t0R; irfccli_z,30;
GST; \Teclee El Regimen Fiscal de MDS:\; t0R; iregimen_z,70;
* --> No lo pido GST; \Quieres Con 2 Leyendas ?:\; t0R; istdrd_z,1; <-- *
[fcd; GST; \Fecha Emision sea del `C`odigo o `P`ersonalizada ? <C/P>: \; 
t0R; ifeccod_z,1; 
!(feccod_z)5($C,1)(feccod_z)5($P,1)&>fcd;
GGRABA_PARAMETROS;
[SAL_PIDEPARAM; tu1;
R;

[PIDE_TIPO_FECHA_EMISION; 
GST; \Fecha Emision sea del `C`odigo o `P`ersonalizada ? <C/P>: \; 
t0R; ifeccod_z,1; 
!(feccod_z)5($C,1)(feccod_z)5($P,1)&>PIDE_TIPO_FECHA_EMISION;
R;

[Salfac;
!(solocons_z)0($S,1)>Fin;
GCHECA_TOTALES; 
!(band_z)5($S,1)>|;
  GST; \Desea regresar a la `T`arjeta ? o continuar en la `F`actura ? <R/F>:\;
  t0R; iband_z,1; !(band_z)0($F,1)>R;
.
f1; k1; P; nR; f1; QNOPDMDF1;
!(caroal_z)0($A,1)>|; k3; P$; .
!(caroal_z)0($C,1)>|; k4; P$; .
GGRABA_ARTICULOS;
gFin;
R;

[CHECA_TOTALES;
(import_z)=(cargos_cli); z0,band_z,#;
!(ticte_cli)0($FI,2)>|; (import_z)=(canle2_cli)(bonifi_cli)-; .
!(ticte_cli)0($FN,2)>|; (import_z)=(canle2_cli); .
(eng1_z)=(enganc_cli)(servic_cli)+;
(prec1_z)=(precon_cli)(piva_cli)(100)/(1)+*; @prec1_z,10;
(propfi_z)=(cargos_cli)(prec1_z)-(servic_cli)-;
!(propfi_z)2($1)>|; z0,propfi_z,#; .
tL37; ppropfi_z,MDS12;
(totfacli_z)=(total_faf)(propfi_z)+(servic_cli)+;
@totfacli_z,100; @import_z,100;
(totdesfac_z)=(prec1_z)(total_faf)-;
!(totdesfac_z)2($-0.5)(totdesfac_z)1($0.5)|>|;
  GCREA_VENTANA_BUS_GRANDE;
  t@4,1; \El total de las Mercancias debe ser:\;
  t@5,1; pprec1_z,MDS12;
  t@6,1; \Presione <S> P/continuar\; y|;.
  tS0; R;
.
!(totfacli_z)5(import_z)>|;
  tS7,15,1,5,78; tM; tS8,16,2,3,75; tf;
  t@0,0; \Cargo Cliente:\; pimport_z,MDS12;
  t@1,0; \Facturas     :\; ptotfacli_z,MDS12;
  t@2,0; `7; \La suma de Facturas No Cuadra con el cargo \;
  \del Cliente. <S> P/Continuar\; y|;. `7; tS0; R;
.
(band_z)=($S,1);
R;

[GRABA_ARTICULOS;
!(solocons_z)0($S,1)>Fin; !(sihaymod_z)5($S,1)>Fin;
f2; k4; P$; z0,conse_z,#; z0,idmvcli_z,#; 
z0,ulticon_ind6,#; f7; k15; P; n|;. (idmvcli_z)=(ulticon_ind6)(1)+;
z0,ulticon_ind6,#; f7; k16; P; n|;. (conse_z)=(ulticon_ind6)(1)+;
z0,iii_z,#; z0,exten_z,#; z0,compra_z,#;
f8; k1;
P;
{ n+;
  (nconcep_z)=(descri_rff); z0,concepto_cpm,l; f6; k1; P; n|;.
  z0,concepto_z,#; (concepto_z)=(concepto_cpm,#);
  GST; \Concepto:\; pconcepto_z,0; \:\;
  !(iii_z)1($0)>|; q+,compra_z," ",; .
  z0,concep2_z,#; q+,compra_z,concepto_z,; (nombre_z)=(concepto_z,#);
  !(serie_rff)1($ ,1)>|; 
    q+,compra_z," S/",serie_rff,; q+,nombre_z," S/",serie_rff,;
    q+,concep2_z,"S/",serie_rff,;
  .
  !(folio_rff)5($0)>|;
    (ii_z)=(folio_rff); z0,serieart_z,#; >isii_z,serieart_z,MIS4;
    (strfolio_z)=(serieart_z,#); (ii_z)=(0); (ind1_z)=(strfolio2_z&);
    { !(ii_z)1($4)>+; !(strfolio2_z[ind1_z])5($ ,1)>+;
      (ii_z)=(ii_z)(1)+; (ind1_z)=(ind1_z)(1)+;
    )
    z0,serieart_z,#; (serieart_z)=(strfolio2_z[ind1_z],4);
    q+,compra_z," #",serieart_z,;
  .
  (iii_z)=(iii_z)(1)+;
  GST; \iii_z:\; piii_z,MIS2; \:\; pcompra_z,0; \:\;
  f8; a;
)
f1; k1; P; nR; f1; QNOPDMDF1; f1; k6; P$;
Fslexten_z,compra_z; 
!(exten_z)2($71)>Fin; 
(iii_z)=(70); (ind2_z)=(compra2a_z&)(70)+;
(compra2_z)=(compra_z,#);
{ !(iii_z)1($200)>+; !(iii_z)1(exten_z)>+;
  z0,concepto_z,#; (concepto_z)=(compra2a_z[ind2_z],25); GAGREGA_MVCLI;
  (iii_z)=(iii_z)(25)+; (ind2_z)=(ind2_z)(25)+;
)
gFin;

[AGREGA_MVCLI;
z0,ncon_cpm,l; f6; k4; P; n|;.
z0,idcli_mvc,l; (idcli_mvc)=(idcli_z); (fechamov_mvc)=(fechavta_cli,#);
(coa_mvc)=($C,1); (concep1_mvc)=(ncon_cpm); (conse_mvc)=(conse_z);
&cfech8_z; qD,4,feccap_mvc,fech8_z,; (idmvcli_mvc)=(idmvcli_z);
(idusuario_mvc)=(idusuario_z); (usuario_mvc)=(iniciales_z,#); 
f2; k2; P$;
(idmvcli_z)=(idmvcli_z)(1)+; (conse_z)=(conse_z)(1)+;
R;


[antfac;
!(bandf3_z)0($N,1)>R; f3; b; n|; a; nR; . GDESPFAC;
R;

[sigfac;
!(bandf3_z)0($N,1)>R; f3; a; n|; b; nR; . GDESPFAC;
R;

[nvafac;
!(solocons_z)0($S,1)>R;
!(master_z)5($S,1)>|;
  z0,ulticon_ind6,#; f7; k18; P; n|;. 
  !(ulticon_ind6)1($0)>|;
    GST; \No puede tener mas de una factura de venta <S> P/Continuar\; y|;. R;
  .
.
@totfacli_z,100; @cargos_cli,100; &a; &cfechb_z; (fecha_z)=(fechb_z);
!(ticte_cli)5($FI,2)>|; qD,1,fechavta_cli,fecha_z,; .
!(totfacli_z)0(cargos_cli)>|;
  GST; `7; \La suma de Facturas ya Cuadra con cargo \;
  \Cliente, Seguro continuar ? <S/N> \; y|; | gR; .
.
GST; \Teclee el Numero de la Factura...\; t0R;
!(status_cli)5($Y,1)>|;
  tL33; pseriefac_z,5;
  z0,ulticon_ind6,l; f7;
  !(caroal_z)0($A,1)>|; k8; P; .
  !(caroal_z)0($C,1)>|; k7; P; .
  n|;. (nfac_z)=(ulticon_ind6)(1)+;
  [nfac; tL02; t0R; infac_z,MLE10,MLS10; 
|
  z0,seriefac_z,#; tL02; pidcli_z,MLS10; (nfac_z)=(idcli_z)(-1)*;  
.
f3; k2; P;
n|; | 
  !(idcli_faf)0(idcli_z)>|; 
    GST; `7; \Ya Existe esa Factura...\; Z1; 
    GDESPFAC; 
  |
    GDESPFACEXISTE_DE_CLIEN;
  .
  R; 
.
!(tipoffo_z)0($F,1)>|; GDESPFACEXISTE; .
tL04; pfecha_z,+10;
GPIDATFAC; !(band_z)5($S,1)>R;
z0,ulticon_ind6,l; f7;
!(caroal_z)0($A,1)>|; k6; P; .
!(caroal_z)0($C,1)>|; k5; P; .
n|;. (idfac_z)=(ulticon_ind6)(1)+;

z0,idcli_faf,l; (idcli_faf)=(idcli_z); (serie_faf)=(seriefac_z,#);
(tasa_faf)=(tasa_z); >lsnfac_z,MLS6,factur_faf;
(nfac_faf)=(nfac_z); qD,2,fecha_faf,fecha_z,;
(idfac_faf)=(idfac_z); (concep1_faf)=(nfac_z);
(precio2_faf)=(ntipoffo_z); (status_faf)=($A,1); (tipo_faf)=(tipofac_z);
f3; QNOPDAGF3;
!(caroal_z)0($A,1)>|; k4; P$; .
!(caroal_z)0($C,1)>|; k5; P$; .
GDESPFAC; GDESPMISFACS;
{ Gnvoren; !(band_z)5($S,1)>+; )
R;

[DESPFACEXISTE;
f11; k1; P; 
n|; |
  GCREA_VENTANA_BUS_GRANDE;
  t@3,1; \Ya esta utilizada ese folio en cartera \;
  t@4,1; \Tiene serie:\; pserie_ind11,0;
  t@5,1; \Cliente:\; pnumcli_ind11,0; 
  t@6,1; \Nombre :\; pnombre_ind11,0;
  t@7,1; \Debe usar otra factura. \;
  t@8,1; \Presione <S> P/Continuar...\; y|;.
  tS0;
  gnfac;
.
R;

[DESPFACEXISTE_DE_CLIEN;
GCREA_VENTANA_BUS_GRANDE;
z0,ncon_cpm,l; f6; k5; P; n|;.
t@3,1; \Ya esta utilizada esa Factura por Otro Cliente \;
t@4,1; \Nombre:\; pconcepto_cpm,0;
t@5,1; \Debe usar otra factura. \;
t@6,1; \Presione <S> P/Continuar...\; y|;.
tS0;
R;

[confac;
(antidcli_z)=(idcli_z);
GST; \Teclee el Numero de la Factura...\; t0R;
tL02; infac_z,MLE10,MLS10; (bandb_z)=($F,1); Gbusca2; f3; k2; P;
n|; GST; `7; \No Existe esa Factura...\; Z1; R; .
GDESPFAC;
(idcli_z)=(antidcli_z);
R;

[MIGRAR;
!(solocons_z)0($S,1)>R;
z0,ulticon_ind6,l; f7; k17; P; n|;.
!(ulticon_ind6)0($0)>|;
  GST; \No tiene articulos no relacionados en factura <S> P/Continuar\; y|;. R;
.
f8; k9; P$;
GLISRENFAC; GUPDATEFAC; f3; k2; P; nR; GDESPTOTFAC; GDESPMISFACS;
R;

[NOPDAGF3; GST; `7; \No pude agregar registro en facfon ...\; Z2; R;
[NOPDMDF3; GST; `7; \No pude mdificar registro en facfon ...\; Z2; R;

[PIDATFAC;
z32,band_z,#; z0,folio_z,#;
{ 
  !(ticte_cli)0($FN,2)>|;
    [tas; GST; \Teclee la Tasa FONACOT de la Factura...\; t0+;
    tL05; itasa_z,MFE,MFS; (folio_z)=(1);
  .
  !(ticte_cli)0($FI,2)>|;
    [fec; GST; \Teclee la Fecha de la Factura...\; t0+; (fecha_z)=(fechb_z);
    tL04; ifecha_z,+10; !(fecha_z)0($-1)>fec; (folio_z)=(1);
  .
  GST; \Estan Correctos los datos ? <S/N> : \; 
  y|; (band_z)=($S,1); g+; | !(folio_z)0($0)>+; .
)
R;

[BUSCONCEP;
z0,ncon_cpm,l; f6; k4; P; n|;. (nconcep_z)=(ncon_cpm);
R;

[CLR;
tL02; s6; tL05; s5; tL06; s30; tL07; s5; tL08; s12; tL09; s12;
tL10; s30; tL11; s5; tL12; s12; tL13; s12; tL14; s30; tL15; s5;
tL16; s12; tL17; s12; tL18; s12; tL21; s12; tL22; s12; tL33; s2;
R;

[DESPFAC;
(idcli_z)=(idcli_faf);
f1; k2; P; 
n|; 
  * -> No Encuentro al cliente, puede ser de solo consulta, en nombres *
  (idnombre_z)=(concep2_faf); f5; k2; P; 
  n|; 
    GNOCLI; 
  | 
    z0,numcli_cli,#; (numcli_cli)=($ALTA,4); (nombre_cli)=(observ_ind5,34); 
  .
. 
qD,1,fecha_faf,fecha_z,; (fechb_z)=(fecha_z);
tL00; pnumcli_cli,10;
tL01; pnombre_cli,34; tL33; pserie_faf,5; tL02; pnfac_faf,MLS10;
tL04; pfecha_z,+10;
!(ticte_cli)0($FN,2)>|; tL05; ptasa_faf,MFS; .
(tasa_z)=(tasa_faf); (seriefac_z)=(serie_faf,#); (idfac_z)=(idfac_faf);
(nfac_z)=(nfac_faf); 
GDESPTOTFAC; GLISRENFAC;
(iduuid_z)=(iduuid_faf); (idconcep_z)=(iduuid_z);
z0,refyobs_rfsol,l; f15; k2; P; n|;. tL38; prefyobs_rfsol,#;
R;

[DESPTOTFAC;
tL18; psubtot_faf,MDS12; tL21; piva_faf,MDS12; tL22; ptotal_faf,MDS12;
R;

[modfac;
!(solocons_z)0($S,1)>R;
GST; \Teclee el Numero de la Factura...\; pcodcli_z,0; t0R;
tL33; pseriefac_z,5;
tL02; infac_z,MLE10,MLS10;
f3; k2; P;
n|; GST; `7; \No Existe esa Factura...\; Z1; R; . GDESPFAC;
GST; `7; \Seguro de Modificar Esta Factura ? <S/N> : \; y|; | R; .
GPIDATFAC; !(band_z)5($S,1)>R; f3; k2; P; nR;
(tasa_faf)=(tasa_z);
f3; QNOPDMDF3;
!(caroal_z)0($A,1)>|; k6; P$; .
!(caroal_z)0($C,1)>|; k7; P$; .
GDESPFAC; GDESPMISFACS;
R;

[cambianumfac;
GST; \Teclee el Numero de la Factura...\; pcodcli_z,0; t0R;
tL33; iseriefac_z,5;
tL02; infac_z,MLE10,MLS10;
f3; k2; P;
n|; GST; `7; \No Existe esa Factura...\; Z1; R; . GDESPFAC;
GST; `7; \Seguro de Modificar Esta Factura ? <S/N> : \; y|; | R; .
GCREA_VENTANA_BUS;
[nnf; t@4,3; \Nueva Serie :\; t@4,30; t0ventanacero; invaseriefac_z,5;
t@5,3; \Nuevo Numero:\; t@5,30; t0ventanacero; invonumfac_z,MLE10,MLS10;
f7; k9; P; 
n|; | 
  GSTVB; \Ya existe esa Factura... \;
  GSTVB2; \Intente con otra\; Z2; gnnf; 
.
GSTVB2; GSTVB; \Estan correctos los datos ? <S/N>\;
y|;
  GSTVB; \Estoy Ejecutando... A \;
  f7; k10; P$;
  GSTVB; \Estoy Ejecutando... B \;
  (seriefac_z)=(nvaseriefac_z,#); (nfac_z)=(nvonumfac_z);
  GSTVB; \Estoy Ejecutando... C \;
.
[ventanacero;
tS0;
f3; k2; P; nR;
GDESPFAC; GDESPMISFACS;
R;

[STVB;  t@6,3; s27; t@6,3; R;
[STVB2; t@7,3; s27; t@7,3; R;

[bajfac;
!(solocons_z)0($S,1)>R;
!(status_faf)0($C,1)>|;
  GST; \Esta factura ha sido cerrada previamente... <S> P/Continuar\; y|;. R;
.
GST; \Teclee el Numero de la Factura...\; pcodcli_z,0; t0R;
tL33; pseriefac_z,5;
tL02; infac_z,MLE10,MLS10;
f3; k2; P;
n|; GST; `7; \No Existe esa Factura...\; Z1; R; . GDESPFAC;
GST; `7; \Seguro de Borrar Esta Factura ? <S/N> : \;
y|;
  !(caroal_z)0($A,1)>|; f3; k8; P$; f8; k6; P$; .
  !(caroal_z)0($C,1)>|; f3; k9; P$; f8; k3; P$; .
  GMARCA_FAC_ELIMINADA;
.
GDESPMISFACS;
R;

[MARCA_FAC_ELIMINADA;
z0,ulticon_ind6,l;
!(caroal_z)0($A,1)>|; f7; k3; P; .
!(caroal_z)0($C,1)>|; f7; k2; P; .
n|;. z0,idrenfacfo_rff,l;
(idrenfacfo_rff)=(ulticon_ind6)(1)+; (idfacfon_rff)=(idfac_z)(-1)*;
(idcli_rff)=(idcli_z);
z0,concepto_z,#; 
z0,codigo_z,#; >lsnfac_z,codigo_z,MLS6; q+,concepto_z,codigo_z,seriefac_z,;
z0,codigo_z,#; qD,1,fecha_faf,fech8_z,; &bfech8_z; &p4codigo_z,;
q+,concepto_z," F:",codigo_z,;
z0,codigo_z,#; (codigo_z)=($FAC_ELIM,8);
(preciou_z)=(subtot_faf); (canti_z)=(1); (pdsc_z)=(0);
(preciou_z)=(preciou_z)(piva_z)(100)/(1)+/; @preciou_z,1000;
(codigo_rff)=(codigo_z,#); (piva_z)=(16);
GBUSCONCEP; (descri_rff)=(nconcep_z);
(canti_rff)=(canti_z); (preciou_rff)=(preciou_z);
(importe_rff)=(canti_rff)(preciou_rff)*; @importe_rff,1000;
(piva_rff)=(piva_z); (pdsc_rff)=(pdsc_z);
(descto_rff)=(importe_rff)(pdsc_z)(100)/*; @descto_rff,1000;
(iva_rff)=(importe_rff)(descto_rff)-(piva_rff)(100)/*; @iva_rff,1000;
(cia_rff)=(cia_z); (import_z)=(importe_rff); (iva_z)=(iva_rff);
(serie_rff)=(seriefac_z,#); (folio_rff)=(nfac_z);
!(caroal_z)0($A,1)>|;
  f8; QNOPDAGF8; k5; P$;
|
  f8; QNOPDAGF8; k2; P$;
.
R;

[impfac;
(eng1_z)=(enganc_cli)(servic_cli)+;
(prec1_z)=(precon_cli)(piva_cli)(100)/(1)+*; @prec1_z,10;
(propfi_z)=(cargos_cli)(prec1_z)-(servic_cli)-;
!(propfi_z)2($1)>|; z0,propfi_z,#; .

f3; k2; P; nR;
tc; Ff4; FO(arch_z),w~; GFONT11; GFONT14; s10; pnombre_cli,0;
* s5; \FFG-740520-SY9\; -- DRBR 08-May-2002 Se Elimina la impresion de RFC *
l; s10; pdirec_cli,0; f4; k1; P; n|; z0,direc2_dcl,#; .
s1; pdirec2_dcl,0; l; l;
s10; ppoblac_cli,0; (ind2_z)=(6); GLFEED;
(rena_z)=(base_z); z0,subtot_z,#;

(bndf8_z)=($N,1); z0,ind2_z,#; f8; k1; P;
{ n+;
  !(codigo_rff)0($BONIF,5)>|; s5; | pcanti_rff,MLS5; .
  s5; (nconcep_z)=(descri_rff); z0,concepto_cpm,l;
  f6; k1; P; n|;. pconcepto_cpm,30;
  (import_z)=(importe_rff)(iva_rff)+;
  !(import_z)2($0)>|; (import_z)=(import_z)(-1)*; .
  !(ticte_cli)0($FI,2)(ticte_cli)0($IM,2)|(ticte_cli)0($FN,2)|>|;
    !(ticte_cli)0($FI,2)>|;
      (import_z)=(importe_rff); (subtot_z)=(subtot_z)(importe_rff)+;
    .
    !(import_z)5($0)>|; s5; pimport_z,MDS12; .
  .
  (ind2_z)=(ind2_z)(1)+; l;
  Fslexten_z,serie_rff;
  !(exten_z)1($0)>|; s10; \Serie:\; pserie_rff,0; (ind2_z)=(ind2_z)(1)+; l; .
  f8; a;
)
!(ticte_cli)0($FI,2)>|;
  (iva_z)=(total_faf)(subtot_z)-;
  s34; \Subtotal:  \; psubtot_z,MDS12; l;
  s34; \     IVA:  \; piva_z,MDS12;  l;
  s34; \   Total:  \; ptotal_faf,MDS12; l;
  (ind2_z)=(ind2_z)(3)+;
.
!(nfac_faf)0(ultfac_z)(ticte_cli)0($FN,2)(ticte_cli)0($IM,2)|&>|;
  (pagcon_z)=(abonos_cli)(servic_cli)-; @pagcon_z,100;
  !(pagcon_z)1($0)>|;
    s7; \El Cliente Pago de Contado:\; ppagcon_z,MDS12;
    l; (ind2_z)=(ind2_z)(1)+;
  .
.
(ind2_z)=(11)(ind2_z)-; GLFEED;
(importe_z)=(cargos_cli); GTOMALETRAS; tc; Ff4;
s3; GFONT13; \Son : (\; pmsg_z,0; \ Pesos \;
ppar4_z,#;  \/100 M.N.)\; GFONT14; l; l;
!(tipoffo_z)0($F,1)>|;
  (ind2_z)=(1); GLFEED;
  !(ticte_cli)5($FI,2)>|; s26; ptotal_faf,MDS12; . (ind2_z)=(6); GLFEED;
  s45; ptotal_faf,MDS12; l;
|
  s26; pprec1_z,MDS12; s10; peng1_z,MDS12; l; l;
  s26; pservic_cli,MDS12; s4; pnulet1_cli,MIS2; s4; 
  pcanle1_cli,MDS12; s1; pqom_cli,0; l; l;
  s26; ppropfi_z,MDS12; s4; pnulet2_cli,MIS2; s4;
  pcanle2_cli,MDS12; s1; pqom_cli,0; l; l;
  s51; pcargos_cli,MDS12; l;
.
l; s25; pfechaDay_faf,MIS2; s7; (mes_z)=(fechaMon_faf);
GSACANOMMES;
s11; z0,milinea_z,#; >isfechavtaYear_cli,milinea_z,MIS4;
!(diganufac_z)5($4)>|; (ii_z)=(4)(diganufac_z)-; z32,milinea_z,ii_z; .
pmilinea_z,4; l; l;
s10; \GRACIAS POR SU PREFERENCIA ...\; l;
Ff4; FC; tr; Ff1; GSalir;
!(ticte_cli)0($FI,2)>|;
  GST; \Desea imprimir el endoso ? <S/N>:\; y|; GIMPRIENDOSO; .
.
R;

[LFEED; { !(ind2_z)2($1)>+; l; (ind2_z)=(ind2_z)(1)-; ) R;

[IMPRIENDOSO;
tc; Ff4; FO(arch_z),w~; 
(ind2_z)=(4); GLFEED; 
f5; k1; P;
{ n+;
  Ff4; s5; pobserv_ind5,0; l;
  f5; a;
)
Fsenombre_cli,34,exten_z;
(ind2_z)=(4); GLFEED;
(esp_z)=(70)(40)-(2)/; !(esp_z)2($0)>|; z0,esp_z,#; .
sesp_z; c_40; l;
(esp_z)=(70)(exten_z)-(2)/; !(esp_z)2($0)>|; z0,esp_z,#; .
sesp_z; pnombre_cli,0; l;
Ff4; FC; tr; Ff1; GSalir;
R;

[TOMALETRAS;
(progra_z)=($vpg4s /programas/vps/cartera/util1.vp    ,41);
>dsimporte_z,msg1_z,%13.2f~; z32,codref_z,#; (codref_z)=(msg1_z,10);
(tarea_z)=($12345.txt,9); >lsntar_z,tarea_z,%05ld~;
tv0; tc; x(soli_z); tr; tv1;
Ff5; FO(tarea_z),r~; FG|; (msg_z)=($NO PUDE LEER,20); | Fkmsg_z,l; . FC;
R;

[renfac;
GLISRENFAC; z0,bandrenf_z,#;
{
  GMENS1; GSELEC1; !(bandrenf_z)0($S,1)>+;
)
GDESPMISFACS;
R;

[MENS1;
GST; \Seleccione:`A`nterior `S`iguiente `N`uevo `B`orra `L`ista `R`egresa\;
R;

[SELEC1;
?G[Aantren, [Ssigren, [Nnvoren, [MMODREN, [Bborren, [LLISRENFAC, [Rregren,
  [aantren, [ssigren, [nnvoren, [mMODREN, [bborren, [lLISRENFAC, [rregren;
R;

[regren; (bandrenf_z)=($S,1); R;

[nvoren;
!(solocons_z)0($S,1)>R;
!(status_faf)0($X,1)>|;
  GST; \Esta factura ha sido cerrada previamente... <S> P/Continuar\; y|;. R;
.
(renb_z)=(rena_z)(1)+;
!(renb_z)1(tope_z)>|;
  t@base_z,0; td; (rena_z)=(rena_z)(1)-; (renb_z)=(tope_z);
.
(nvoren_z)=($S,1);
GPIDATREN; 
!(band_z)0($S,1)>|;
  GAGRERENFAC;
  !(linea_inv)0($MOTO,4)>|;
    z0,preciou_z,#; z0,codigo_z,#; (codigo_z)=($AUXILIAR,8);
    z0,concepto_z,#; z0,serieart_z,#; z0,folio_z,#; z0,pdsc_z,#; z0,canti_z,#;
    (idrenfac_z)=(idrenfac_z)(1)+;
    !(seriemotor_z)1($ ,1)>|; q+,concepto_z,"MOTOR S/",seriemotor_z,; GAGRERENFAC; .
    z0,concepto_z,#; (idrenfac_z)=(idrenfac_z)(1)+;
    !(pedimento_z)1($ ,1)>|; q+,concepto_z,"PEDIMENTO:",pedimento_z,; GAGRERENFAC; .
    z0,concepto_z,#; (idrenfac_z)=(idrenfac_z)(1)+;
    !(aduana_z)1($ ,1)>|; q+,concepto_z,"ADUANA:",aduana_z,; GAGRERENFAC; .
  .
.
GLISRENFAC; f3; k2; P; nR; GDESPTOTFAC; GDESPMISFACS;
(sihaymod_z)=($S,1);
R;

[AGRERENFAC;
 z0,ulticon_ind6,l;
!(caroal_z)0($A,1)>|; f7; k3; P; .
!(caroal_z)0($C,1)>|; f7; k2; P; .
n|;. z0,idrenfacfo_rff,l;
(idrenfacfo_rff)=(ulticon_ind6)(1)+; (idfacfon_rff)=(idfac_z);
(idcli_rff)=(idcli_z);
(preciou_z)=(preciou_z)(piva_z)(100)/(1)+/; @preciou_z,1000;
(codigo_rff)=(codigo_z,#);
GBUSCONCEP; (descri_rff)=(nconcep_z);
(canti_rff)=(canti_z); (preciou_rff)=(preciou_z);
(importe_rff)=(canti_rff)(preciou_rff)*; @importe_rff,1000;
(piva_rff)=(piva_z); (pdsc_rff)=(pdsc_z);
(descto_rff)=(importe_rff)(pdsc_z)(100)/*; @descto_rff,1000;
(iva_rff)=(importe_rff)(descto_rff)-(piva_rff)(100)/*; @iva_rff,1000;
(cia_rff)=(cia_z); (import_z)=(importe_rff); (iva_z)=(iva_rff);
(serie_rff)=(serieart_z,#); (folio_rff)=(folio_z);
!(caroal_z)0($A,1)>|;
  f8; QNOPDAGF8; k5; P$;
  f3; QNOPDAGF8; k11; P$;
|
  f8; QNOPDAGF8; k2; P$;
  f3; QNOPDAGF8; k10; P$;
.
R;

[MODREN;
!(solocons_z)0($S,1)>R;
!(status_faf)0($C,1)>|;
  GST; \Factura Cerrada previamente... <S> P/Continuar\; y|;. R;
.
(renb_z)=(rena_z);
(nvoren_z)=($S,1);
GPIDATREN; 
!(band_z)0($S,1)>|;
  (idrenfac_z)=(idrenfacfo_rff);
  (idfacfon_rff)=(idfac_z);
  (idcli_rff)=(idcli_z);
  (preciou_z)=(preciou_z)(piva_z)(100)/(1)+/; @preciou_z,1000;
  (codigo_rff)=(codigo_z,#);
  GBUSCONCEP; (descri_rff)=(nconcep_z);
  (canti_rff)=(canti_z); (preciou_rff)=(preciou_z);
  (importe_rff)=(canti_rff)(preciou_rff)*; @importe_rff,1000;
  (piva_rff)=(piva_z); (pdsc_rff)=(pdsc_z);
  (descto_rff)=(importe_rff)(pdsc_z)(100)/*; @descto_rff,1000;
  (iva_rff)=(importe_rff)(descto_rff)-(piva_rff)(100)/*; @iva_rff,1000;
  (cia_rff)=(cia_z); (import_z)=(importe_rff); (iva_z)=(iva_rff);
  (serie_rff)=(serieart_z,#); (folio_rff)=(folio_z);
  f8; k8; P$;
  GLISRENFAC; GUPDATEFAC; f3; k2; P; nR; GDESPTOTFAC; GDESPMISFACS;
  (sihaymod_z)=($S,1);
.
R;

[NOPDAGF8; GST; \No pude agregar registro en renfacfo...\; y|;. R;

[PIDATREN;
z32,band_z,#;
{
  [cod; GST; \Teclee el Codigo del Articulo...\; t0+; tL23; icodigo_z,13;
  (canti_z)=(1); 
  !(codigo_z)0($BONIF,5)>|;
    z0,concepto_z,#; q+,concepto_z,"MENOS BONIFICACION",;
    (tipo_inv)=($ALF,3); z0,serieart_z,#; (piva_inv)=(16);
    (preciou_z)=(bonifi_cli)(-1)*; tL24; pconcepto_z,30;
    tL27; ppreciou_z,MDS12;
  |
    !(codigo_z)0($AUXILIAR,8)>|;
      !(master_z)5($S,1)(siaux_z)5($S,1)&>|; GPIDPASW; !(bandpas_z)5($S,1)>cod; .
      [des; GST; \Teclee la Descripcion:\; t0cod; tL24; iconcepto_z,30;
      (tipo_inv)=($ALF,3); z0,serieart_z,#; z0,linea_inv,#;
    |
      f9; k1; P;
      n|;
        (bandb_z)=($I,1); Gbusca2; f9; k1; P;
        n|; GST; `7; \Articulo Inexistente...\; Z1; gcod; .
      .
      tL23; pcodigo_z,13; tL24; pdescri_inv,30;
      (preciou_z)=(precelec_inv);
      !(ticte_cli)0($FI,2)>|; (preciou_z)=(canle2_cli); .
      * --> Calcula el Precio de Venta en base al margen, suspendido
      !(poruti_z)0($0)>|; (poruti_z)=(1); .
      (preciou_z)=(costos_inv)(poruti_z)/(piva_inv)(100)/(1)+x;
      *
      (concepto_z)=(descri_inv,#); (piva_z)=(piva_inv);
      t@renb_z,col04_z; ppreciou_z,MDS12;
    .
  .
  !(fechaYear_faf)1($2009)>|; (piva_z)=(16); | (piva_z)=(15); .
  [piv; GST; \Teclee el Porcentaje de Iva:\; t0cod; tL28; ppiva_z,MFS;
  [can; GST; \Teclee la Cantidad...\; t0cod; tL26; icanti_z,MLE5,MLS5;
  (prec1_z)=(precon_cli)(piva_cli)(100)/(1)+*; @prec1_z,100;
  [pru; GST; \Precio Unitario (Iva Incluido):\; pprec1_z,MDS12; s1;
  t0can; ptipo_inv,0; tL27; ipreciou_z,MDE12,MDS12;
  (impren_z)=(preciou_z)(canti_z)*; t@renb_z,col04_z; pimpren_z,MDS12;
  !(tipo_inv)0($ALF,3)>|;
    [ser; GST; \Teclee la serie del articulo\; t0pru; tL25; iserieart_z,20;
  |
    z0,serieart_z,#;
  .
  [fol; GST; \Teclee el Folio del Articulo...\; t0pru; tL35; ifolio_z,MLE6,MLS6;
  !(folio_z)0($0)(codigo_z)5($AUXILIAR,8)&>|;
    GST; \Esta seguro de que es folio 0 ? <S/N>\; y|; | gfol; .
  .
  !(linea_inv)0($MOTO,4)(nvoren_z)0($S,1)&>|; 
    (siaux_z)=($S,1); GPIDE_DATOS_MOTO; 
  .
  GST; \Estan Correctos los datos ? <S/N>:\; y|; (band_z)=($S,1); g+; .
)
R;

[PIDE_DATOS_MOTO;
z0,bandmoto_z,#; GCREA_VENTANA_BUS_GRANDE;
{
  t@2,1; t0+; \Serie Motor:\; iseriemotor_z,30;
  t@3,1; t0-; \Pedimento  :\; ipedimento_z,30;
  t@4,1; t0-; \Aduana     :\; iaduana_z,30;
  t@5,1; s30; t@5,1; \Estan correctos los datos ? <S/N>:\; 
  y|; (bandmoto_z)=($S,1); g+; .
)
tS0;
R;

[borren;
!(solocons_z)0($S,1)>R;
!(status_faf)0($X,1)>|;
  GST; \Esta factura ha sido cerrada previamente... <S> P/Continuar\; y|;. R;
.
!(bndf8_z)0($N,1)>R;
GST; \Seguro de borrar este renglon ? <S/N>:\;
y|;
  (import_z)=(importe_rff)(-1)*; (iva_z)=(iva_rff)(-1)*;
  (idrenfac_z)=(idrenfacfo_rff);
  !(caroal_z)0($A,1)>|;
    f3; QNOPDAGF8; k11; P$; f8; k7; P$;
  |
    f3; QNOPDAGF8; k10; P$; f8; k4; P$;
  .
  GLISRENFAC; f3; k2; P; nR; GDESPTOTFAC; GDESPMISFACS; (sihaymod_z)=($S,1);
.
R;

[LISRENFAC;
(totimpfac_z)=(0); (totivafac_z)=(0); (totdesfac_z)=(0);
(rena_z)=(base_z); t@base_z,0; te;
(bndf8_z)=($N,1); f8; k1; P; nR;
{ 
  (totimpfac_z)=(totimpfac_z)(importe_rff)+;
  (totivafac_z)=(totivafac_z)(iva_rff)+;
  (totdesfac_z)=(totdesfac_z)(descto_rff)+;
  GDESPREN; f8; a; n+; GSUMAREN;
)
f8; b; nR; GDESPMIREN; (bndf8_z)=($S,1);
(anter_z)=($S,1); (sigte_z)=($N,1);
R;

[UPDATEFAC;
* --> Aqui le pongo la sumatoria <-- *
f3; k13; P$;
R;

[DESPMIREN; ta1; GDESPREN; ta0; tp;
tL23; pcodigo_rff,13; tL24; pconcepto_cpm,30; tL28; ppiva_rff,MFS;
tL26; pcanti_rff,MLS5;
(preciou_z)=(preciou_rff)(piva_rff)(100)/(1)+*;
tL27; ppreciou_z,MDS12; tL25; pserie_rff,20; tL35; pfolio_rff,MLS6;
(serieart_z)=(serie_rff,#); (folio_z)=(folio_rff); (canti_z)=(canti_rff);
(codigo_z)=(codigo_rff,#);
R;

[DESPREN;
(importe_z)=(importe_rff)(iva_rff)+;
t@rena_z,col01_z; pcodigo_rff,13; (nconcep_z)=(descri_rff);
z0,concepto_cpm,l; f6; k1; P; n|;.
t@rena_z,col02_z; pconcepto_cpm,30; t@rena_z,col03_z; pserie_rff,20;
t@rena_z,col04_z; pimporte_z,MDS12;
R;

[antren;
!(bndf8_z)0($N,1)>R; !(anter_z)0($N,1)>R;
GDESPREN; f8; b; n|; (anter_z)=($N,1); a; nR; GDESPMIREN; R; .
GRESTAREN; GDESPMIREN; (sigte_z)=($S,1);
R;

[sigren;
!(bndf8_z)0($N,1)>R; !(sigte_z)0($N,1)>R;
GDESPREN; f8; a; n|; (sigte_z)=($N,1); b; nR; GDESPMIREN; R; .
GSUMAREN; GDESPMIREN; (anter_z)=($S,1);
R;

[SUMAREN;
(rena_z)=(rena_z)(1)+;
!(rena_z)1(tope_z)>|; t@base_z,0; td; (rena_z)=(tope_z); .
R;

[RESTAREN;
(rena_z)=(rena_z)(1)-;
!(rena_z)2(base_z)>|; t@base_z,0; ti; (rena_z)=(base_z); .
R;

* --------> Este es el Codigo de la Busqueda  <-- ----------------------- *
 
[SALDEBUS;
!(bandb_z)0($C,1)>|; (codcli_z)=(numcli_cli,#); .
!(bandb_z)0($I,1)>|; (codigo_z)=(codigo_inv,#); .
!(bandb_z)0($F,1)>|; (nfac_z)=(nfac_faf); (seriefac_z)=(serie_faf,#); .
!(bandprog_z)0($1,1)>|; GKprog1; .
R;

[DESPTITULO;
t@1,1;
!(bandb_z)0($C,1)>|; \Listado de Clientes\; .
!(bandb_z)0($C,1)>|; \Listado de Inventario FONACOT\; .
!(bandb_z)0($F,1)>|; \Listado de Facturas FONACOT\; .
R;
 
[BUSCAINI;
!(bandb_z)0($C,1)>|; f1; k5; P; .
!(bandb_z)0($I,1)>|; f9; k2; P; .
!(bandb_z)0($F,1)>|; f3; k12; P; .
R;                                                                              

[SELARCH;
!(bandb_z)0($C,1)>|; f1; .
!(bandb_z)0($I,1)>|; f9; .
!(bandb_z)0($F,1)>|; f3; .
R;
 
[DESPRENOR;
!(bandb_z)0($C,1)>|;
  t@ren_z,col1_z; pnumcli_cli,10; s1; pnombre_cli,34;
.
!(bandb_z)0($I,1)>|;
  t@ren_z,col1_z; pcodigo_inv,13; s1; pdescri_inv,30;
.
!(bandb_z)0($F,1)>|;
  qD,1,fecha_faf,fech8_z,; 
  t@ren_z,col1_z; pserie_faf,2; s1; pnfac_faf,MLS6; s1; pfech8_z,+10;
.
R;

[nvoreg; R;                                                                     

[Ayuda; ];
[Kprog1; R;
[Kprog2; R;
[Kprog4; R;

#ibusca.i;
#isacaf.i;
#iimpri.i;


[MANDAELFNT; f13; k1; P; n|; z0,impre_fnt,l; . GSACAF; R;

[misar;
tS11,10,1,10,70; tM;
t@1,1; \Clientes:\; pclientes_z,0; s10;
t@2,1; \Mvcli   :\; pmvcli_z,0; s10;
t@3,1; \Dircli  :\; ptbdircl_z,0; s10;
t@4,1; \Solicit :\; psolicit_z,0; s10;
t@5,1; \Facfon  :\; pfacfon_z,0; s10;
t@6,1; \RenFacfn:\; prenfacfon_z,0; s10;
t@9,1; \Presione <S> P/Continuar...\; y|;.
tR11,10,1,10,70; tS0;
R;

[TOMAALTAS;
Ff6; FOaltas.ini~,r~;
{ Ff6; FG+; z0,milinea_z,#; Fkmilinea_z,l;
  !(milinea_z)0($clientes:,9)>|; Ff6; FG+; Fkclientes_z,l; 	g-; .
  !(milinea_z)0($mvcli:,6)>|;    Ff6; FG+; Fkmvcli_z,l;    	g-; .
  !(milinea_z)0($dircli:,7)>|;   Ff6; FG+; Fktbdircl_z,l;   	g-; .
  !(milinea_z)0($solicit:,8)>|;  Ff6; FG+; Fksolicit_z,l;  	g-; .
  !(milinea_z)0($facfon:,7)>|;	 Ff6; FG+; Fkfacfon_z,l;	g-; .
  !(milinea_z)0($renffo:,7)>|;	 Ff6; FG+; Fkrenfacfon_z,l;	g-; .
  !(milinea_z)0($caroal:,7)>|;	 Ff6; FG+; Fkcaroal_z,l;	g-; .
  !(milinea_z)0($misdatsol:,10)>|; Ff6; FG+; Fkmisdatsol_z,l;	g-; .
)
R;

[ABRE_TABLA;
GTOMAALTAS; GST; \Estoy en ABRE_TABLA\;
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1; 
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #iclientes.i;
k0; ot,clientes_z,;
k1; kp,"numcli=?",codcli_z,#,1,;
k2; kp,"idcli=?",idcli_z,;
k3; kq,"update clialta  set fac=? where idcli=?",prifac_z,idcli_z,;
k4; kq,"update clientes set fac=? where idcli=?",prifac_z,idcli_z,;
k5; kp,"tienda=95 order by numcli",;
!(caroal_z)0($C,1)>|;
  k6; kq,"update dircli2 set compra=? where idcli=?",compra_z,#,1,idcli_z,;
|
  k6; kq,"update dirclialta set compra=? where idcli=?",compra_z,#,1,idcli_z,;
.

f2; #imvcli2.i;
k0; ot,mvcli_z,;
k1; kp,"idcli=?",idcli_z,;
!(caroal_z)0($C,1)>|;
  k2; kq,"insert into mvcli2 (idcli,fechamov,coa,concep1,poliza,tipag,recobon,
      import,oper,ace,usuario,conse,feccap,idmvcli,idcobra,idusuario)
      values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
      idcli_mvc,fechamov_mvc,#,3,coa_mvc,#,1,concep1_mvc,poliza_mvc,#,1,
      tipag_mvc,#,1,recobon_mvc,import_mvc,oper_mvc,#,1,ace_mvc,#,1,
      usuario_mvc,#,1,conse_mvc,feccap_mvc,#,2,idmvcli_mvc,idcobra_mvc,idusuario_mvc,;
  k3; kq,"delete from mvcli2 where idmvcli=?",idmvcli_z,;
  k4; kq,"delete from mvcli2 where idcli=? and coa <> 'A'",idcli_z,;
  k5; kq,"update mvcli2 set conse=? + rownum where idcli=? and coa='A' 
      and fechamov=?",conse_z,idcli_z,fechavta_z,#,3,;
| 
  k2; kq,"insert into mvclialta (idcli,fechamov,coa,concep1,poliza,tipag,recobon,
      import,oper,ace,usuario,conse,feccap,idmvcli,idcobra,idusuario)
      values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
      idcli_mvc,fechamov_mvc,#,3,coa_mvc,#,1,concep1_mvc,poliza_mvc,#,1,
      tipag_mvc,#,1,recobon_mvc,import_mvc,oper_mvc,#,1,ace_mvc,#,1,
      usuario_mvc,#,1,conse_mvc,feccap_mvc,#,2,idmvcli_mvc,idcobra_mvc,idusuario_mvc,;
  k3; kq,"delete from mvclialta where idmvcli=?",idmvcli_z,;
  k4; kq,"delete from mvclialta where idcli=? and coa <> 'A'",idcli_z,;
  k5; kq,"update mvclialta set conse=? + rownum where idcli=? and coa='A' 
      and fechamov=?",conse_z,idcli_z,fechavta_z,#,3,;
.

f3; #ifacfon2.i;
k0; ot,facfon_z,;
k1; kp,"idcli=? order by serie,nfac",idcli_z,;
k2; kp,"serie=? and nfac=?",seriefac_z,#,1,nfac_z,;
q+,sqlcmd_z,"delete from ",facfon_z," where idcli=? and serie=? and nfac=?",;
k3; kq,sqlcmd_z,idcli_z,seriefac_z,#,1,nfac_z,;
k4; kq,"insert into facfonalta (idcli,factur,tasa,canti1,concep1,precio1,
	canti2,concep2,precio2,canti3,idfac,precio3,subtot,iva,total,
        nfac,fecha,serie,status,fechayhora,tipo,iduuid) 
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idcli_faf,factur_faf,#,1,tasa_faf,canti1_faf,concep1_faf,
        precio1_faf,canti2_faf,concep2_faf,precio2_faf,canti3_faf,
        idfac_faf,precio3_faf,subtot_faf,iva_faf,total_faf,nfac_faf,
        fecha_faf,#,3,serie_faf,#,1,status_faf,#,1,fechayhora_faf,#,2,
        tipo_faf,iduuid_faf,;
k5; kq,"insert into facfon2 (idcli,factur,tasa,canti1,concep1,precio1,
	canti2,concep2,precio2,canti3,idfac,precio3,subtot,iva,total,
        nfac,fecha,serie,status,fechayhora,tipo,iduuid)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idcli_faf,factur_faf,#,1,tasa_faf,canti1_faf,concep1_faf,
        precio1_faf,canti2_faf,concep2_faf,precio2_faf,canti3_faf,
        idfac_faf,precio3_faf,subtot_faf,iva_faf,total_faf,nfac_faf,
        fecha_faf,#,3,serie_faf,#,1,status_faf,#,1,fechayhora_faf,#,2,
        tipo_faf,iduuid_faf,;
k6; kq,"update facfonalta set tasa=?,canti1=?,concep1=?,
	precio1=?,canti2=?,precio2=?,canti3=?,precio3=?,
        subtot=?,iva=?,total=?,status=?,fechayhora=?,
        tipo=?,iduuid=? where idfac=?",
	tasa_faf,canti1_faf,concep1_faf,precio1_faf,
        canti2_faf,precio2_faf,canti3_faf,precio3_faf,
        subtot_faf,iva_faf,total_faf,status_faf,#,1,fechayhora_faf,#,2,
        tipo_faf,iduuid_faf,idfac_z,;
k7; kq,"update facfon2 set tasa=?,canti1=?,concep1=?,
	precio1=?,canti2=?,precio2=?,canti3=?,precio3=?,
        subtot=?,iva=?,total=?,status=?,fechayhora=?,
        tipo=?,iduuid=? where idfac=?",
	tasa_faf,canti1_faf,concep1_faf,precio1_faf,
        canti2_faf,precio2_faf,canti3_faf,precio3_faf,
        subtot_faf,iva_faf,total_faf,status_faf,#,1,fechayhora_faf,#,2,
        tipo_faf,iduuid_faf,idfac_z,;
k8; kq,"delete from facfonalta where idfac=?",idfac_z,;
k9; kq,"delete from facfon2 where idfac=?",idfac_z,;
k10; kq,"update facfon2 set subtot=round(subtot+?,2),iva=round(iva+?,2),
        total=round(total+?+?,2)
	where idcli=? and idfac=?",
        import_z,iva_z,import_z,iva_z,idcli_z,idfac_z,;
k11; kq,"update facfonalta set subtot=round(subtot+?,2),iva=round(iva+?,2),
        total=round(total+?+?,2)
	where idcli=? and idfac=?",
        import_z,iva_z,import_z,iva_z,idcli_z,idfac_z,;
k12; kp,"idcli=? order by serie,fecha",nfac_z,;
!(caroal_z)0($C,1)>|;
  k13; kq,"update facfon2 set subtot=round(?,2),iva=round(?,2),total=round(?+?,2)
	where idcli=? and idfac=?",
        totimpfac_z,totivafac_z,totimpfac_z,totivafac_z,idcli_z,idfac_z,;
  k14; kq,"update facfon2 set iduuid=? where idfac=?",iduuid_z,idfac_z,;
  k15; kq,"update facfon2 set status = 'A' where idcli=? and idfac=?",
          idcli_z,idfac_z,;
|
  k13; kq,"update facfonalta set subtot=round(?,2),iva=round(?,2),total=round(?+?,2)
	where idcli=? and idfac=?",
        totimpfac_z,totivafac_z,totimpfac_z,totivafac_z,idcli_z,idfac_z,;
  k14; kq,"update facfonalta set iduuid=? where idfac=?",iduuid_z,idfac_z,;
  k15; kq,"update facfonalta set status = 'A' where idcli=? and idfac=?",
          idcli_z,idfac_z,;
       
.

f4; #idircli2.i;
k0; ot,tbdircl_z,;
k1; kp,"idcli=?",idcli_z,;

f5; M
	observ_ind5		s201,
        tma_ind5		s0,;
k0; ot,"car_obsercli",;
k1; kq,"select b.observ from car_obsercli a join car_observs b 
	on a.idobserv = b.idobserv where idcli = ? order by a.idobservcli",
        idcliendoso_z,;
k2; kq,"select nomcomp from car_nombres where idnombre = ?",idnombre_z,;
k3; kq,"select nombre from car_estados where idestado = ?",iddato_z,;

f6; M
	ncon_cpm  		l,
	concepto_cpm  		s31,
        tam_cpm			s0,;
k0; ot,"conceps",;
k1; kq,"select ncon, concepto from conceps where ncon=?",nconcep_z,;
k2; kq,"insert into conceps (ncon,concepto) values (?,?)",
	nconcep_z,concepto_z,#,1,;
k3; kp,"select ncon, concepto from conceps where concepto=?",concepto_z,#,1,;
k4; kq,"call oldbusconcep(?)",concepto_z,#,1,;
!(caroal_z)0($C,1)>|;
  k5; kq,"select idcli, nombre from clientes where idcli = ?",idcli_z,;
|
  k5; kq,"select idcli, nombre from clialta where idcli = ?",idcli_z,;
.
k6; kq,"select idpermis,permis from car_usuarios a join car_permiusuario b
    on a.idusuario = b.idusuario where a.login=? and clave=? and b.idpermis=?",
    logingerente_z,#,1,paswdgte_z,#,1,permisabrefac_z,;
k7; kq,"select cast(0 as integer) as id, nombre from tiendas 
    where  codigo = ?",codcartera_z,#,1,;

f7; M
	ulticon_ind6		l,;
k0; ot,"conceps",;
k1; kq,"select max(ncon) from conceps",;
k2; kq,"select max(idrenfacfo) from renfacfo",;
k3; kq,"select max(idrenfacfo) from renfacfoalta",;
k5; kq,"select max(idfac) from facfon2",;
k6; kq,"select max(idfac) from facfonalta",;
k7; kq,"select max(nfac) from facfon2 where serie=?",seriefac_z,#,1,;
k8; kq,"select max(nfac) from facfonalta where serie=?",seriefac_z,#,1,;
k11; kq,"select max(nref) from refsol where nref > 0",;
k13; kq,"select iddato2 from car_relpobs where iddato1=? and tiporel=?",
  idpob_z,iddato_z,;
k14; kq,"select numero from poblacs where nombre=?",poblac_z,#,1,;
!(caroal_z)0($C,1)>|;
  k9; kq,"select nfac from facfon2 where serie=? and nfac=?",
    nvaseriefac_z,#,1,nvonumfac_z,;
  k10; kq,"update facfon2 set serie=?, nfac=?, concep1=? 
    where serie=? and nfac=?",
    nvaseriefac_z,#,1,nvonumfac_z,nvonumfac_z,seriefac_z,#,1,nfac_z,;
  k12; kq,"select iddato from car_relclis a where idcli=? and tiporel=?",
    idcli_z,REL_NOMCLI,;
  k15; kq,"select max (idmvcli) from mvcli2 where idmvcli > 0",;
  k16; kq,"select max (conse) from mvcli2 where idcli = ? and fechamov = ?",
    idcli_z,fechavta_z,#,3,;
  k17; kq,"select max(idfacfon) from renfacfo where idfacfon = ?",idcli_z,;
  k18; kq,"select count(*) from facfon2 where idcli=? and tipo=?",idcli_z,tipofac_z,;
|
  k9; kq,"select nfac from facfonalta where serie=? and nfac=?",
    nvaseriefac_z,#,1,nvonumfac_z,;
  k10; kq,"update facfonalta set serie=?, nfac=?, concep1=? 
    where serie=? and nfac=?",
    nvaseriefac_z,#,1,nvonumfac_z,nvonumfac_z,seriefac_z,#,1,nfac_z,;
  k12; kq,"select iddato from car_relclialta a where idcli=? and tiporel=?",
    idcli_z,REL_NOMCLI,;
  k15; kq,"select max (idmvcli) from mvclialta where idmvcli > 0",;
  k16; kq,"select max (conse) from mvcli2 where idcli = ? and fechamov = ?",
    idcli_z,fechavta_z,#,3,;
  k17; kq,"select max(idfacfon) from renfacfoalta where idfacfon = ?",idcli_z,;
  k18; kq,"select count(*) from facfonalta where idcli=? and tipo=?",idcli_z,tipofac_z,;
.

f8; #irenfacfo.i;
k0; ot,renfacfon_z,;
k1; kp,"idfacfon=? order by idrenfacfo",idfac_z,;
k2; kq,"insert into renfacfo (idrenfacfo,idfacfon,idcli,codigo,descri,
	serie,preciou,canti,piva,pdsc,importe,descto,iva,cia,folio)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idrenfacfo_rff,idfacfon_rff,idcli_rff,codigo_rff,#,1,
        descri_rff,serie_rff,#,1,preciou_rff,canti_rff,piva_rff,
        pdsc_rff,importe_rff,descto_rff,iva_rff,cia_rff,folio_rff,;
k3; kq,"delete from renfacfo where idfacfon=?",idfac_z,;
k4; kq,"delete from renfacfo where idrenfacfo=?",idrenfac_z,;
k5; kq,"insert into renfacfoalta (idrenfacfo,idfacfon,idcli,codigo,descri,
	serie,preciou,canti,piva,pdsc,importe,descto,iva,cia,folio)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idrenfacfo_rff,idfacfon_rff,idcli_rff,codigo_rff,#,1,
        descri_rff,serie_rff,#,1,preciou_rff,canti_rff,piva_rff,
        pdsc_rff,importe_rff,descto_rff,iva_rff,cia_rff,folio_rff,;
k6; kq,"delete from renfacfoalta where idfacfon=?",idfac_z,;
k7; kq,"delete from renfacfoalta where idrenfacfo=?",idrenfac_z,;
!(caroal_z)0($C,1)>|;
  k8; kq,"update renfacfo set 
        codigo=?,descri=?,serie=?,preciou=?,canti=?,piva=?,pdsc=?,importe=?,
        descto=?,iva=?,folio=? where idrenfacfo=?",
        codigo_rff,#,1,
        descri_rff,serie_rff,#,1,preciou_rff,canti_rff,piva_rff,
        pdsc_rff,importe_rff,descto_rff,iva_rff,folio_rff,idrenfac_z,;
  k9; kq,"update renfacfo set idfacfon=? where idfacfon=?",idfac_z,idcli_z,;
|        
  k8; kq,"update renfacfoalta set
        codigo=?,descri=?,serie=?,preciou=?,canti=?,piva=?,pdsc=?,importe=?,
        descto=?,iva=?,folio=? where idrenfacfo=?",
        codigo_rff,#,1,
        descri_rff,serie_rff,#,1,preciou_rff,canti_rff,piva_rff,
        pdsc_rff,importe_rff,descto_rff,iva_rff,folio_rff,idrenfac_z,;
  k9; kq,"update renfacfoalta set idfacfon=? where idfacfon=?",idfac_z,idcli_z,;
.

f10; M
	serie_ind10		s6,
	factur_ind10		l,
        totfac_ind10		d,
        tipo_ind10		l,
        tam_ind10		s0,;
k0; ot,facfon_z,;
k1; kq,"select serie,nfac,total,tipo from facfon2 
	where idcli=? order by serie,factur",idcli_z,;
k2; kq,"select serie,nfac,total,tipo from facfonalta 
	where idcli=? order by serie,factur",idcli_z,;

f13; #itablefnt.i;
k0; ot,"fonts",;
k1; kp,"impre=? and numero=?",impre_z,font_z,;

f14; #imisdatsol.i;
k0; ot,misdatsol_z,;
k1; kp,"idcli=? and dato=?",idcli_z,iddato_z,;
!(caroal_z)0($C,1)>|;
  k2; kq,"insert into misdatsol (idcli, dato, concep) values (?,?,?)",
    idcli_z,iddato_z,idconcep_z,;
  k3; kq,"update misdatsol set concep=? where idcli=? and dato=?",
    idconcep_z,idcli_z,iddato_z,;
|
  k2; kq,"insert into misdatsolalta (idcli, dato, concep) values (?,?,?)",
    idcli_z,iddato_z,idconcep_z,;
  k3; kq,"update misdatsolalta set concep=? where idcli=? and dato=?",
    idconcep_z,idcli_z,iddato_z,;
.

f15; #irefsol.i;
k0; ot,"refsol",;
k1; kp,"refyobs=?",datosol_z,#,1,;
k2; kp,"nref=?",idconcep_z,;
k3; kq,"insert into refsol (refyobs,nref) values (?,?)",
    refyobs_rfsol,#,1,nref_rfsol,;

f16; #icar_usuarios.i;
k0; ot,"car_usuarios",;
k1; kp,"login=?",login_z,#,1,;
k2; kp,"login=? and clave=?",login_z,#,1,clause_z,#,1,;
k3; kp,"idusuario = ?",idusuario_z,;

* -- Abro la BD INVEN -- *
Ff5; FObdinven.ini~,r~; FGNOBD; Fkmibdinv_z,l; FC; Ff1;
\Haciendo Conexion a:\; pmibdinv_z,0; l;
fd2; O@,mibdinv_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *

f9; #iinven.i;
k0; ot,"inven",;
k1; kp,"codigo=? and cia=?",codigo_z,#,1,cia_z,;
k2; kp,"codigo like ?+'%' and cia=? order by codigo",codigo_z,#,1,cia_z,;

* --> Abro la BD de Cartera para buscar facturas por folio <----*
Ff5; FObdcartera.ini~,r~; FGNOBD; Fkmibdcartera_z,l; FC; Ff1;
GST; \Haciendo Conexion a:\; pmibdcartera_z,0; 
fd3; O@,mibdcartera_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *

f11; M
	nfac_ind11		l,
        serie_ind11		s6,
        numcli_ind11		s11,
        nombre_ind11		s35,
        tam_ind11		s0,;
k0; ot,"facfon2",;
k1; kq,"select nfac, serie, b.numcli, b.nombre from facfon2 a 
	join clientes b on a.idcli = b.idcli 
        where a.nfac = ? and precio2 <> ? order by serie,nfac",
        nfac_z,FAC_TRADICIONAL,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/dlg_msg.i;
#i/programas/lib/ventananom.i;
#i/programas/lib/sacanommes.i;
#i/programas/lib/passw.i;


[PAN; 
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro; tf; GST; tn; t@0,0;
tP/programas/vps/cartera/capfacli.s~;
tL/programas/vps/cartera/capfacli.pos~;
ta0; t@5,0; tBmaxcol_z,5; t@2,0; tBmaxcol_z,11; t@0,0; tBmaxcol_z,13;
^=direc_z,#); Fslexten_z,nemp_z; z0,modul_z,#; z0,modul2_z,#;
q+,modul_z,"Captura Facturas",;
!(codcli_z)0($95,2)>|; 
  q+,modul_z," FONACOT",;
|
  !(codcli_z)0($90,2)>|; 
    q+,modul_z," FIDE",; tL34; s10;
  |
    q+,modul_z," TRADICIONAL",; tL34; s10;
  .
.
(modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[ST; t@13,0; tl; t@13,0; ta1; ta=; ta0; tp; R;
[ST2; t@tope_z,0; tl; ta1; ta=; ta0; tp; R;
[NOCLI; R;
[ERROR3; gFin1;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

*   -->  Variables y Rutina para Reportes Multiples en variables   <--    *
[Fin1; y|;.
[Fin; t@23,0; te; };
