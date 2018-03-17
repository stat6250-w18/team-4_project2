
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
'Research Question: Which zipcode has maximum number of inspections?'
;

title2
'Rationale: This will help the team focus maximum on that particular zip code that needs more attention'
;

footnote1
"Based on the data zip code 94109 had the maximum number of inspections. It has 2584 observations and 10.46 % frequency"
;

footnote2
"Given the magnitude of these changes, further investigation should be performed to ensure no data errors are involved."
;

footnote3
"However, assuming there are no data issues underlying this analysis, futher check needs to be performed with a larger data set."
;

*

Methodology: Use PROC FREQ with order=freq option to list the frequency of the
zip codes.

Limitations: This methodology does not account for calls with missing data, 
neither does it attempt to validate the data in any way.

Followup Steps: Lookout for missing data and handle it and test with ,
bigger data set.
;

proc print
       data = Inspection_Count_Desc (obs=5) label
   ;
   label COUNT="Num of Observations";
run;
title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Which is the commonly used inspection type?'
;

title2
'Rationale: This will help understand the statistics on the commonly used inspection type and have list of common steps for it.'
;

footnote1
"Based on the data Inspection Type 31 is  commonly used .It has 6137 observations and 25.35 % total frequency"
;

footnote2
"In future this data can help identify the patterns and assist with the initial steps"
;

footnote3
"However we are testing with the subset of data and need to iteratively expand to a significant larger data set to conclude."
;

*

Methodology: Use PROC FREQ with order=freq option to list the frequency of the
inspection types.

Limitations: This methodology does not account for calls with missing data, 
neither does it attempt to validate the data in any way.

Followup Steps: Lookout for missing data and handle it and test with ,
much bigger data set.
;

proc print
       data = Inspection_Type_Count_Desc (obs=5) label
   ;
   label COUNT="Num of Observations";
run;
title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Which Battalion has completed the maximum number of inspections?'
;

title2
"Rationale: This should help  identify the top performing battalion group."
;

footnote1
"Based on the data Battalion 1 has completed the maximum number of inspections.It has completed 11815 observations at 24% frequency"
;

footnote2
"Various factors including team size,location ,time can then be considered to conclude the reason for the performance."
;

footnote3
"However,since this is a subset of data ,we will need to iteratively test with larger data sets before concluding "
;

*

Methodology: Use PROC FREQ with order=freq option to list the frequency of the
Batallions.

Limitations: This methodology does not account for calls with missing data, 
neither does it attempt to validate the data in any way.

Followup Steps: Lookout for missing data and handle it and test with ,
much bigger data set.
;

proc print
       data = Battalion_Count_Desc (obs=5) label
   ;
   label COUNT="Num of Observations";
run;
title;
footnote;
