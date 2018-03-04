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
'Research Question: Which top 5 Fire Prevention District where Fire Inspections
took place in the year 2016'
;

title2
'Rationale: This will help the team to know in 2016 which top 5 areas where 
Fire Inspections took place'
;

footnote1
'Based on the result district which is called 04 ranked first. This area
happened 3765 times during 2016. It occupies almost 15% in total'
;

footnote2
'Rationale: This will help the team to know in 2016 which top 5 areas
where Fire Inspections took place.'
;

footnote3
'Therefore, I am considering coding to list similar results happend in 2017'
;

*


Methodology: Use PROC FREQ with order=freq option to list the frequency
of the Fire Prevention District.
Limitations: This methodology is only show the cases happened in 2016.

Followup Steps: try to code to list result happened in 2017.
;


proc freq
       data = Work.Fire_Inspections_2016_raw noprint
   ;
   table
       Fire_Prevention_District / out = Count list
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


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Research Question: Which top 5 Fire Prevention District
where Fire Inspections took place in the year 2017'
;

title2
'Rationale: This will help the team to know in 2017 which top 5 areas where 
Fire Inspections took place.'
;

footnote1
"Based on the result district which is called 04 ranked first. This area
happened 3765 times during 2016. It occupies almost 15% in total."
;

footnote2
"Rationale: This will help the team to know in 2017 which top 5 areas
where Fire Inspections took place."
;

footnote3
"Therefore, I am considering coding how to compare these two result."
;

*


Methodology: Use PROC FREQ with order=freq option to list the frequency of the
Neighborhood_Distric.
Limitations: This methodology is not a good way to compare results 
by these two results.
Followup Steps: try a comparing code different datasets.
;

proc freq
       data = Work.Fire_Inspections_2017_raw noprint
   ;
   table
       Fire_Prevention_District / out = Count list
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



*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Which Station Area has completed the maximum number of inspections?'
;

title2
"Rationale: This should help  identify the top Station Area."
;

footnote1
"This analysis would help to know the Station Area that has completed maximum number of inspections."
;

footnote2
"Only one sation area is not enough."
;

footnote3
"I will put top 10 station areas that has completed maximum number of inspections. "
;

*


Methodology: Use PROC FREQ with order=freq option to list the frequency of the
Station Area.
Limitations: This methodology will not help me to identities how many missing
data I lost.
Followup Steps: Try to find one more way to solve this problem.
;

proc freq data = SF_FireStats_1617_analytic_file order=freq;
    tables Station_Are;
run;

title;
footnote;


