* Programa que sirve para recibir Facturas de Fonacot
  DRBR 23-Ene-2007
*

#dMIS2 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIE2 %-2d~; #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS5 %5.2f~; #dMDS9 %-9.2f~;
#i/programas/lib/funkey.i;

f0; M
	ter_z            	s2,
	fech9_z     {
	  dias2_z       	s16,
	  hora_z         	s5,
	  resto_z        	s5,
	            }
	bandman_z        	s3,
	band_z           	s3,
	bandh_z          	s3,
        sff_z			s2,
	nemp_z			s80,
	direc_z			s50,
	modul_z			s30,
	modul2_z		s10,
	usuarios_z      	s80,
	teruser_z       	s80,
	mibd_z          	s80,
        tbdircli_z		s80,
        misdatsol_z		s80,
        clientes_z		s80,
        mvcli_z			s80,
        solicit_z		s80,
        tbdircl_z		s80,
        facfon_z		s80,
        renfacfon_z		s80,
        sqlcmd_z		s251,
        milinea_z		s100,
	nombuse_z       s15,
	clause_z        s10,
	bandf1_z	 s3,
        voc_z			s2,
        abonos_z		 d,
        maxrow_z		i,
        maxcol_z		i,
        renst_z			i,

	banddcl_z		s3,
        nfac_z			l,
        idfactmp_z		l,
        idfac_z			l,
        idrenfacfo_z		l,
        idnombre_z		l,
        iddirec_z		l,
        idcol_z			l,
        idmvcli_z		l,
        cambialo_z		s2,
	fecha_z			D,
	fechb_z			D,
        feche_z			D,
        fechd_z			D,
        fecinican_z	{
          fecinicanaa_z		i,
          fecinicanmm_z		i,
          fecinicandd_z		i,
          		}
        fecfincan_z	{
          fecfincanaa_z		i,
          fecfincanmm_z		i,
          fecfincandd_z		i,
          		}
	fecini_z	{
	  feciniYear_z		i,
	  feciniMon_z		i,
	  feciniDay_z		i,
			}
	fecult_z	{
	  fecultYear_z		i,
	  fecultMon_z		i,
	  fecultDay_z		i,
			}
	ulmod_z			s12,
	ulmodt_z		s12,
        minfvta_z		s12,
	fechc_z			D,
        appat_z			s51,
        apmat_z			s51,
        nom1_z			s51,
        nom2_z			s51,
	
	codigo_z		s11,
	fechamov_z	{
	  fechamovaa_z	i,
	  fechamovmm_z		i,
	  fechamovdd_z		i,
			}
	concepto_z		s31,
        poblac_z		s26,
        oldidcli_z		l,
        idcli_z			l,
        ncon_z			l,
        oldcon_z		l,
        nref_z			l,
        oldref_z		l,
        ndato_z			l,
        datsol_z		l,
        refyobs_z		s61,
        deldis_z		s2,
        checacrc_z		s2,
	prtda_z			i,
	ultda_z			i,
	poliza_z		s3,
	import_z		d,
	conse_z			i,
	seriefac_z		s3,
	lospaso_z		s2,
        recinvo_z		s2,

	fech8_z           	D,
        iddato_z		l,
	ind1_z            	i,
	ind2_z            	i,
	termi_z           	i,
	esp_z             	i,
	exten_z           	i,
        ii_z			i,
        iii_z			i,
        crc_z			i,
        haydif_z		i,
        cia_z			i,
	tam0             s0,;

mtam0&;
GTOMACIA;
Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
* &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1; phora_z,#; s1; FW3; l; *
GPAN;

t@10,3; \Este Programa recibe temporales y los agrega a clientes... \;

