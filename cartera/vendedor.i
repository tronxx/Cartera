* Buffer definitions for table vendedor *
M
codigo_ven 		s4,
nombre_ven 		s21,
idvnd_ven 		l,
idnombre_ven 		l,;
 * 4 columns (size for buffer = 33)*
*
insert into vendedor (codigo,nombre,idvnd,idnombre)
 values (?,?,?,?)
codigo_ven,#,1,nombre_ven,#,1,idvnd_ven,idnombre_ven,; 
*
