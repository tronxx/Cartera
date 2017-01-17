* Programa que sirve para generar una Carta de Promocion
  DRBR 16-Dic-1994
*

#i/programas/lib/funkey.i;
#dMDE10 %-10.0f~; #dMDS10 %10.0f~; #dMIS4 %04d~;


f0; M
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
	version_z	s20,
	llavf_z    {
	  impre_z        i,
	  font_z         i,
	           }
	micar_z		s3,
	carac_z		i,
	maxrow_z	i,
	maxcol_z	i,
	renst_z		i,
	ter_z            s2,
	sff_z		s2,
	fech9_z     {
	  dias_z        s16,
	  hora_z         s6,
	  resto_z        s5,
	            }
	fech8_z           D,
	codcte_z        s11,
	claed_z          s6,
	bandrs_z         s1,
        idcli_z		l,

	lin_z       {
	  lineas_z     C200,
	            }
	nlin_z            i,
	bandimp_z		s1,
	editor_z		s80,
	fechu2_z   {
	  diasem_z        s4,
	  mesexp_z        s4,
	  diaexp_z        s3,
	  anuexp_z        s5,
	  resexp_z       s11,
	           }
*   -->  Variables y Rutina para Reportes Multiples en variables   <--    *
	cmds_z		{
	  cmd1_z		s7,
	  cmd2_z		s13,
	  cmd3_z		s30,
			}
	arch_z      {
	  nomar_z        s5,
	  nter_z         s3,
	  reser_z        s5,
	            }

*  --> Estas son las variables que se necesitan para usar esta funcion  <--  *
	pos_z             l,
	narts_z           i,
	tpmov_z          s1,
	bandc_z           s1,
	bandb_z          s1,
	band4_z          s1,
	ren_z             i,
	iii_z             i,
	pos1_z            l,
	col1_z            i,
	col2_z            i,
	xx_z              i,
	yy_z              i,
	ren2_z            i,
	cols_z            i,
	ii_z              i,

	ncli_z            d,
	mibd_z		s80,
	nargs_z           i,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;
mtam0&; 
q+,version_z,"V:CJ01",;
* --> Version CJ01 se modifica que use mandaimp en lugar de impri.i <-- *
tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; ts0;
ttttermi_z; >istermi_z,ter_z,%02d~; (impre_z)=(1);
* &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1; phora_z,#; s1; FW3; l; *
GPAN; GABRE_TABLA;

z0,numcli_cli,l;
$inargs_z;
!(nargs_z)2($2)>|;
  z32,codcte_z,#;
|
  $s1,codcte_z,#; f1; k1; P; n|; (bandb_z)=($C,1); Gbusca2; .
.

