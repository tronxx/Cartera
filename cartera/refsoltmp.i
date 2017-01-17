* Buffer definitions for table refsoltmp *
M
refyobs_tmprfsol 		s66,
nref_tmprfsol 		l,;
 * 2 columns (size for buffer = 70)*
*
insert into refsoltmp (refyobs,nref)
 values (?,?)
refyobs_tmprfsol,#,1,nref_tmprfsol,; 
*
