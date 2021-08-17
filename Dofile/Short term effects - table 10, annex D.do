use "\\Mac\Home\Documents\PhD\School diets Vietnam\Results\Paper\Submission to Food Policy\After reviews\Data to submit\Endline1_Parent_questionnaire.dta", clear

	
*Table 10: Short term effects of nutrition lesson on parents:

*Without control variables	
	regress know_index_el1_p treat1, vce(cluster cluster_grade)
//	outreg2 using "$endline1\Output\parent_treat1.rtf",  replace label dec(2) pdec(3) 
	regress att_index_el1_p treat1, vce(cluster cluster_grade)
//	outreg2 using "$endline1\Output\parent_treat1.rtf",  append label dec(2) pdec(3) 
	regress fre_consumption_FAV treat1, vce(cluster cluster_grade)
//	outreg2 using "$endline1\Output\parent_treat1.rtf",  append label dec(2) pdec(3) 
	
	
	
*Annex D: Additional regressions:

*=========Merge with baseline data for control variables=============

*Merge with covariates from baseline:
//Set ID variables:
local ID pro_code dis_code com_code school_code grade_code class_code student_code
*Merge with baseline covariates:
merge 1:1 `ID' using "\\Mac\Home\Documents\PhD\School diets Vietnam\Results\Paper\Submission to Food Policy\After reviews\Data to submit\Baseline_Child.dta", generate(merge_BL_child) force

merge 1:1 `ID' using "\\Mac\Home\Documents\PhD\School diets Vietnam\Results\Paper\Submission to Food Policy\After reviews\Data to submit\Baseline_Parent.dta", generate(merge_BL_parent) force
	
	
*With control variables
*Column 1 - Annex D
	regress know_index_el1_p treat1 male_child age_child i.income_quart hhsize male_parent know_index_bls_p, vce(cluster cluster_grade)
//	outreg2 using "$endline1\Output\parent_treat1_withcontrols.rtf",  replace label dec(2) pdec(3)

*Column 2 - Annex D

	regress att_index_el1_p treat1 male_child age_child i.income_quart hhsize male_parent att_index_bls_p, vce(cluster cluster_grade)
//	outreg2 using "$endline1\Output\parent_treat1_withcontrols.rtf",  append label dec(2) pdec(3)
	
*Column 3 - Annex D
	
	gen fre_consumption_FAV_bls_p = fre_consumption_fruits_bls_p + fre_consumption_vegetables_bls_p
	regress fre_consumption_FAV_el1_p treat1 male_child age_child i.income_quart hhsize male_parent fre_consumption_FAV_bls_p, vce(cluster cluster_grade)
//	outreg2 using "$endline1\Output\parent_treat1_withcontrols.rtf",  append label dec(2) pdec(3)		


*LATE estimator
*Create compliance variable:
	replace q30 = 0 if q30==.
	replace q30 = 0 if q30==2
	tab q30 if treat1 == 1
	
*2SLS IV regression:
	ivregress 2sls know_index_el1_p (q30 = treat1), vce(cluster cluster)
//	outreg2 using "$endline1\Output\parent_treat1_withcontrols.rtf",  append label dec(2) pdec(3)

	ivregress 2sls att_index_el1_p (q30 = treat1), vce(cluster cluster)
//	outreg2 using "$endline1\Output\parent_treat1_withcontrols.rtf",  append label dec(2) pdec(3)

	ivregress 2sls fre_consumption_FAV_el1_p (q30 = treat1), vce(cluster cluster)
//	outreg2 using "$endline1\Output\parent_treat1_withcontrols.rtf",  append label dec(2) pdec(3)

**Children do not share the leaflets with their parents!
