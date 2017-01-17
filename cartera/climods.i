* Buffer definitions for table climods *
M
idcli_clm 		l,
fecha_clm 		{
	fechaYear_clm 	i,
	fechaMon_clm 	i,
	fechaDay_clm 	i,
	}
;
 * 2 columns (size for buffer = 10)*
*
insert into climods (idcli,fecha)
 values (?,?)
idcli_clm,fecha_clm,#,3,; 
*
