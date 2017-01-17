* Programa que sirve para dar de Alta a las Solicitudes
  DRBR   21-Dic-1993
*

#dMDS10 %,10.2f~; #dMDE10 %-10.2f~; #dMIS2 %2d~; #dMIS02 %02d~; #dMIE2 %-2d~;
#dMDE10a %-10.0f~; #dMDS10a %10.0f~;
#i/programas/lib/funkey.i; tsp70;


f0; M
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
	clientes_z		s20,
	solicit_z		s20,
        misdatsol_z		s20,
	milinea_z		s100,
        sqlcmd_z		s200,
	ter_z            s2,
	fech9_z     {
	  dias_z        s16,
	  hora_z         s5,
	  resto_z        s5,
	            }
	nombre_z		s35,
	mibd_z			s80,
	solic_z     {
	  codigo_z        s11,
	  sexo_z           s2,
	  edad_z            i,
	  edociv_z         s2,
	  depend_z          i,
	  ocupac_z        s31,
	  ingres_z          d,
	  trabaj_z        s31,
	  teltra_z        s31,
	  dirtra_z        s31,
	  antig_z     {       
	    anuant_z        i,
	    mesant_z        i,
	               }
	  conyug_z        s31,
	  ocucon_z        s31,
	  tracon_z        s31,
	  teltrc_z        s31,
	  dirtrc_z        s31,
	  ingcon_z          d,
	  antcon_z     {
	    anuanc_z        i,
	    mesanc_z        i,
	               }
	  aval_z          s31,
	  ocuava_z        s31,
	  traava_z        s31,
	  teltav_z        s31,
	  dirtav_z        s31,
	  ingava_z          d,
	  antava_z    {       
	    anuana_z        i,
	    mesana_z        i,
	               }
	  conoci_z        s31,
	  dircono_z       s31,
	  telcono_z       s31,
	  famili_z        s31,
	  dirfami_z       s31,
	  telfami_z       s31,
	  conyava_z       s31,
	  ocucona_z       s31,
	  tracona_z       s31,
	  teltrca_z       s31,
	  dirtrca_z       s31,
	  ingcona_z         d,
	  antcona_z  {
	    anuanca_z       i,
	    mesanca_z       i,
	               }
	  refer_z      {
	    casa1_z        s6,  * Clave de la Casa Comercial                    *
	    ref1_z        s66,  * Referencias                                   *
	    ref1a_z       s66,  * Referencias 1a                                *
	    casa2_z        s6,  * Clave de la Casa Comercial                    *
	    ref2_z        s66,  * Referencias                                   *
	               }
	  observ_z        s66,
	            }
	casaux_z         s5,
	fech8_z           D,
	ncli_z            d,
	clacas_z         s5,
	nomcas_z        s31,
	descedc_z       s11,
	banp_z           s1,
	banr_z           s1,
        idcli_z			l,
        ndato_z			l,
        ncon_z 		        l,
        concepto_z		s31,
        vacio_z			s31,
        refyobs_z		s66,
        vacio2_z		s66,
        nref_z			l,
* --> Estas son las variables que se necesitan para usar esta funcion  <--  *
	pos_z             l,
	narts_z           i,
	tpmov_z          s1,
	band_z           s1,
	bandb_z          s1,
	band4_z          s1,
	ren_z             i,
	iii_z             i,
	pos1_z            l,
	col1_z            i,
	col2_z            i,
	xx_z              i,
	yy_z              i,
	ren2_z            i,
	cols_z            i,
	ii_z              i,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	nargs_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;
mtam0&; tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; ts0;
ttttermi_z; >istermi_z,ter_z,%02d~;
* &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1; phora_z,#; s1; FW3; l; *
z0,vacio_z,#; z0,vacio2_z,#; (banp_z)=($1,1); GPAN; GABRE_TABLA;

$inargs_z;
!(nargs_z)2($2)>|;
  z32,codigo_z,#;
|
  $s1,codigo_z,#;
