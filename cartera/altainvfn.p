* Programa que sirve para Taller Talleres de Servicios
  DRBR  24-Sep-1994
*

#dMIS2 %2d~; 
#dMLE10 %-10ld~; #dMDE12 %-12.2f~; #dMFE5 %-5.2f~; 
#dMLS10 %10ld~;  #dMDS12 %,12.2f~; #dMFS5 %5.2f~; 

#i/programas/lib/funkey.i;

f0; M
	nemp_z          s80,
	direc_z         s80,
	modul_z         s30,
	modul2_z        s10,
	ter_z            s2,
        impre_z		i,
        cia_z		i,
	fech9_z     {
	  dias2_z       s16,
	  hora_z         s5,
	  resto_z        s5,
	            }
	bandman_z        	s2,
	band_z           	s2,
	bandh_z          	s2,
	bndf1_z          	s2,
	usuarios_z      	s80,
	teruser_z       	s80,
	nombuse_z       	s15,
	clause_z        	s10,
	mibd_z			s80,
	mibdinv_z		s80,

	idart_z			l,
        idlinea_z		l,
        idmarca_z		l,
        idmodelo_z		l,
        iddescri_z		l,
	REL_GRUPO		l,
        REL_LINEA		l,
        REL_SITUAC		l,
        REL_GPODIA		l,
        REL_MARCA		l,
	codigo_z             	s14, 	* Codigo del Articulo		*
        descri_z		s31,	* Descripcion del Articulo	*
        linea_z			s31, 	* Linea de Articulo		*
        marca_z			s31, 	* Marca del Articulo		*
        modelo_z		s31, 	* Modelo del articulo		*
        prvta_z			d,	* Precio de Venta FONACOT	*
        piva_z			d,	* Tasa de Iva del Articulo	*
        linbus_z		s31,
        modbus_z		s31,
        marcabus_z		s31,
        datbus_z		s31,
        codbus_z		s14,

* ---> Estas son las variables que se necesitan para usar esta funcion  <-- *
	pos_z             l,
	narts_z           i,
	tpmov_z          s2,
	bandc_z          s2,
	bandb_z          s2,
	band4_z          s2,
	ren_z             	i,
	iii_z             	i,
        maxcol_z		i,
        maxrow_z		i,
        renst_z			i,
        tope1_z			i,
        base1_z			i,
        bandprog_z		s2,
        haciabus_z		s2,
        hacia_z			s2,
	pos1_z            l,
	col1_z            i,
	col2_z            i,
	xx_z              i,
	yy_z              i,
	ren2_z            i,
	cols_z            i,
	ii_z              i,

	fech8_z           D,
	ind1_z            i,
	ind2_z            i,
	termi_z           i,
	esp_z             i,
	exten_z           i,
	tam0             s0,;
mtam0&; tr; Ff3; FOdatos.ini~,r~; FGNodatos; Fknemp_z,l; &f0; tu1; ts0;
GPAN; GABRE_TABLA;
Ff5; FO.impri.ini~,r~; FG|; | Fknemp_z,l; >sinemp_z,#,impre_z; . FC;
Ff5; FO.cias.ini~,r~; z0,nemp_z,#; FG|; | Fknemp_z,l; . FC; Ff1; 
>sinemp_z,#,cia_z;
f20; k1; P; n|; GNOCIA; . z0,nemp_z,#; (nemp_z)=(razon_cia,#); GPAN;

* --> Defino las relaciones de inv_relinv <-- *
GASIGNA_INVRELINV;

