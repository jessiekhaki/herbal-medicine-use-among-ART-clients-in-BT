//import data
import excel "H:\My Documents\Research\Hawah - Herbal Medicine\Herbal excel herbal status narrowed.xlsx", sheet("Sheet1") firstrow

//look at outcome variable
ta Herbalstatus, m

gen hs=.
replace hs=1 if Herbalstatus=="Using"
replace hs=0 if hs==.
label var hs " current herbal medicine use"
label define hs_lbl 0 "no" 1 "yes"
label val hs hs_lbl
ta hs

***********************
ta Age, m
gen age=.
replace age=1 if Age == "20 or less"| Age== "> 20 to 30"
replace age=2 if Age == ">30 to 40"
replace age=3 if Age == ">40 to 50"
replace age=4 if Age == "More than 50"
ta age

label var age "age"
label define age_lbl 1 "<=30" 2 "31-40" 3 "41-50" 4 "51+"
label val age age_lbl
ta age

****************************
ta Gender
gen sex=.
replace sex=1 if Gender==1
replace sex=2 if Gender == 2
label define sex_lbl 1 "male" 2 "female"
label val sex sex_lbl
ta sex

****************************
ta Residence, m
gen residence =.
replace residence =1 if Residence == "Rural/peri Urban"
replace residence =2 if Residence == "Urban"
label define residence_lbl 1 "rural/peri-urban" 2 "urban"
label val residence residence_lbl
ta residence

*****************************
ta Religion, m
gen religion=.
replace religion = 1 if Religion == 0
replace religion = 2 if Religion ==1| Religion ==2
label define religion_lbl 1 "Christian" 2 "Muslim and other"
label val religion religion_lbl
ta religion

*********************************
ta MaritalStatus
gen marits =.
replace marits =1 if MaritalStatus==0
replace marits = 2 if MaritalStatus ==1
replace marits = 3 if MaritalStatus ==2| MaritalStatus==3
label define marits_lbl 1 "Single" 2 "Married" 3 "Divorced/widowed"
label val marits marits_lbl
ta marits 

***********************************
ta Income, m
gen income =.
replace income=1 if Income ==0
replace income=2 if Income ==1
replace income = 3 if Income >=2
ta income

label define income_lbl 1 "< 10,000" 2 "10,000-49,000" 3 "50,000+"
label val income income_lbl
ta income 

************************************
ta Cormobidity, m

gen ncdcormbod =.
replace ncdcormbod=1 if Cormobidity==1
replace ncdcormbod = 2 if Cormobidity ==2
label define ncdcormbod_lb 1 "yes" 2 "no"
label val ncdcormbod ncdcormbod_lb
ta ncdcormbod

**************************************
ta c6NCD, m
gen ncdc =.
replace ncdc =0 if c6NCD == ""
replace ncdc=1 if ncdc==.

************************************
//length on ART
ta DurationonART, m
gen artlen=.
replace artlen=1 if DurationonART==1| DurationonART ==2
replace artlen = 2 if DurationonART ==3 | DurationonART ==4
replace artlen = 3 if DurationonART ==5
replace artlen = 4 if DurationonART == 6

label define artlen_lbl 1 "0-11 months" 2 "1-5 years" 3 "5-9 years" 4 "10+ years"
label val artlen artlen_lbl
ta artlen

*******************************************
ta Adherence, m
gen adherence=.
replace adherence=1 if Adherence== "95% or more"
replace adherence = 2 if adherence==.
label define adherence_lbl 1 "yes" 2 "no"
label val adherence adherence_lbl
ta adherence


***********************************
ta ARTswitch, m
gen artswitch=.
replace artswitch =1 if ARTswitch==1
replace artswitch=2 if ARTswitch==2
label define artswitch_lbl 1 "yes" 2 "no"
label val artswitch artswitch_lbl
ta artswitch

**********************************
ta DurationofHVstatusknowledge, m
gen durhiv=.
*replace durhiv=1 if DurationofHVstatusknowledge

*********************************
ta ncdc, m
logistic hs m

/////////////////////////////////////////
**DESCRIPTIVE ANALYSIS
ta age hs, col chi2
ta marits hs, col chi2 exact
ta income hs, col chi2
ta adherence hs, col chi2

ta sex hs, col chi2
ta residence hs, col chi2
ta religion hs, col chi2
ta artlen hs, col chi2 exact
ta artswitch hs, col chi2
ta ncdcormbod hs, col chi2

**UNIVARIATE ANALYSIS
logistic hs i.age
logistic hs i.marits
logistic hs i.income
logistic hs i.adherence

logistic hs i.sex
logistic hs i.residence
logistic hs i.religion
logistic hs i.artlen
logistic hs i.artswitch
logistic hs i.ncdcormbod

logistic hs i.age i.sex i.marits i.income i.residence i.religion i.artswitch i.artlen i.ncdcormbod i.adherence

**Check for multicollinearity in the model
collin age sex marits income residence religion artswitch artlen ncdcormbod adherence

logistic hs i.sex i.residence i.religion i.artswitch i.artlen i.ncdcormbod

logistic hs i.residence i.artswitch i.ncdcormbod


***original file
import excel "C:\Users\khaki\Documents\Downloads\Herbal excel 26th March.xlsx", sheet("Sheet1") firstrow clear














