* Buffer definitions for table renpol2 *
M
fecha_rpo 		{
	fechaYear_rpo 	i,
	fechaMon_rpo 	i,
	fechaDay_rpo 	i,
	}

tda_rpo 		s3,
idcli_rpo 		l,
sino_rpo 		s2,
concep_rpo 		l,
tipo_rpo 		s3,
rob_rpo 		d,
impor_rpo 		d,
salcli_rpo 		d,
moneda_rpo 		s2,
fecven_rpo 		{
	fecvenYear_rpo 	i,
	fecvenMon_rpo 	i,
	fecvenDay_rpo 	i,
	}

comis_rpo 		d,
dias_rpo 		i,
cobr2_rpo 		s4,
usuario_rpo 		s5,
ace_rpo 		s2,
conse_rpo 		i,
feccap_rpo 		{
	 feccapYear_rpo 	i, 
	feccapMon_rpo 	i, 
	feccapDay_rpo 	i, 
	feccapHour_rpo 	i, 
	feccapMin_rpo 	i, 
	feccapSec_rpo 	i, 
	feccapFrac_rpo 	l, 
		}
idrenpol_rpo 		l,
idpoliza_rpo 		l,
idcobra_rpo 		l,
idusuario_rpo 		l,
foliobon_rpo 		l,
iduuid_rpo 		l,
idfacfon_rpo 		l,;
 * 25 columns (size for buffer = 121)*
*
insert into renpol2 (fecha,tda,idcli,sino,concep,tipo,rob,impor,salcli,moneda,fecven,comis,dias,cobr2,usuario,ace,conse,feccap,idrenpol,idpoliza,idcobra,idusuario,foliobon,iduuid,idfacfon)
 values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
fecha_rpo,#,3,tda_rpo,#,1,idcli_rpo,sino_rpo,#,1,concep_rpo,tipo_rpo,#,1,rob_rpo,impor_rpo,salcli_rpo,moneda_rpo,#,1,fecven_rpo,#,3,comis_rpo,dias_rpo,cobr2_rpo,#,1,usuario_rpo,#,1,ace_rpo,#,1,conse_rpo,feccap_rpo,#,2,idrenpol_rpo,idpoliza_rpo,idcobra_rpo,idusuario_rpo,foliobon_rpo,iduuid_rpo,idfacfon_rpo,; 
*
