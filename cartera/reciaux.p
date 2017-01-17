* Programa que sirve para recibir ventas
  DRBR 10-Oct-1997
*

#dMIS02 %02d~; #dMLE6 %-6ld~; #dMLE4 %-4ld~; #dMFE %-5.2f~; #dMDS12 %,12.2f~;
#dMIS2 %2d~;   #dMLS6 %6ld~; #dMLS4 %4ld~; #dMFS5 %5.2f~; #dMDS9 %-9.2f~;
#i/programas/lib/funkey.i;

f0; M
	llavf_z    {
	  impre_z        s2,
	  font_z         s5,
	           }
	ter_z            s2,
	fech9_z     {
	  dias2_z       s16,
	  hora_z         s5,
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
	bandf1_z	 s1,
	saldo_z		d,

	banddcl_z		s1,
	fecha_z			D,
	fechb_z			D,
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
	ulmod_z			s6,
	ulmodt_z		s6,
	fechc_z			D,
	
	codigo_z		s11,
	fechamov_z	{
	  fechamovYear_z	i,
	  fechamovMon_z		i,
	  fechamovDay_z		i,
			}
	concep_z		s21,
	poliza_z		s3,
	import_z		d,
	conse_z			i,

	fech8_z           D,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;

mtam0&; tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; tr; ts0;
* &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1; phora_z,#; s1; FW3; l; *
GPAN; GABRE_TABLA;

[fei; t@5,3; \Fecha Inicial:\; t@5,20; &a; &cfecha_z; t0Fin; ifecha_z,+10;
!(fecha_z)0($-1)>fei; qD,2,fecini_z,fecha_z,;
[feu; t@6,3; \Fecha Final  :\; t@6,20; (fechb_z)=(fecha_z); t0fei; ifechb_z,+10;
!(fechb_z)0($-1)>feu; qD,2,fecult_z,fechb_z,;
GST; \Estan correctos los datos ? <S/N> : \; y|; | gfei; .

GST; \Comenzamos por Inicializar los archivos...\;
f4; k12; P$; k13; P$; k14; P$; k15; P$;
GST; \Ahora tomamos los archivos...\;

tS1,0,0,23,80; tf; tc; x./recivtas.bat ~; tr;
tf; tS0;
GST; \Ahora tenemos que cambiar las fechas y letras, codigos (a formato SQL)\;
f4;
GST;
 k11; P$; \ 1 \;
 k3; P$; \ 2 \; 
 k4; P$; \ 3 \; 
 k5; P$; \ 4 \; 
 k6; P$; \ 5 \; 
 k7; P$; \ 6 \; 
 k8; P$; \ 7 \; 
 k9; P$; \ 8 \; 
 k10; P$;\ 9 \; 
 k11; P$; \ 1 \;
 k16; P$; \ 1 \;

[Pasacalabaza;
GST; \Ahora que tenemos las tablas temporales comenzamos a tomar los datos...\;
f8; k2; P$;
{ n+;
  t@10,3; \Leyendo:\; pcodigo_tmpsol,0; GAGRESOL;
  f8; a;
)
gFin;
  
[CAMBIALO;
GST; \Lo voy a cambiar.... \;
f1; (tienda_cli)=(tienda_tmpcli); (fechavta_cli)=(fechavta_tmpcli,#);
(conse_cli)=(conse_tmpcli); (status_cli)=(status_tmpcli,#);
(nombre_cli)=(nombre_tmpcli,#); (direc_cli)=(direc_tmpcli,#); (poblac_cli)=(poblac_tmpcli,#);
(qom_cli)=(qom_tmpcli,#); (ticte_cli)=(ticte_tmpcli,#); (letra1_cli)=(letra1_tmpcli);
(enganc_cli)=(enganc_tmpcli); (nulet1_cli)=(nulet1_tmpcli); (canle1_cli)=(canle1_tmpcli);
(nulet2_cli)=(nulet2_tmpcli); (canle2_cli)=(canle2_tmpcli); (bonifi_cli)=(bonifi_tmpcli);
(servic_cli)=(servic_tmpcli); (precon_cli)=(precon_tmpcli); (agente_cli)=(agente_tmpcli,#);
(fac_cli)=(fac_tmpcli); (comisi_cli)=(comisi_tmpcli); (agent2_cli)=(agent2_tmpcli,#);
(operac_cli)=(operac_tmpcli,#); (comis2_cli)=(comis2_tmpcli); (cargos_cli)=(cargos_tmpcli);
(abonos_cli)=(abonos_tmpcli); (jefgpo_cli)=(jefgpo_tmpcli,#); (moneda_cli)=(moneda_tmpcli,#);
(solici_cli)=(solici_tmpcli,#); (pgocom_cli)=(pgocom_tmpcli,#); (ubiage_cli)=(ubiage_tmpcli,#);
(jefpas_cli)=(jefpas_tmpcli,#); (cojepa_cli)=(cojepa_tmpcli); (pdsc_cli)=(pdsc_tmpcli);
(fechal_cli)=(fechal_tmpcli,#); (ultmod_cli)=(ultmod_tmpcli,#); (fecsal_cli)=(fecsal_tmpcli,#);
(piva_cli)=(piva_tmpcli); (diacum_cli)=(diacum_tmpcli); (mescum_cli)=(mescum_tmpcli);
f1; QNOPDMDF1; w;
f5; k1; P$;
{ n+;
  t@11,3; \Verificando y Agregando Movimientos:\; pxfechamov_tmpmvc,0; s1; pconcep1_tmpmvc,0;
  (fechamov_z)=(fechamov_tmpmvc,#); (concep_z)=(concep1_tmpmvc,#); (poliza_z)=(poliza_tmpmvc,#);
  (import_z)=(import_tmpmvc); f2; k2; P;
  n|; GAGREMOV; .
  f5; a;
)
f6; k1; P; n|; GST; `7; \No tengo dircli\; y|;. R; .
f3; k1; P; n|; (banddcl_z)=($A,1); | (banddcl_z)=($M,1); .
f3; z0,codcli_dcl,l; (codcli_dcl)=(codcli_tmpdcl,#); (direc2_dcl)=(direc2_tmpdcl,#);
(nomav_dcl)=(nomav_tmpdcl,#); (dirav1_dcl)=(dirav1_tmpdcl,#); (dirav2_dcl)=(dirav2_tmpdcl,#);
(compra_dcl)=(compra_tmpdcl,#); (linea_dcl)=(linea_tmpdcl,#);
!(banddcl_z)0($A,1)>|; f3; QNOPDAGF3; I; | f3; QNOPDMDF3; w; . GAGRESOL;
R;

[AGREGACLI;
f1; z0,numcli_cli,l; (numcli_cli)=(numcli_tmpcli,#); (tienda_cli)=(tienda_tmpcli);
(fechavta_cli)=(fechavta_tmpcli,#); (conse_cli)=(conse_tmpcli); (status_cli)=(status_tmpcli,#);
(nombre_cli)=(nombre_tmpcli,#); (direc_cli)=(direc_tmpcli,#); (poblac_cli)=(poblac_tmpcli,#);
(qom_cli)=(qom_tmpcli,#); (ticte_cli)=(ticte_tmpcli,#); (letra1_cli)=(letra1_tmpcli);
(enganc_cli)=(enganc_tmpcli); (nulet1_cli)=(nulet1_tmpcli); (canle1_cli)=(canle1_tmpcli);
(nulet2_cli)=(nulet2_tmpcli); (canle2_cli)=(canle2_tmpcli); (bonifi_cli)=(bonifi_tmpcli);
(servic_cli)=(servic_tmpcli); (precon_cli)=(precon_tmpcli); (agente_cli)=(agente_tmpcli,#);
(fac_cli)=(fac_tmpcli); (comisi_cli)=(comisi_tmpcli); (agent2_cli)=(agent2_tmpcli,#);
(operac_cli)=(operac_tmpcli,#); (comis2_cli)=(comis2_tmpcli); (cargos_cli)=(cargos_tmpcli);
(abonos_cli)=(abonos_tmpcli); (jefgpo_cli)=(jefgpo_tmpcli,#); (moneda_cli)=(moneda_tmpcli,#);
(solici_cli)=(solici_tmpcli,#); (pgocom_cli)=(pgocom_tmpcli,#); (ubiage_cli)=(ubiage_tmpcli,#);
(jefpas_cli)=(jefpas_tmpcli,#); (cojepa_cli)=(cojepa_tmpcli); (pdsc_cli)=(pdsc_tmpcli);
(fechal_cli)=(fechal_tmpcli,#); (ultmod_cli)=(ultmod_tmpcli,#); (fecsal_cli)=(fecsal_tmpcli,#);
(piva_cli)=(piva_tmpcli); (diacum_cli)=(diacum_tmpcli); (mescum_cli)=(mescum_tmpcli);
f1; QNOPDAGF1; I;
f5; k1; P$;
{ n+;
  t@11,3; \Agregando Movimientos:\; pxfechamov_tmpmvc,0; s1; pconcep1_tmpmvc,0;
  (fechamov_z)=(fechamov_tmpmvc,#); (concep_z)=(concep1_tmpmvc,#); (poliza_z)=(poliza_tmpmvc,#);
  (import_z)=(import_tmpmvc); f2; k2; P;
  n|; GAGREMOV; .
  f5; a;
)
f6; k1; P; nR;
f3; k1; P; n|; (banddcl_z)=($A,1); | (banddcl_z)=($M,1); .
f3; z0,codcli_dcl,l; (codcli_dcl)=(codcli_tmpdcl,#); (direc2_dcl)=(direc2_tmpdcl,#);
(nomav_dcl)=(nomav_tmpdcl,#); (dirav1_dcl)=(dirav1_tmpdcl,#); (dirav2_dcl)=(dirav2_tmpdcl,#);
(compra_dcl)=(compra_tmpdcl,#); (linea_dcl)=(linea_tmpdcl,#);
!(banddcl_z)0($A,1)>|; f3; QNOPDAGF3; I; | f3; QNOPDMDF3; w; .
GAGRESOL;
R;

[AGRESOL;
f7; k1; P; n|; (banddcl_z)=($A,1); | R; .
z0,codigo_sol,l;
(codigo_sol)=(codigo_tmpsol,#);
(sexo_sol)=(sexo_tmpsol,#);
(edad_sol)=(edad_tmpsol);
(edociv_sol)=(edociv_tmpsol,#);
(depend_sol)=(depend_tmpsol);
(ocupac_sol)=(ocupac_tmpsol,#);
(ingres_sol)=(ingres_tmpsol);
(trabaj_sol)=(trabaj_tmpsol,#);
(teltra_sol)=(teltra_tmpsol,#);
(dirtra_sol)=(dirtra_tmpsol,#);
(anuant_sol)=(anuant_tmpsol);
(mesant_sol)=(mesant_tmpsol);
(conyug_sol)=(conyug_tmpsol,#);
(ocucon_sol)=(ocucon_tmpsol,#);
(tracon_sol)=(tracon_tmpsol,#);
(teltrc_sol)=(teltrc_tmpsol,#);
(dirtrc_sol)=(dirtrc_tmpsol,#);
(ingcon_sol)=(ingcon_tmpsol);
(anuanc_sol)=(anuanc_tmpsol);
(mesanc_sol)=(mesanc_tmpsol);
(aval_sol)=(aval_tmpsol,#);
(ocuava_sol)=(ocuava_tmpsol,#);
(traava_sol)=(traava_tmpsol,#);
(teltav_sol)=(teltav_tmpsol,#);
(dirtav_sol)=(dirtav_tmpsol,#);
(ingava_sol)=(ingava_tmpsol);
(anuana_sol)=(anuana_tmpsol);
(mesana_sol)=(mesana_tmpsol);
(conoci_sol)=(conoci_tmpsol,#);
(dircono_sol)=(dircono_tmpsol,#);
(telcono_sol)=(telcono_tmpsol,#);
(famili_sol)=(famili_tmpsol,#);
(dirfami_sol)=(dirfami_tmpsol,#);
(telfami_sol)=(telfami_tmpsol,#);
(conyava_sol)=(conyava_tmpsol,#);
(ocucona_sol)=(ocucona_tmpsol,#);
(tracona_sol)=(tracona_tmpsol,#);
(teltrca_sol)=(teltrca_tmpsol,#);
(dirtrca_sol)=(dirtrca_tmpsol,#);
(ingcona_sol)=(ingcona_tmpsol);
(anuanca_sol)=(anuanca_tmpsol);
(mesanca_sol)=(mesanca_tmpsol);
(casa1_sol)=(casa1_tmpsol,#);
(ref1_sol)=(ref1_tmpsol,#);
(ref1a_sol)=(ref1a_tmpsol,#);
(casa2_sol)=(casa2_tmpsol,#);
(ref2_sol)=(ref2_tmpsol,#);
(observ_sol)=(observ_tmpsol,#);
(dircli2_sol)=(dircli2_tmpsol,#);
!(banddcl_z)0($A,1)>|; f7; QNOPDAGF7; I; | f7; QNOPDMDF7; w; .
R;


[NOPDAGF1; GST; `7; \No pude agregar cliente....\; Z2; R;
[NOPDMDF1; GST; `7; \No pude Modificar cliente....\; Z2; R;
[NOPDAGF2; GST; `7; \No pude agregar movimiento...\; Z2; R;
[NOPDAGF3; GST; `7; \No pude agregar dircli...\; Z2; R;
[NOPDMDF3; GST; `7; \No pude modificar dircli...\; Z2; R;
[NOPDMDF7; GST; `7; \No pude modificar solicit...\; Z2; R;
[NOPDAGF7; GST; `7; \No pude agregar solicit...\; Z2; R;

[AGREMOV;
f2; k3; P$; n|; z0,conse_mvc,#; . (conse_z)=(conse_mvc)(1)+;
f2; z0,llave_mvc,l; (llave_mvc)=(llave_tmpmvc,#); (fechamov_mvc)=(fechamov_tmpmvc,#);
(coa_mvc)=(coa_tmpmvc,#); (concep1_mvc)=(concep1_tmpmvc,#); (poliza_mvc)=(poliza_tmpmvc,#);
(tipag_mvc)=(tipag_tmpmvc,#); (recobon_mvc)=(recobon_tmpmvc); (import_mvc)=(import_tmpmvc);
(oper_mvc)=(oper_tmpmvc,#); (ace_mvc)=(ace_tmpmvc,#); (usuario_mvc)=(usuario_tmpmvc,#);
(conse_mvc)=(conse_z); QNOPDAGF2; I;
R;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1;
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #iclientes.i;
k0; Ot,"clientes",;
k1; kp,"numcli = ?",codigo_z,#,1,;

f2; #imvcli.i;
k0; Ot,"mvcli",;
k1; kp,"llave=?",codigo_z,#,1,;
k2; kp,"llave=? and fechamov=? and concep1=? and poliza=? and import=?",
    codigo_z,#,1,fechamov_z,#,3,concep_z,#,1,poliza_z,#,1,import_z,;
k3; kp,"llave=? and fechamov=? order by conse desc",
    codigo_z,#,1,fechamov_z,#,3,;

f3; #idircli.i;
k0; Ot,"dircli",;
k1; kp,"codcli=?",codigo_z,#,1,;

f4; #iclitmp.i;
k0; ot,"clitmp",;
k1; kp,"numcli=?",codigo_z,#,1,;
k2; kp,"fechavta between ? and ?",fecini_z,#,3,fecult_z,#,3,;
k11; kq,"update clitmp set tienda = convert_smallint(substring(numcli,1,2)) where numcli <> ''",;
k3; kq,"update clitmp set fechavta =convert_date(
    '19'+substring(numcli,7,2)+'-'+substring(numcli,5,2)+'-'+substring(numcli,3,2)) where numcli <> ''",;
k4; kq,"update clitmp set conse = convert_smallint(substring(numcli,9,2)) where numcli <> ''",;
k5; kq,"update clitmp set nulet1 = convert_smallint(xnulet1) where numcli <> ''",;
k6; kq,"update clitmp set nulet2 = convert_integer(xnulet2) where numcli <> ''",;
k7; kq,"update clitmp set numcli =
    substring(numcli,1,2)+substring(numcli,7,2)+substring(numcli,5,2)+substring(numcli,3,2)+substring(numcli,9,2)
    where numcli <> ''",;
k8; kq,"update mvclitmp set fechamov=convert_date(
    '19'+substring(xfechamov,1,2)+'-'+substring(xfechamov,3,2)+'-'+substring(xfechamov,5,2))
    where llave<>''",;
k9; kq,"update mvclitmp set llave=
    substring(llave,1,2)+substring(llave,7,2)+substring(llave,5,2)+substring(llave,3,2)+substring(llave,9,2)
    where llave<>''",;
k10; kq,"update dirclitmp set codcli = 
     substring(codcli,1,2)+substring(codcli,7,2)+substring(codcli,5,2)+substring(codcli,3,2)+substring(codcli,9,2)
     where codcli <> ''",;
k16; kq,"update solictmp set codigo=
     substring(codigo,1,2)+substring(codigo,7,2)+substring(codigo,5,2)+substring(codigo,3,2)+substring(codigo,9,2)",;

k12; kq,"delete from dirclitmp",;
k13; kq,"delete from mvclitmp",;
k14; kq,"delete from clitmp",;
k15; kq,"delete from solictmp",;

f5; #imvclitmp.i;
k0; ot,"mvclitmp",;
k1; kp,"llave=?",codigo_z,#,1,;

f6; #idirclitmp.i;
k0; Ot,"dirclitmp",;
k1; kp,"codcli=?",codigo_z,#,1,;

f7; #isolicit.i;
k0; Ot,"solicit",;
k1; kp,"codigo=?",codigo_z,#,1,;

f8; #isolictmp.i;
k0; Ot,"solictmp",;
k1; kp,"codigo=?",codigo_z,#,1,;
k2; kp,"codigo <> ''",;
R;

[PAN; 
Ff1; GST; tf; tn; #iprog1.i;
^=direc_z,#); z0,modul_z,#; (modul_z)=($Recibe Ventas y Modific,23); (modul2_z)=($CAR-MDS,7);
Fslexten_z,nemp_z; ta1; t@0,1; pdirec_z,0;
(esp_z)=(80)(exten_z)-(2)/; Ff1; t@1,esp_z; pnemp_z,0;
Fslexten_z,modul_z; (esp_z)=(79)(exten_z)-; t@0,esp_z; pmodul_z,0; ta0; tp;
Fslexten_z,modul2_z; (esp_z)=(78)(exten_z)-; t@1,esp_z; pmodul2_z,0;
R;

[R; R; [E; ];
[ST; t@21,1; ta0; s78; t@21,1; ta1; ta=; ta0; R;
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[ERROR1; GST; `7; \No pude agregar registro en mantos.v ...\; gFin1;
[ERROR4; GST; `7; \No pude agregar registro \; pteruser_z,0; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

[Fin1; y|;.
[Fin; t@23,0; te; };
