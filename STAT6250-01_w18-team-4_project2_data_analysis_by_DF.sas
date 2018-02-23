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
'Research Question: Which Fire Prevention District has maximum number of inspections?'
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
