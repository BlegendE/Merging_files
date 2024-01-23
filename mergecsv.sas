/*importing the file to SAS*/
PROC IMPORT OUT= WORK.Bright 
            DATAFILE= "\\fld6filer\SRGD_SRTIP_PTIRS\UAT Data\IT_Solution_Delivery_Section\Software\SAS\Data_JL\insurance.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
run;


	 PROC IMPORT OUT= WORK.Bright1 
            DATAFILE= "\\fld6filer\SRGD_SRTIP_PTIRS\UAT Data\IT_Solution_Delivery_Section\Software\SAS\Data_JL\CardioGoodFitness.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
run;




/*Sorting Data*/
proc sort data=Work.Bright; by Age; run;
proc sort data=Work.Bright1; by Age; run;


/*Merging data by Age Column*/
data combined;
merge Bright
	  Bright1;
by Age; 
run;

/*Merging data by Gender Column*/
data combined1;
merge Bright
	  Bright1;
by Gender; 
run;

