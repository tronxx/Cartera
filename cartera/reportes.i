* Buffer definitions for table reportes *
M
ubica_rep  i,
numero_rep  l,
codcli_rep  s11,
cliente_rep  s36,
fecha_rep { fechaYear_rep i, fechaMon_rep i, fechaDay_rep i, }
artic_rep  s31,
serie_rep  s11,
sintom1_rep  s61,
sintom2_rep  s61,
dircli_rep  s36,
pobla_rep  s26,
cargo_rep  s2,
importe_rep  d,
status_rep  s2,
fecres_rep { fecresYear_rep i, fecresMon_rep i, fecresDay_rep i, }
ccarmds_rep  s2,
carmds_rep  d,
obser1_rep  s61,
clialm_rep  s2,
taller_rep  s2,
fectal_rep { fectalYear_rep i, fectalMon_rep i, fectalDay_rep i, }
visit1_rep  s2,
fevis1_rep { fevis1Year_rep i, fevis1Mon_rep i, fevis1Day_rep i, }
resvi1_rep  s21,
visit2_rep  s2,
fevis2_rep { fevis2Year_rep i, fevis2Mon_rep i, fevis2Day_rep i, }
resvi2_rep  s21,
visit3_rep  s2,
fevis3_rep { fevis3Year_rep i, fevis3Mon_rep i, fevis3Day_rep i, }
resvi3_rep  s21,
situac_rep  s2,
devolt_rep  s2,
fecdvt_rep { fecdvtYear_rep i, fecdvtMon_rep i, fecdvtDay_rep i, }
recogi_rep  s2,
fecrec_rep { fecrecYear_rep i, fecrecMon_rep i, fecrecDay_rep i, }
obsrec_rep  s21,
artser_rep  s2,
desars_rep  s31,
linea_rep  s5,
diiase_rep  s2,
obsolu_rep  s21,
talser_rep  s3,
prom2_rep  s4,;
 * 43 columns (size for buffer = 578)*

*
"insert into reportes (ubica,numero,codcli,cliente,fecha,artic,serie,sintom1,sintom2,dircli,pobla,cargo,importe,status,fecres,ccarmds,carmds,obser1,clialm,taller,fectal,visit1,fevis1,resvi1,visit2,fevis2,resvi2,visit3,fevis3,resvi3,situac,devolt,fecdvt,recogi,fecrec,obsrec,artser,desars,linea,diiase,obsolu,talser,prom2,
 values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
ubica_rep,numero_rep,codcli_rep,#,1,cliente_rep,#,1,fecha_rep,#,3,artic_rep,#,1,serie_rep,#,1,sintom1_rep,#,1,sintom2_rep,#,1,dircli_rep,#,1,pobla_rep,#,1,cargo_rep,#,1,importe_rep,status_rep,#,1,fecres_rep,#,3,ccarmds_rep,#,1,carmds_rep,obser1_rep,#,1,clialm_rep,#,1,taller_rep,#,1,fectal_rep,#,3,visit1_rep,#,1,fevis1_rep,#,3,resvi1_rep,#,1,visit2_rep,#,1,fevis2_rep,#,3,resvi2_rep,#,1,visit3_rep,#,1,fevis3_rep,#,3,resvi3_rep,#,1,situac_rep,#,1,devolt_rep,#,1,fecdvt_rep,#,3,recogi_rep,#,1,fecrec_rep,#,3,obsrec_rep,#,1,artser_rep,#,1,desars_rep,#,1,linea_rep,#,1,diiase_rep,#,1,obsolu_rep,#,1,talser_rep,#,1,prom2_rep,#,1,;
*
