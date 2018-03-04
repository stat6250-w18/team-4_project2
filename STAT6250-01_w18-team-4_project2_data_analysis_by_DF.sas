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
'Research Question: What are top 5 Fire Prevention District where Fire Inspections took place in the year 2016.'
;

title2
'Rationale: This will help to know in 2016 where Fire Inspections took place most.'
;

footnote1
'Based on the result district 04 ranked first. This area happened 3765 times during 2016. It occupies 15.1035% in total.'
;

footnote2
'Rationale: This will help to know in 2016 which top 5 areas where Fire Inspections took place most.'
;

footnote3
'I would like to know in 2017 which are top 5 areas where Fire Inspections took place most?'
;

*


Methodology: Use PROC FREQ with order=freq option to list the frequency of the Fire Prevention District.
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
'Research Question: Research Question: What are top 5 Fire Prevention District where Fire Inspections took place in the year 2017'
;

title2
'Rationale: This will help to know in 2017 where Fire Inspections took place most.'
;

footnote1
"Based on the result district 04 ranked first again in 2017. This area happened 3975 times. It occupies almost 16% in total."
;

footnote2
"Rationale: This will help the team to know only in 2017 where Fire Inspections took place most."
;

footnote3
"Therefore, I am considering coding how to combine these two results together."
;

*


Methodology: Use PROC FREQ with order=freq option to list the frequency of the frequency of the Fire Prevention District.

Limitations: This methodology is not a good way to compare results by these two results.

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
'Research Question: What are top 5 Fire Prevention District where Fire Inspections took place in the year 2016 and 2017?'
;

title2
"Rationale: This analysis would help to know what are top 5 areas where fire inspections took place both in 2016 and 2017."
;

footnote1
"We can see the 04 district took place most which is 7740. The number comes from results of first and second question by 3765 adding 3975."
;

footnote2
"We can see the 01w district took place second which is 4297. The number comes from results of first and second question by 2179 adding 2118."

;

footnote3
"The result shows that based on combine funcion, the two data sets add the corresponding values together. "
;

*


Methodology: Use PROC FREQ with order=freq option to list the frequency of the Fire Prevention District.

;


proc freq
       data = Fire_Inspections_1617 noprint
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


