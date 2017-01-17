* Buffer definitions for table polser *
M
fecha_pos { fechaYear_pos i, fechaMon_pos i, fechaDay_pos i, }
tda_pos  s5,
status_pos  s2,
usuario_pos  s21,;
 * 4 columns (size for buffer = 34)*

*
"insert into polser (fecha,tda,status,usuario,
 values (?,?,?,?)",
fecha_pos,#,3,tda_pos,#,1,status_pos,#,1,usuario_pos,#,1,;
*