[fei; t@4,3; \Fecha Inicial:\; t@4,20; &a; &cfecha_z; t0Fin; ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
[feu; t@4,40; \Fecha Final  :\; t@4,60; (fechb_z)=(fecha_z); t0fei; ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
[ica; t@5,3; \Cancelaciones del:\; t0feu; t@5,20; &a; &cfeche_z;
ifeche_z,+10; !(fechc_z)0($-1)>ica; qD,2,fecinican_z,feche_z,;
[uca; t@5,40; \Hasta el :\; t0ica; t@5,60; (fechd_z)=(feche_z);
ifechd_z,+10; !(fechd_z)0($-1)>uca; qD,2,fecfincan_z,fechd_z,;
(ultda_z)=(99);
[prt; t@6,3; \Del Codigo:\; t0feu; t@6,20; pprtda_z,MIE2,MIS2;
[ult; t@6,40; \Al Codigo:\; t0prt; t@6,60; pultda_z,MIE2,MIS2;
(voc_z)=($V,1);
[voc; t@8,3; \Los recibo en `V`entas o `C`artera ? <V/C>:\; t0ult;
pvoc_z,1; !(voc_z)5($V,1)(voc_z)5($C,1)&>voc;
[ire; t@9,3; \Inicializo anteriores y recibo nuevos ? <S/N>:\; t0voc;
irecinvo_z,1; !(recinvo_z)5($S,1)(recinvo_z)5($N,1)&>ire;
!(recinvo_z)0($S,1)>|;
  [ded; t@9,3; \Desea Copiar los temporales del diskette ? <S/N> : \;
  t0ire; ideldis_z,1; !(deldis_z)5($S,1)(deldis_z)5($N,1)&>ded;
.

GST; \Estan correctos los datos ? <S/N> : \; y|; | gfei; .
GABRE_TABLA;
!(recinvo_z)0($S,1)>|;
  GST; \Comenzamos por Inicializar los archivos...\;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from clitmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from mvclitmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from dirclitmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from solictmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from concepstmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from datsoltmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from refsoltmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from misdatsoltmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from poblacstmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from facfontmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from renfacfotmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from car_cambiostmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from car_clifidetmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from car_apellidostmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from car_nombrestmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from car_nompiltmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from car_relclistmp",; GHAZSQL;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"delete from car_vndclitmp",; GHAZSQL;
  GST; \Ahora tomamos los archivos...\;
  !(deldis_z)0($S,1)>|;
    tS9,0,0,23,80; tc; xrecibtmp.bat ~; tr; tf; tS0;
  .
  tS9,0,0,23,80; tf; tc; xbats/newrecivtas.bat ~; tr; tf; tS0;
.
tS1,0,0,23,80; tc;
z0,idcli_tmpmdsol,l; f14; k9; P; n|;. 
!(concep_tmpmdsol)1($0)>|; (checacrc_z)=($S,1); .

GAGREFACFON;
gFin;

gchecacli;
\ Checo las poblaciones nuevas\; l;
f26; k1; P;
{ n+;
  Ff1; \Buscando Poblacion:\; pnombre_tmppob,0; l; 
  (poblac_z)=(nombre_tmppob,#); f27; k1; P;
  n|;
    Ff1; \Agregando Poblacion:\; pnombre_tmppob,0; l;
    (nombre_pob)=(nombre_tmppob,#); (numero_pob)=(numero_tmppob,#);
    f27; k2; P$;
  .
  f26; a;
)
* --> Ya Actualice los Conceptos, datos de Solicitud y Referencias de Solicitud
      Ahora tengo que agregar los clientes y demas...
*

[checacli;
f10; k2; P$;
z0,fecha_tmpcan,l; f21; k2; P; n|;. qD,1,fecha_tmpcan,fechc_z,;
&bfechc_z; &p4minfvta_z; Ff1; \Fecha Cierre:\; pminfvta_z,0; l;
f10; k1; P;
{ n+;
  Ff1; \Leyendo: \; pnumcli_tmpcli,0; s1; pnombre_tmpcli,0; l;
  (codigo_z)=(numcli_tmpcli,#); (idcli_z)=(idcli_tmpcli); z0,lospaso_z,#;
  f28; k4; P; n|; | \ Cliente Baneado, no lo tomo...\; l; f10; a; g-; .
  
  \Lo voy a buscar...\; l;
  f1; k1; P;
  n|;
    f1; k12; P;
    n|; 
      qD,1,fechavta_tmpcli,fechc_z,; &bfechc_z; &p4ulmodt_z;
      !(ulmodt_z)4(minfvta_z,#)>|; 
        \Venta del \; pulmodt_z,0; \ No lo agrego \; l; f10; a; g-; 
      .
    |
      !(voc_z)0($V,1)>|; 
        (lospaso_z)=($S,1);
      |
        f28; k3; P; n|; (lospaso_z)=($N,1); | (lospaso_z)=($S,1); .
      .
      !(lospaso_z)0($N,1)>|; f10; a; g-; .
      Ff1; pidcli_z,MLS6; s1; pnombre_tmpcli,0;
      \ Ya Existe en \; pnumcli_cli,0;
      \ lo sobreescribo ? <S/N>:\; plospaso_z,0;
      \ Implica borrar a:\; pnumcli_cli,0; s1; pnombre_cli,0; l;
    .
    \No Existe \; pnumcli_tmpcli,0; \ Lo agrego \; l; GCAMBIALO;
  |
    f28; k3; P; n|; (lospaso_z)=($N,1); | (lospaso_z)=($S,1); .
    !(lospaso_z)0($N,1)>|; f10; a; g-; .
    pnumcli_cli,0; \Ya Tiene Asignado \; pidcli_cli,MLS6; 
    \ lo sobreescribo\; l;
    !(lospaso_z)0($S,1)>|;
      qD,1,ultmod_tmpcli,fechc_z,; &bfechc_z; &p4ulmodt_z;
      qD,1,ultmod_cli,fechc_z,; &bfechc_z; &p4ulmod_z;
      !(ulmodt_z)3(ulmod_z,#)>|; GCAMBIALO; .
    .
  .
  f10; a;
)
f21; k1; P;
{ n+;
  \Leyendo Cancelacion:\; pcodcli_tmpcan,0; l;
  (codigo_z)=(codcli_tmpcan,#); f20; k1; P;
  n|;
    z0,fecha_can,l; (fecha_can)=(fecha_tmpcan,#);
    (codcli_can)=(codcli_tmpcan,#); (impor_can)=(impor_tmpcan);
    (devol_can)=(devol_tmpcan); (adeud_can)=(adeud_tmpcan);
    (foc_can)=(foc_tmpcan,#); f20; QNOPDAGF20; k2; P$;
    f1; k1; P; n|; | (idcli_z)=(idcli_cli); GTOMALOSMOVS; .
  .
  f21; a;
)
GRECIBE_FIDE;

Ff1; \Ahora Ejecuto f28 k1 (Cambios de cartera) \; l;
f28; k1; P;
{ n+;
  \Leyendo Cambios:\; ptipo_tmpcam,0; s1; pnumcli_tmpcam,0; s1; 
  psentencias_tmpcam,0; l; (idcli_z)=(idcli_tmpcam);
  !(tipo_tmpcam)0($B,1)>|; GBORRACLI; .
  !(tipo_tmpcam)0($S,1)>|; (sqlcmd_z)=(sentencias_tmpcam,#); GHAZSQL; .
  f28; a;
)
gFin;

[BORRACLI;  
f27; k4; P$; k5; P$; k6; P$; k7; P$; k8; P$; k9; P$; k10; P$;
R;

[RECIBE_FIDE;
Ff1; \Recibo las Ventas de Fide...\; l;
f29; k1; P;
{ n+;
  z0,cambialo_z,#;
  Ff1; \Leyendo:\; pcodigo_tmpfid,0; s1; pnombre_tmpfid,0; l;
  (oldidcli_z)=(idcli_tmpfid);
  (codigo_z)=(codigo_tmpfid,#); (idcli_z)=(idcli_tmpfid); f30; k1; P; 
  n|; | (cambialo_z)=($S,1); f28; k3; P; n|; f29; a; g-; . .
  !(cambialo_z)5($S,1)>|; 
    z0,idcli_fid,l; z0,ulticon_ind18,l; f18; k10; P; n|;.
    (idcli_z)=(ulticon_ind18)(1)+;
    (codigo_fid)=(codigo_tmpfid,#); (idcli_fid)=(idcli_z); 
    (cia_fid)=(cia_tmpfid);
    z0,ulticon_ind18,l; f18;
    !(voc_z)0($C,1)>|; k9; .
    !(voc_z)0($V,1)>|; k10; .
    n|;. (idfac_z)=(ulticon_ind18)(1)+;
    (idfac_fid)=(idfac_z);
  .
  (concepto_z)=(nombre_tmpfid,#); f9; k4; P; n|;. (idnombre_z)=(ncon_cpm);
  (concepto_z)=(direc_tmpfid,#); f9; k4; P; n|;. (iddirec_z)=(ncon_cpm);
  (concepto_z)=(col_tmpfid,#); f9; k4; P; n|;. (idcol_z)=(ncon_cpm);
  (fecha_fid)=(fecha_tmpfid,#); (idnombre_fid)=(idnombre_z); 
  (iddirec_fid)=(iddirec_z); (idcol_fid)=(idcol_z); 
  (idpoblac_fid)=(idpoblac_tmpfid); (idptovta_fid)=(idptovta_tmpfid);
  (agente_fid)=(agente_tmpfid,#); (preciofid_fid)=(preciofid_tmpfid);
  (bonifi_fid)=(bonifi_tmpfid); (iduser_fid)=(iduser_tmpfid);
  
  !(cambialo_z)5($S,1)>|; f30; k2; P$; | k3; P$; .
  GAGREFACFON;
  f29; a;
)
R;

[HAZSQL;
f27; k11; qx,sqlcmd_z,;
R;

[TOMALOSMOVS;
* --> Por Unica Vez <--- *
f11; k1; P;
{ n+;
  \Verificando y Agregando Movimientos:\; pconcep1_tmpmvc,MLS6;
  s1; ppoliza_tmpmvc,0; s1; ptipag_tmpmvc,0; s1; pimport_tmpmvc,MDS12;
  s1; pidcli_tmpmvc,MLS6;
  (fechamov_z)=(fechamov_tmpmvc,#); (ncon_z)=(concep1_tmpmvc);
  f17; k2; P; n|; f11; a; g-; . * -- Si no encuentro el concepto en temporales lo brinco *
  (concepto_z)=(concepto_tmpcpm,#); GBUSCA_CONCEP;
  s1; pconcepto_z,0; s1; pncon_z,MLS6; l;
  (poliza_z)=(poliza_tmpmvc,#); (import_z)=(import_tmpmvc); f2; k2; P;
  n|; GAGREMOV; .
  f11; a;
)
\Ahora Actualizo los Clientes...\; l;
z0,abonos_ind22,l; f22;
!(voc_z)0($C,1)>|; k1; .
!(voc_z)0($V,1)>|; k3; .
P; n|;. (abonos_z)=(abonos_ind22);
!(abonos_z)5(abonos_cli)>|;
  !(voc_z)0($C,1)>|; k2; .
  !(voc_z)0($V,1)>|; k4; .
  P$;
.
R;

[AGREMOV;
z0,ulticon_ind18,l; f18; k11; P; n|;. (idmvcli_z)=(ulticon_ind18)(1)+;
z0,ulticon_ind18,l; f18;
!(voc_z)0($C,1)>|; k4; .
!(voc_z)0($V,1)>|; k5; .
P; n|;. (conse_z)=(ulticon_ind18)(1)+;
\Estoy en AGREMOV \; l;
f2; z0,idcli_mvc,l; (idcli_mvc)=(idcli_tmpmvc);
(fechamov_mvc)=(fechamov_tmpmvc,#);
(coa_mvc)=(coa_tmpmvc,#); (concep1_mvc)=(ncon_z);
(poliza_mvc)=(poliza_tmpmvc,#);
(tipag_mvc)=(tipag_tmpmvc,#); (recobon_mvc)=(recobon_tmpmvc);
(import_mvc)=(import_tmpmvc);
(oper_mvc)=(oper_tmpmvc,#); (ace_mvc)=(ace_tmpmvc,#);
(usuario_mvc)=(usuario_tmpmvc,#);
(conse_mvc)=(conse_z);
(feccap_mvc)=(feccap_tmpmvc,#);
(idcobra_mvc)=(idcobra_tmpmvc);
(idmvcli_mvc)=(idmvcli_z);
(idusuario_mvc)=(idusuario_tmpmvc);
!(voc_z)0($C,1)>|; \Ejecutando: f2 k3 \; l; f2; QNOPDAGF2; k3; P$; .
!(voc_z)0($V,1)>|; \Ejecutando: f2 k4 \; l; f2; QNOPDAGF2; k4; P$; .
\Agregado el Movimiento...\; l;
R;

[CAMBIALO;
!(checacrc_z)0($S,1)>|; GCHECA_CRC; .
!(voc_z)0($V,1)>|; f1; k11; P$; k14; P$; f2; k6; P$; .
!(voc_z)0($C,1)>|; f1; k10; P$; k13; P$; f2; k5; P$; .
f2; k7; P$; k8; P$;
GAGREGACLI;
R;

[CHECA_CRC;
z0,crc_z,#; z0,haydif_z,#;
z0,idcli_tmpmdsol,l; f14; k2; P; n|;. (ii_z)=(concep_tmpmdsol);
(iddato_z)=(-1); 
z0,idcli_tmpmdsol,l; f14; k8; P; n|;. (iii_z)=(concep_tmpmdsol);
!(ii_z)5(iii_z)>|;
  Ff1; \Movimientos no coincide:\; pii_z,MIS2; \:\; piii_z,MIS2; l; 
  (crc_z)=(crc_z)(ii_z)+(iii_z)-; (haydif_z)=(haydif_z)(1)+;
.
z0,idcli_tmpmdsol,l; f14; k3; P; n|;. (ii_z)=(concep_tmpmdsol);
(iddato_z)=(-2); 
z0,idcli_tmpmdsol,l; f14; k8; P; n|;. (iii_z)=(concep_tmpmdsol);
!(ii_z)5(iii_z)>|; 
  Ff1; \Datos Solicitud no coincide:\; pii_z,MIS2; \:\; piii_z,MIS2; l; 
  (crc_z)=(crc_z)(ii_z)+(iii_z)-; (haydif_z)=(haydif_z)(1)+;
.
z0,idcli_tmpmdsol,l; f14; k4; P; n|;. (ii_z)=(concep_tmpmdsol);
(iddato_z)=(-3); 
z0,idcli_tmpmdsol,l; f14; k8; P; n|;. (iii_z)=(concep_tmpmdsol); 
!(ii_z)5(iii_z)>|; 
  Ff1; \Relaciones Nombres no coincide:\; pii_z,MIS2; \:\; piii_z,MIS2; l; 
  (crc_z)=(crc_z)(ii_z)+(iii_z)-; (haydif_z)=(haydif_z)(1)+;
.
z0,idcli_tmpmdsol,l; f14; k5; P; n|;. (ii_z)=(concep_tmpmdsol);
(iddato_z)=(-4); 
z0,idcli_tmpmdsol,l; f14; k8; P; n|;. (iii_z)=(concep_tmpmdsol); 
!(ii_z)5(iii_z)>|; 
  Ff1; \Vendedores no coincide:\; pii_z,MIS2; \:\; piii_z,MIS2; l; 
  (crc_z)=(crc_z)(ii_z)+(iii_z)-; (haydif_z)=(haydif_z)(1)+;
.
z0,idcli_tmpmdsol,l; f14; k6; P; n|;. (ii_z)=(concep_tmpmdsol);
(iddato_z)=(-5); 
z0,idcli_tmpmdsol,l; f14; k8; P; n|;. (iii_z)=(concep_tmpmdsol); 
!(ii_z)5(iii_z)>|; 
  Ff1; \Facturas Fonacot no coincide:\; pii_z,MIS2; \:\; piii_z,MIS2; l; 
  (crc_z)=(crc_z)(ii_z)+(iii_z)-; (haydif_z)=(haydif_z)(1)+;
.
z0,idcli_tmpmdsol,l; f14; k7; P; n|;. (ii_z)=(concep_tmpmdsol);
(iddato_z)=(-6); 
z0,idcli_tmpmdsol,l; f14; k8; P; n|;. (iii_z)=(concep_tmpmdsol); 
!(ii_z)5(iii_z)>|; 
  Ff1; \Renglones Fact Fonacot no coincide:\; pii_z,MIS2; \:\; piii_z,MIS2; l; 
  (crc_z)=(crc_z)(ii_z)+(iii_z)-; (haydif_z)=(haydif_z)(1)+;
.
!(haydif_z)1($0)>|;
  Ff1; \Hay \; phaydif_z,MIS2; \ Diferencias con \; pcrc_z,MIS2; 
  \ Datos Inconsistentes...\; l;
.
R;

[CAMBIALO2;
f1; k1; P;
n|; |
  !(voc_z)0($V,1)>|; f1; k14; P$; k14; P$; .
  !(voc_z)0($C,1)>|; f1; k13; P$; k13; P$; .
.
GAGREGACLI;
R;

[AGREGACLI;
f1; z0,numcli_cli,l; (numcli_cli)=(numcli_tmpcli,#); 
(tienda_cli)=(tienda_tmpcli);
(fechavta_cli)=(fechavta_tmpcli,#); (conse_cli)=(conse_tmpcli);
(status_cli)=(status_tmpcli,#);
(nombre_cli)=(nombre_tmpcli,#);
(direc_cli)=(direc_tmpcli,#); (poblac_cli)=(poblac_tmpcli,#);
(qom_cli)=(qom_tmpcli,#); (ticte_cli)=(ticte_tmpcli,#);
(letra1_cli)=(letra1_tmpcli);
(enganc_cli)=(enganc_tmpcli); (nulet1_cli)=(nulet1_tmpcli);
(canle1_cli)=(canle1_tmpcli);
(nulet2_cli)=(nulet2_tmpcli); (canle2_cli)=(canle2_tmpcli); 
(bonifi_cli)=(bonifi_tmpcli);
(servic_cli)=(servic_tmpcli); (precon_cli)=(precon_tmpcli); 
(agente_cli)=(agente_tmpcli,#);
(fac_cli)=(fac_tmpcli); (comisi_cli)=(comisi_tmpcli); 
(agent2_cli)=(agent2_tmpcli,#);
(operac_cli)=(operac_tmpcli,#); (comis2_cli)=(comis2_tmpcli); 
(cargos_cli)=(cargos_tmpcli);
(abonos_cli)=(abonos_tmpcli); (jefgpo_cli)=(jefgpo_tmpcli,#); 
(moneda_cli)=(moneda_tmpcli,#);
(solici_cli)=(solici_tmpcli,#); (pgocom_cli)=(pgocom_tmpcli,#); 
(ubiage_cli)=(ubiage_tmpcli,#);
(jefpas_cli)=(jefpas_tmpcli,#); (cojepa_cli)=(cojepa_tmpcli); 
(pdsc_cli)=(pdsc_tmpcli);
(fechal_cli)=(fechal_tmpcli,#); (ultmod_cli)=(ultmod_tmpcli,#); 
(fecsal_cli)=(fecsal_tmpcli,#);
(piva_cli)=(piva_tmpcli); (diacum_cli)=(diacum_tmpcli); 
(mescum_cli)=(mescum_tmpcli); (inter_cli)=(inter_tmpcli,#);
(idcli_cli)=(idcli_tmpcli); (idcli_z)=(idcli_cli);
\ 1 \;
!(voc_z)0($C,1)>|; f1; QNOPDAGF1; k15; P$; .
!(voc_z)0($V,1)>|; f1; QNOPDAGF1; k16; P$; .
\ 2 \;
z0,ulticon_ind18,l; f18; k12; P; n|;. !(ulticon_ind18)1($0)>|; f32; k2; P$; .
f31; k1; P;
f32; k1; P; { n+; a; )
GTOMALOSMOVS; GAGREDIRCLI; GAGRESOL; (oldidcli_z)=(idcli_z); GAGREFACFON;
R;

[AGREDIRCLI;
f12; k1; P; nR;
f3; k1; P; n|; (banddcl_z)=($A,1); | (banddcl_z)=($M,1); .
f3; z0,idcli_dcl,l; (idcli_dcl)=(idcli_tmpdcl);
(direc2_dcl)=(direc2_tmpdcl,#); (nomav_dcl)=(nomav_tmpdcl,#);
(dirav1_dcl)=(dirav1_tmpdcl,#); (dirav2_dcl)=(dirav2_tmpdcl,#);
(compra_dcl)=(compra_tmpdcl,#); (linea_dcl)=(linea_tmpdcl,#);
!(banddcl_z)0($A,1)>|;
  !(voc_z)0($C,1)>|; f3; QNOPDAGF3; k2; P$; .
  !(voc_z)0($V,1)>|; f3; QNOPDAGF3; k3; P$; .
|
  !(voc_z)0($C,1)>|; f3; QNOPDAGF3; k4; P$; .
  !(voc_z)0($V,1)>|; f3; QNOPDAGF3; k5; P$; .
.
R;

[AGRESOL;
f13; k1; P; nR; f4; k1; P; n|; (banddcl_z)=($A,1); | (banddcl_z)=($M,1); .
z0,idcli_sol,l;
(idcli_sol)=(idcli_tmpsol,#);
(sexo_sol)=(sexo_tmpsol,#);
(edad_sol)=(edad_tmpsol);
(edociv_sol)=(edociv_tmpsol,#);
(depend_sol)=(depend_tmpsol);
(ingres_sol)=(ingres_tmpsol);
(anuant_sol)=(anuant_tmpsol);
(mesant_sol)=(mesant_tmpsol);
(ingcon_sol)=(ingcon_tmpsol);
(anuanc_sol)=(anuanc_tmpsol);
(mesanc_sol)=(mesanc_tmpsol);
(ingava_sol)=(ingava_tmpsol);
(anuana_sol)=(anuana_tmpsol);
(mesana_sol)=(mesana_tmpsol);
(ingcona_sol)=(ingcona_tmpsol);
(anuanca_sol)=(anuanca_tmpsol);
(mesanca_sol)=(mesanca_tmpsol);
(casa1_sol)=(casa1_tmpsol,#);
(casa2_sol)=(casa2_tmpsol,#);
!(banddcl_z)0($A,1)>|;
  Ff1; \Estoy en Alta de Solicitud \; 
  !(voc_z)0($C,1)>|; f4; QNOPDAGF4; k2; P$; \ Cartera \; l; .
  !(voc_z)0($V,1)>|; f4; QNOPDAGF4; k3; P$; \ Ventas \; l; .
|
  Ff1; \Estoy en Modificacion de Solicitud \;
  !(voc_z)0($C,1)>|; f4; QNOPDAGF4; k4; P$; \ Cartera \; l; .
  !(voc_z)0($V,1)>|; f4; QNOPDAGF4; k5; P$; \ Ventas \; l; .
.
f14; k1; P;
{ n+;
  (ndato_z)=(dato_tmpmdsol); (datsol_z)=(concep_tmpmdsol);
  !(ndato_z)2($500)>|;
    (ncon_z)=(datsol_z); f15; k2; P; n|;. (concepto_z)=(concepto_tmpdsol,#);
    GBUSCA_DATSOL; (datsol_z)=(ncon_z);
  |
    (nref_z)=(datsol_z); f16; k2; P; n|;. (refyobs_z)=(refyobs_tmprfsol,#);
    GBUSCA_REFSOL; (datsol_z)=(nref_z);
  .
  (oldcon_z)=(ncon_tmpdsol);

*  GST; \Pongo:\; pndato_z,MLS4; s1; pdatsol_z,MLS4; s1; pidcli_z,MLS4; y|;. *
  f5; k1; P;
  n|;
    (idcli_mdsol)=(idcli_z); (dato_mdsol)=(ndato_z);
    (concep_mdsol)=(datsol_z);
    !(voc_z)0($C,1)>|; f5; QNOPDAGF5; k2; P$; .
    !(voc_z)0($V,1)>|; f5; QNOPDAGF5; k3; P$; .
  |
    (idcli_mdsol)=(idcli_z); (dato_mdsol)=(ndato_z);
    (concep_mdsol)=(datsol_z);
    !(voc_z)0($C,1)>|; f5; QNOPDAGF5; k4; P$; .
    !(voc_z)0($V,1)>|; f5; QNOPDAGF5; k5; P$; .
  .
  f14; a;
)
R;

[NOPDAGF5; GST; `7; \No pude agregar registro en \; pmisdatsol_z,0; Z1; R;
[NOPDMDF5; GST; `7; \No pude modoficar registro en \; pmisdatsol_z,0; Z1; R;

[AGREFACFON;
Ff1;\Estoy en AGREFACFON \;
f19; k2; P;
{ n+;
  (seriefac_z)=(serie_tmpfaf,#); (nfac_z)=(nfac_tmpfaf); 
  (idcli_z)=(idcli_tmpfaf); 
  * Si ya existe el cliente en altas, se respeta la Factura Asignada en altas *
  f1; k1; P; n|; | f19; a; g-; .
  Ff1; \Factura Serie:\; pseriefac_z,0; s1; \ No:\; pnfac_z,MLS6;
  \ Idfac:\; pidfac_tmpfaf,MLS6; l;
  f8; k1; P; 
  n|; 
    f18;
    !(voc_z)0($C,1)>|; k8; P; .
    !(voc_z)0($V,1)>|; k9; P; .
    n|;. (idfac_z)=(ulticon_ind18)(1)+;
  |
    (idfac_z)=(idfac_faf);
    !(voc_z)0($C,1)>|; f8; k2; P$; f23; k2; P$; .
    !(voc_z)0($V,1)>|; f8; k5; P$; f23; k3; P$; .
  .
  z0,idrelcli_ind31,l; f31; k2; P; n|;. (appat_z)=(nombre_ind31,50);
  z0,idrelcli_ind31,l; f31; k3; P; n|;. (apmat_z)=(nombre_ind31,50);
  z0,idrelcli_ind31,l; f31; k4; P; n|;. (nom1_z)=(nombre_ind31,50);
  z0,idrelcli_ind31,l; f31; k5; P; n|;. (nom2_z)=(nombre_ind31,50);
  * -> Voy a buscar el idnombre <- *
  f18; k13; P; n|;. (idnombre_z)=(ulticon_ind18); 
  z0,idcli_faf,l; (idcli_faf)=(idcli_z); (nfac_faf)=(nfac_z);
  (factur_faf)=(factur_tmpfaf,#); (serie_faf)=(serie_tmpfaf,#);
  (fecha_faf)=(fecha_tmpfaf,#); (tasa_faf)=(tasa_tmpfaf);
  (canti1_faf)=(canti1_tmpfaf); (concep1_faf)=(nfac_z);
  (precio1_faf)=(precio1_tmpfaf);
  (canti2_faf)=(canti2_tmpfaf); (concep2_faf)=(idnombre_z);
  (precio2_faf)=(precio2_tmpfaf);  (canti3_faf)=(canti3_tmpfaf);
  (precio3_faf)=(precio3_tmpfaf);  (subtot_faf)=(subtot_tmpfaf); 
  (iva_faf)=(iva_tmpfaf);
  (total_faf)=(total_tmpfaf); (idfac_faf)=(idfac_z);
  !(voc_z)0($C,1)>|; f8; QNOPDAGF5; k3; P$; .
  !(voc_z)0($V,1)>|; f8; QNOPDAGF5; k4; P$; .
  !(voc_z)0($C,1)>|; f23; QNOPDAGF5; k2; P$; .
  !(voc_z)0($V,1)>|; f23; QNOPDAGF5; k3; P$; .
  (idfactmp_z)=(idfac_tmpfaf);
  f24; k1; P;
  { n+;
    z0,ulticon_ind18,l;
    !(voc_z)0($C,1)>|; f18; k6; P; .
    !(voc_z)0($V,1)>|; f18; k7; P; .
    n|;. (idrenfacfo_z)=(ulticon_ind18)(1)+;
    (ncon_z)=(descri_tmprff); z0,concepto_tmpcpm,#;
    f17; k2; P; n|;. (concepto_z)=(concepto_tmpcpm,#); GBUSCA_CONCEP;
    (idrenfacfo_rff)=(idrenfacfo_z); (idfacfon_rff)=(idfac_z);
    (idcli_rff)=(idcli_tmprff); (codigo_rff)=(codigo_tmprff,#);
    (descri_rff)=(ncon_z); (serie_rff)=(serie_tmprff,#);
    (preciou_rff)=(preciou_tmprff); (canti_rff)=(canti_tmprff);
    (piva_rff)=(piva_tmprff); (pdsc_rff)=(pdsc_tmprff);
    (importe_rff)=(importe_tmprff); (descto_rff)=(descto_tmprff);
    (iva_rff)=(iva_tmprff); (cia_rff)=(cia_tmprff);
    !(voc_z)0($C,1)>|; f23; k4; P$; .
    !(voc_z)0($V,1)>|; f23; k5; P$; .
    f24; a;
  )
  f19; a;
)
R;

[BUSCA_CONCEP;
z0,ncon_cpm,l; f9; k4; P; n|;. (ncon_z)=(ncon_cpm);
R;

[BUSCA_DATSOL;
f6; k1; P;
n|;
  z0,ulticon_ind18,l; f18; k2; P; n|;.
  (ncon_z)=(ulticon_ind18)(1)+;
  f6; k3; P$;
|
  (ncon_z)=(ncon_dsol);
.
R;

[BUSCA_REFSOL;
f7; k1; P;
n|;
  z0,ulticon_ind18,l; f18; k3; P; n|;.
  (nref_z)=(ulticon_ind18)(1)+;
  f7; k3; P$;
|
  (nref_z)=(nref_rfsol);
.
R;    

[NOPDAGF8; \No pude agregar facfon ...\; l; Z2; R;
[NOPDAGF1; \No pude agregar cliente....\; l; Z2; R;
[NOPDMDF1; \No pude Modificar cliente....\; l; Z2; R;
[NOPDAGF2; \No pude agregar movimiento...\; l; Z2; R;
[NOPDAGF3; \No pude agregar dircli...\; l; Z2; R;
[NOPDMDF3; \No pude modificar dircli...\; l; Z2; R;
[NOPDMDF4; GST; `7; \No pude modificar solicit...\; l; Z2; R;
[NOPDAGF4; GST; `7; \No pude agregar solicit...\; l; Z2; R;
[NOPDAGF20; GST; `7; \No pude agregar cancel...\; l; Z2; R;


[TOMAALTAS;
!(voc_z)0($V,1)>|;
  Ff6; FOaltas.ini~,r~;
|
  Ff6; FOcartera.ini~,r~;
.
{ Ff6; FG+; z0,milinea_z,#; Fkmilinea_z,l;
  !(milinea_z)0($clientes:,9)>|;   Ff6; FG+; Fkclientes_z,l;  g-; .
  !(milinea_z)0($mvcli:,6)>|;      Ff6; FG+; Fkmvcli_z,l;     g-; .
  !(milinea_z)0($dircli:,7)>|;     Ff6; FG+; Fktbdircl_z,l;   g-; .
  !(milinea_z)0($solicit:,8)>|;    Ff6; FG+; Fksolicit_z,l;   g-; .
  !(milinea_z)0($renffo:,7)>|;	   Ff6; FG+; Fkrenfacfon_z,l; g-; .
  !(milinea_z)0($facfon:,7)>|;     Ff6; FG+; Fkfacfon_z,l;    g-; .
  !(milinea_z)0($misdatsol:,10)>|; Ff6; FG+; Fkmisdatsol_z,l; g-; .
)
R;

[ABRE_TABLA;
GTOMAALTAS;
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #iclientes.i;
k0; ot,clientes_z,;
k1; kp,"numcli = ?",codigo_z,#,1,;
k10; kq,"delete from clientes where numcli=?",codigo_z,#,1,;
k11; kq,"delete from clialta where numcli=?",codigo_z,#,1,;
k13; kq,"delete from clientes where idcli=?",idcli_z,;
k14; kq,"delete from clialta where idcli=?",idcli_z,;
k12; kp,"idcli=?",idcli_z,;
k15; kq,"insert into clientes (numcli,tienda,fechavta,conse,status,nombre,
	direc,poblac,qom,ticte,letra1,enganc,nulet1,canle1,nulet2,canle2,
        bonifi,servic,precon,agente,fac,comisi,agent2,operac,comis2,cargos,
        abonos,jefgpo,moneda,solici,pgocom,ubiage,jefpas,cojepa,pdsc,
        fechal,ultmod,fecsal,piva,diacum,mescum,inter,idcli)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,
        ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        numcli_cli,#,1,tienda_cli,fechavta_cli,#,3,conse_cli,status_cli,#,1,
        nombre_cli,#,1,direc_cli,#,1,poblac_cli,#,1,qom_cli,#,1,
        ticte_cli,#,1,letra1_cli,enganc_cli,nulet1_cli,canle1_cli,
        nulet2_cli,canle2_cli,bonifi_cli,servic_cli,precon_cli,
        agente_cli,#,1,fac_cli,comisi_cli,agent2_cli,#,1,operac_cli,#,1,
        comis2_cli,cargos_cli,abonos_cli,jefgpo_cli,#,1,moneda_cli,#,1,
        solici_cli,#,1,pgocom_cli,#,1,ubiage_cli,#,1,jefpas_cli,#,1,
        cojepa_cli,pdsc_cli,fechal_cli,#,3,ultmod_cli,#,3,fecsal_cli,#,3,
        piva_cli,diacum_cli,mescum_cli,inter_cli,#,1,idcli_cli,;
k16; kq,"insert into clialta (numcli,tienda,fechavta,conse,status,nombre,
	direc,poblac,qom,ticte,letra1,enganc,nulet1,canle1,nulet2,canle2,
        bonifi,servic,precon,agente,fac,comisi,agent2,operac,comis2,cargos,
        abonos,jefgpo,moneda,solici,pgocom,ubiage,jefpas,cojepa,pdsc,
        fechal,ultmod,fecsal,piva,diacum,mescum,inter,idcli)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,
        ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        numcli_cli,#,1,tienda_cli,fechavta_cli,#,3,conse_cli,status_cli,#,1,
        nombre_cli,#,1,direc_cli,#,1,poblac_cli,#,1,qom_cli,#,1,
        ticte_cli,#,1,letra1_cli,enganc_cli,nulet1_cli,canle1_cli,
        nulet2_cli,canle2_cli,bonifi_cli,servic_cli,precon_cli,
        agente_cli,#,1,fac_cli,comisi_cli,agent2_cli,#,1,operac_cli,#,1,
        comis2_cli,cargos_cli,abonos_cli,jefgpo_cli,#,1,moneda_cli,#,1,
        solici_cli,#,1,pgocom_cli,#,1,ubiage_cli,#,1,jefpas_cli,#,1,
        cojepa_cli,pdsc_cli,fechal_cli,#,3,ultmod_cli,#,3,fecsal_cli,#,3,
        piva_cli,diacum_cli,mescum_cli,inter_cli,#,1,idcli_cli,;
k17; kq,"delete from clientes where idcli=?",idcli_z,;

f2; #imvcli2.i;
k0; ot,mvcli_z,;
k1; kp,"idcli=?",idcli_z,;
k2; kp,"idcli=? and fechamov=? and poliza=? and concep1=? and import=?",
	idcli_z,fechamov_z,#,3,poliza_z,#,1,ncon_z,import_z,;
k3; kq,"insert into mvcli2 (idcli,fechamov,coa,concep1,poliza,tipag,
	recobon,import,oper,ace,usuario,conse,feccap,idmvcli,idcobra,
        idusuario) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idcli_mvc,fechamov_mvc,#,3,coa_mvc,#,1,concep1_mvc,poliza_mvc,#,1,
        tipag_mvc,#,1,recobon_mvc,import_mvc,oper_mvc,#,1,ace_mvc,#,1,
        usuario_mvc,#,1,conse_mvc,feccap_mvc,#,2,idmvcli_mvc,idcobra_mvc,
        idusuario_mvc,;
k4; kq,"insert into mvclialta (idcli,fechamov,coa,concep1,poliza,tipag,
	recobon,import,oper,ace,usuario,conse,feccap,idmvcli,idcobra,
        idusuario) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idcli_mvc,fechamov_mvc,#,3,coa_mvc,#,1,concep1_mvc,poliza_mvc,#,1,
        tipag_mvc,#,1,recobon_mvc,import_mvc,oper_mvc,#,1,ace_mvc,#,1,
        usuario_mvc,#,1,conse_mvc,feccap_mvc,#,2,idmvcli_mvc,idcobra_mvc,
        idusuario_mvc,;
k5; kq,"delete from mvcli2 where idcli = ? and ace='P'",idcli_z,;
k6; kq,"delete from mvclialta where idcli = ? and ace='P'",idcli_z,;
!(voc_z)0($C,1)>|;
  k7; kq,"delete from car_vndcli  where idcli = ?",idcli_z,;
  k8; kq,"delete from car_relclis where idcli = ?",idcli_z,;
.
!(voc_z)0($V,1)>|;
  k7; kq,"delete from car_vndclialta where idcli = ?",idcli_z,;
  k8; kq,"delete from car_relclialta where idcli = ?",idcli_z,;
.

f3; #idircli2.i;
k0; ot,tbdircl_z,;
k1; kp,"idcli=?",idcli_z,;
k2; kq,"insert into dircli2 (idcli,direc2,nomav,dirav1,dirav2,compra,linea)
	values (?,?,?,?,?,?,?)",
        idcli_dcl,direc2_dcl,#,1,nomav_dcl,#,1,dirav1_dcl,#,1,
        dirav2_dcl,#,1,compra_dcl,#,1,linea_dcl,#,1,;
k3; kq,"insert into dirclialta (idcli,direc2,nomav,dirav1,dirav2,compra,linea)
	values (?,?,?,?,?,?,?)",
        idcli_dcl,direc2_dcl,#,1,nomav_dcl,#,1,dirav1_dcl,#,1,
        dirav2_dcl,#,1,compra_dcl,#,1,linea_dcl,#,1,;
k4; kq,"update dircli2 set direc2=?,nomav=?,dirav1=?,dirav2=?,
	compra=?,linea=? where idcli=?",
        direc2_dcl,#,1,nomav_dcl,#,1,dirav1_dcl,#,1,
        dirav2_dcl,#,1,compra_dcl,#,1,linea_dcl,#,1,idcli_dcl,;
k5; kq,"update dirclialta set direc2=?,nomav=?,dirav1=?,dirav2=?,
	compra=?,linea=? where idcli=?",
        direc2_dcl,#,1,nomav_dcl,#,1,dirav1_dcl,#,1,
        dirav2_dcl,#,1,compra_dcl,#,1,linea_dcl,#,1,idcli_dcl,;

f4; #isolicit2.i;
k0; ot,solicit_z,;
k1; kp,"idcli=?",idcli_z,;
k2; kq,"insert into solicit2 (idcli,sexo,edad,edociv,depend,ingres,anuant,
	mesant,ingcon,anuanc,mesanc,ingava,anuana,mesana,ingcona,anuanca,
        mesanca,casa1,casa2) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idcli_sol,sexo_sol,#,1,edad_sol,edociv_sol,#,1,depend_sol,ingres_sol,
        anuant_sol,mesant_sol,ingcon_sol,anuanc_sol,mesanc_sol,ingava_sol,
        anuana_sol,mesana_sol,ingcona_sol,anuanca_sol,mesanca_sol,
        casa1_sol,#,1,casa2_sol,#,1,;
k3; kq,"insert into solicalta (idcli,sexo,edad,edociv,depend,ingres,anuant,
	mesant,ingcon,anuanc,mesanc,ingava,anuana,mesana,ingcona,anuanca,
        mesanca,casa1,casa2) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idcli_sol,sexo_sol,#,1,edad_sol,edociv_sol,#,1,depend_sol,ingres_sol,
        anuant_sol,mesant_sol,ingcon_sol,anuanc_sol,mesanc_sol,ingava_sol,
        anuana_sol,mesana_sol,ingcona_sol,anuanca_sol,mesanca_sol,
        casa1_sol,#,1,casa2_sol,#,1,;
k4; kq,"update solicit2 set sexo=?,edad=?,edociv=?,depend=?,ingres=?,
	anuant=?,mesant=?,ingcon=?,anuanc=?,mesanc=?,ingava=?,anuana=?,
        mesana=?,ingcona=?,anuanca=?,mesanca=?,casa1=?,casa2=? where idcli=?",
        sexo_sol,#,1,edad_sol,edociv_sol,#,1,depend_sol,ingres_sol,
        anuant_sol,mesant_sol,ingcon_sol,anuanc_sol,mesanc_sol,ingava_sol,
        anuana_sol,mesana_sol,ingcona_sol,anuanca_sol,mesanca_sol,
        casa1_sol,#,1,casa2_sol,#,1,idcli_sol,;
k5; kq,"update solicalta set sexo=?,edad=?,edociv=?,depend=?,ingres=?,
	anuant=?,mesant=?,ingcon=?,anuanc=?,mesanc=?,ingava=?,anuana=?,
        mesana=?,ingcona=?,anuanca=?,mesanca=?,casa1=?,casa2=? where idcli=?",
        sexo_sol,#,1,edad_sol,edociv_sol,#,1,depend_sol,ingres_sol,
        anuant_sol,mesant_sol,ingcon_sol,anuanc_sol,mesanc_sol,ingava_sol,
        anuana_sol,mesana_sol,ingcona_sol,anuanca_sol,mesanca_sol,
        casa1_sol,#,1,casa2_sol,#,1,idcli_sol,;

f5; #imisdatsol.i;
k0; ot,misdatsol_z,;
k1; kp,"idcli=? and dato=?",idcli_z,ndato_z,;
k2; kq,"insert into misdatsol (idcli,dato,concep) values (?,?,?)",
	idcli_mdsol,dato_mdsol,concep_mdsol,;
k3; kq,"insert into misdatsolalta (idcli,dato,concep) values (?,?,?)",
	idcli_mdsol,dato_mdsol,concep_mdsol,;
k4; kq,"update misdatsol set concep=? where idcli=? and dato=?",
	concep_mdsol,idcli_mdsol,dato_mdsol,;
k5; kq,"update misdatsolalta set concep=? where idcli=? and dato=?",
	concep_mdsol,idcli_mdsol,dato_mdsol,;

f6; #idatsol.i;
k0; ot,"datsol",;
k1; kp,"concepto=?",concepto_z,#,1,;
k2; kp,"ncon=?",ncon_z,;
k3; kq,"insert into datsol (concepto,ncon) values (?,?)",
	concepto_z,#,1,ncon_z,;
k4; kq,"update misdatsoltmp set concep=? where concep=? and dato < 500",
	ncon_z,oldcon_z,;

f7; #irefsol.i;
k0; ot,"refsol";
k1; kp,"refyobs=?",refyobs_z,#,1,;
k2; kp,"nref=?",nref_z,;
k3; kq,"insert into refsol (refyobs,nref) values (?,?)",
	refyobs_z,#,1,nref_z,;
k4; kq,"update misdatsoltmp set concep=? where concep=? and dato >= 500",
	nref_z,oldref_z,;

f8; #ifacfon2.i;
k0; ot,facfon_z,;
k1; kp,"idcli=? and serie=? and nfac=?",idcli_z,seriefac_z,#,1,nfac_z,;
k3; kq,"insert into facfon2 (idcli,factur,tasa,canti1,concep1,precio1,
	canti2,concep2,precio2,canti3,idfac,precio3,subtot,iva,total,
        nfac,fecha,serie) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idcli_faf,factur_faf,#,1,tasa_faf,canti1_faf,concep1_faf,
        precio1_faf,canti2_faf,concep2_faf,precio2_faf,canti3_faf,
        idfac_faf,precio3_faf,subtot_faf,iva_faf,total_faf,nfac_faf,
        fecha_faf,#,3,serie_faf,#,1,;
k4; kq,"insert into facfonalta (idcli,factur,tasa,canti1,concep1,precio1,
	canti2,concep2,precio2,canti3,idfac,precio3,subtot,iva,total,
        nfac,fecha,serie) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idcli_faf,factur_faf,#,1,tasa_faf,canti1_faf,concep1_faf,
        precio1_faf,canti2_faf,concep2_faf,precio2_faf,canti3_faf,
        idfac_faf,precio3_faf,subtot_faf,iva_faf,total_faf,nfac_faf,
        fecha_faf,#,3,serie_faf,#,1,;
k2; kq,"delete from facfon2 where idcli = ? and idfac = ?",idcli_z,idfac_z,;
k5; kq,"delete from facfonalta where idcli = ? and idfac = ?",idcli_z,idfac_z,;

f9; M
        ncon_cpm  	l,
	concepto_cpm  s31,
        tam_cpm		s0,;
k0; ot,"conceps",;
k1; kq,"select ncon, concepto from conceps where concepto=?",concepto_z,#,1,;
k2; kq,"select ncon, concepto from conceps where ncon=?",ncon_z,;
k3; kq,"insert into conceps (concepto,ncon) values (?,?)",
	concepto_z,#,1,ncon_z,;
k4; kq,"call oldbusconcep(?)",concepto_z,#,1,;

f10; #iclitmp.i;
k0; ot,"clitmp",;
k1; kp,"((fechavta between ? and ?) or (ultmod between ? and ?))
	and tienda between ? and ? order by numcli",
	fecini_z,#,3,fecult_z,#,3,fecini_z,#,3,fecult_z,#,3,prtda_z,ultda_z,;
k2; kq,"update clitmp set poblac = ltrim(rtrim(poblac)) 
	where poblac <> ltrim(rtrim(poblac))",;

f11; #imvclitmp.i;
k0; ot,"mvclitmp",;
k1; kp,"idcli=?",idcli_z,;

f12; #idirclitmp.i;
k0; ot,"dirclitmp",;
k1; kp,"idcli=?",idcli_z,;

f13; #isolictmp.i;
k0; ot,"solictmp",;
k1; kp,"idcli=?",idcli_z,;

f14; #imisdatsoltmp.i;
k0; ot,"misdatsoltmp",;
k1; kp,"idcli=?",idcli_z,;
k2; kq,"select cast (-1 as integer) as id, a.idcli, count(*) 
        from clitmp a join mvclitmp b on a.idcli = b.idcli
        where a.idcli = ? group by id, a.idcli",idcli_z,;
k3; kq,"select cast (-2 as integer) as id, a.idcli, count(*) 
        from clitmp a join misdatsoltmp b on a.idcli = b.idcli
        where a.idcli = ? group by id, a.idcli",idcli_z,;
k4; kq,"select cast (-3 as integer) as id, a.idcli, count(*) 
        from clitmp a join car_relclistmp b on a.idcli = b.idcli
        where a.idcli = ? group by id, a.idcli",idcli_z,;
k5; kq,"select cast (-4 as integer) as id, a.idcli, count(*) 
        from clitmp a join car_vndclitmp b on a.idcli = b.idcli
        where a.idcli = ? group by id, a.idcli",idcli_z,;
k6; kq,"select cast (-5 as integer) as id, a.idcli, count(*) 
        from clitmp a join facfontmp b on a.idcli = b.idcli
        where a.idcli = ? group by id, a.idcli",idcli_z,;
k7; kq,"select cast (-6 as integer) as id, a.idcli, count(*) 
        from clitmp a join facfontmp b on a.idcli = b.idcli
  	join renfacfoalta c on b.idfac = c.idfacfon
        where a.idcli = ? group by id, a.idcli",idcli_z,;
k8; kp,"idcli=? and dato=?",iddato_z,idcli_z,;
k9; kq,"select cast (-7 as integer) as id, count(*), count(*)
        from misdatsoltmp where idcli < 0 group by id",;

f15; #idatsoltmp.i;
k0; ot,"datsoltmp",;
k1; kq,"select unique concepto,ncon from datsoltmp",;
k2; kp,"ncon=?",ncon_z,;

f16; #irefsoltmp.i;
k0; ot,"refsoltmp",;
k1; kq,"select unique refyobs,nref from refsoltmp",;
k2; kp,"nref=?",nref_z,;

f17; #iconcepstmp.i;
k0; ot,"concepstmp",;
k2; kp,"ncon=?",ncon_z,;

f18; M
	ulticon_ind18		l,;
k0; ot,"conceps",;
k1; kq,"select max(ncon) from conceps",;
k2; kq,"select max(ncon) from datsol",;
k3; kq,"select max(nref) from refsol",;
k4; kq,"select max(conse) from mvcli2 where idcli=? and fechamov=?",
	idcli_z,fechamov_z,#,3,;
k5; kq,"select max(conse) from mvclialta where idcli=? and fechamov=?",
	idcli_z,fechamov_z,#,3,;
k6; kq,"select max(idrenfacfo) from renfacfo",;
k7; kq,"select max(idrenfacfo) from renfacfoalta",;
k8; kq,"select max(idfac) from facfon2",;
k9; kq,"select max(idfac) from facfonalta",;
k10; kq,"select max(idcli) from car_clifide",;
!(voc_z)0($C,1)>|;
  k11; kq,"select max(idmvcli) from mvcli2 where idmvcli > 0",;
|
  k11; kq,"select max(idmvcli) from mvclialta where idmvcli > 0",;
.
k12; kq,"select count(*) from car_vndclitmp where idcli=?",idcli_z,;
k13; kq,"call busnombre ( ?, ?, ?, ?)",
	appat_z,#,1,apmat_z,#,1,nom1_z,#,1,nom2_z,#,1,;

f19; #ifacfontmp.i;
k0; ot,"facfontmp",;
k1; kp,"idcli=?",oldidcli_z,;
k2; kp,"fecha between ? and ? order by serie, nfac",
	fecini_z,#,3,fecult_z,#,3,;

f20; #icancel.i;
k0; ot,"cancel",;
k1; kp,"codcli=?",codigo_z,#,1,;
k2; kq,"insert into cancel (fecha,codcli,impor,devol,adeud,foc)
	values (?,?,?,?,?,?)",
        fecha_can,#,3,codcli_can,#,1,impor_can,devol_can,adeud_can,
        foc_can,#,1,;

f21; #icanceltmp.i;
k0; ot,"canceltmp",;
k1; kp,"fecha between ? and ?",fecinican_z,#,3,fecfincan_z,#,3,;
k2; kq,"select max(fecorte), cast('' as varchar(10)), cast(0 as float),
	cast(0 as float), cast(0 as float), cast('' as varchar(1))
        from car_fecorte",;
 

f22; M
	abonos_ind22		d,;
k0; ot,mvcli_z,;
k1; kq,"select sum(import) from mvcli2 where idcli=?",idcli_z,;
k2; kq,"update clientes set abonos=? where idcli=?",abonos_z,idcli_z,;
k3; kq,"select sum(import) from mvclialta where idcli=?",idcli_z,;
k4; kq,"update clialta set abonos=? where idcli=?",abonos_z,idcli_z,;

f23; #irenfacfo.i;
k0; ot,"renfacfo",;
k1; kp,"idfacfon = ?",idfac_z,;
k2; kq,"delete from renfacfo where idfacfon = ?",idfac_z,;
k3; kq,"delete from renfacfoalta where idfacfon = ?",idfac_z,;
k4; kq,"insert into renfacfo (idrenfacfo,idfacfon,idcli,codigo,descri,
	serie,preciou,canti,piva,pdsc,importe,descto,iva,cia)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idrenfacfo_rff,idfacfon_rff,idcli_rff,codigo_rff,#,1,
        descri_rff,serie_rff,#,1,preciou_rff,canti_rff,piva_rff,
        pdsc_rff,importe_rff,descto_rff,iva_rff,cia_rff,;
k5; kq,"insert into renfacfoalta (idrenfacfo,idfacfon,idcli,codigo,descri,
	serie,preciou,canti,piva,pdsc,importe,descto,iva,cia)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idrenfacfo_rff,idfacfon_rff,idcli_rff,codigo_rff,#,1,
        descri_rff,serie_rff,#,1,preciou_rff,canti_rff,piva_rff,
        pdsc_rff,importe_rff,descto_rff,iva_rff,cia_rff,;

f24; #irenfacfotmp.i;
k0; ot,"renfacfotmp",;
k1; kp,"idfacfon = ?",idfactmp_z,;

f26; #ipoblacstmp.i;
k0; ot,"poblacstmp",;
k1; kp,"nombre <> ''",;

f27; #ipoblacs.i;
k0; ot,"poblacs",;
k1; kp,"nombre = ?",poblac_z,#,1,;
k2; kq,"insert into poblacs (nombre,numero) values (?,?)",
	nombre_pob,#,1,numero_pob,;
k4; kq,"delete from renfacfo where idcli = ?",idcli_z,;
k5; kq,"delete from dircli2 where idcli = ?",idcli_z,;
k6; kq,"delete from solicit2 where idcli = ?",idcli_z,;
k7; kq,"delete from misdatsol where idcli = ?",idcli_z,;
k8; kq,"delete from facfon2 where idcli = ?",idcli_z,;
k9; kq,"delete from mvcli2 where idcli = ?",idcli_z,;
k10; kq,"delete from clientes where idcli = ?",idcli_z,;
k11;

f28; #icar_cambiostmp.i;
k0; ot,"car_cambiostmp",;
k1; kp,"fecha between ? and ?",fecini_z,#,3,fecult_z,#,3,;
k4; kp,"idcli <> 0",;
k3; kp,"idcli = ?",idcli_z,;
k4; kq,"select * from car_cambios where numcli = ? and tipo = 'B'",
	codigo_z,#,1,;

f29; #icar_clifidetmp.i;
k0; ot,"car_clifidetmp",;
k1; kp,"fecha between ? and ? and cia=?",fecini_z,#,3,fecult_z,#,3,cia_z,;

f30; #icar_clifide.i;
k0; ot,"car_clifide",;
k1; kp,"codigo=?",codigo_z,#,1,;
k2; kq,"insert into car_clifide (idcli,codigo,fecha,idnombre,iddirec,
	idcol,idpoblac,idptovta,agente,idfac,preciofid,bonifi,iduser,cia,status)
        values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        idcli_fid,codigo_fid,#,1,fecha_fid,#,3,idnombre_fid,
        iddirec_fid,idcol_fid,idpoblac_fid,idptovta_fid,agente_fid,#,1,
        idfac_fid,preciofid_fid,bonifi_fid,iduser_fid,cia_fid,status_fid,#,1,;
k3; kq,"update car_clifide set fecha=?,idnombre=?,iddirec=?,
	idcol=?,idpoblac=?,idptovta=?,agente=?,idfac=?,preciofid=?,bonifi=?,
        iduser=?,status=? where idcli=?",
        fecha_fid,#,3,idnombre_fid,
        iddirec_fid,idcol_fid,idpoblac_fid,idptovta_fid,agente_fid,#,1,
        idfac_fid,preciofid_fid,bonifi_fid,iduser_fid,status_fid,#,1,idcli_z,;

f31; M
	idrelcli_ind31		l,
        idnombre_ind31		l,
        nombre_ind31		s201,
        tam_ind31		s0,;
k0; ot,"car_relclis",;
k1; kq,"call toma_relclitmp (?, ?)",idcli_z,voc_z,#,1,;
k2; kq,"select g.idnombre, a.idapellido, a.apellido as appat from clitmp e 
	join car_relclistmp f on e.idcli = f.idcli and f.tiporel = 1
        join car_nombrestmp g on f.iddato = g.idnombre
        join car_apellidostmp a on g.idappat = a.idapellido
        where e.idcli = ?",idcli_z,;
k3; kq,"select g.idnombre, a.idapellido, a.apellido as apmat from clitmp e 
	join car_relclistmp f on e.idcli = f.idcli and f.tiporel = 1
        join car_nombrestmp g on f.iddato = g.idnombre
        join car_apellidostmp a on g.idapmat = a.idapellido
        where e.idcli = ?",idcli_z,;
k4; kq,"select g.idnombre, a.idnompil, a.nombre as nom1 from clitmp e 
	join car_relclistmp f on e.idcli = f.idcli and f.tiporel = 1
        join car_nombrestmp g on f.iddato = g.idnombre
        join car_nompil a on g.idnom1 = a.idnompil
        where e.idcli = ?",idcli_z,;
k5; kq,"select g.idnombre, a.idnompil, a.nombre as nom2 from clitmp e 
	join car_relclistmp f on e.idcli = f.idcli and f.tiporel = 1
        join car_nombrestmp g on f.iddato = g.idnombre
        join car_nompil a on g.idnom1 = a.idnompil
        where e.idcli = ?",idcli_z,;



f32; M
	idvndcli_ind32		l,
        idvnd_ind32		l,
        vnd_ind32		s4,
        comis_ind32		d,
        porvta_ind32		d,
        tam_ind32		s0,;
k0; ot,"car_vndcli",;
k1; kq,"call toma_rel_vndtmp (?,?)",idcli_z,voc_z,#,1,;
!(voc_z)0($C,1)>|;
  k2; kq,"delete from car_vndcli where idcli = ?",idcli_z,;
|
  k2; kq,"delete from car_vndclialta where idcli = ?",idcli_z,;
.

R;

[PAN;
Ff1; Gtomamaxrc; GST; Gdefine_colores; GST; Gamarillo_negro; tf; tn; #iprog1.i;
(renst_z)=(maxrow_z)(3)-;
^=direc_z,#); z0,modul_z,#; q+,modul_z,"Recibe Ventas y Modific",;
(modul2_z)=($CAR-MDS,7); GBANNER; Gblanco_azul;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;
#i/programas/lib/tomacia.i;

[R; R; [E; ];

[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[ERROR1; GST; `7; \No pude agregar registro en mantos.v ...\; gFin1;
[ERROR4; GST; `7; \No pude agregar registro \; pteruser_z,0; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
