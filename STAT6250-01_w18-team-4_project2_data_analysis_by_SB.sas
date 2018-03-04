*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address fire inspections
performed at given location by Fire department.
Dataset Name: cde_2014_analytic_file created in external file
STAT6250-01_w18-team-4_project2_data_preparation.sas, which is assumed to be
in the same directory as this file
See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file that generates analytic datasets cde_2014_analytic_file,
  cde_2014_analytic_file_sort_frpm, and cde_2014_analytic_file_sort_sat;
%include '.\STAT6250-01_w18-team-4_project2_data_preparation.sas';


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top 5 address Zip Codes where Fire Inspections took place in the year 2016 and again in 2017?'
;

title2
'Rationale: This should help compare the Zip codes for both the years, where after the inspections, corrective actions were taken or not.'
;

footnote1
"Based on the data top 5 zip codes have the maximum number of Fire inspections."
;

footnote2
"Given the magnitude of these changes, further investigation should be performed to ensure no data errors are involved."
;

footnote3
"However, assuming there are no data issues underlying this analysis, futher check needs to be performed with a larger data set."
;

*
Note: This compares the column "Inspection_Address_Zipcode” 
from Fire_Inspections_2016 to the column of the same name from 
Fire_Inspections_2016.

Methodology: Use PROC FREQ to generate a frequency table based on the dataset
on "Inspection_Address_Zipcode”. Then, use PROC SORT to temporarily sort 
the data by descending count, in order to find the top three zip codes where 
inspection took place. 
Finally, use PROC PRINT to determine the top five zip codes where Fire 
inspection took place.

Limitations: This methodology does not account for Zip Codes with missing data, 
nor does it attempt to validate the data in any way.

Follow-up Steps: More carefully clean values in order to filter out any possible 
illegal values, and better handle missing data.
;

proc freq
       data = Work.Fire_Inspections_2016_raw noprint
   ;
   table
       Inspection_Address_Zipcode / out = Count list
   ;
       where 
           not(missing(Inspection_Address_Zipcode));
   ;
run;

proc sort
       data = Count
       out = Count_Desc
   ;
   by
       descending count
   ;
run;

proc print
       data = Count_Desc (obs=5)
   ;
run;

proc freq
       data = Work.Fire_Inspections_2017_raw noprint
   ;
   table
       Inspection_Address_Zipcode / out = Count list
   ;
       where 
           not(missing(Inspection_Address_Zipcode));
   ;
run;

proc sort
       data = Count
       out = Count_Desc
   ;
   by
       descending count
   ;
run;

proc print
       data = Count_Desc (obs=5)
   ;
run;
title;
footnote;



*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What percentage of inspections are billable for both the years?'
;

title2
'Rationale: This would help managing the number of inspectors in a team.'
;

footnote1
"As can be from the data ,this can be used to find common inspection types and its status."
;

footnote2
"In future this data can help identify the billable inspections even better."
;

footnote3
"However we are testing with the subset of data and need to iteratively expand to a significant larger data set to conclude."
;

*
Note: This compares the column "Billable_Inspections” 
from Fire_Inspections_2016 to the column of the same name from 
Fire_Inspections_2016.

Methodology: Use PROC SQL to generate a table based on the dataset
on "Billable_Inspection”.

Limitations: This methodology does not account for Billable Inspections with missing data, 
nor does it attempt to validate the data in any way.

Follow-up Steps: More carefully clean values in order to filter out any possible 
illegal values, and better handle missing data.
;

proc sql;
    select Billable_Inspection,
	    count(*) as Fr
		from Work.Fire_Inspections_2016_raw
		group by Billable_Inspection
;
run;

proc sql;
    select Billable_Inspection,
	    count(*) as Fr
		from Work.Fire_Inspections_2017_raw
		group by Billable_Inspection
;
run;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Which Item is responsible for maximum violation amongst the supervisor districts?'
;

title2
"Rationale: This would help the supervisors in imparting messages to the residents to prevent future violations."
;

footnote1
"This analysis would help identify the supervisor district that has maximum number of fire violations."
;

footnote2
"However,since this is a subset of data ,we will need to iteratively test with larger data sets before concluding "
;

*
Note: This compares the column “Violation Item” and “Supervisor District”.

Methodology: Use PROC SQL to generate a table based on the dataset
on "ISupervisor_District” and "Violation_Item.

Limitations: This methodology does not account for Zip Codes with missing data, 
nor does it attempt to validate the data in any way.

Follow-up Steps: More carefully clean values in order to filter out any possible 
illegal values, and better handle missing data.
;

proc sql;

 select 
Supervisor_District
,Violation_item
,count(Violation_Item)as VIOLATION_COUNT
	from Work.Fire_Violations_2016_raw
		group by Violation_item,
	Supervisor_District	
;
run;

proc sql;

 select 
Supervisor_District
,Violation_item
,count(Violation_Item)as VIOLATION_COUNT
	from Work.Fire_Violations_2017_raw
		group by Violation_item,
	Supervisor_District	
;
run;

