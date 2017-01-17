* Buffer definitions for table renposer *
M
fecha_rps 		{
	fechaYear_rps 	i,
	fechaMon_rps 	i,
	fechaDay_rps 	i,
	}

tda_rps 		s5,
conse_rps 		i,
reporte_rps 		l,
movto_rps 		s2,
observ_rps 		s21,
top_rps 		s2,
nomat_rps 		s21,
atie2_rps 		s4,
zona_rps 		s3,
ubica_rps 		i,
import_rps 		d,
boe_rps 		s2,;
 * 13 columns (size for buffer = 82)*
*
insert into renposer (fecha,tda,conse,reporte,movto,observ,top,nomat,atie2,zona,ubica,import,boe)
 values (?,?,?,?,?,?,?,?,?,?,?,?,?)
fecha_rps,#,3,tda_rps,#,1,conse_rps,reporte_rps,movto_rps,#,1,observ_rps,#,1,top_rps,#,1,nomat_rps,#,1,atie2_rps,#,1,zona_rps,#,1,ubica_rps,import_rps,boe_rps,#,1,; 
*
