
* Programa de caja (cobranzas)
  DRBR 30-Dic-1992
  --------------------------------------------------------------------------
  Modificado para que apunte en el movimiento del cliente el codigo de la
  poliza donde se capturo
  DRBR 19-May-1993
  ---------------------------------------------------------------------------
  Modificado para que calcule las fechas de vencimentos de las letras, pregunte
  el numero de la letra, si es a cuenta, saldo o completo y el numero de la
  letra o SE para saldo de Enganche
  ---------------------------------------------------------------------------
  Modificado para que use la nueva estructura de movimientos de clientes
  indexados
  DRBR 30-Sep-1993
  Modificado para que tome en Cuenta El Indice de Productividad del Cobratario
  ---------------------------------------------------------------------------
  DRBR 11-Oct-2008
  Modificado para que grabe el folio de bonificacion y que cuando teclee
  el importe verifique que el importe al ser mayor de 1 letra no permita
  que tecleen importes vencidos y por vencer en 1 solo movimiento
  por ejemplo Letras 1-13/13 ( siendo que las letras 1 y 2 estan vencidas 
  y las demas no )
  --------------------------------------------------------------------------
  DRBR 14-May-2009
  Modificado para que no permita capturar conceptos duplicados
  --------------------------------------------------------------------------
  DRBR 4-Jun-2011
  Modificado para que tome en cuenta a los clientes que estan en
  Juridico, que no permita cobrarles.  
  --------------------------------------------------------------------------
  Modificado para que al hacer un abono genere una factura electronica
  DRBR 13-Nov-2012. La factura electronica la genera de los Abonos 
  con Bonificacion. Los abonos con Recargos no los genera, al final del dia
  se generara una factura global del dia de los recargos
*

#i/programas/lib/funkey.i;
#dMLE %-10ld~; #dMDE13 %-13.2f~; #dMDE10 %-10.2f~; #dMDS7 %,7.0f~; #dMIE %-2d~;
#dMLS %10ld~;  #dMDS13 %,13.2f~; #dMDS10 %,10.2f~; #dMIS4 %04d~;   #dMIS %2d~;
#dMDS2 %2.0f~; #dMDS12 %,12.2f~; #dMDS9 %9.2f~; #dMDS102 %10.0f~;  #dMIS02 %02d~;
#dMDE102 %-10.0f~; #dMDE12 %-12.2f~; #dMIS2 %2d~;
#dMLE6 %-6ld~; #dMLS06 %06ld~; #dMDS12A %12.2f~;
#dMLS6 %6ld~;  #dMFS6A %6.0f~; #dMLSA %1ld~;
tsf20;

