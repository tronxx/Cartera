* Buffer definitions for table renfacmentmp *
M
idren_tmpfrm  l,
idfac_tmpfrm  l,
codigo_tmpfrm  s14,
descri_tmpfrm  s31,
unids_tmpfrm  d,
preciou_tmpfrm  d,
importe_tmpfrm  d,
pordsc_tmpfrm  d,
descu_tmpfrm  d,
poriva_tmpfrm  d,
iva_tmpfrm  d,
total_tmpfrm  d,
costou_tmpfrm  d,
cia_tmpfrm  i,;
 * 14 columns (size for buffer = 127)*

*
"insert into renfacmentmp (idren,idfac,codigo,descri,unids,preciou,importe,pordsc,descu,poriva,iva,total,costou,cia)
 values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
idren_tmpfrm,idfac_tmpfrm,codigo_tmpfrm,#,1,descri_tmpfrm,#,1,unids_tmpfrm,preciou_tmpfrm,importe_tmpfrm,pordsc_tmpfrm,descu_tmpfrm,poriva_tmpfrm,iva_tmpfrm,total_tmpfrm,costou_tmpfrm,cia_tmpfrm,;
*
