*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address fire inspections
performed at given location by Fire department

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
'Research Question: What are the top 5 Fire Prevention District where Fire Inspections took place in the year 2016.'
;

title2
'Rationale: This will help to know in 2016 where Fire Inspections took place most.'
;

footnote1
'Based on the result district 04 ranked first. This area happened 3765 times during 2016. It occupies 15.1035% in total.'
;

footnote2
'This will help to know in 2016 what are the top 5 areas where Fire Inspections took place most.'
;

footnote3
'I would like to know in 2017 what are the top 5 areas where Fire Inspections took place most?'
;

*
Note: This list top 5 results of column "Fire Prevention District" in 2016 to 
show the observations and percentage.

Methodology: Use PROC FREQ with order=freq option to list the frequency of the Fire Prevention District.

Limitations: This methodology is only show the cases happened in 2016.

Followup Steps: try to code to list results happened in 2017.
;


proc print
       data = Count_Desc (obs=5)
   ;
run;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top 5 Fire Prevention District where Fire Inspections took place in the year 2017'
;

title2
'Rationale: This will help to know in 2017 where Fire Inspections took place most.'
;

footnote1
"Based on the result district 04 ranked first again in 2017. This area happened 3975 times. It occupies 16.4480% in total."
;

footnote2
"This will help to know only in 2017 where Fire Inspections took place most."
;

footnote3
"I am considering coding how to combine these two results together."
;

*


Methodology: Use PROC FREQ with order=freq option to list the frequency of the frequency of the Fire Prevention District.

Limitations: This methodology is not a good way to compare results by these two results.

Followup Steps: try to code to combine different datasets.
;


proc print
       data = Count_Desc (obs=5)
   ;
run;



*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top 5 Fire Prevention District where Fire Inspections took place in the year 2016 and 2017?'
;

title2
"Rationale: This analysis would help to know what are the top 5 areas where fire inspections took place both in 2016 and 2017."
;

footnote1
"We can see the 04 district took place most which is 7740. The number comes from results of first and second questions by adding 3765 and 3975."
;

footnote2
"We can see the 01w district rank second which is 4297. The number also comes from results of first and second questions by adding 2179 and 2118."

;

footnote3
"The result shows that merging two data sets works successfully. "
;

*


Methodology: Use PROC FREQ with order=freq option to list the frequency of the Fire Prevention District happened in 2016 and 2017.

Limitations: This methodology can only list top 5 results happened in 2016 and 2017.

Followup Steps: To analyize the result to test whether combining datasets works or not.
;



proc print
       data = Count_Desc (obs=5)
   ;
run;

