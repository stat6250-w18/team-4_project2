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
'Research Question: What are the top 5 Fire Prevention District where Fire Inspections took place in the year 2016.'
;

title2
'Rationale: This will help to know in 2016 where Fire Inspections took place most.'
;

footnote1
'Based on the result district 04 ranked first. This area happened 3765 times during 2016. It occupies 15.1035% in total.'
;

footnote2
'This will help to prepare the result about what are the top 5 areas where Fire Inspections took place most in 2016.'
;

footnote3
'My purpose base on these three research questions is to test whether my combining two datasets does work or not. Therefore, I need to show what happened in 2017 further.'  .'
;


*Note: This lists top 5 observations from column Fire Prevention District in
2016 and their percentages.These five rows are ready for comparing.

Methodology: Use proc print to show the results. Also, some codes about proc
freq with order=freq option to list the frequency of the Fire Prevention
District. Also, proc sort to sort results are done in data prep file.

Limitations: This methodology is only show 5 cases happened in 2016. There
are many records may need to be compared. 

Followup Steps: try to code to list the top 5 areas where Fire Inspections
took place most in 2017. Use similar code to do the next research question
for comparsion.
;


proc print
       data = Count_Desc (obs=5);
run;
title;
footnote;

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
'Based on the result district 04 ranked first again in 2017. This area happened 3975 times. It occupies 16.4480% in total.'
;

footnote2
'This will help to know only in 2017 where Fire Inspections took place most.'
;

footnote3
'These two results are ready for comparing for my purpose to test combining datasets.'
;

*
Note: This lists top 5 observations from column Fire Prevention District 
in 2017 and their percentages.

Methodology: Use proc print to show the results. Also, some codes about PROC
FREQ with order=freq option to list the frequency of the Fire Prevention
District. Also, PROC SORT to sort results are done in data prep file.

Limitations: This methodology is not a good way to compare results by these
two results.

Followup Steps: In next reserch question, I will proc print the results for
where Fire Inspections took place in both 2016 and 2017. The comined table
has been ready in prep.sas file. Its name is called table Fire_Inspections
_1617 which is created by proc sql.
;

proc print
       data = Count1_Desc (obs=5);
run;
title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top 5 Fire Prevention District where Fire Inspections took place in the year 2016 and 2017?'
;

title2
'Rationale: This analysis would help to know what are the top 5 areas where fire inspections took place both in 2016 and 2017.'
;

footnote1
'We can see the 04 district took place most which is 7740. The number comes from results of first and second questions by adding 3765 and 3975.'
;

footnote2
'We can see the 01w district rank second which is 4297. The number also comes from results of first and second questions by adding 2179 and 2118.'

;

footnote3
'These results show that combining does work due to the values in the chart.'
;

*
Note: This compares observations from column Fire Prevention District in 2016
and 2017 and compares their percentages.

Methodology: Use proc print to show the table results. The combined table
has been ready in prep.sas file. Its name is called table Fire_Inspections
_1617 which is created by proc sql.

Limitations: This methodology can only list top 5 results happened in 2016
and 2017. Also, from these 5 rows, we can not get some statistic meanings,
for example, why the place ranked in 3rd position in 2016 and 5th position
in 2017 goes to 4 position after combining.

Followup Steps: Based on the limitaion above, we need more statistic knowlege
to look for a method to make the questions more meaningful. Or maybe use more
reference objects such as other columns in row datasets to help to get a 
better conclusion.
;

proc print
       data = Count2_Desc (obs=5);
run;
title;
footnote;
