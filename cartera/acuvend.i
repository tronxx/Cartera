* Buffer definitions for table acuvend *
M
fecini_acv { feciniYear_acv i, feciniMon_acv i, feciniDay_acv i, }
fecfin_acv { fecfinYear_acv i, fecfinMon_acv i, fecfinDay_acv i, }
codigo_acv  s4,
voc_acv  s2,
nombre_acv  s21,
vtafon_acv  d,
comfon_acv  d,
vtaprcon_acv  d,
vtaprcrd_acv  d,
porcen2_acv  d,
totno_acv  d,
totsi_acv  d,
contado_acv  d,
contcom_acv  d,
meses05_acv  d,
meses06_acv  d,
meses08_acv  d,
meses10_acv  d,
meses13_acv  d,
clienpc_acv  d,
clienar_acv  d,
cliencr_acv  d,
credsi_acv  d,
credno_acv  d,
costovtas_acv  d,
comision_acv  d,
servic_acv  d,
comca_acv  d,
compi_acv  d,;
 * 29 columns (size for buffer = 231)*

*
"insert into acuvend (fecini,fecfin,codigo,voc,nombre,vtafon,comfon,vtaprcon,vtaprcrd,porcen2,totno,totsi,contado,contcom,meses05,meses06,meses08,meses10,meses13,clienpc,clienar,cliencr,credsi,credno,costovtas,comision,servic,comca,compi,
 values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
fecini_acv,#,3,fecfin_acv,#,3,codigo_acv,#,1,voc_acv,#,1,nombre_acv,#,1,vtafon_acv,comfon_acv,vtaprcon_acv,vtaprcrd_acv,porcen2_acv,totno_acv,totsi_acv,contado_acv,contcom_acv,meses05_acv,meses06_acv,meses08_acv,meses10_acv,meses13_acv,clienpc_acv,clienar_acv,cliencr_acv,credsi_acv,credno_acv,costovtas_acv,comision_acv,servic_acv,comca_acv,compi_acv,;
*