.
Glocalizalo;
EK0; GKprog1;
{ 
  GMENS; 
  ?G[Mmodsol, [FFin, [Aantsol, [Ssigsol, [hmisar, [Ocodigo,
    [mmodsol, [fFin, [aantsol, [ssigsol, [Hmisar, [ocodigo;
)
gFin;

[MENS;
GST; \Seleccione : `M`odificar `F`in `C`asas\;
R;

[antsol; f1; b; n|; S$zzzzzzzzzz; nR; . GDESPSOL; R;
[sigsol; f1; a; n|; b; nR; . GDESPSOL; R;

[DESPSOL;
(sexo_z)=(sexo_sol,#); (edad_z)=(edad_sol);
(edociv_z)=(edociv_sol,#); (depend_z)=(depend_sol);
(ingres_z)=(ingres_sol);  (anuant_z)=(anuant_sol); (mesant_z)=(mesant_sol);
(ingcon_z)=(ingcon_sol); (anuanc_z)=(anuanc_sol); (mesanc_z)=(mesanc_sol);
(ingava_z)=(ingava_sol); (anuana_z)=(anuana_sol); (mesana_z)=(mesana_sol);
(ingcona_z)=(ingcona_sol); (anuanca_z)=(anuanca_sol); (mesanca_z)=(mesanca_sol);
(casa1_z)=(casa1_sol,#); (casa2_z)=(casa2_sol,#); 

tL60; pnumcli_cli,10; tL00; psexo_sol,1; tL01; pedad_sol,MIS2;
tL02; pedociv_sol,0; tL03; pdepend_sol,MIS2; tL05; pingres_sol,MDS10;
tL09; panuant_sol,MIS2; tL10; pmesant_sol,MIS2;
tL16; pingcon_sol,MDS10; tL17; panuanc_sol,MIS2; tL18; pmesanc_sol,MIS2;
tL24; pingava_sol,MDS10; tL25; panuana_sol,MIS2; tL26; pmesana_sol,MIS2;
tL57; pingcona_sol,MDS10;
tL58; panuanca_sol,MIS2; tL59; pmesanca_sol,MIS2;
tL33; pcasa1_sol,0; tL39; pcasa2_sol,0;
z0,ocupac_z,#; z0,trabaj_z,#; z0,teltra_z,#; z0,dirtra_z,#; z0,conyug_z,#;
z0,ocucon_z,#; z0,tracon_z,#; z0,teltrc_z,#; z0,dirtrc_z,#; z0,aval_z,#;
z0,ocuava_z,#; z0,traava_z,#; z0,teltav_z,#; z0,dirtav_z,#; z0,conoci_z,#;
z0,dircono_z,#; z0,famili_z,#; z0,dirfami_z,#; z0,conyava_z,#; z0,ocucona_z,#;
z0,tracona_z,#; z0,teltrca_z,#; z0,dirtrca_z,#; z0,observ_z,#; z0,ref1_z,#;
z0,ref1a_z,#;   z0,ref2_z,#;

f2; k2; P$;
{ n+;
  !(dato_mdsol)2($500)>|;
    (ncon_z)=(concep_mdsol); GBUSCONCEP;
  |
    (nref_z)=(concep_mdsol); GBUSREFYOBS;
  .
  (ndato_z)=(dato_mdsol);
  !(ndato_z)0($005)>|; (ocupac_z)=(concepto_dsol,#);  .
  !(ndato_z)0($010)>|; (trabaj_z)=(concepto_dsol,#);  .
  !(ndato_z)0($015)>|; (teltra_z)=(concepto_dsol,#);  .
  !(ndato_z)0($020)>|; (dirtra_z)=(concepto_dsol,#);  .
  !(ndato_z)0($025)>|; (conyug_z)=(concepto_dsol,#);  .
  !(ndato_z)0($030)>|; (ocucon_z)=(concepto_dsol,#);  .
  !(ndato_z)0($035)>|; (tracon_z)=(concepto_dsol,#);  .
  !(ndato_z)0($040)>|; (teltrc_z)=(concepto_dsol,#);  .
  !(ndato_z)0($045)>|; (dirtrc_z)=(concepto_dsol,#);  .
  !(ndato_z)0($050)>|; (aval_z)=(concepto_dsol,#);    .
  !(ndato_z)0($055)>|; (ocuava_z)=(concepto_dsol,#);  .
  !(ndato_z)0($060)>|; (traava_z)=(concepto_dsol,#);  .
  !(ndato_z)0($065)>|; (teltav_z)=(concepto_dsol,#);  .
  !(ndato_z)0($070)>|; (dirtav_z)=(concepto_dsol,#);  .
  !(ndato_z)0($075)>|; (conoci_z)=(concepto_dsol,#);  .
  !(ndato_z)0($080)>|; (dircono_z)=(concepto_dsol,#); .
  !(ndato_z)0($090)>|; (famili_z)=(concepto_dsol,#);  .
  !(ndato_z)0($095)>|; (dirfami_z)=(concepto_dsol,#); .
  !(ndato_z)0($105)>|; (conyava_z)=(concepto_dsol,#); .
  !(ndato_z)0($110)>|; (ocucona_z)=(concepto_dsol,#); .
  !(ndato_z)0($115)>|; (tracona_z)=(concepto_dsol,#); .
  !(ndato_z)0($120)>|; (teltrca_z)=(concepto_dsol,#); .
  !(ndato_z)0($125)>|; (dirtrca_z)=(concepto_dsol,#); .
  !(ndato_z)0($515)>|; (observ_z)=(refyobs_rfsol,#);  .
  !(ndato_z)0($500)>|; (ref1_z)=(refyobs_rfsol,#);    .
  !(ndato_z)0($505)>|; (ref1a_z)=(refyobs_rfsol,#);   .
  !(ndato_z)0($510)>|; (ref2_z)=(refyobs_rfsol,#);    .
  f2; a;
)

tL04; pocupac_z,30;
tL06; ptrabaj_z,30;
tL07; pteltra_z,30;
tL08; pdirtra_z,30;
tL11; pconyug_z,30;
tL12; pocucon_z,30;
tL13; ptracon_z,30;
tL14; pteltrc_z,30;
tL15; pdirtrc_z,30;
tL19; paval_z,30;
tL20; pocuava_z,30;
tL21; ptraava_z,30;
tL22; pteltav_z,30;
tL23; pdirtav_z,30;
tL27; pconoci_z,30;
tL28; pdircono_z,30;
tL30; pfamili_z,30;
tL31; pdirfami_z,30;
tL52; pconyava_z,30;
tL53; pocucona_z,30;
tL54; ptracona_z,30;
tL55; pteltrca_z,30;
tL56; pdirtrca_z,30;
tL51; pobserv_z,65;
tL34; pref1_z,65;
tL35; pref1a_z,65;
tL40; pref2_z,65;
R;

[BUSDATO;
f2; k1; P$; n|; z0,idcli_mdsol,l; . (ncon_z)=(concep_mdsol); GBUSCONCEP;
R;

[BUSCONCEP;
z0,concepto_dsol,l; f4; k2; P$; n|;.
R;

[BUSREF;
f2; k1; P$; n|; z0,idcli_mdsol,l; . (nref_z)=(concep_mdsol); GBUSREFYOBS;
R;

[BUSREFYOBS;
z0,refyobs_rfsol,l;
f5; k2; P$; n|;.
R;

[modsol;
GST; \Seguro de Modificar esta Solicitud ? <S/N> : \; y|; | gR; .
GPIDATS; !(band_z)5($S,1)>R; f1; k1; P;
n|; GMEMTAR; QNOPDAGF1; f1; I; | GMEMTAR; QNOPDMDF1; f1; w; .
(ndato_z)=(005); (concepto_z)=(ocupac_z,#);   GAGREDATO;
(ndato_z)=(010); (concepto_z)=(trabaj_z,#);   GAGREDATO;
(ndato_z)=(015); (concepto_z)=(teltra_z,#);   GAGREDATO;
(ndato_z)=(020); (concepto_z)=(dirtra_z,#);   GAGREDATO;
(ndato_z)=(025); (concepto_z)=(conyug_z,#);   GAGREDATO;
(ndato_z)=(030); (concepto_z)=(ocucon_z,#);   GAGREDATO;
(ndato_z)=(035); (concepto_z)=(tracon_z,#);   GAGREDATO;
(ndato_z)=(040); (concepto_z)=(teltrc_z,#);   GAGREDATO;
(ndato_z)=(045); (concepto_z)=(dirtrc_z,#);   GAGREDATO;
(ndato_z)=(050); (concepto_z)=(aval_z,#);     GAGREDATO;
(ndato_z)=(055); (concepto_z)=(ocuava_z,#);   GAGREDATO;
(ndato_z)=(060); (concepto_z)=(traava_z,#);   GAGREDATO;
(ndato_z)=(065); (concepto_z)=(teltav_z,#);   GAGREDATO;
(ndato_z)=(070); (concepto_z)=(dirtav_z,#);   GAGREDATO;
(ndato_z)=(075); (concepto_z)=(conoci_z,#);   GAGREDATO;
(ndato_z)=(080); (concepto_z)=(dircono_z,#);  GAGREDATO;
(ndato_z)=(090); (concepto_z)=(famili_z,#);   GAGREDATO;
(ndato_z)=(095); (concepto_z)=(dirfami_z,#);  GAGREDATO;
(ndato_z)=(105); (concepto_z)=(conyava_z,#);  GAGREDATO;
(ndato_z)=(110); (concepto_z)= (ocucona_z,#); GAGREDATO;
(ndato_z)=(115); (concepto_z)=(tracona_z,#);  GAGREDATO;
(ndato_z)=(120); (concepto_z)=(teltrca_z,#);  GAGREDATO;
(ndato_z)=(125); (concepto_z)=(dirtrca_z,#);  GAGREDATO;
(ndato_z)=(500); (refyobs_z)=(ref1_z,#);  GAGREREF;
(ndato_z)=(505); (refyobs_z)=(ref1a_z,#); GAGREREF;
(ndato_z)=(510); (refyobs_z)=(ref2_z,#);  GAGREREF;

GDESPSOL;
R;

[NOPDAGF1; GST; `7; \No pude agregar registro en \p solicit_z,0; Z1; R;
[NOPDMDF1; GST; `7; \No pude modificar registro en \p solicit_z,0; Z1; R;

[bajsol;
f1; k1; P$; nR; GST; \Seguro de Borrar Esta Solicitud ? <S/N> : \;
y|; f1; D; T; n|;. GPAN; .
R;

[nvasol; R;

[codigo;
GST; \Teclee el Codigo : \; t0R; icodigo_z,#; (bandb_z)=($C,1); Gbusca2;
Glocalizalo;
R;

[localizalo;
f3; k1; P; nR; (idcli_z)=(idcli_cli);
f1; k1; P; n|; z0,idcli_sol,l; . GDESPSOL;
R;

[PIDATS;
z32,band_z,#;
{
  [sex; GST; \Teclee si el Cliente es de Sexo `F`emenino o `M`asculino ...\;
  tL00; t0+; isexo_z,1; !(sexo_z)5($F,1)(sexo_z)5($M,1)&>sex;
  [eda; GST; \Teclee la Edad del Cliente ...\; tL01; t0sex; iedad_z,MIE2,MIS2;
  [edc; GST; \Teclee el Edo. Civil del Cliente ...\; tL02; t0eda; iedociv_z,1;
  [dep; GST; \Teclee el No. de Personas Dependen Economicamente del Cliente\;
  tL03; t0edc; idepend_z,MIE2,MIS2;
  [ocu; GST; \Teclee la Ocupacion del Cliente ...\; tL04; t0dep; iocupac_z,30;
  [ing; GST; \Teclee el Ingreso Mensual del Cliente ...\; tL05; t0ocu;
  iingres_z,MDE10,MDS10;
  [tra; GST; \Teclee el Lugar de Trabajo del Cliente ...\; tL06; t0ing;
  itrabaj_z,30;
  [tel; GST; \Teclee el Telefono de su trabajo...\; tL07; t0tra; iteltra_z,30;
  [dit; GST; \Teclee la Direccion de su Trabajo...\; tL08; t0tel; idirtra_z,30;
  [ant; GST; \Teclee cuantos Anios de Antiguedad Tiene en su Trabajo...\;
  tL09; t0dit; ianuant_z,MIE2,MIS2;
  [mea; GST; \Teclee Cuantos Meses de Antiguedad ...\; tL10; t0ant;
  imesant_z,MIE2,MIS2;
  [con; GST; \Teclee el Nombre del Conyuge del Cliente ...\; t0mea;
  tL11; iconyug_z,30;
  [oco; GST; \Teclee la Ocupacion del Conyuge ...\; tL12; t0con; iocucon_z,30;
  [trc; GST; \Teclee el Lugar de Trabajo del Conyuge...\; tL13; t0oco;
  itracon_z,30;
  [ttc; GST; \Teclee el Telefono del Trabajo del Conyuge ...\; t0trc; tL14;
  iteltrc_z,30;
  [dtc; GST; \Teclee la Direccion del Trabajo del Conyuge ...\; t0ttc;
  tL15; idirtrc_z,30;
  [inc; GST; \Teclee el Ingreso Mensual del Conyuge ...\; t0dtc;
  tL16; iingcon_z,MDE10,MDS10;
  [anc; GST; \Teclee cuantos anios de Antiguedad Tiene el Conyuge en su Trabajo\;
  tL17; t0inc; ianuanc_z,MIE2,MIS2;
  [mac; GST; \Con Cuantos Meses ? ...\; tL18; t0anc; imesanc_z,MIE2,MIS2;
  [ava; GST; \Nombre del Aval del Cliente ...\; t0mac; tL19; iaval_z,30;
  [oca; GST; \Teclee la Ocupacion del Aval ...\; tL20; t0ava; iocuava_z,30;
  [taa; GST; \Teclee el Lugar de Trabajo del Cliente ...\; t0oca;
  tL21; itraava_z,30;
  [tea; GST; \Teclee el Telefono del Aval ...\; t0taa; tL22; iteltav_z,30;
  [dta; GST; \Teclee la Direccion del Trabajo del Aval ...\; t0tea;
  tL23; idirtav_z,30;
  [ina; GST; \Teclee los Ingresos Mensuales del Aval ...\; t0dta;
  tL24; iingava_z,MDE10,MDS10;
  [ana; GST; \Teclee la Antiguedad del Aval en el Trabajo ...\;
  t0ina; tL25; ianuana_z,MIE2,MIS2;
  [maa; GST; \Teclee con Cuantos Meses ...\; t0ana; tL26; imesana_z,MIE2,MIS2;
  [cna; GST; \Teclee el Nombre del Conyuge del Aval del Cliente ...\; t0maa;
  tL52; iconyava_z,30;
  [oya; GST; \Teclee la Ocupacion del Conyuge del Aval ...\; tL53; t0cna;
  iocucona_z,30;
  [tca; GST; \Teclee el Lugar de Trabajo del Conyuge del Aval...\; tL54; t0oya;
  itracona_z,30;
  [ttca; GST; \Teclee el Telefono del Trabajo del Conyuge del Aval...\; t0tca;
  tL55; iteltrca_z,30;
  [dtca; GST; \Teclee la Direccion del Trabajo del Conyuge del Aval...\; t0ttca;
  tL56; idirtrca_z,30;
  [inca; GST; \Teclee el Ingreso Mensual del Conyuge del Aval...\; t0dtca;
  tL57; iingcona_z,MDE10,MDS10;
  [anca; GST; \Teclee cuantos anios de Antiguedad Tiene el Conyuge del Aval en su Trabajo\;
  tL58; t0inca; ianuanca_z,MIE2,MIS2;
  [maca; GST; \Con Cuantos Meses ? ...\; tL59; t0anca; imesanca_z,MIE2,MIS2;
  [fam; GST; \Teclee el Nombre de algun Familiar del Cliente ...\;
  t0maa; tL30; ifamili_z,30;
  [dfa; GST; \Teclee la Direccion del Familiar ...\; t0fam; tL31; idirfami_z,30;
  [cno; GST; \Teclee el Nombre de un Conocido del Cliente ...\;
  tL27; t0dfa; iconoci_z,30;
  [dcn; GST; \Teclee la Direccion del Conocido ...\; t0cno; tL28; idircono_z,30;
  [cs1; GST; \Teclee la Casa Comercial de la Referencia ...\;
  tL33; t0dcn; icasa1_z,5;
  [rf1; GST; \Teclee las Referencias ...\; t0cs1; tL34; iref1_z,65;
  [rf1a; GST; \Continue con las Referencias ...\; t0rf1; tL35; iref1a_z,65;
  [cs2; GST; \Teclee la Casa Comercial de la Referencia ...\;
  tL39; t0rf1; icasa2_z,5;
  [rf2; GST; \Teclee las Referencias ...\; t0cs2; tL40; iref2_z,65;
  [obs; GST; \Teclee sus Obervaciones ...\; t0dcn; tL51; iobserv_z,65;
  GST; \Estan Correctos los Datos ? <S/N> : \; y|; (band_z)=($S,1); g+; .
)
R;

[ARTMEM; R;

[MEMTAR;
(idcli_sol)=(idcli_z); (sexo_sol)=(sexo_z,#); (edad_sol)=(edad_z);
(edociv_sol)=(edociv_z,#); (depend_sol)=(depend_z);
(ingres_sol)=(ingres_z);  (anuant_sol)=(anuant_z); (mesant_sol)=(mesant_z);
(ingcon_sol)=(ingcon_z); (anuanc_sol)=(anuanc_z); (mesanc_sol)=(mesanc_z);
(ingava_sol)=(ingava_z); (anuana_sol)=(anuana_z); (mesana_sol)=(mesana_z);
(ingcona_sol)=(ingcona_z); (anuanca_sol)=(anuanca_z); (mesanca_sol)=(mesanca_z);
(casa1_sol)=(casa1_z,#); (casa2_sol)=(casa2_z,#); 
R;

[AGREDATO;
!(concepto_z)0(vacio_z,#)>R;
f4; k1; P$;
n|;
  z0,ulticon_ind6,l; f6; k1; P$; n|;. (ncon_z)=(ulticon_ind6)(1)+;
  f4; k3; P$;
|
  (ncon_z)=(ncon_dsol);
.
f2; k1; P;
n|;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"insert into ",misdatsol_z," (idcli,dato,concep)",
  " values (",idcli_z,",",ndato_z,",",ncon_z,")",;
  f6; k3; qx,sqlcmd_z,;
|
  !(concep_mdsol)0(ncon_z)>R;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"update ",misdatsol_z," set concep=",ncon_z,
  " where idcli=",idcli_z," and dato=",ndato_z,;
  f6; k3; qx,sqlcmd_z,ncon_z,idcli_z,ndato_z,;
.
R;

[AGREREF;
!(refyobs_z)0(vacio2_z,#)>R;
f5; k1; P$;
n|;
  z0,ulticon_ind6,l; f6; k2; P$; n|;. (nref_z)=(ulticon_ind6)(1)+;
  f5; k3; P$;
|
  (nref_z)=(nref_rfsol);
.
f2; k1; P;
n|;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"insert into ",misdatsol_z," (idcli,dato,concep)",
  " values (",idcli_z,",",ndato_z,",",nref_z,")",;
  GST; psqlcmd_z,0; y|;. f6; k3; qx,sqlcmd_z,;
|
  !(concep_mdsol)0(ncon_z)>R;
  z0,sqlcmd_z,#; q+,sqlcmd_z,"update ",misdatsol_z," set concep=",nref_z,
  " where idcli=",idcli_z," and dato=",ndato_z,;
   GST; psqlcmd_z,0; y|;. f6; k3; qx,sqlcmd_z,;
.
R;
* ------      --> Este es el Codigo de la Busqueda  <--       -------------  *
[busca2; R;
[antersol; Gantsol; GMENS; ];
[sigtesol; Gsigsol; GMENS; ];


[Ayuda; ];

[Kprog1;
KcF1,Ayuda,PU,antersol,PD,sigtesol;
R;

[misar;
tS11,10,1,10,70; tM;
t@1,1; \Clientes :\; pclientes_z,0; s10;
t@2,1; \Solicit  :\; psolicit_z,0; s10;
t@3,1; \Misdatsol:\; pmisdatsol_z,0; s10;
t@6,1; \Presione <S> P/Continuar...\; y|;.
tR11,10,1,10,70; tS0;
R;

[TOMAALTAS;
Ff6; FOaltas.ini~,r~;
{ Ff6; FG+; z0,milinea_z,#; Fkmilinea_z,l;
  !(milinea_z)0($clientes:,9)>|; Ff6; FG+; Fkclientes_z,l; g-; .
  !(milinea_z)0($solicit:,8)>|;  Ff6; FG+; Fksolicit_z,l;  g-; .
  !(milinea_z)0($misdatsol:,10)>|;  Ff6; FG+; Fkmisdatsol_z,l;  g-; .
)
R;

[ABRE_TABLA;
GTOMAALTAS; Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1; fd1; 
O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *

f1; #isolicit2.i;
k0; ot,solicit_z,;
k1; kp,"idcli=?",idcli_z,;

f3; #iclientes.i;
k0; ot,clientes_z,;
k1; kp,"numcli = ?",codigo_z,#,1,;
k2; kp,"nombre like ?",nombre_z,#,1,;

f2; #imisdatsol.i;
k0; ot,misdatsol_z,;
k1; kp,"idcli=? and dato=?",idcli_z,ndato_z,;
k2; kp,"idcli=?",idcli_z,;

f4; #idatsol.i;
k0; ot,"datsol",;
k1; kp,"concepto=?",concepto_z,#,1,;
k2; kp,"ncon=?",ncon_z,;
k3; kq,"insert into datsol(concepto,ncon) values (?,?)",
	concepto_z,#,1,ncon_z,;

f5; #irefsol.i;
k0; ot,"refsol",;
k1; kp,"refyobs=?",refyobs_z,#,1,;
k2; kp,"nref=?",nref_z,;
k3; kq,"insert into refsol(refyobs,nref) values (?,?)",
	refyobs_z,#,1,nref_z,;

f6; M
	ulticon_ind6		l,;
k0; ot,"datsol",;
k1; kq,"select max(ncon) from datsol",;
k2; kq,"select max(nref) from refsol",;
k3;
R;


[PAN; 
Ff1; tf; tn; tP/programas/vps/cartera/altasol.s~;
tL/programas/vps/cartera/altasol.pos~; ta0; t@0,0; tB80,3;
t@0,0; tB80,23; ^=direc_z,#); Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
(esp_z)=(80)(exten_z)-(2)/; Ff1; t@1,esp_z; pnemp_z,0;
Fslexten_z,modul_z; (esp_z)=(79)(exten_z)-; t@0,esp_z; pmodul_z,0; ta0; tp;
Fslexten_z,modul2_z; (esp_z)=(78)(exten_z)-; t@1,esp_z; pmodul2_z,0;
R;

[R; R; [E; ];
[ST; t@23,0; tl; ta1; ta=; ta0; tp; R;
[NOBD; Ff1; GST; `7; \archivo basedato.ini incompleto o inexistente...\; gFin1;
[ERRCNB; GST; `7; \No pude conectarme a la BD ...\; gFin1;
[ERROR1; GST; `7; \No pude agregar registro en solicit.v...\; gFin1;
[ERROR2; GST; `7; \No pude agregar registro en casas.v...\; gFin1;
[ERROR4; GST; `7; \No pude agregar registro en edociv.v...\; gFin1;
[ERROR5; GST; `7; \No pude agregar registro en cambios.v ...\; gFin1;

[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