[MANTOS;
{
  GMENS2;
  ?G[Aantman, [Ssigman, [Dnombre, [Nnvoman, [Bbajman, [Mmodman, [Cconman,
    [aantman, [ssigman, [dnombre, [nnvoman, [bbajman, [mmodman, [cconman,
    [FFin,
    [fFin;
)
gFin;
R;

[MENS2;
GST; \Seleccione:`A`nterior `S`iguiente `N`uevo `M`odifica `B`aja \;
\`C`onsulta `D`escripcion `F`in \;
R;

[antman; (hacia_z)=($A,1); GMUEVETE; R;
[sigman; (hacia_z)=($S,1); GMUEVETE; R;

[MUEVETE;
f2;
!(hacia_z)0($A,1)>|; k2; .
!(hacia_z)0($S,1)>|; k1; .
P; nR; (codigo_z)=(codigo_ind2,#); f1; k1; P; nR; GDESPMAN;
R;

[nvoman;
GST; \Teclee la Clave del Nuevo Articulo ...\; tL00; t0R; icodigo_z,13;
f1; k1; P; n|; | GST; `7; \Taller Existente...\; GDESPMAN; R; .
f9; k1; P; 
n|; |
  z0,descri_z,#; z0,linea_z,#; z0,marca_z,#; z0,prvta_z,#;
  (descri_z)=(descri_inv,#); (linea_z)=(linea_inv,#); 
  (marca_z)=(marca_inv,#); (prvta_z)=(precio_inv); (piva_z)=(piva_inv);
.
GPIDATMAN; !(band_z)5($S,1)>R;
z0,numid_ind8,l; f8; k5; P; n|;. (idart_z)=(numid_ind8)(1)+;
f1; z0,codigo_ivf,l; (codigo_ivf)=(codigo_z,#); (idarticulo_ivf)=(idart_z);
GMEMTAR; 
f1; QNOPDAGF1; k4; P$; f1; k1; P; nR; GDESPMAN;
R;

[NOPDAGF1; GST; `7; \No pude agregar registro en tallser...\; Z1; R;

[modman;
GST; \Teclee la Clave del Articulo ...\; tL00; t0R; icodigo_z,13;
(bandb_z)=($A,1); f1; k1; P; n|; GST; `7; \Articulo inexistente.\; R; .
GDESPMAN; GST; `7; \Seguro de Modificar este Articulo ? <S/N> : \;
y|; | gmodman; .
GPIDATMAN; !(band_z)5($S,1)>R;
GMEMTAR; f1; QERROR1; k5; P$; GDESPMAN;
R;

[conman;
GST; \Teclee la Clave del Articulo ...\; tL00; t0R; icodigo_z,13;
f1; k1; P;
n|;
  (bandb_z)=($A,1); Gbusca2; f1; k1; P;
  n|; GST; `7; \Articulo Inexistente...\; Z1; R; .
.
GDESPMAN;
R;

[nombre;
GST; \Teclee la Descricion del Articulo ...\; tL01; t0R; idescri_z,30;
(datbus_z)=(descri_z,#); (bandb_z)=($D,1); Gbusca2; f1; k1; P; nR; GDESPMAN;
R;

[bajman;
GST; \Teclee el Codigo a borrar ...\; tL00; t0R; icodigo_z,13;
(bandb_z)=($M,1); f1; k1; P; n|; GST; `7; \Articulo inexistente.\; R; .
GDESPMAN;
GST; `7; \Seguro de Borrar este Articulo ? <S/N> : \;
y|; f1; k6; P$; GCLR; .
R;

[MEMTAR;
(datbus_z)=(descri_z,#); z0,numid_ind8,l; 
f8; k4; P; n|;. (iddescri_z)=(numid_ind8);
(datbus_z)=(linea_z,#); z0,numid_ind8,l; 
f8; k1; P; n|;. (idlinea_z)=(numid_ind8);
(datbus_z)=(marca_z,#); z0,numid_ind8,l; 
f8; k2; P; n|;. (idmarca_z)=(numid_ind8);
(datbus_z)=(modelo_z,#); z0,numid_ind8,l; 
f8; k3; P; n|;. (idmodelo_z)=(numid_ind8);
(idmarca_ivf)=(idmarca_z);
(idmodelo_ivf)=(idmodelo_z);
(idlinea_ivf)=(idlinea_z);
(iddescri_ivf)=(iddescri_z);
(preciou_ivf)=(prvta_z);
(piva_ivf)=(piva_z);
(cia_ivf)=(cia_z);
R;

[ARTMEM;
(prvta_z)=(preciou_ivf); (piva_z)=(piva_ivf);
R;

[PIDATMAN;
z32,band_z,#;
{
  [des; GST; \Teclee la Descripcion del articulo ...\;
  tL01; t0+; idescri_z,30;
  [lin; GST; \Teclee la linea del articulo ...\; t0des; tL02; ilinea_z,30;
  f3; k1; P; 
  n|;
    (bandb_z)=($L,1); z0,linbus_z,#; (linbus_z)=(linea_z,1);
    q+,linbus_z,"%",; Gbusca2;
  .
  tL02; plinea_z,30;
  [mca; GST; \Teclee la marca del articulo ...\; t0lin; tL03; imarca_z,30;
  f4; k1; P;
  n|;
    (bandb_z)=($M,1); z0,marcabus_z,#; (marcabus_z)=(marca_z,1); 
    q+,marcabus_z,"%",; Gbusca2;
  .
  tL03; pmarca_z,30;
  [mod; GST; \Teclee el Modelo del articulo ...\; t0mca; tL04; imodelo_z,30;
  f5; k1; P;
  n|;
    (bandb_z)=($O,1); z0,modbus_z,#; (modbus_z)=(modelo_z,1); 
    q+,modbus_z,"%",; Gbusca2;
  .
  tL04; pmodelo_z,30;
  [prv; GST; \Teclee el Precio de Venta...\; t0mod; tL05; iprvta_z,MDE12,MDS12;
  [piv; GST; \Teclee la tasa de iva...\; t0prv; tL06; ipiva_z,MFE5,MFS5;
  GST; \Estan Correctos los Datos ? <S/N> : \; y|; (band_z)=($S,1); g+; . 
)
R;
  
[DESPMAN;
(idart_z)=(idarticulo_ivf);
(iddescri_z)=(iddescri_ivf); f6; k1; P; n|;. (descri_z)=(dato_ind6,30);
(idlinea_z)=(idlinea_ivf); f3; k3; P; n|;. (linea_z)=(linea_lif,#);
(idmodelo_z)=(idmodelo_ivf); f5; k3; P; n|;. (modelo_z)=(modelo_mdf,#);
(idmarca_z)=(idmarca_ivf); f4; k3; P; n|;. (marca_z)=(marca_mcf,#);
(prvta_z)=(preciou_ivf); (piva_z)=(piva_ivf);
tL00; pcodigo_ivf,13; tL01; pdescri_z,30; tL02; plinea_z,30; 
tL03; pmarca_z,30; tL04; pmodelo_z,30; tL05; pprvta_z,MDS12;
tL06; ppiva_z,MFS5;
R;

[CLR;
tL00; s13; tL01; s30; tL02; s30; tL03; s30; tL04; s30; tL05; s12;
R;

*    -->   Rutina de Busquedas   <----                   *
[SALDEBUS;
!(bandb_z)0($A,1)(bandb_z)0($D,1)|>|; (codigo_z)=(codigo_ind7,#); .
!(bandb_z)0($L,1)>|; (linea_z)=(linea_lif,#); .
!(bandb_z)0($M,1)>|; (marca_z)=(marca_mcf,#); .
!(bandb_z)0($O,1)>|; (modelo_z)=(modelo_mdf,#); .
R;

[DESPTITULO;
t@1,1;
!(bandb_z)0($A,1)(bandb_z)0($D,1)|>|; \Listado de Articulos/FONACOT\; .
!(bandb_z)0($L,1)>|; \Listado de Lineas/FONACOT\; .
!(bandb_z)0($M,1)>|; \Listado de Marcas/FONACOT\; .
!(bandb_z)0($O,1)>|; \Listado de Modelos/FONACOT\; .
R;

[BUSCAINI;
!(bandb_z)0($A,1)>|; f7; k1; P; .
!(bandb_z)0($D,1)>|; f7; k2; P; .
!(bandb_z)0($L,1)>|; f3; k2; P; .
!(bandb_z)0($M,1)>|; f4; k2; P; .
!(bandb_z)0($O,1)>|; f5; k2; P; .
R;

[SELARCH;
!(bandb_z)0($A,1)(bandb_z)0($D,1)|>|; f7; .
!(bandb_z)0($L,1)>|; f3; .
!(bandb_z)0($M,1)>|; f4; .
!(bandb_z)0($O,1)>|; f5; .
R;

[DESPRENOR;
!(bandb_z)0($A,1)(bandb_z)0($D,1)|>|;
  t@ren_z,col1_z; pcodigo_ind7,13; s1; pdescri_ind7,30;
.
!(bandb_z)0($L,1)>|; t@ren_z,col1_z; plinea_lif,30; .
!(bandb_z)0($M,1)>|; t@ren_z,col1_z; pmarca_mcf,30; .
!(bandb_z)0($O,1)>|; t@ren_z,col1_z; pmodelo_mdf,30; .
R;

#ibusca.i;

[nvoreg;
!(bandb_z)5($L,1)(bandb_z)5($M,1)&(bandb_z)5($O,1)&>R;
tS0; 
!(bandb_z)0($L,1)>|; Gnvolin; .
!(bandb_z)0($M,1)>|; Gnvomca; .
!(bandb_z)0($O,1)>|; Gnvomod; .
[regnvo;
!(tpmov_z)5($N,1)>|; tS2; tS3; GBUSCAINI;  z0,narts_z,#; GLLENABOX; .
R;

[nvolin;
GST; \Linea:\; t0R; ilinea_z,30; z0,datbus_z,#; (datbus_z)=(linea_z,#);
f8; k1; P; z0,linbus_z,#; (linbus_z)=(linea_z,1); q+,linbus_z,"%",; 
(haciabus_z)=($S,1);
R;

[nvomca;
GST; \Marca:\; t0R; imarca_z,30; z0,datbus_z,#; (datbus_z)=(marca_z,#);
f8; k2; P; z0,marcabus_z,#; (marcabus_z)=(marca_z,1); q+,marcabus_z,"%",; 
(haciabus_z)=($S,1);
R;

[nvomod;
GST; \Modelo:\; t0R; imodelo_z,30; z0,datbus_z,#; (datbus_z)=(modelo_z,#);
f8; k3; P; z0,modbus_z,#; (modbus_z)=(modelo_z,1);  q+,modbus_z,"%",; 
(haciabus_z)=($S,1);
R;

[bajasman; Gbajman; GMENS2; ];
[modifman; Gmodman; GMENS2; ];
[anterman; Gantman; GMENS2; ];
[sigteman; Gsigman; GMENS2; ];

[Kprog1; R;
[Kprog2; R;
[Kprog4; R;

[ABRE_TABLA; 
Ff5; FObasedato.ini~,r~; FGNOBD; Fkmibd_z,l; FC; Ff1; 
fd1; O@,mibd_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *
f1; #iinvenfon.i;
k0; ot,"invenfon",;
k1; kp,"codigo = ? and cia=?",codigo_z,#,1,cia_z,;
k3; kp,"codigo like ? order by codigo",codigo_z,#,1,;
k4; kq,"insert into invenfon (idarticulo, codigo, idmarca, idmodelo,
	iddescri, idlinea, preciou, piva, cia)
        values (?,?,?,?,?,?,?,?,?)",
        idarticulo_ivf,codigo_ivf,#,1,idmarca_ivf,idmodelo_ivf,
        iddescri_ivf,idlinea_ivf,preciou_ivf,piva_ivf,cia_ivf,;
k5; kq,"update invenfon set idmarca=?, idmodelo=?,
	iddescri=?, idlinea=?, preciou=?, piva=? where idarticulo=?",
        idmarca_ivf,idmodelo_ivf,iddescri_ivf,idlinea_ivf,preciou_ivf,
        piva_ivf,idart_z,;
k6; kq,"delete from invenfon where idarticulo = ?",idart_z,;
k7; kp,"idarticulo = ?",idart_z,;

f2; M
	codigo_ind2		s14,;
k0; ot,"invenfon",;
k1; kq,"select min(codigo) from invenfon where codigo > ? and cia=?",
	codigo_z,#,1,cia_z,;
k2; kq,"select max(codigo) from invenfon where codigo < ? and cia=?",
	codigo_z,#,1,cia_z,;

f3; #ilineasfon.i;
k0; ot,"lineasfon",;
k1; kp,"linea = ?",linea_z,#,1,;
k2; kp,"linea like ? order by linea",linbus_z,#,1,;
k3; kp,"idlinea = ?",idlinea_z,;

f4; #imarcasfon.i;
k0; ot,"marcasfon",;
k1; kp,"marca = ?",marca_z,#,1,;
k2; kp,"marca like ? order by marca",marcabus_z,#,1,;
k3; kp,"idmarca = ?",idmarca_z,;

f5; #imodelosfon.i;
k0; ot,"modelosfon",;
k1; kp,"modelo = ?",modelo_z,#,1,;
k2; kp,"modelo like ? order by modelo",modbus_z,#,1,;
k3; kp,"idmodelo = ?",idmodelo_z,;

f6; M
	dato_ind6		s61,
        tam_ind6		s0,;
k0; ot,"datsolfon",;
k1; kq,"select datsolfon from datsolfon where iddatsolfon = ?",iddescri_z,;

f7; M
	idart_ind7		l,
        codigo_ind7		s14,
        descri_ind7	    	s51,
        tam_ind7		s0,;
k0; ot,"invenfon",;
k1; kq,"select idarticulo, codigo, datsolfon from invenfon a join datsolfon b
	on iddescri = iddatsolfon where codigo like ? and cia = ?
        order by codigo",codigo_z,#,1,cia_z,;
k2; kq,"select idarticulo, codigo, datsolfon from invenfon a join datsolfon b
	on iddescri = iddatsolfon where datsolfon like ? and cia = ?
        order by datsolfon",datbus_z,#,1,cia_z,;
        

f8; M
	numid_ind8		l,;
k0; ot,"lineasfon",;
k1; kq,"call buslineasfon (?)",datbus_z,#,1,;
k2; kq,"call busmarcasfon (?)",datbus_z,#,1,;
k3; kq,"call busmodelosfon (?)",datbus_z,#,1,;
k4; kq,"call busdatsolfon(?)",datbus_z,#,1,;
k5; kq,"select max(idarticulo) from invenfon",;

f20; #iciasinv.i;
k0; ot,"ciasinv",;
k1; kp,"cia=?",cia_z,;

* -- Abro la BD INVEN -- *
Ff5; FObdinven.ini~,r~; FGNOBD; Fkmibdinv_z,l; FC; Ff1;
\Haciendo Conexion a:\; pmibdinv_z,0; l;
fd2; O@,mibdinv_z,"sa","lux",1,ERRCNB,;  * con conexion autocommit    *

f9; M
	codigo_inv		s14,
        descri_inv		s31,
        linea_inv		s5,
        marca_inv		s31,
        precio_inv		d,
        piva_inv		d,
        tam_inv			s0,;
k0; ot,"inven",;
k1; kq,"select a.codigo, descri, a.linea, b.marca, precio, piva
	from inven a 
        join inv_invhist c on a.codigo = c.codigo and a.cia = c.cia
        join inv_relinv d on c.idart = d.idart and d.idrel = ?
        join inv_marcas b on d.iddato = b.idmarcainv
        where a.codigo=? and a.cia=?",
        REL_MARCA,codigo_z,#,1,cia_z,;
R;

#i/programas/lib/colores.i;
#i/programas/lib/tomamaxrc.i;
#i/programas/lib/status.i;
#i/programas/lib/idrelacs.i;

[PAN; 
Ff1; Gtomamaxrc; Gdefine_colores; Gamarillo_negro; tf; tn;
tP/programas/vps/cartera/altainvfn.s~;
tL/programas/vps/cartera/altainvfn.pos~;
ta0; #iprog1.i; ^=direc_z,#); 
z0,modul_z,#; z0,modul2_z,#;
q+,modul_z,"Manto.Articulos FONACOT",;
q+,modul2_z,"CARTERA",;
GBANNER; Gblanco_azul;
R;

[R; R; [E; ];

[NOBD; Ff1; GST; `7; \basedato.ini incompleto o inexistente...\; gFin1;
[ERRCNB; GST; `7; \No pude conectarme a la Base de datos...\; gFin1;
[ERROR1; GST; `7; \No pude agregar registro en mantos.v ...\; gFin1;
[ERROR4; GST; `7; \No pude agregar registro en \; pteruser_z,0; gFin1;
[Nodatos; Ff1; GST; `7; \archivo datos incompleto o inexistente...\; gFin1;
[NOCIA; z0,razon_cia,l; (razon_cia)=($CIA INEXISTENTE,15); R;

[Fin1; y|;.
[Fin; t@23,0; te; };