t@10,3; \Codigo:\; pnumcli_cli,#; s1; pnombre_cli,#; (idcli_z)=(idcli_cli);
f3; k1; P; n|; z0,direc2_dcl,l; .
[edi; GST; \Clave de la Carta : \; t0Fin; iclaed_z,5; f2; k1; P;
n|; (bandb_z)=($E,1); Gbusca2; f2; k1; P; nedi; .
GST; \Editor : \; pclave_edi,#; s1; pdescri_edi,#; \ Correcto ? <S/N> : \;
z0,editor_z,#; Fsenomarch_edi,59,exten_z; (editor_z)=(nomarch_edi,exten_z);
y|; | gedi; .
z0,arch_z,#; (nomar_z)=($caja0,5); >istermi_z,nter_z,%03X~; (reser_z)=($.txt,4);
z0,nlin_z,#;
tS1,0,0,23,80; tc; tv0;
Ff4; FO(arch_z),w~; Ff6; FO(editor_z),r~; FT;
{ z0,lin_z,#; Ff6; FG+;
  Fklin_z,l; (nlin_z)=(nlin_z)(1)+;
  Ff1; \Linea :\; pnlin_z,MIS4; l;
  GIMPRIMELIN;
)
Ff6; FC; Ff1; 
GMANDA_IMP;
tf; tr; tS0;
Ff1; GST; \Desea Imprimir el Sobre ? <S/N> : \;
y|;
  tc; Ff4; FO(arch_z),w~; l; l; l;
  s20; \Nombre    : \; pnombre_cli,#; l;
  s20; \Direccion : \; pdirec_cli,#; l;
  s20; \            \; pdirec2_dcl,#; l;
  s20; \Poblacion : \; ppoblac_cli,#; l;
  s20; \No.Cliente: \; pnumcli_cli,#; l; l; l;
  s5; &a; &cfech8_z; &p3fech9_z; pfech8_z,+8; s1; phora_z,#; l;
  Ff4; FC; Ff1; tr; GMANDA_IMP;
.
gFin;

[IMPRIMELIN;
tc; (ind1_z)=(lineas_z&); Fslexten_z,lineas_z[ind1_z]; z0,ind2_z,#;
&a; &p3fechu2_z; Ff4;
{ !(ind2_z)3(exten_z)>+;
  !(lineas_z[ind1_z])0($@,1)>|;
    (ind1_z)=(ind1_z)(1)+; (ind2_z)=(ind2_z)(1)+;
    !(lineas_z[ind1_z])0($N,1)>|; pnombre_cli,#; .
    !(lineas_z[ind1_z])0($D,1)>|; pdirec_cli,#;  .
    !(lineas_z[ind1_z])0($I,1)>|; pdirec2_dcl,#; .
    !(lineas_z[ind1_z])0($P,1)>|; ppoblac_cli,#; .
    !(lineas_z[ind1_z])0($C,1)>|; pnumcli_cli,#; .
    !(lineas_z[ind1_z])0($i,1)>|; pdiacum_cli,%2d~;   .
    !(lineas_z[ind1_z])0($e,1)>|; GSACAMESCUM;   .
    !(lineas_z[ind1_z])0($d,1)>|; pdiaexp_z,#;   .
    !(lineas_z[ind1_z])0($m,1)>|; pmesexp_z,#;   .
    !(lineas_z[ind1_z])0($a,1)>|; panuexp_z,#;   .
  |
    plineas_z[ind1_z],1;
  .
  (ind1_z)=(ind1_z)(1)+; (ind2_z)=(ind2_z)(1)+;
)
l;
R;

[SACAMESCUM;
!(mescum_cli)0($1)>|;  \Enero      \; .
!(mescum_cli)0($2)>|;  \Febrero    \; .
!(mescum_cli)0($3)>|;  \Marzo      \; .
!(mescum_cli)0($4)>|;  \Abril      \; .
!(mescum_cli)0($5)>|;  \Mayo       \; .
!(mescum_cli)0($6)>|;  \Junio      \; .
!(mescum_cli)0($7)>|;  \Julio      \; .
!(mescum_cli)0($8)>|;  \Agosto     \; .
!(mescum_cli)0($9)>|;  \Septiembre \; .
!(mescum_cli)0($10)>|; \Octubre    \; .
!(mescum_cli)0($11)>|; \Noviembre  \; .
!(mescum_cli)0($12)>|; \Diciembre  \; .
R;

* -------  -> Este es el Codigo de la Busqueda  <-  -------------------- *
[busca2;
R;

[anterbus; ];
[sigtebus; ];
[anterpan; ];
[sigtepan; ];

[Kprog1; R;

[Kprog3;
KPU,anterpan,PD,sigtepan,UA,anterbus,DA,sigtebus;
R;

[ABRE_TABLA;
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1; 
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #iclientes.i;
k0; Ot,"clientes",;
k1; kp,"numcli=?",codcte_z,#,1,;

f2; #ieditores.i;
k0; Ot,"editores",;
k1; kp,"clave=?",claed_z,#,1,;
k2; kp,"clave <> ?",claed_z,#,1,;

f3; #idircli2.i;
k0; ot,"dircli2",;
k1; kp,"idcli=?",idcli_z,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;

[PAN; 
Ff1; Gdefine_colores; Gtomamaxrc; Gamarillo_negro; GST; tf; tn;
#iprog1.i; ^=direc_z,#); z0,modul_z,#;
q+,modul_z,"Impresion Cartas",; (modul2_z)=($CAR-MDS,7);
GBANNER; Gblanco_azul;
R;


[R; R; [E; ];
[NOBD; Ff1; GST; `7; \No existe el archivo basedato.ini ...\; gFin1;
[ERRCNB; GST; `6; \No pude conectarme a la base de datos...\; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;

*   -->  Variables y Rutina para Reportes Multiples en variables   <--    *
#iimpri.i;
#imandaimp.i;

[Fin1; y|;.
[Fin; t@23,0; te; };

