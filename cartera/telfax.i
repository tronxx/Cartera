* Buffer definitions for table telfax *
M
idtel_tel 		l,
telfax_tel 		s51,;
 * 2 columns (size for buffer = 55)*
*
insert into telfax (idtel,telfax)
 values (?,?)
idtel_tel,telfax_tel,#,1,; 
*
