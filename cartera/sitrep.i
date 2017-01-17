* Buffer definitions for table sitrep *
M
clave_sit 		s2,
descri_sit 		s16,
valor_sit 		l,;
 * 3 columns (size for buffer = 22)*
*
insert into sitrep (clave,descri,valor)
 values (?,?,?)
clave_sit,#,1,descri_sit,#,1,valor_sit,; 
*
