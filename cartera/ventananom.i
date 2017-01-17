* --> Rutina de Pedir Datos de Nombres
  DRBR 6-Ago-2004
  ---- Modificado para pedir las direcciones ----
  DRBR 8/Nov/2012
*

[HAZ_VENTANA_NOM;
(ind1_z)=(7); (yy_z)=(18); (ind2_z)=(1);
(ren_z)=(maxrow_z)(ind1_z)-(2)/; !(ren_z)2($0)>|; z0,ren_z,#; .
(col_z)=(maxcol_z)(70)-(2)/; !(col_z)2($0)>|; z0,col_z,#; .
tS9,ren_z,col_z,ind1_z,70;
ttrind2_z;  !(ind2_z)1(ind1_z)>|; tR9; tS0; tS9,ren_z,col_z,ind1_z,70; .
(ind2_z)=(1); tf; tP/programas/lib/capnom1.s~; tM;
t@0,1; ta1; ptitven_z,0; ta0;
R;

[PIDENOMBRE;
z0,bandnom_z,#; GHAZ_VENTANA_NOM;
(xx_z)=(ind2_z);     t@xx_z,yy_z; pappat_z,50;
(xx_z)=(ind2_z)(1)+; t@xx_z,yy_z; papmat_z,50;
(xx_z)=(ind2_z)(2)+; t@xx_z,yy_z; pnompil1_z,50;
(xx_z)=(ind2_z)(3)+; t@xx_z,yy_z; pnompil2_z,50;

[app; (xx_z)=(ind2_z);     t@xx_z,yy_z; t0SALDENOM; iappat_z,50;
[apm; (xx_z)=(ind2_z)(1)+; t@xx_z,yy_z; t0app; iapmat_z,50;
[np1; (xx_z)=(ind2_z)(2)+; t@xx_z,yy_z; t0apm; inompil1_z,50;
[np2; (xx_z)=(ind2_z)(3)+; t@xx_z,yy_z; t0np1; inompil2_z,50;
(bandnom_z)=($S,1);
[SALDENOM; GCIERRAVENTANANOM;
z0,nombre_z,#;
q+,nombre_z,appat_z," ",;
!(apmat_z)1($ ,1)>|;   q+,nombre_z,apmat_z," ",;   .
!(nompil1_z)1($ ,1)>|; q+,nombre_z,nompil1_z," ",; .
!(nompil2_z)1($ ,1)>|; q+,nombre_z,nompil2_z,; .
R;

[HAZ_VENTANA_DIR;
(ind1_z)=(7); (yy_z)=(18); (ind2_z)=(1);
(ren_z)=(maxrow_z)(ind1_z)-(2)/; !(ren_z)2($0)>|; z0,ren_z,#; .
(col_z)=(maxcol_z)(76)-(2)/; !(col_z)2($0)>|; z0,col_z,#; .
tS9,ren_z,col_z,ind1_z,76;
ttrind2_z;  !(ind2_z)1(ind1_z)>|; tR9; tS0; tS9,ren_z,col_z,ind1_z,76; .
(ind2_z)=(1); tf; tP/programas/lib/capdir1.s~; tM;
t@0,1; ta1; ptitven_z,0; ta0;
R;

[PIDEDIRECMAY;
GSOLOPIDEDIREC; GCIERRAVENTANANOM;
R;

[PIDEDIREC;
GSOLOPIDEDIREC;
[SALDEDIR; GCIERRAVENTANANOM;
z0,dircli_z,#; z0,dircli2_z,#;
q+,dircli_z,calle_z," ",;
!(numpred_z)1($ ,1)>|;   q+,dircli_z," N.",numpred_z," ",;   .
!(colonia_z)1($ ,1)>|; q+,dircli2_z,colonia_z," ",; .
!(codpost_z)1($ ,1)>|; q+,dircli2_z," C.P:",codpost_z,; .
R;

[CIERRAVENTANANOM;
tS0;
R;

[SOLOPIDEDIREC;
* --> en ii_z Tengo el ancho que voy a pedir *
z0,bandnom_z,#; GHAZ_VENTANA_DIR;
(xx_z)=(ind2_z);     t@xx_z,yy_z; pcalle_z,ii_z;
(xx_z)=(ind2_z)(1)+; t@xx_z,yy_z; pnumpred_z,ii_z;
(xx_z)=(ind2_z)(2)+; t@xx_z,yy_z; pcolonia_z,ii_z;
(xx_z)=(ind2_z)(3)+; t@xx_z,yy_z; pcodpost_z,ii_z;

[call; (xx_z)=(ind2_z);     t@xx_z,yy_z; t0R; icalle_z,ii_z;
[nump; (xx_z)=(ind2_z)(1)+; t@xx_z,yy_z; t0call; inumpred_z,ii_z;
[colo; (xx_z)=(ind2_z)(2)+; t@xx_z,yy_z; t0nump; icolonia_z,ii_z;
[codp; (xx_z)=(ind2_z)(3)+; t@xx_z,yy_z; t0colo; icodpost_z,ii_z;
(bandnom_z)=($S,1);

#i/programas/lib/define_relclis.i;


* -- Deben estar definidas las Siguientes Variables
        bandnom_z			s2,
        titven_z			s80,
        appat_z				s51,
        apmat_z				s51,
        nompil1_z			s51,
        nompil2_z			s51,
        REL_NOMCLI			l,
	REL_DIRCLI			l,
        REL_NOMAVA			l,
        REL_NOMFIDE			l,
	FAC_TRADICIONAL			l,
	FAC_FONACOT			l,
	TIPO_TARJETA_CREDITO_FELIZ	l,
	TIPO_TARJETA_CREDITO_BANCARIA	l,
	NUM_IMPRESIONES_FAC		l,
*