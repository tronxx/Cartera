* Buffer definitions for table car_observrep *
M
idobservrep_obr 		l,
idreporte_obr 		l,
fecha_obr 		{
	fechaYear_obr 	i,
	fechaMon_obr 	i,
	fechaDay_obr 	i,
	}

iddatpolser_obr 		l,
idobserv_obr 		l,;
 * 5 columns (size for buffer = 22)*
*
insert into car_observrep (idobservrep,idreporte,fecha,iddatpolser,idobserv)
 values (?,?,?,?,?)
idobservrep_obr,idreporte_obr,fecha_obr,#,3,iddatpolser_obr,idobserv_obr,; 
*
