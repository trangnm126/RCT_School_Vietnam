*Paper: Testing Methods to Increase Consumption of Healthy Foods: Evidence from a schoolbased field experiment in Viet Nam

*Date: 30 January 2021

*Prepared by: Trang Nguyen


*Short term effects (tables 6-8) on knowledge, attitude and consumption (frequency) outcomes

use "$directory\Endline1_Child_questionnaire.dta"

*Table 6: //Regressions: to be reported using mean effects index:
*Column 1: Without control variables	
	regress know_index_el1_c treat1##treat2, vce(cluster cluster_grade)
	//boottest 1.treat1 = 0
	//outreg2 using "$endline1\Output\knowledge.rtf", replace label dec(2) pdec(3)

//Regressions:	
*Table7, column 1: Without control variables	
	regress att_index_el1_c treat1##treat2, vce(cluster cluster_grade)
	//outreg2 using "$endline1\Output\attitude.rtf", replace label dec(2) pdec(3)	
	
*Table 8, column 6:
	regress fre_consumption_fruits_el1_c treat1##treat2, vce(cluster cluster_grade)

	*Control average
	sum fre_consumption_fruits if treat1== 0 & treat2 == 0
	
	
*=========Merge with baseline data for control variables=============

*Merge with covariates from baseline:
//Set ID variables:
local ID pro_code dis_code com_code school_code grade_code class_code student_code
*Merge with baseline covariates:
merge 1:1 `ID' using "$directory\Baseline_Child.dta", generate(merge_BL_child) force

merge 1:1 `ID' using "$directory\Baseline_Parent.dta", generate(merge_BL_parent) force


*With control variables

*Knowledge index:
*Table 6, Column 2: With socio-economic controls
	regress know_index_el1_c treat1##treat2 male_child age_child i.income_quart hhsize male_parent, vce(cluster cluster_grade)
	//outreg2 using "$endline1\Output\knowledge.rtf", drop (i.school_code) append label dec(2) pdec(3)
	
*Table 6, Column3: With baseline value of knowledge_index
	regress know_index_el1_c treat1##treat2 male_child age_child know_index_bls_c, vce(cluster cluster_grade)
	//outreg2 using "$endline1\Output\knowledge.rtf", drop (i.school_code) append label dec(2) pdec(3)

*Attitude index:
*Table 7, Column 2: With socio-economic controls	
	regress att_index_el1_c treat1##treat2 male_child age_child i.income_quart hhsize male_parent, vce(cluster cluster_grade)
	//outreg2 using "$endline1\Output\attitude.rtf", drop (i.school_code) append label dec(2) pdec(3)
	
*Table 7, column 3: With baseline value of attitude index
	regress att_index_el1_c treat1##treat2 male_child age_child att_index_bls_c, vce(cluster cluster_grade)
	//outreg2 using "$endline1\Output\attitude.rtf", drop (i.school_code) append label dec(2) pdec(3)

