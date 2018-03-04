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
'Research Question: Which top 5 Fire Prevention District has taken place 
inspections?'
;

title2
'Rationale: This will help the team to know which area has maximum number of inspections.'
;

footnote1
"Based on the result district 01 has the maximum number of inspections."
;

footnote2
"From this result, we should learn more areas about the maximum number of inspections."
;

footnote3
"Therefore, I put which Fire Prevention Districts have top 5 maximum number of inspections."
;

*


Methodology: Use PROC FREQ with order=freq option to list the frequency of the
Fire Prevention District.
Limitations: This methodology is not a good way to show the results of the 
frequency of fire prevention district because there are so many records.

Followup Steps: Try one more way to filter something more.
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
'Research Question: Which Neighborhood District is the most inspection?'
;

title2
'Rationale: This will help understand the most inspections based on Neighborhood District.'
;

footnote1
"The most neighborhood district is Financial District/South Beach. "
;

footnote2
"The result of the most neighborhood district looks too few."
;

footnote3
"However we are need more to focus on this question."
;

*


Methodology: Use PROC FREQ with order=freq option to list the frequency of the
Neighborhood_Distric.
Limitations: This methodology can help me to list the frequency of the reuslt
but still there will miss some results and show me what I do not need.

Followup Steps: Try new methodology to narrow the missing gap.
;

proc freq data = SF_FireStats_1617_analytic_file order=freq;
    tables Neighborhood_District;
run;

title;
footnote;



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


