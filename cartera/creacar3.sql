insert into mvcli (
	llave,fechamov,coa,concep1,poliza,tipag,recobon,import,oper,ace,usuario
	)
	select llave,fechamov,coa,concep1,poliza,tipag,recobon,import,oper,ace,usuario
	from mvclitmp;
