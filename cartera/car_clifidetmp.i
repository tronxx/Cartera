* Buffer definitions for table car_clifidetmp *
M
idcli_tmpfid 		l,
codigo_tmpfid 		s11,
fecha_tmpfid 		{
	fechaYear_tmpfid 	i,
	fechaMon_tmpfid 	i,
	fechaDay_tmpfid 	i,
	}

nombre_tmpfid 		s31,
direc_tmpfid 		s31,
col_tmpfid 		s31,
idpoblac_tmpfid 		l,
idptovta_tmpfid 		l,
agente_tmpfid 		s4,
idfac_tmpfid 		l,
preciofid_tmpfid 		d,
bonifi_tmpfid 		d,
iduser_tmpfid 		l,
cia_tmpfid 		i,
status_tmpfid 		s2,;
 * 15 columns (size for buffer = 154)*
*
insert into car_clifidetmp (idcli,codigo,fecha,nombre,direc,col,idpoblac,idptovta,agente,idfac,preciofid,bonifi,iduser,cia,status)
 values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)
idcli_tmpfid,codigo_tmpfid,#,1,fecha_tmpfid,#,3,nombre_tmpfid,#,1,direc_tmpfid,#,1,col_tmpfid,#,1,idpoblac_tmpfid,idptovta_tmpfid,agente_tmpfid,#,1,idfac_tmpfid,preciofid_tmpfid,bonifi_tmpfid,iduser_tmpfid,cia_tmpfid,status_tmpfid,#,1,; 
*
