* Buffer definitions for table car_infacupo *
M
idinfacupo_ifc 		l,
idperiodo_ifc 		l,
idcorlarpzo_ifc 		l,
poliza_ifc 		s3,
tdacli_ifc 		l,
piva_ifc 		d,
anu_ifc 		l,
tipo_ifc 		s3,
ace_ifc 		s2,
diasv_ifc 		l,
bonif_ifc 		d,
recar_ifc 		d,
impor_ifc 		d,
cia_ifc 		l,;
 * 14 columns (size for buffer = 68)*
*
insert into car_infacupo (idinfacupo,idperiodo,idcorlarpzo,poliza,tdacli,piva,anu,tipo,ace,diasv,bonif,recar,impor,cia)
 values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)
idinfacupo_ifc,idperiodo_ifc,idcorlarpzo_ifc,poliza_ifc,#,1,tdacli_ifc,piva_ifc,anu_ifc,tipo_ifc,#,1,ace_ifc,#,1,diasv_ifc,bonif_ifc,recar_ifc,impor_ifc,cia_ifc,; 
*
