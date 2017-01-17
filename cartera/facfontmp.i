* Buffer definitions for table facfontmp *
M
idcli_tmpfaf 		l,
factur_tmpfaf 		s7,
tasa_tmpfaf 		d,
canti1_tmpfaf 		i,
concep1_tmpfaf 		l,
precio1_tmpfaf 		d,
canti2_tmpfaf 		i,
concep2_tmpfaf 		l,
precio2_tmpfaf 		d,
canti3_tmpfaf 		i,
idfac_tmpfaf 		l,
precio3_tmpfaf 		d,
subtot_tmpfaf 		d,
iva_tmpfaf 		d,
total_tmpfaf 		d,
nfac_tmpfaf 		l,
fecha_tmpfaf 		{
	fechaYear_tmpfaf 	i,
	fechaMon_tmpfaf 	i,
	fechaDay_tmpfaf 	i,
	}

serie_tmpfaf 		s6,
status_tmpfaf 		s2,
fechayhora_tmpfaf 		{
	 fechayhoraYear_tmpfaf 	i, 
	fechayhoraMon_tmpfaf 	i, 
	fechayhoraDay_tmpfaf 	i, 
	fechayhoraHour_tmpfaf 	i, 
	fechayhoraMin_tmpfaf 	i, 
	fechayhoraSec_tmpfaf 	i, 
	fechayhoraFrac_tmpfaf 	l, 
		}
tipo_tmpfaf 		l,
iduuid_tmpfaf 		l,;
 * 22 columns (size for buffer = 127)*
*
insert into facfontmp (idcli,factur,tasa,canti1,concep1,precio1,canti2,concep2,precio2,canti3,idfac,precio3,subtot,iva,total,nfac,fecha,serie,status,fechayhora,tipo,iduuid)
 values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
idcli_tmpfaf,factur_tmpfaf,#,1,tasa_tmpfaf,canti1_tmpfaf,concep1_tmpfaf,precio1_tmpfaf,canti2_tmpfaf,concep2_tmpfaf,precio2_tmpfaf,canti3_tmpfaf,idfac_tmpfaf,precio3_tmpfaf,subtot_tmpfaf,iva_tmpfaf,total_tmpfaf,nfac_tmpfaf,fecha_tmpfaf,#,3,serie_tmpfaf,#,1,status_tmpfaf,#,1,fechayhora_tmpfaf,#,2,tipo_tmpfaf,iduuid_tmpfaf,; 
*