f0; M
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
	clientesal_z    s80,
	avalsal_z       s80,
	climovsal_z     s80,
	version_z		s20,
	tda_z		s3,
	codigo_z	s11,
	fech5_z    	s10,
	fecvta_z	D,
	antm_z           s2,
	prom_z		s4,
	pueblo_z        s26,
	nombre_z        s35,
	nomcomp_z	s201,
	qin_z            s2,
	ace_z            s2,
	arc_z            s2,
	sdo_z            s2,
	band_z           s2,
	bande_z          s2,
	bandh_z          s2,
	resta_z          s2,
  strfec1_z       s10,
  strfec2_z       s10,
	bandcan_z		s2,
        stranu_z		s5,
        strmes_z		s3,
        strdia_z		s3,
        aux1_z			l,
        aux2_z			l,
        aux3_z			d,
        idcli_z			l,
        status_z		s2,
        diaspla_z		d,
        ltas_z			i,
        bonif_z			d,
        recar_z			d,
        iniciales_z		s5,
        seriefacoricli_z	s6,
        numfacoriginal_z	l,
        uuidfaccli_z		s65,
        cmdfac_z		s200,
        msg_z			s100,
	milinea_z		s100,
	calle_z			s31,
	numpred_z		s31,
	colonia_z		s31,
	codpost_z		s31,
	dircli_z		s31,
	dircli2_z		s31,
	poblac_z		s26,
	regimen_z		s100,
        estado_z		s65,
        pais_z			s65,
        pobsuc_z		s65,
        emailcli_z		s65,
        rfccli_z		s20,
        concep1_z		s31,
        concep2_z		s31,
        devol_z			d,
        bandnom_z                       s2,
        titven_z                        s80,
        appat_z                         s51,
        apmat_z                         s51,
        nompil1_z                       s51,
        nompil2_z                       s51,
        REL_NOMCLI                      l,
        REL_DIRCLI                      l,
        REL_NOMAVA                      l,
        REL_NOMFIDE                     l,
        FAC_TRADICIONAL                 l,
        FAC_FONACOT                     l,
        TIPO_TARJETA_CREDITO_FELIZ      l,
        TIPO_TARJETA_CREDITO_BANCARIA   l,
        NUM_IMPRESIONES_FAC             l,
        precmerc_z		d,
        propfi_z		d,
        fletes_z		d,
        preciou_z		d,
        
	numpagos_z		i,
	spf_z			s2,
	seriefac_z		s6,
	datosol_z		s66,
        archuuid_z		s30,
	idnombre_z		l,
	idfacfon_z		l,
	numfac_z		l,
	iduuid_z		l,
	idrenfacfo_z		l,
	TIPO_FAC_ABONO		l,
	uuid_z			s66,
	archfac_z		s30,
	strnumfac_z		s10,
	iddato_z		l,
	idpob_z			l,
        idusuario_z		l,
        idobservcli_z		l,
        tipoobs_z		l,
        nconcep_z		l,
        idcli2_z		l,
        foliobon_z		l,
        ultfoliobon_z		l,
        fecsig_z	{
          fecsigaa_z		i,
          fecsigmm_z		i,
          fecsigdd_z		i,
        		}
        fecven_z	{
          fecvenaa_z		i,
          fecvenmm_z		i,
          fecvendd_z		i,
          		}
	espar_z			s2,
	cmd_z	{
	  cmd1_z		s41,
	  cmd2_z		s14,
	  	}
	fechapol_z	{
          anupol_z		i,
          mespol_z		i,
          diapol_z		i,
          		}
        feplazo_z		D,
        fechapzo_z	{
          fechapzoaa_z		i,
          fechapzomm_z		i,
          fechapzodd_z		i,
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
        idmvcli_z		l,
        idplazo_z		l,
        idobservs_z		l,
        obsplazo_z		s61,
        conplazo_z		s2,
	fechob2_z         	D,
	vence_z           	D,
	plazos_z          	D,
	tipag_z          	s3,
	fvtafac_z	{
	  fvtafacaa_z		i,
	  fvtafacmm_z		i,
	  fvtafacdd_z		i,
	  fvtafachor_z		i,
	  fvtafacmin_z		i,
	  fvtafacsec_z		i,
	  fvtafacfra_z		i,
	                }
	fevta_z		{
	  fevtaaa_z		i,
	  fevtamm_z		i,
	  fevtadd_z		i,
	  		}
	concep_z    	{
	  conc1_z        	s6,
   	  conc2_z        	s3,
	  conc3_z        	s2,
	  conc3a_z		s1,
	  conc4_z        	s19,
	            	}
	concepto_z       	s31,
	concepmov_z		s31,
	fech3_z     	{
	  dd_z           	s3,
	  mm_z           	s3,
	  aa_z           	s2,
	            	}
	prom2_z          	s3,
	acosde_z         	s2,
	asc_z            	s2,
	tpmov_z          	s2,
        haciabus_z		s2,
	litigante_z     	s31,
	obser_z         	s70,
        obslar_z		s201,
	usuarios_z      	s80,
	teruser_z       	s80,
	mibd_z			s80,
	nombuse_z       	s16,
	clause_z        	s11,
        renst3_z		i,
	ren2a_z           	i,
	col_z			i,
	conse_z            	i,
	conspol_z		i,
        topebajo_z		i,
	nmeses_z			i,
	bandobs_z        	s2,
	obs_z            	s2,
	
        ltaspag_z		i,
        diasmor_z		i,
        diascom_z		i,
        cia_z			i,
        maxrow_z		i,
        maxcol_z		i,
        renst_z			i,
        ind1_z			i,
        ind2_z			i,
        ii_z			i,
	entero_z		i,
	milet_z			i,
	proxlta_z		i,
	tope1_z			i,
	base1_z			i,
	bandb_z			s2,
	bandc_z			s2,
	bndf1_z			s2,
	band4_z			s2,
        bandprog_z		s2,
	iii_z			i,
	
	col1a_z           	i,
	col2a_z           	i,
	ncons_z           	i,
	ltra_z           	s3,
	mone_z           	s2,
	bandm_z          	s2,
	bandmod_z        	s2,
	dias_z            	l,
	fechoy_z		s10,
	fecnva_z		s10,
	milin_z				s100,
	fech8_z				D,
	fecha_z           	D,
	fechb_z           	D,
	fechc_z           	D,
	impmov_z		d,
	rel_z             	d,
	comis_z           	d,
	adeud_z           	d,
	tasa_z            	d,
	difabo_z          	d,
	totlets_z         	i,
	ltapag_z          	i,
	totabo_z          	d,
	aux_z             	d,
	boni_z            	d,
	tot_z             	d,
	saldo_z           	d,
	salcli_z          	d,
	import_z          	d,
	recobon_z         	d,
	recib_z           	d,
	cambio_z          	d,
	cod_z             	d,
	toteng_z          	d,
	pos_z             	l,
	pos2_z            	l,
	pos1_z            	l,
        idcarplazo_z		l,
        vencepzo_z	{
          vencepzoaa_z		i,
          vencepzomm_z		i,
          vencepzodd_z		i,
        		}
        idconcep_z		l,
        idpromotor_z		l,
        idpoliza_z		l,
        idrenpol_z		l,
	nconp_z           	i,
	lta_z             	i,
	letras_z          	i,
	renglos_z         	i,
	xx_z              	i,
	yy_z              	i,
	ren2_z            	i,
	cols_z            	i,
	ntda_z            	i,
	ren_z             	i,
	col1_z            	i,
	col3_z            	i,
	col2_z            	i,
	renbaj_z          	i,
	narts_z           	i,
	col00_z           	i,
	col01_z           	i,
	col02_z           	i,
	col03_z           	i,
	col04_z           	i,
	col05_z           	i,
	col06_z           	i,
	col07_z           	i,
	col08_z           	i,
	col09_z           	i,
	nlets_z           	i,
	ren3c_z           	i,
	col1c_z           	i,
	col2c_z           	i,
	col3c_z           	i,
	col4c_z           	i,
	col5c_z           	i,
	col6c_z           	i,
	arch_z       {
	  nomar_z        	s7,
	  ter_z          	s2,
	  reser_z        	s5,
	             }
	cero_z           	s2,
	pifec_z          	s2,
	bandp_z          	s2,
        sibus_z		 	s2,
	termi_z           	i,
        idpermis_z		l,
	bonifs_z          	d,
	recars_z          	d,
	impors_z          	d,
	efectis_z         	d,
	esp_z             	i,
	exten_z           	i,
	tam0             	s0,;
mtam0&; 
q+,version_z,"V:CB02",; 
* -- 2013-02-06 -- 
  2013-02-14 Modificado para que no imprima el uuid si el cliente no es de 2013
  y para inicializar el dato de serie y tomar el n. de fac del cte
*
(TIPO_FAC_ABONO)=(2);
tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; ts0;
Ff5; FO.cias.ini~,r~;  FG|; | Fkmilin_z,l; . >similin_z,#,cia_z;
z0,milin_z,#; Ff5; FG|; | Fkmilin_z,l; . (seriefac_z)=(milin_z,5);
FC; Ff1;
(nomar_z)=($cajati_,7); >istermi_z,ter_z,%02d~; Ff1; GPAN; GABRE_TABLA;
(idpermis_z)=(11); 
z0,cero_z,#; (tipoobs_z)=(1); * -> 1=Clientes 2=Reportes *
(spf_z)=($|,1);
GTOMA_PARAMETROS;
GDEFINE_REL_CLI;

*  -->  Codigo de Instrucciones de Permisiones de Usuarios    <--  *
ttunombuse_z; qu,nombuse_z,;
[use; GST; \Teclee su Nombre de Usuario : \; t0Fin; inombuse_z,#;
[cla; GST; \Teclee la Clave de Usuario : \; t0use; z0,clause_z,#;
ts2; iclause_z,#;
f4; k1; P; n|; GST; `7; \Usuario Inexistente ...\; Z1; guse; .
(iniciales_z)=(iniciales_use,#); (idusuario_z)=(idusuario_use);
z0,permi_ind14,l; f14; k1; P; n|; f14; k2; P; n|; (permi_ind14)=($N,1); . .
!(permi_ind14)0($N,1)>|;
  GST; `7; \Lo Siento \; pnombre_use,0; \ No tiene Acceso a esta seccion \;
  Z2; gFin;
.
tc;
Ff5; FO.usuario.ini~,w~;
pidusuario_z,MLS; l;
FC;
tr;

GKprog1; GST; ppermi_ind14,0; \:\; pnumpol_use,0; \:\;
(renglos_z)=(14); (renbaj_z)=(18); &a; &cfecha_z; (fech8_z)=(fecha_z); 
&p4fechoy_z; (tda_z)=(numpol_use,#);

!(permi_ind14)0($T,1)>|;
  [fec; t0Fin; t@3,1; \Fecha Poliza:\; &a; &cfecha_z; ifecha_z,+10;
  !(fecha_z)0($-1)>fec; 
  !(maestro_use)5($S,1)>|;
    (ii_z)=(fech8_z)(fecha_z)-(86400)/;
    !(ii_z)1($3)>|;
      z0,msg_z,#; q+,msg_z,"No puede teclear fechas de mas de 3 dias de atraso",;
      GDLG_MSG; gfec;
    .
  .
  &bfecha_z; &p4fecnva_z;
  !(fecnva_z)1(fechoy_z,#)>|;
    z0,msg_z,#; q+,msg_z,"No puede teclear fechas futuras",;
    GDLG_MSG; gfec;
  .
.
!(permi_ind14)0($T,1)>|; 
  [tda; GST2; \Teclee la Sucursal ..\; t@3,26; \Tienda:\; itda_z,2;
  f10; k1; P; n|; GST; \Tienda Inexistente ...\; gtda; . s1; pnombre_cpo,15;
|
  z0,ulticon_ind7,l; f7; k12; P; n|;. 
  !(ulticon_ind7)1($1)>|; 
    (bandb_z)=($P,1); Gbusca2; (tda_z)=(clave_cpo,#);
  | 
    f10; k2; P; n|;. (tda_z)=(clave_cpo,#);
  .
.

t@3,1; \Fecha Poliza:\; pfecha_z,+10; qD,2,fechapol_z,fecha_z,;
t@3,26; \Tienda : \; ptda_z,2;
f10; k1; P; n|; GST; \Tienda Inexistente ...\; gFin1; .
s1; pnombre_cpo,15;
f9; k1; P;
n|; 
  z0,ulticon_ind7,l; f7; k9; P; n|;. (idpoliza_z)=(ulticon_ind7)(1)+; 
  f9; k2; P$;
  f9; k1; P; n|; GERROR9; . 
.
(idpoliza_z)=(idpoliza_pol);
!(status_pol)0($C,1)>|;
  GST; `7; \Poliza Cerrada ...\; Z2; !(permi_ind14)5($T,1)>Fin; gfec;
.
z0,fecha_ind20,l; f20; k1; P; n|;. (fecsig_z)=(fecha_ind20,#);
GST; \Ultima Poliza:\; 
pfecsigaa_z,MIS2; \-\;
pfecsigmm_z,MIS2; \-\;
pfecsigdd_z,MIS2; 
z0,ulticon_ind7,l; f7; k14; P; n|;. (ultfoliobon_z)=(ulticon_ind7);
(foliobon_z)=(ultfoliobon_z)(1)+;
\Ultimo Folio:\; pultfoliobon_z,MLS; \ Siguiente:\; pfoliobon_z,MLS;
(prom_z)=(iniciales_z,3);


{
  (bandmod_z)=($S,1);
  !(permi_ind14)5($x,1)>|;
    [pro2; GST; \Teclee la Clave del Cobratario \;
    tL15; t0CHECA_SI_SALGO; iprom_z,3; f12; k2; P;
    n|; GST; `7; \No hay promotor en el archivo ....\; gpro2; .
  .
  tL15; pprom_z,3; 
  f12; k2; P; 
  n|; GST; `7; \No existe ese cobratario <S> P/Continuar\; y|;. gFin; .
  tL15; pcvepromo_pmt,3; tL16; pnombre_pmt,27;
  (idpromotor_z)=(idpromot_pmt);
  [pasacob;
  { [cod; (sibus_z)=($S,1); t0+; tL00; icodigo_z,10; z0,sibus_z,#;
    f1; k1; P; n|; GST; `7; \Cliente inexistente ...\; g-; . GDESP;
    Gcobran;
  )
  
  [CHECA_SI_SALGO;
  GST; \Si sale de la poliza se cierra y no puede agregar mas.\;
  \ Seguro de salir de la poliza ? <S/N>:\; y|; g+; .
)
!(status_pol)5($S,1)>|;
  (status_pol)=($C,1); f9; k4; P$;
.
gFin;

[TOMA_PARAMETROS;
tc; xcrea_param.bat .polcancel.ini ~;
Ff5; FO.polcancel.ini~,r~;
(ind1_z)=(1);
{ Ff5; FG+;
  z0,milinea_z,#; Fkmilinea_z,l;
  !(ind1_z)0($1)>|; (seriefac_z)=(milinea_z,5);    .
  !(ind1_z)0($2)>|; (pobsuc_z)=(milinea_z,60);     .
  !(ind1_z)0($3)>|; (pais_z)=(milinea_z,60);       .
  !(ind1_z)0($4)>|; (emailcli_z)=(milinea_z,40);   .
  !(ind1_z)0($5)>|; (rfccli_z)=(milinea_z,20);     .
  !(ind1_z)0($6)>|; (regimen_z)=(milinea_z,100);   .
  !(ind1_z)0($7)>|; (bandcan_z)=(milinea_z,1);     .
  (ind1_z)=(ind1_z)(1)+;
)
Ff5; FC; Ff1; tr;
R;

[GRABA_PARAMETROS;
tc;
Ff5; FO.polcancel.ini~,w~;
pseriefac_z,0; l;
ppobsuc_z,0; l;
ppais_z,0; l;
pemailcli_z,0; l;
prfccli_z,0; l;
pregimen_z,0; l;
pbandcan_z,0; l;
Ff5; FC; Ff1; tr;
R;

[pideparam;
GDESPLIEGA_PARAMETROS;
tu1;
GST; \Serie de las Facturas:\; t0R; iseriefac_z,5;
GST; \Poblacion de la Sucursal:\; t0R; ipobsuc_z,30;
GST; \Pais de la Sucursal:\; t0R; ipais_z,30;
GST; \Email del Cte General:\; t0pideparam; tu0; iemailcli_z,30; tu1;
GST; \RFC del Cte General:\; t0R; irfccli_z,30;
GST; \Regimen Fiscal de MDS:\; t0R; iregimen_z,70;
GST; \Solo Genera Nota Credito ? <S/N>:\; t0R; ibandcan_z,1;
GGRABA_PARAMETROS;
R;

[DESPLIEGA_PARAMETROS;
tS1,0,0,23,80; tf; tM;
(ind1_z)=(1);
{ t@ind1_z,3; !(ind1_z)1($7)>+;
  !(ind1_z)0($1)>|; \Serie de Facturas    :\; pseriefac_z,0; .
  !(ind1_z)0($2)>|; \Poblacion de Sucursal:\; ppobsuc_z,0;   .
  !(ind1_z)0($3)>|; \El Pais de Sucursal  :\; ppais_z,0;     .
  !(ind1_z)0($4)>|; \Email Cte General    :\; pemailcli_z,0; .
  !(ind1_z)0($5)>|; \RFC del Cte General  :\; prfccli_z,0;   .
  !(ind1_z)0($6)>|; \Regimen Fiscal de MDS:\; pregimen_z,0;  .
  !(ind1_z)0($7)>|; \Cancelacion Auxiliar :\; pbandcan_z,0;  .
  (ind1_z)=(ind1_z)(1)+;
)
\Presione <S> P/Continuar\; y|;.
tS0;
R;

[cobran;
tL35; s10; tL36; s50;
!(permi_ind14)5($T,1)(permi_ind14)5($A,1)&>|;
  GST; `7; \Lo Siento \; pnombre_use,#; \ No puedes agregar...\; Z1; gR;
.
(totlets_z)=(nulet1_cli)(nulet2_cli)+; (toteng_z)=(enganc_cli)(servic_cli)+;
(ltapag_z)=(abonos_cli)(enganc_cli)-(servic_cli)-(canle1_cli)/;
(totabo_z)=(ltapag_z)(canle1_cli)*(enganc_cli)+(servic_cli)+;
(ltapag_z)=(ltapag_z)(1)+; (fevta_z)=(fechavta_cli,#);
!(bandcan_z)5($S,1)>|;
  f27; k1; P;
  n|; |
    z0,msg_z,#; q+,msg_z,"Este cliente ya esta cancelado",; GDLG_MSG; R;
  .

  f5; k1; P;
  n|;
    z0,msg_z,#; q+,msg_z,"Cliente sin recoja",; GDLG_MSG; R;
  |
    !(devuel_rec)0($S,1)>|;
      z0,msg_z,#; q+,msg_z,"Recoja devuelta",; 
      GDLG_MSG; R;
    .
  .
.
z0,appat_z,#; >istotlets_z,appat_z,MIS2;
!(totabo_z)2(abonos_cli)>|;
  (difabo_z)=(canle1_cli)(abonos_cli)(totabo_z)--; (acosde_z)=($S,1);
  GST2; \Debe ser un Saldo de la Letra \; pltapag_z,MIS; \/\; ptotlets_z,MIS2;
  \ Por : \; pdifabo_z,MDS13; (asc_z)=($S,1); >isltapag_z,ltra_z,MIS2;
  z0,concep1_z,#; q+,concep1_z,"SDO ",ltra_z,"/",appat_z,;
  !(ltapag_z)2(totlets_z)>|; q+,concep1_z," - ",appat_z,"/",appat_z,; .
|
  z0,acosde_z,#;
  !(abonos_cli)2(toteng_z)>|;
    (acosde_z)=($S,1); (difabo_z)=(toteng_z)(abonos_cli)-; z0,ltapag_z,#;
    GST2; \Debe ser un Saldo de Enganche por : \; pdifabo_z,MDS13;
    (asc_z)=($S,1); (ltra_z)=($SE,2);
    z0,concep1_z,#; q+,concep1_z,"SDO ENG","/",appat_z,;
    !(ltapag_z)2(totlets_z)>|; q+,concep1_z," - ",appat_z,"/",appat_z,; .
  |
    GST2; \Debe Abonar la Letra \; pltapag_z,MIS; \/\; ptotlets_z,MIS2;
    (asc_z)=($C,1); >isltapag_z,ltra_z,MIS2;
    z0,concep1_z,#; q+,concep1_z,"LTA ",ltra_z,"/",appat_z,;
    !(ltapag_z)2(totlets_z)>|; q+,concep1_z," - ",appat_z,"/",appat_z,; .
  .
.
(lta_z)=(ltapag_z); (milet_z)=(lta_z); GCALCUVEN; (vence_z)=(fechb_z); 
tL17; pvence_z,+10; (adeud_z)=(0);
(dias_z)=(fecha_z)(vence_z)-(86400)/; tL34; s70; 
!(cargos_cli)1(abonos_cli)>|;
  !(dias_z)3($12)>|;
    (proxlta_z)=(milet_z);
    { 
      (milet_z)=(milet_z)(1)+; GCALCUVEN; (vence_z)=(fechb_z);
      (dias_z)=(fecha_z)(vence_z)-(86400)/;
      * -- lo pongo como comentario para que no salga
        GST; \Lta:\; pmilet_z,MIS2; \ Vence:\; pvence_z,+10; 
        \ Dias:\; pdias_z,MLS6; y|;.
      *
      !(dias_z)2($12)>+; (proxlta_z)=(proxlta_z)(1)+; 
      !(proxlta_z)1(nulet1_cli)>+;
    )
    (milet_z)=(proxlta_z);
    !(milet_z)1(nulet1_cli)>|; (milet_z)=(nulet1_cli); .
    (adeud_z)=(enganc_cli)(servic_cli)+(milet_z)(canle1_cli)*+(abonos_cli)-;
    tL34; \Cliente Atrasado \; pdias_z,MIS2; 
    \ Dias. Adeudo: \; padeud_z,MDS12; \ Mas recargos \; 
  .
.
(import_z)=(salcli_z);
!(fechavtaYear_cli)1($2012)>|;
  GBUSCA_UUIDFACVTA;
  Fslexten_z,uuidfaccli_z;
  !(exten_z)5($36)>|;
    z0,msg_z,#; q+,msg_z,"Uuid Venta Incorrecto:",uuidfaccli_z,;
    GDLG_MSG;
  .
.

[impd; GST;  \Teclee el Importe Devuelto...\; 
tL13; t0R; idevol_z,MDE12,MDS12;
[impr; GST;  \Teclee el Importe a Cancelar...\; 
tL14; t0impd; iimport_z,MDE12,MDS12;
[conc; GST; \Concepto...\; t0impr; tL09; iconcep1_z,30;
[con2; GST; \Continuacion del Concepto...\; 
t0conc; tL10; iconcep2_z,30;
(asc_z)=($S,1);
GCALCUVEN; (vence_z)=(fechb_z); tL17; pvence_z,+10;
(dias_z)=(fecha_z)(vence_z)-(86400)/;
(tpmov_z)=($B,1); (concep_z)=(concep1_z);
tL09; pconcep_z,30;
(recobon_z)=(0); 
(tipag_z)=($NE,2);
(rel_z)=(salcli_z)(.01)+;
(boni_z)=(recobon_z); (boni_z)=(recobon_z)(-1)*;
(tot_z)=(import_z)(boni_z)+; z0,comis_z,#;
z0,concepto_z,#; (concepto_z)=(concep1_z,#); GBUSCONCEP; 
f8; k4; P; 
n|; | 
  z0,msg_z,#; 
  q+,msg_z,"Ya existe un movimiento con ese concepto...",;
  GDLG_MSG; R;
.
(recib_z)=(tot_z); z0,conplazo_z,#;
GST; \Estan Correctos los datos ? <S/N> : \;
y|;
  GAGREMOV; 
  GST2; GST; \ Presione <S> Para Continuar \; y|;.
.
GCLR;
R;


[PIDE_PLAZO;
z0,band_z,#;
[fpl; GST; \Cliente continua atrasado, pida el plazo de proxima cobranza\;
tL35; (feplazo_z)=(fecha_z)(86400)(7)*+; t0R; ifeplazo_z,+10;
!(feplazo_z)0($-1)>fpl; (conplazo_z)=($S,1);
[obp; GST; \Teclee las Observaciones del plazo...\;
tL36; t0fpl; iobsplazo_z,50; Fslexten_z,obsplazo_z;
!(exten_z)2($1)>|; 
  z0,msg_z,#; 
  q+,msg_z,"Debe proporcionar el concepto del plazo...",; 
  GDLG_MSG; gobp;
.
(band_z)=($S,1);
R;

[CALCUCOM; R;

[CALCUVEN;
(fecsig_z)=(fechavta_cli,#); GCALCUVENCTO;
R;

[CALCUVENCTO;
!(qom_cli)0($Q,1)>|;
  (ind1_z)=(milet_z)(2)/; (nmeses_z)=(ind1_z); 
  (iii_z)=(milet_z)(nmeses_z)(2)*-;
  !(iii_z)0($0)>|; GSUMA_IND1_MESES; | GSUMA_IND1_MESES_SIN_VALIDAR; .
  (ind1_z)=(milet_z)(nmeses_z)(2)*-;
  !(ind1_z)1($0)>|;
    (ind1_z)=(fecsigdd_z)(15)+; 
    !(ind1_z)1($30)>|; 
      (nmeses_z)=(ind1_z)(30)-; (ind1_z)=(1); GSUMA_IND1_MESES;
      (fecsigdd_z)=(nmeses_z);
    |
      (fecsigdd_z)=(ind1_z);
    .  
  .
|
   (ind1_z)=(milet_z); GSUMA_IND1_MESES;
.
GVALIDA_FECHA;
qD,1,fecsig_z,fechb_z,;
!(milet_z)0($0)>|; 
  !(qom_cli)0($Q,1)>|; (ind1_z)=(7); .
  !(qom_cli)0($M,1)>|; (ind1_z)=(15); .
  (fechb_z)=(fechb_z)(ind1_z)(86400)*+;  
.
R;

* --> Calculo el importe vencido <---- *
qD,1,fevta_z,fechc_z,;
(adeud_z)=(cargos_cli)(abonos_cli)-; @adeud_z,100;
!(qom_cli)0($Q,1)>|; (diaspla_z)=(15.2); | (diaspla_z)=(30.4); .
(ltas_z)=(fecha_z)(fechc_z)-(86400)/(diaspla_z)/;
!(ltas_z)1(nulet1_cli)>|; (ltas_z)=(nulet1_cli); .
(adeud_z)=(enganc_cli)(servic_cli)+(canle1_cli)(ltas_z)*+(abonos_cli)-;
R;

[listaven;
f1; k1; P; nR; GST; \Presione <S> Para Continuar...\;
tS5,10,0,13,80; tf; tM; (ren_z)=(1);
(ren_z)=(1); (col09_z)=(1);
!(letra1_cli)5($0)>|;
  (milet_z)=(0); GCALCUVEN;
  t@ren_z,col09_z; tn; \ 1/1 : \; tp; pfechb_z,+10; (ren_z)=(ren_z)(1)+;
.
(nlets_z)=(1);
(totlets_z)=(nulet1_cli)(nulet2_cli)+;
{ !(nlets_z)1(totlets_z)>+;
  (milet_z)=(nlets_z); GCALCUVEN;
  !(ren_z)1($9)>|; (ren_z)=(1); (col09_z)=(col09_z)(18)+; .
  t@ren_z,col09_z; tn; pnlets_z,MIS; \/\; ptotlets_z,MIS2; \: \; tp;
  pfechb_z,+10;
  (ren_z)=(ren_z)(1)+;
  (nlets_z)=(nlets_z)(1)+;
)
t@11,1; \Presione <S> P/Continuar...\; y|;. tS0;
R;

[CHECA;
(bandm_z)=($S,1); R;
!(mone_z)0($N,1)>|;
  !(aux_z)1($5000)>|;
    z0,bandm_z,#;
    GST; `7; \Estas seguro de que son \; ta3; paux_z,MDS13; ta0; tp;
    \ Nuevos Pesos ? <S/N> : \; y|; (band_z)=($S,1); .
  |
    z83,bandm_z,#;
  .
|
  z83,bandm_z,#;
.
R;

[DESP;
tL00; pnumcli_cli,0; tL01; pnombre_cli,0; tL02; pdirec_cli,0;
tL03; ppoblac_cli,0; tL04; pcargos_cli,MDS13; tL05; pabonos_cli,MDS13;
(salcli_z)=(cargos_cli)(abonos_cli)-; tL06; psalcli_z,MDS13; &bfecha_z;
tL20; pletra1_cli,MDS13; tL21; pnulet1_cli,MIS2; tL22; pcanle1_cli,MDS13;
tL23; pbonifi_cli,MDS13;
!(fechavtaYear_cli)3($93)>|; (mone_z)=($N,1); | (mone_z)=($P,1); .
(codigo_z)=(numcli_cli,#); qD,1,fechavta_cli,fecvta_z,; &bfecvta_z;
(status_z)=(status_cli,#); &p4fech5_z; (idcli_z)=(idcli_cli);
R;

[CLR;
tL01; s34; tL02; s25,#; tL03; s25; tL04; s13; tL05; s13; tL06; s13; tL08; s2;
tL09; s15; z0,concepto_z,#;
tL11; s1; z0,tipag_z,#; tL12; s12; tL13; s10; tL14; s13; tL16; s27;
tL17; s8; tL18; s1; tL19; s2;
R;

[OBTENDATO;
z0,idcli_mdsol,l; f24; k1; P; n|;. (idconcep_z)=(concep_mdsol);
z0,refyobs_rfsol,l; f21; k2; P; n|;.
R;

[OBTEN_EDOYPAIS;
z0,iddato_ind25,l;  f25; k1; P; n|;. (iddato_z)=(iddato_ind25);
z0,idobserv_obs,l; f18; k4; P; n|;.
R;

[GENERA_CFDI;
GST; \Estoy en GENERA_CFDI \;
&a; &cfech8_z; 
&bfech8_z; &p4strfec2_z; &bfecha_z; &p4strfec1_z;
* --> Checo si es dias anteriores <-- *
!(strfec2_z)1(strfec1_z,#)>|; (fech8_z)=(fech8_z)(3600)+; .
qD,4,feccap_z,fech8_z,;

(feccapaa_z)=(fechaYear_pol);
(feccapmm_z)=(fechaMon_pol);
(feccapdd_z)=(fechaDay_pol);
(ii_z)=(fech8_z)(fecha_z)-(86400)/;
GST; \Fech8:\; pfech8_z,+10; s1; pstrfec2_z,0; \ Fecha:\; pfecha_z,+10; s1; pstrfec1_z,0; 
!(ii_z)1($3)>|;
  &a; &cfech8_z; (fech8_z)=(fech8_z)(86400)(2)*-; 
  qD,4,feccap_z,fech8_z,;
.
GST; \ Fecha Movida:\; pfeccapdd_z,MIS02; 
pfeccapmm_z,MIS02;
pfeccapaa_z,MIS2; \:\;
pfeccaphor_z,MIS02; \:\;
pfeccapmin_z,MIS02; \:\;
pfeccapsec_z,MIS02;
tS1,0,0,23,80; 
z0,ulticon_ind7,l; f7; k17; P; n|;. (numfac_z)=(ulticon_ind7)(1)+;
GST; \Seriefac:\; pseriefac_z,0; \ Ultimo:\; pnumfac_z,MLS6; 
GBUSCA_FACLIBRE;

tc;
z0,idobserv_obs,l; f18; k3; P; n|;. (nomcomp_z)=(observ_obs,#);
!(nomcomp_z)2($ ,1)>|; (nomcomp_z)=(nombre_cli,#); .

(iddato_z)=(640); GOBTENDATO; (calle_z)=(refyobs_rfsol,#);
(iddato_z)=(641); GOBTENDATO; (numpred_z)=(refyobs_rfsol,#);
(iddato_z)=(642); GOBTENDATO; (colonia_z)=(refyobs_rfsol,#);
(iddato_z)=(643); GOBTENDATO; (codpost_z)=(refyobs_rfsol,#);
z0,seriefacoricli_z,#; z0,uuidfaccli_z,#; (numfacoriginal_z)=(fac_cli); 
!(fechavtaYear_cli)3($2013)>|;
  f22; k3; P; 
  n|; |
    (numfacoriginal_z)=(nfac_faf); (seriefacoricli_z)=(serie_faf,#);
    (fvtafac_z)=(fechayhora_faf,#);
    z0,refyobs_rfsol,l; (idconcep_z)=(iduuid_faf); f21; k2; P; n|;. 
    (uuidfaccli_z)=(refyobs_rfsol,#);
  .
.
Fslexten_z,uuidfaccli_z; !(exten_z)5($36)>|; z0,uuidfaccli_z,#; .
!(calle_z)2($ ,1)(numpred_z)2($ ,1)&>|; 
  (calle_z)=(direc_cli,#); (numpred_z)=(direc2_dcl,#);
.

(precmerc_z)=(precon_cli);
(fletes_z)=(servic_cli)(piva_cli)(100)/(1)+/;
(poblac_z)=(poblac_cli,#); z0,iddato_ind25,l;  f25; k2; P; n|;.
(idpob_z)=(iddato_ind25); (iddato_z)=(2); 
GOBTEN_EDOYPAIS; (estado_z)=(observ_obs,65);
(idpob_z)=(iddato_z); (iddato_z)=(3); 
GOBTEN_EDOYPAIS; (pais_z)=(observ_obs,65);

(numpagos_z)=(nulet1_cli); !(numpagos_z)2($1)>|; (numpagos_z)=(1); .
z0,strnumfac_z,#; >lsnumfac_z,strnumfac_z,MLS06;
z0,archfac_z,#; q+,archfac_z,seriefac_z,strnumfac_z,".txt",;
z0,archuuid_z,#; q+,archuuid_z,seriefac_z,strnumfac_z,".uuid.txt",;

Ff4; FO(archfac_z),w~;
(concepmov_z)=(concep_z,#);
(numpagos_z)=(nulet1_cli); !(numpagos_z)2($1)>|; (numpagos_z)=(1); .
(impmov_z)=(import_z)(piva_cli)(100)/(1)+/;
GIMPRIME_REN_LAYOUT;
!(recobon_z)5($0)>|;
  !(tipag_z)0($AB,2)>|;
    (impmov_z)=(recobon_z)(-1)*(piva_cli)(100)/(1)+/;
    z0,concepmov_z,#;  q+,concepmov_z,"BONIFICACION",;
    GIMPRIME_REN_LAYOUT;
  .
  !(tipag_z)0($AR,2)>|;
    (impmov_z)=(recobon_z)(piva_cli)(100)/(1)+/;
    z0,concepmov_z,#;  q+,concepmov_z,"RECARGOS",;
    GIMPRIME_REN_LAYOUT;
  .
  * --> Agrego el Mov de Cancelacion <-- *
.
(impmov_z)=(0);
z0,concepmov_z,#; q+,concepmov_z,concep2_z,;
GIMPRIME_REN_LAYOUT;
FC;
z0,cmdfac_z,#; q+,cmdfac_z,"generafac.bat ",archfac_z,;
x(cmdfac_z);
Ff5; FO(archuuid_z),r~;
Ff5; FGFIN_TOMA_UUID; 
z0,milinea_z,#; Fkmilinea_z,l; (uuid_z)=(milinea_z,60);
FC;
Ff1; tf; tr; tS0;
GST; \El uuid es:\; puuid_z,0;
GGRABA_UUID_EN_RENPOL2;
R;

[BUSCA_UUIDFACVTA;
z0,uuidfaccli_z,#;
f22; k3; P; 
n|; |
  (numfacoriginal_z)=(nfac_faf); (seriefacoricli_z)=(serie_faf,#);
  (fvtafac_z)=(fechayhora_faf,#);
  z0,refyobs_rfsol,l; (idconcep_z)=(iduuid_faf); f21; k2; P; n|;. 
  (uuidfaccli_z)=(refyobs_rfsol,#);
.
R;

[CALCU_FLOAT_SINESPACIOS;
(aux1_z)=(aux3_z);
(aux2_z)=(aux3_z)(aux1_z)-(100)*; !(aux2_z)2($0)>|; (aux2_z)=(aux2_z)(-1)*; .
paux1_z,MLSA; \.\; paux2_z,MLSA;
R;

[IMPRIME_REN_LAYOUT;
pspf_z,0; 
pnumfac_z,MLSA; pspf_z,0;
pseriefac_z,0; pspf_z,0;
pnomcomp_z,0; pspf_z,0;
prfccli_z,0; pspf_z,0;
ppais_z,0; pspf_z,0;
pestado_z,0; pspf_z,0;
* Municipio del Cte * ppoblac_cli,0; pspf_z,0;
ppoblac_cli,0; pspf_z,0;
pcalle_z,0; pspf_z,0;
!(numpred_z)2($ ,1)>|; \0\; . pnumpred_z,0; pspf_z,0;
* num int.* \0\; pspf_z,0;
!(colonia_z)2($ ,1)>|; \0\; . pcolonia_z,0; pspf_z,0;
!(codpost_z)2($ ,1)>|; \97000\; . pcodpost_z,0; pspf_z,0;
pfeccapdd_z,MIS02; 
pfeccapmm_z,MIS02;
pfeccapaa_z,MIS2; \:\;
pfeccaphor_z,MIS02; \:\;
pfeccapmin_z,MIS02; \:\;
pfeccapsec_z,MIS02; pspf_z,0;
* Unidad Medida * \NO APLICA\; pspf_z,0;
* Cantidad * \1\; pspf_z,0;
(aux3_z)=(impmov_z); pimpmov_z,MDS12A; * GCALCU_FLOAT_SINESPACIOS; * pspf_z,0;
pconcepmov_z,0; pspf_z,0; 
* Codigo de Articulo * pspf_z,0;
(aux1_z)=(piva_cli); paux1_z,MLSA; pspf_z,0; 
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
  \Pago en una sola exhibicion\;
|
  \Pago en parcialidades\; 
.
pspf_z,0;
* Condiciones de Pago*
!(numpagos_z)1($1)>|;
   \CONTADO\;
|
  \CREDITO\; 
.
pspf_z,0;

* Metodo de Pago* \01 EFECTIVO\; pspf_z,0;
* Correo del Cliente* pemailcli_z,0; pspf_z,0;
* Leyenda1 = Valor Mercancias * pspf_z,0;
* Leyenda2 = Transporte de Mercancias * pspf_z,0;
* Leyenda3 = Prod.Financieros * pspf_z,0;
* Leyenda4 = Numero de Letras y Tipo Q/M/C * pspf_z,0;
* Leyenda5 = Precio de las Letras * pspf_z,0;
* Leyenda6 = Importe del Enganche * pspf_z,0;
* Leyenda7 = Importe del Enganche * pspf_z,0;
* NumCta del Banco con que pago* pspf_z,0;
* Lugar Expedicion * ppobsuc_z,0; pspf_z,0;
* Regimen * pregimen_z,0; pspf_z,0;
* Cuando es pago va el UUID * puuidfaccli_z,0; pspf_z,0;
* Cuando es pago va El Total del Folio Fiscal Original * 
pnumfacoriginal_z,MLSA; pspf_z,0;
* Cuando es pago va la Fecha Folio Fiscal Original * 
!(uuidfaccli_z)2($ ,1)>|;
  pfechavtaDay_cli,MIS02; 
  pfechavtaMon_cli,MIS02;
  pfechavtaYear_cli,MIS02;
|
  pfvtafacdd_z,MIS02; 
  pfvtafacmm_z,MIS02;
  pfvtafacaa_z,MIS02;
  \:\; pfvtafachor_z,MIS02; \:\; pfvtafacmin_z,MIS02; \:\; pfvtafacsec_z,MIS02;
.
pspf_z,0;
* Cuando es pago va El Total del Folio Fiscal Original * 
(aux3_z)=(cargos_cli); pcargos_cli,MDS12A; * GCALCU_FLOAT_SINESPACIOS; * pspf_z,0;
l;
R;

[GRABA_UUID_EN_RENPOL2;
z0,datosol_z,#; (datosol_z)=(uuid_z,#); f21; k1; P;
n|;
  z0,ulticon_ind7,l;
  f7; k15; P; n|;. (idconcep_z)=(ulticon_ind7)(1)+;
  (refyobs_rfsol)=(datosol_z,#); (nref_rfsol)=(idconcep_z);
  f21; k3; P$;
|
  (idconcep_z)=(nref_rfsol);
.
(iduuid_z)=(idconcep_z);
z0,ulticon_ind7,l; f7; k16; P; n|;. (idfacfon_z)=(ulticon_ind7)(1)+;
f22; z0,idcli_faf,l; (idcli_faf)=(idcli_z);
(idfac_faf)=(idfacfon_z);
!(tipag_z)0($AB,2)>|;
  (subtot_faf)=(import_z)(recobon_z)-(piva_cli)(100)/(1)+/;
  (total_faf)=(import_z)(recobon_z)-;
|
  (subtot_faf)=(import_z)(recobon_z)+(piva_cli)(100)/(1)+/;
  (total_faf)=(import_z)(recobon_z)+;
.
@subtot_faf,100;
(iva_faf)=(subtot_faf)(piva_cli)(100)/*; @iva_faf,100;
(nfac_faf)=(numfac_z); qD,2,fecha_faf,feccap_z,;
(fechayhora_faf)=(feccap_z,#);
(serie_faf)=(seriefac_z,#); (status_faf)=($C,1);
(tipo_faf)=(TIPO_FAC_ABONO);
(iduuid_faf)=(iduuid_z);
(fecha_faf)=(fechapol_z,#);
f22; k2; P$;
(concepmov_z)=(concep_z,#); (impmov_z)=(import_z);
GAGREGA_RENFAFO;
!(recobon_z)5($0)>|;
  !(tipag_z)0($AB,2)>|;
    (impmov_z)=(recobon_z)(-1)*; z0,concepmov_z,#; 
    q+,concepmov_z,"BONIFICACION",;  GAGREGA_RENFAFO;
  .
  !(tipag_z)0($AR,2)>|;
    (impmov_z)=(recobon_z); z0,concepmov_z,#; 
    q+,concepmov_z,"RECARGOS",; GAGREGA_RENFAFO;
  .
.
GLIBERA_FAC_LIBRE;
R;

[AGREGA_RENFAFO;
z0,ulticon_ind7,l; f7; k18; P; n|;. (idrenfacfo_z)=(ulticon_ind7)(1)+;
z0,concepto_z,#; (concepto_z)=(concepmov_z,#); GBUSCONCEP;
z0,idrenfacfo_rff,l;
(idrenfacfo_rff)=(idrenfacfo_z);
(idfacfon_rff)=(idfacfon_z);
(idcli_rff)=(idcli_z);
(codigo_rff)=($AUXILIAR,8);
(descri_rff)=(nconcep_z);
(preciou_rff)=(impmov_z)(piva_cli)(100)/(1)+/; @preciou_rff,100;
(canti_rff)=(1);
(piva_rff)=(piva_cli);
(pdsc_rff)=(0);
(importe_rff)=(preciou_rff); @importe_rff,100;
(descto_rff)=(0);
(iva_rff)=(impmov_z)(preciou_rff)-; @iva_rff,100;
(cia_rff)=(cia_z);
f23; k2; P$;
R;

[BUSCA_FACLIBRE; 
{
  f26; k1; P; n+;
  (numfac_z)=(numfac_z)(1)+;
)
z0,serie_fsol,l;
(serie_fsol)=(seriefac_z,#);
(numero_fsol)=(numfac_z);
(poliza_fsol)=(tda_z,#);
(status_fsol)=($A,1);
(horasol_fsol)=(feccap_z,#);
(cia_fsol)=(1);
\ Voy a ejecutar f26 k2 \;
\Serie:\; pseriefac_z,0; 
\Numero:\; pnumfac_z,MLS6;
\Pza:\; ptda_z,0;  
\feccap:\; pfeccapaa_z,MIS2; \-\; pfeccapmm_z,MIS2; \-\; pfeccapdd_z,MIS2;
\ \; pfeccaphor_z,MIS2; \:\; pfeccapmin_z,MIS2; \:\; pfeccapsec_z,MIS2; 
\ \; pfeccapfra_z,MIS2;  
\ Status:\; pstatus_z,0; 
f26; k2; P$;
\ Ya ejecute f26 k2 \;                       
R;

[LIBERA_FAC_LIBRE; f26; k3; P$; R;

[AGREMOV;
z0,iduuid_z,#; z0,idfacfon_z,#; z0,bande_z,#;
(nmeses_z)=(nulet1_cli); !(qom_cli)0($Q,1)>|; (nmeses_z)=(nmeses_z)(2)/; .
!(fechavtaYear_cli)1($2012)>|;
  (bande_z)=($S,1);
|
  !(nmeses_z)2($13)>|; (bande_z)=($S,1); .
.

!(import_z)1($0)(bande_z)0($S,1)&>|;
  GGENERA_CFDI;
  !(uuid_z)0($-1,2)>|; 
    GST; \No se pudo generar el uuid Voy a Continuar...\; 
  .
.
!(bandcan_z)0($S,1)>R; (ace_z)=($C,1);
* --> Si es de Cancelacion auxiliar es solo para generar el CFDI <-- *
qD,2,fecven_z,vence_z,;
z0,concepto_z,#; (concepto_z)=(concep_z,#); GBUSCONCEP;
(codigo_z)=(numcli_cli,#);
(salcli_z)=(cargos_cli)(abonos_cli)-(import_z)-; @salcli_z,100;
z0,ulticon_ind7,l; f7; k10; P; n|;. (idrenpol_z)=(ulticon_ind7)(1)+;
z0,ulticon_ind7,l; f7; k11; P; n|;. (conspol_z)=(ulticon_ind7)(1)+;
&a; &cfech8_z; qD,4,feccap_z,fech8_z,;
f8; k3; P$;
z0,ulticon_ind7,l; f7; k7; P; n|;. (idmvcli_z)=(ulticon_ind7)(1)+;
z0,ulticon_ind7,l; f7; k8; P; n|;. (conse_z)=(ulticon_ind7)(1)+;
f3; k3; P$;
!(salcli_z)2($1)>|; (fecsal_cli)=(fechapol_z,#); .
f1; k4; P$; f1; k1; P; n|;. 
tL04; pcargos_cli,MDS13; tL05; pabonos_cli,MDS13; tL06; psalcli_z,MDS13;
!(tipo_rpo)0($AB,2)>|; (bonif_z)=(recobon_z); | (recar_z)=(recobon_z); .
f9; k3; P$;

z0,fecha_can,l; (fecha_can)=(fechapol_z,#); (codcli_can)=(codigo_z,#);
(impor_can)=(import_z); (devol_can)=(devol_z); (adeud_can)=(adeud_z);
!(ticte_cli)0($FN,2)>|; (foc_can)=($F,1); | (foc_can)=($C,1); .
f27; k2; P$;

* --> Ahora agrego el 2do Mov <--*
z0,concepto_z,#; (concepto_z)=(concep2_z,#); GBUSCONCEP;
(codigo_z)=(numcli_cli,#); z0,import_z,#; z0,recobon_z,#;
z0,ulticon_ind7,l; f7; k10; P; n|;. (idrenpol_z)=(ulticon_ind7)(1)+;
z0,ulticon_ind7,l; f7; k11; P; n|;. (conspol_z)=(ulticon_ind7)(1)+;
&a; &cfech8_z; qD,4,feccap_z,fech8_z,;
f8; k3; P$;

z0,ulticon_ind7,l; f7; k7; P; n|;. (idmvcli_z)=(ulticon_ind7)(1)+;
z0,ulticon_ind7,l; f7; k8; P; n|;. (conse_z)=(ulticon_ind7)(1)+;
f3; k3; P$;
!(salcli_z)2($1)>|; (fecsal_cli)=(fechapol_z,#); .
f1; k4; P$; f1; k1; P; n|;. 
tL04; pcargos_cli,MDS13; tL05; pabonos_cli,MDS13; tL06; psalcli_z,MDS13;
R;

[AGREGA_PLAZO;
qD,2,fechapzo_z,feplazo_z,;
z0,obslar_z,#;
z0,fech5_z,#; >isfechapzodd_z,fech5_z,MIS02;
q+,obslar_z,"Plazo:",fech5_z,"-",;
z0,fech5_z,#; >isfechapzomm_z,fech5_z,MIS02;
q+,obslar_z,fech5_z,"-",;
z0,fech5_z,#; >isfechapzoaa_z,fech5_z,MIS4;
q+,obslar_z,fech5_z," ",obsplazo_z,;
z0,idconcep_con,l; f18; k2; P; n|;. (idobservs_z)=(idobserv_obs);
f7; k5; P;
n|;
  z0,ulticon_ind7,l; f7; k6; P; n|;. (idobservcli_z)=(ulticon_ind7)(1)+;
  z0,idobservcli_obc,l; (idobservcli_obc)=(idobservcli_z);
  (idcli_obc)=(idcli_z); (fecha_obc)=(fechapol_z,#); 
  (tipoobs_obc)=(tipoobs_z); (idobserv_obc)=(idobservs_z); f19; k2; P$;
.
f16; k3; Qsigpzo1; P$; [sigpzo1;
z0,ulticon_ind7,l; f7; k2; P; n|;. (idplazo_z)=(ulticon_ind7)(1)+;
z0,idcarplazo_pzo,l; (idcarplazo_pzo)=(idplazo_z); (idcli_pzo)=(idcli_z);
(fecha_pzo)=(fechapol_z,#); (vence_pzo)=(fechapzo_z,#); 
(idconcep_pzo)=(idobservs_z); (idusuario_pzo)=(idusuario_z);
(idpromotor_pzo)=(idpromotor_z); (cia_pzo)=(cia_z); (poliza_pzo)=(tda_z,#);
f16; k2; P$;
R;

[BUSCONCEP; z0,ncon_cpm,l; f6; k4; P; n|;. (nconcep_z)=(ncon_cpm); R;

[nvoreg; R;

[NOPDAGF5; GST; `7; \No pude agregar registro en recojas...\; Z2; R;
[NOPDMDF5; GST; `7; \No pude modificar registro en recojas...\; Z2; R;
[NOPDAGF6; GST; `7; \No pude agregar regisitro en litigio...\; Z2; R;

[AGREGACOM;
R;

[repor; GDESPMOVNSDO; R;

[DESPMOVNSDO;
(cmd1_z)=($vpg4s /programas/vps/cartera/conscli5.vp ,41);
(cmd2_z)=(numcli_cli,#);
tS7,0,0,23,80; tf; x(cmd_z); tf; tR7,0,0,23,80; tS0; R;
R;

[IMPCART;
(cmd1_z)=($vpg4s /programas/vps/cartera/impcart2.vp ,41);
(cmd2_z)=(numcli_cli,#);
tS7,0,0,23,80; tf; x(cmd_z); tf; tS0; R;
R;

* --------> Este es el Codigo de la Busqueda  <-------------------------- *

[BUSNOM;
!(sibus_z)5($S,1)>R;
GST; \Teclee el Nombre:\; t0R; inombre_z,#; (bandb_z)=($N,1); Gbusca2;
f1; k1; P; nR;
R;

[BUSPUE;
!(sibus_z)5($S,1)>R;
GST; \Teclee el Nombre:\; t0R; inombre_z,#;
GST; \Teclee el Pueblo:\; t0R; ipueblo_z,#;
(bandb_z)=($C,1); Gbusca2; f1; k1; P; nR;
R;

[LISTAPOL;
!(sibus_z)5($S,1)>R;
GST; \Teclee el Cobratario o *** para todos : \; t0R; iprom2_z,#;
EK0; f8; tS1,0,0,renst_z,maxcol_z; tf; t@2,0; (topebajo_z)=(renst_z)(2)-;
(renst3_z)=(renst_z)(1)-;
\`Codigo    ` `Nombre                        ` `TM` `Bonificac.` `  Recargos` `      Importe`\;
(col1c_z)=(0); (col2c_z)=(11); (col3c_z)=(42); (col4c_z)=(45); (col5c_z)=(56);
(col6c_z)=(67); (ren3c_z)=(2); z0,bonifs_z,#; z0,recars_z,#; z0,impors_z,#; 
f8; k1; P;
{ n+;
  !(prom2_z)5($***,3)>|;
    !(cobr2_rpo)5(prom2_z,#)>|; f8; a; g-; .
  .
  (ren3c_z)=(ren3c_z)(1)+;
  !(ren3c_z)1(topebajo_z)>|;
    GST3; \Presione <S> Para Continuar ...\; y|;. (ren3c_z)=(3); t@3,0; te;
  .
  (idcli2_z)=(idcli_rpo); f1; k7; P; n|;.
  t@ren3c_z,col1c_z; pnumcli_cli,10; t@ren3c_z,col2c_z;
  pnombre_cli,30; t@ren3c_z,col3c_z; ptipo_rpo,0;
  !(tipo_rpo)0($AB,2)>|;
    t@ren3c_z,col4c_z; prob_rpo,MDS10; (bonifs_z)=(bonifs_z)(rob_rpo)+;
  |
    t@ren3c_z,col5c_z; prob_rpo,MDS10; (recars_z)=(recars_z)(rob_rpo)+;
  .
  t@ren3c_z,col6c_z; pimpor_rpo,MDS13; (impors_z)=(impors_z)(impor_rpo)+;
  t@1,col4c_z; pbonifs_z,MDS10; t@1,col5c_z; precars_z,MDS10; t@1,col6c_z;
  pimpors_z,MDS13; (efectis_z)=(impors_z)(recars_z)+(bonifs_z)-;
  t@1,0; \Efectivo en \; ta3; \Nuevos Pesos \; ta0; tp; pefectis_z,MDS13;
  f8; a;
)
GST3; \Promotor : \; pprom2_z,0; \ Presione <N> Para Salir ...\; y|;.
tS0; GKprog1;
f1; k1; P; n|;.
R;

* ------------  -->   Rutina de Busquedas   <---- -------------- *
[SALDEBUS;
!(bandb_z)0($N,1)(bandb_z)0($C,1)|>|; (codigo_z)=(numcli_cli,#); .
R;

[DESPTITULO;
t@1,1;
!(bandb_z)0($N,1)(bandb_z)0($C,1)|>|; \Listado de Clientes\;  .
!(bandb_z)0($P,1)>|; \Codigos de Polizas\;  .
R;

[BUSCAINI;
!(bandb_z)0($N,1)>|; f1; k2; P; .
!(bandb_z)0($C,1)>|; f1; k3; P; .
!(bandb_z)0($P,1)>|; f10; k2; P; .
R;

[SELARCH;
!(bandb_z)0($N,1)>|; f1; .
!(bandb_z)0($P,1)>|; f10; .
R;

[DESPRENOR;
!(bandb_z)0($N,1)(bandb_z)0($C,1)|>|;
  t@ren_z,col1_z; pnumcli_cli,10; s1; pnombre_cli,30;
.
!(bandb_z)0($C,1)>|; 
  t@0,0; ppoblac_cli,0; t@ren_z,col1_z; pnumcli_cli,10; s1; pnombre_cli,30;
.
!(bandb_z)0($P,1)>|; t@ren_z,col1_z; pclave_cpo,2; s1; pnombre_cpo,30; .
R;

[lispol;     GLISTAPOL;        ];
[lismov;     GDESPMOVNSDO;     ];
[busnom;     GBUSNOM;          ];
[buspue;     GBUSPUE;          ];
[lisven;     Glistaven;        ];
[ponplazos;            ];
[impcarta; GIMPCART;   ];

[Ayuda;
EK0; tS1,2,2,16,62; tp; ta0; ta=; tn; t@3,3;
!(bandh_z)0($1,1)>|; tP/vpg/car/polmorti1.hlp~; .
!(bandh_z)0($2,1)>|; tP/vpg/car/polmorti2.hlp~; .
ta1; t@2,2; tp; tB61,14; ta0;
y|;. tp; tR1,2,2,16,62; tS0;
!(bandprog_z)0($1,1)>|; GKprog1; .
!(bandprog_z)0($3,1)>|; GKprog3; .
];

[parametros; Gpideparam; ];


[Kprog1;
(bandh_z)=($1,1); (bandprog_z)=($1,1);
KcF1,Ayuda,F1,lismov,F2,busnom,F3,buspue,F4,lispol;
KF6,lisven,F7,ponplazos,F8,impcarta,F9,parametros;
R;

[Kprog2; R;
[Kprog4; R;

#ibusca.i;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *

f1; #iclientes.i;
k0; ot,"clientes",;
k1; kp,"numcli = ?",codigo_z,#,1,;
k2; kp,"nombre like ? order by nombre",nombre_z,#,1,;
k3; kp,"nombre like ? and poblac like ? order by poblac,nombre",nombre_z,#,1,pueblo_z,#,1,;
k4; kq,"update clientes set abonos=abonos+?,fecsal=? where idcli=?",
	import_z,fecsal_cli,#,3,idcli_z,;
k6; kp,"idcli=?",idcli_z,;
k7; kp,"idcli=?",idcli2_z,;

f2; #idircli2.i;
k0; ot,"dircli2",;
k1; kp,"idcli=?",idcli_z,;

f3; #imvcli2.i;
k0; ot,"mvcli2",;
k1; kp,"idcli=?",idcli_z,;
k2; kp,"idcli=? and fechamov=? order by conse desc",idcli_z,fechapol_z,#,3,;
k3; kq,"insert into mvcli2 (idcli,fechamov,coa,concep1,tipag,poliza,recobon,
	import,oper,ace,usuario,conse,feccap, idmvcli, idcobra, idusuario) 
        values (?,?,'A',?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idcli_z,fechapol_z,#,3,nconcep_z,tipag_z,#,1,tda_z,#,1,recobon_z,
        import_z,prom_z,#,1,ace_z,#,1,iniciales_z,#,1,conse_z,
        feccap_z,#,2,idmvcli_z,idpromotor_z,idusuario_z,;

f4; M
	nombre_use		s16,
        maestro_use		s2,
        numpol_use		s3,
        iniciales_use		s5,
        idusuario_use		l,;
k0; ot,"usuarios",;
k1; kq,"select login,maestro,numpol,iniciales,idusuario
	from car_usuarios
	where login =? and clave=?",nombuse_z,#,1,clause_z,#,1,;

f5; #irecojas.i;
k0; ot,"recojas",;
k1; kp,"codcli=?",codigo_z,#,1,;
k2; kq,"insert into recojas (codcli,fecha,adeudo,devuel,fecdev)
	values (?,?,?,'N',?)",codigo_z,#,1,fechapol_z,#,3,adeud_z,fechapol_z,#,3,;
k3; kq,"update recojas set devuel='S',fecdev=? where codcli=?",
	fechapol_z,#,3,codigo_z,#,1,;
k4; kq,"insert into litigio (codigo,fecha,status,adeud,saldo,litigante)
	values (?,?,'A',?,?,?)",
        codigo_z,#,1,fechapol_z,#,3,adeud_z,salcli_z,litigante_z,#,1,;

f6; 	M
	ncon_cpm		l,
	concepto_cpm		s31,
	tam_cpm			s0,;
k0; ot,"conceps",;
k1; kq,"select ncon, concepto from conceps where concepto=?",concepto_z,#,1,;
k2; kq,"insert into conceps (concepto,ncon) values (?,?)",
	concepto_z,#,1,nconcep_z,;
k3; kq,"select ncon, concepto from conceps where ncon=?",nconcep_z,;
k4; kq,"call oldbusconcep(?)",concepto_z,#,1,;

f7; M
	ulticon_ind7		l,;
k0; ot,"conceps",;
k1; kq,"select max(ncon) from conceps",;
k2; kq,"select max(idcarplazo) from car_plazos where idcarplazo > 0",;
k3; kq,"select idpromot from promot where cvepromo=? and cia=?",
	prom_z,#,1,cia_z,;
k4; kq,"call agrega_obscli(?,?,?,?)",idcli_z,fechapol_z,#,3,tipoobs_z,
	obslar_z,#,1,;
k5; kq,"select idobservcli from car_obsercli a join car_observs b
	on a.idobserv = b.idobserv where a.idcli = ? and a.fecha = ?
        and b.observ = ?",idcli_z,fechapol_z,#,3,obslar_z,#,1,;
k6; kq,"select max(idobservcli) from car_obsercli where  idobservcli > 0",;
k7; kq,"select max(idmvcli) from mvcli2 where idmvcli > 0",;
k8; kq,"select max(conse) from mvcli2 where idcli=?",idcli_z,;
k9; kq,"select max(idpoliza) from polizas where idpoliza > 0",;
k10; kq,"select max(idrenpol) from renpol2 where idrenpol > 0",;
k11; kq,"select max(conse) from renpol2 where idpoliza=?",idpoliza_z,;
k12; kq,"select count(*) from car_polusuarios a 
	join car_codpol b on a.idcodpol = b.idcodpol where a.idusuario = ?",
        idusuario_z,;
k13; kq,"select foliobon from renpol2 where idrenpol = ?",idrenpol_z,;
k14; kq,"select foliobon from renpol2 
	where tda=? and fecha = ? and tipo='AB' and rob > 0 
	order by idrenpol desc",
        tda_z,#,1,fecsig_z,#,3,;
k15; kq,"select max(nref) from refsol where nref > 0",;
k16; kq,"select max(idfac) from facfon2 where idfac > 0",;
k17; kq,"select max(nfac) from facfon2 where serie=?",
     seriefac_z,#,1,;
k18; kq,"select max(idrenfacfo) from renfacfo where idrenfacfo > 0",;

f8; #irenpol2.i;
k0; ot,"renpol2",;
k1; kp,"fecha=? and tda=? order by conse",fechapol_z,#,3,tda_z,#,1,;
k2; kp,"fecha=? and tda=? order by conse desc",fechapol_z,#,3,tda_z,#,1,;
k3; kq,"insert into renpol2 (fecha,tda,idcli,sino,concep,tipo,rob,impor,salcli,
	moneda,fecven,comis,dias,cobr2,usuario,ace,conse,feccap,
        idrenpol, idpoliza, idcobra, idusuario, foliobon,iduuid,idfacfon)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        fechapol_z,#,3,tda_z,#,1,idcli_z,status_z,#,1,nconcep_z,tipag_z,#,1,
        recobon_z,import_z,salcli_z,mone_z,#,1,fecven_z,#,3,comis_z,dias_z,
        prom_z,#,1,iniciales_z,#,1,ace_z,#,1,conspol_z,
        feccap_z,#,2,idrenpol_z,idpoliza_z,idpromotor_z,idusuario_z,
        foliobon_z,iduuid_z,idfacfon_z,;
k4; kp,"fecha=? and tda=? and idcli=? and concep=? and tipo=? and rob=? 
	and impor=?",fechapol_z,#,3,tda_z,#,1,idcli_z,nconcep_z,
	tipag_z,#,1,recobon_z,import_z,;

f9; #ipolizas.i;
k0; ot,"polizas",;
k1; kp,"fecha=? and tda=?",fechapol_z,#,3,tda_z,#,1,;
k2; kq,"insert into polizas (fecha,tda,status,bonif,recar,impor,idpoliza)
	values (?,?,'A',0,0,0,?)",fechapol_z,#,3,tda_z,#,1,idpoliza_z,;
k3; kq,"update polizas set bonif=bonif+?,recar=recar+?,impor=impor+?
	where idpoliza=?",
        bonif_z,recar_z,import_z,idpoliza_z,;
k4; kq,"update polizas set status=? where idpoliza=?",
	status_pol,#,1,idpoliza_z,;

f10; #icar_codpol.i;
k0; ot,"car_codpol",;
k1; kp,"clave=?",tda_z,#,1,;
k2; kq,"select b.* from car_polusuarios a 
	join car_codpol b on a.idcodpol = b.idcodpol 
        where a.idusuario = ? order by b.clave",
        idusuario_z,;

f11; #ilitigio.i;
k0; ot,"litigio",;
k1; kp,"codigo=?",codigo_z,#,1,;
k2; kq,"insert into litigio (codigo,fecha,status,adeud,saldo,litigante)
	values (?,?,'A',?,?,?)",
        codigo_z,#,1,fechapol_z,#,3,adeud_z,salcli_z,litigante_z,#,1,;

f12; M
	idpromot_pmt		l,
        cvepromo_pmt		s4,
        idnombre_pmt		l,
        nombre_pmt		s51,
        poc_pmt			s2,
        comlet_pmt		d,
        comrec_pmt		d,
        tam_pmt			s0,;
k0; ot,"promotor",;
k2; kq,"select idpromot, cvepromo, a.idnombre, 
	cast(nomcomp as varchar(50)) as nombre, poc, comlet, comrec
        from promot a join car_nombres b on a.idnombre = b.idnombre 
        where cvepromo=?",prom_z,#,1,;

f14; M
	permi_ind14		s2,
        tam_ind14		s0,;
k0; ot,"permiusuario",;
k1; kq,"select permis from permiusuario where idusuario = ? and idpermis = ?",
	idusuario_z,idpermis_z,;
k2; kq,"select permi01 from usuarios where nombre = ?",
	nombuse_z,#,1,;

f15; #icomiscob.i;
k0; ot,"comiscob",;
	k1; kp,"fecha=? and promo=? and poliza=?",fechapol_z,#,3,prom_z,#,1,tda_z,#,1,;

f16; #icar_plazos.i;
k0; ot,"car_plazos",;
k1; kp,"idcli=?",idcli_z,;
k2; kq,"insert into car_plazos (idcarplazo,idcli,fecha,vence,idconcep,
	idusuario,idpromotor,cia,poliza) values (?,?,?,?,?,?,?,?,?)",
        idcarplazo_pzo,idcli_pzo,fecha_pzo,#,3,vence_pzo,#,3,idconcep_pzo,
        idusuario_pzo,idpromotor_pzo,cia_pzo,poliza_pzo,#,1,;
k3; kq,"delete from car_plazos where idcli = ? and fecha = ?",
	idcli_z,fechapzo_z,#,3,;

f17; #icar_conceps.i;
k0; ot,"car_conceps",;
k1; kq,"idconcep = ?",idconcep_z,;
k2; kq,"call busconcep(?)",obsplazo_z,#,1,;

f18; #icar_observs.i;
k0; ot,"car_observs",;
k1; kp,"idobserv=?",idobservs_z,;
k2; kq,"call busobserv(?)",obslar_z,#,1,;
k3; kq,"select idnombre, nomcomp from car_relclis a join car_nombres b
    on a.iddato = b.idnombre
    where a.idcli=? and tiporel=?",idcli_z,REL_NOMCLI,;
k4; kq,"select idestado,nombre from car_estados where idestado = ?",iddato_z,;

f19; #icar_obsercli.i;
k0; ot,"car_obsercli",;
k1; kp,"idobservcli=?",idobservcli_z,;
k2; kq,"insert into car_obsercli (idobservcli,idcli,fecha,tipoobs,idobserv)
	values (?,?,?,?,?)",
        idobservcli_obc,idcli_obc,fecha_obc,#,3,tipoobs_obc,idobserv_obc,;

f20; M
	fecha_ind20	{
	  fechaaa_ind20		i,
	  fechamm_ind20		i,
	  fechadd_ind20		i,
			}
	tam_ind20		s0,;
k0; ot,"polizas",;
k1; kq,"select max(fecha) from renpol2 where tda = ? and fecha <=?",
	tda_z,#,1,fechapol_z,#,3,;
k2; kq,"select fechamov from mvcli2 where idcli = ? and ace = 'J'",
      idcli_z,;

f21; #irefsol.i;
k0; ot,"refsol",;
k1; kp,"refyobs=?",datosol_z,#,1,;
k2; kp,"nref=?",idconcep_z,;
k3; kq,"insert into refsol (refyobs,nref) values (?,?)",
    refyobs_rfsol,#,1,nref_rfsol,;

f22; #ifacfon2.i;
k0; ot,"facfon2",;
k1; kp,"idfac=?",idfacfon_z,;
k2; kq,"insert into facfon2 (idcli,factur,tasa,canti1,concep1,precio1,
    canti2,concep2,precio2,canti3,idfac,precio3,subtot,iva,total,nfac,
      fecha,serie,status,fechayhora,tipo,iduuid)
       values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
       idcli_faf,factur_faf,#,1,tasa_faf,canti1_faf,concep1_faf,
       precio1_faf,canti2_faf,concep2_faf,precio2_faf,canti3_faf,
       idfac_faf,precio3_faf,subtot_faf,iva_faf,total_faf,nfac_faf,
       fecha_faf,#,3,serie_faf,#,1,status_faf,#,1,fechayhora_faf,#,2,
       tipo_faf,iduuid_faf,; 
k3; kp,"idcli=? and tipo=1",idcli_z,;

f23; #irenfacfo.i;
k0; ot,"renfacfo",;
k1; kp,"idfacfon=?",idfacfon_z,;
k2; kq,"insert into renfacfo (idrenfacfo,idfacfon,idcli,codigo,descri,
    serie,preciou,canti,piva,pdsc,importe,descto,iva,cia,folio)
    values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
    idrenfacfo_rff,idfacfon_rff,idcli_rff,codigo_rff,#,1,descri_rff,
    serie_rff,#,1,preciou_rff,canti_rff,piva_rff,pdsc_rff,importe_rff,
    descto_rff,iva_rff,cia_rff,folio_rff,; 

f24; #imisdatsol.i;
k0; ot,"misdatsol",;
k1; kp,"idcli=? and dato=?",idcli_z,iddato_z,;
k2; kq,"insert into misdatsol (idcli, dato, concep) values (?,?,?)",
    idcli_z,iddato_z,idconcep_z,;
k3; kq,"update misdatsol set concep=? where idcli=? and dato=?",
    idconcep_z,idcli_z,iddato_z,;

f25; M
    iddato_ind25		l,
    tam_ind25			s0,;
k0; ot,"datsol",;
k1; kq,"select iddato2 from car_relpobs where iddato1=? and tiporel=?",
  idpob_z,iddato_z,;
k2; kq,"select numero from poblacs where nombre=?",poblac_z,#,1,;
k3; kq,"select iddato from car_relclis where idcli=? and tiporel=?",
    idcli_z,REL_NOMCLI,;
    
f26; #icar_facsolicit.i;
k0; ot,"car_facsolicit",;
k1; kp,"serie=? and numero = ?",seriefac_z,#,1,numfac_z,;
k2; kq,"insert into car_facsolicit (serie,numero,poliza,status,horasol,cia)
    values (?,?,?,?,?,?)",
    serie_fsol,#,1,numero_fsol,poliza_fsol,#,1,status_fsol,#,1,horasol_fsol,#,2,cia_fsol,;
k3; kq,"delete from car_facsolicit where serie=? and numero = ?",seriefac_z,#,1,numfac_z,;

f27; #icancel.i;
k0; ot,"cancel",;
k1; kp,"codcli=?",codigo_z,#,1,;
k2; kq,"insert into cancel (fecha,codcli,impor,devol,adeud,foc)
    values (?,?,?,?,?,?)",
    fecha_can,#,3,codcli_can,#,1,impor_can,devol_can,adeud_can,foc_can,#,1,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;
#i/programas/lib/fechas.i;
#i/programas/lib/dlg_msg.i;
#i/programas/lib/ventananom.i;

[PAN; 
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro; 
tf; tn; t@0,0; ta0; 
tP/programas/vps/cartera/polcancel.s~;
tL/programas/vps/cartera/polcancel.pos~; t@13,2; tB76,6;
ta0; #iprog1.i; ^=direc_z,#);
(modul_z)=($Poliza de Caja,14); (modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];
[ST1; t@12,0; ta0; tl; ta1; ta=; ta0; tp; R;
[ST2; t@19,1; ta0; s78; t@19,1; ta1; ta=; ta0; tp; R;
[ST3; t@renst3_z,1; ta0; s78; t@renst3_z,1; ta1; ta=; ta0; tp; R;
[NOBD; Ff1; GST; `7; \Archivo 'basedato.ini' incompleto o inexistente...\; gFin1;
[ERRCNB; GST; `7; \No pude conectarme a la BD\; gFin1;
[ERROR1; GST; `7; \No pude accesar registro en clientes.v ...\; gFin1;
[ERROR3; GST; `7; \No pude agregar registro en climov.r ...\;  gFin1;
[ERROR6; GST; `7; \No pude agregar registro en observs.v ...\; gFin1;
[ERROR7; GST; `7; \No pude agregar registro en \; pteruser_z,0; gFin1;
[ERROR8; GST; `7; \No pude accesar registro en renpol.r ...\; gFin1;
[ERROR9; GST; `7; \No pude accesar registro en polizas.v ...\; gFin1;
[EROR15; GST; `7; \No pude agregar registro en comiscob.v ...\; gFin1;
[EROR16; GST; `7; \No pude agregar registro en cobpar.v ...\; gFin1;
[NOCLI; z0,nombre_cli,#; (nombre_cli)=($I N E X I S T E N T E,21); R;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;
[FIN_TOMA_UUID; Ff1; GST; `7; \archivo de uuid incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
