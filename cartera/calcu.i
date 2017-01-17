* Variables que seran necesarias para la calculadora
  DRBR 4-Mzo-1998

	inp_z			d,
	acum_z			d,
	lastop_z		s1,
	punto_z			s1,
	val_z			i,
	factor_z		d,
	quit_z			s1,
	kprog_z			i,
	nvaop_z			s1,
*

* --> Rutina de Calculadora  <----- *
[MI_CALCU;
EK0;
tS15,0,59,4,20; tM; tS16,1,60,2,18; tf;
z32,quit_z,#; z32,enter_z,#; z0,acum_z,#; (lastop_z)=($+,1); GINIINP;
t@1,0; \Q para Salir...\;
{
  GSELMICALC;
  !(enter_z)0($S,1)>|; GIGUAL; .
  !(quit_z)0($S,1)>+;
  z32,enter_z,#; z32,esc_z,#;
)
z32,enter_z,#; z32,esc_z,#;
tS0;
!(kprog_z)0($1)>|; GKprog1; .
R;

[SELMICALC;
?G[1calc_01, [2calc_02, [3calc_03, [4calc_04, [5calc_05,
  [6calc_06, [7calc_07, [8calc_08, [9calc_09, [0calc_00,
  [cborrc, [Cborrc, [qquit,
  37, 42, 46, 43, 45, 47, 263, 13, 27, 61;
R;

[quit; (quit_z)=($S,1); R;
[INIINP; z0,inp_z,#; z32,punto_z,#; (factor_z)=(10); R;

[37;  * Signo de porcentaje *
(inp_z)=(acum_z)(inp_z)*(100)/; t@0,0; pinp_z,MDS12; (lastop_z)=($%,1);
R;

[42;  * Signo de por        * z42,nvaop_z,#; GHAZLASTOP; z42,lastop_z,#; R;
[43;  * Signo de mas        * z43,nvaop_z,#; GHAZLASTOP; z43,lastop_z,#; R;
[45;  * Signo de menos      * z45,nvaop_z,#; GHAZLASTOP; z45,lastop_z,#; R;
[47;  * Signo de div        * z47,nvaop_z,#; GHAZLASTOP; z47,lastop_z,#; R;
[61;  * Signo de igual      * GIGUAL; R;
[263; * Signo de backspace  * R;
[calc_00; (val_z)=(0); GAFEC_INP; R;
[calc_01; (val_z)=(1); GAFEC_INP; R;
[calc_02; (val_z)=(2); GAFEC_INP; R;
[calc_03; (val_z)=(3); GAFEC_INP; R;
[calc_04; (val_z)=(4); GAFEC_INP; R;
[calc_05; (val_z)=(5); GAFEC_INP; R;
[calc_06; (val_z)=(6); GAFEC_INP; R;
[calc_07; (val_z)=(7); GAFEC_INP; R;
[calc_08; (val_z)=(8); GAFEC_INP; R;
[calc_09; (val_z)=(9); GAFEC_INP; R;

[46;  * signo de punto      *
!(punto_z)5($S,1)>|; (punto_z)=($S,1); (factor_z)=(.1); .
R;

[IGUAL; GHAZLASTOP; R;

[AFEC_INP;
!(punto_z)0($S,1)>|;
  (inp_z)=(inp_z)(val_z)(factor_z)*+; (factor_z)=(factor_z)(10)/;
|
  (inp_z)=(inp_z)(factor_z)*(val_z)+;
.
t@0,0; pinp_z,MDS12;
R;

[HAZLASTOP;
!(lastop_z)0($%,1)>|; (lastop_z)=(nvaop_z,#); .
!(lastop_z)0($+,1)>|; (acum_z)=(acum_z)(inp_z)+; GINIINP; .
!(lastop_z)0($-,1)>|; (acum_z)=(acum_z)(inp_z)-; GINIINP; .
!(lastop_z)0($*,1)>|; (acum_z)=(acum_z)(inp_z)*; GINIINP; .
!(lastop_z)0($/,1)>|; (acum_z)=(acum_z)(inp_z)/; GINIINP; .
t@0,0; pacum_z,MDS12;
R;

[borrc; z0,acum_z,#; (lastop_z)=($+,1); GINIINP; t@0,0; pacum_z,MDS12; R;
