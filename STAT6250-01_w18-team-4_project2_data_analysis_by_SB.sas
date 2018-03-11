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
"Based on the data the top 5 zip codes with the maximum number of Fire inspections are-"
;

footnote2
"Given the magnitude of these changes, further investigation should be performed to ensure no data errors are involved."
;

footnote3
"However, assuming there are no data issues underlying this analysis, further check needs to be performed with a larger data set."
;

*
Note: This compares the column "Inspection_Address_Zipcode‚Äù 
from Fire_Inspections_2016 to the column of the same name from 
Fire_Inspections_2016.

Methodology: Use PROC PRINT to determine the top five zip codes where Fire 
inspection took place.

Limitations: This methodology does not account for Zip Codes with missing data, 
nor does it attempt to validate the data in any way.

Follow-up Steps: More carefully clean values in order to filter out any possible 
illegal values, and better handle missing data.
;

proc print
       data = Count_Desc (obs=5)
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
Note: This compares the column "Billable_Inspections‚Äù 
from Fire_Inspections_2016 to the column of the same name from 
Fire_Inspections_2016.

Methodology: Use PROC SQL to generate a table based on the dataset
on "Billable_Inspections".

Limitations: This methodology does not account for Billable Inspections with 
missing data, nor does it attempt to validate the data in any way.

Follow-up Steps: More carefully clean values in order to filter out any 
possible illegal values, and better handle missing data.
;

proc sql;
    select '2016' as Year_of_Inspection,
    round(count(Billable_Inspection)/(select count(Billable_Inspection) 
    from Work.Fire_Inspections_2016_raw)*100,0.02) as PRCT 
	    
		from Work.Fire_Inspections_2016_raw
		where Billable_inspection=1
		
	union

    select '2017' as Year_of_Inspection,
    round(count(Billable_Inspection)/(select count(Billable_Inspection) 
    from Work.Fire_Inspections_2017_raw)*100,0.02) as PRCT
	    
		from Work.Fire_Inspections_2017_raw
		where Billable_inspection=1
		
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
Note: This compares the column "Violation_Item"ù and "Supervisor_District."

Methodology: Use PROC SQL to generate a table based on the dataset
on "Supervisor_District"ù and "Violation_Item".

Limitations: This methodology does not account for Zip Codes with missing data, 
nor does it attempt to validate the data in any way.

Follow-up Steps: More carefully clean values in order to filter out any possible 
illegal values, and better handle missing data.
;

proc sql;
    select '2016' as YEAR,
    Supervisor_District, count(Violation_item) as VC, Violation_item
        from Work.Fire_Violations_2016_raw
            group by Supervisor_District,Violation_item
            having VC=(select max(VC) from(select Supervisor_District,
            count(Violation_item) as VC, Violation_item
            from Work.Fire_Violations_2016_raw
            group by Supervisor_District,Violation_item))
union

select '2017' as YEAR,
    Supervisor_District, count(Violation_item) as VC, Violation_item
        from Work.Fire_Violations_2017_raw
            group by Supervisor_District,Violation_item
            having VC=(select max(VC) from(select Supervisor_District,
            count(Violation_item) as VC, Violation_item
            from Work.Fire_Violations_2017_raw
            group by Supervisor_District,Violation_item));

run;
