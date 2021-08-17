use "\\Mac\Home\Documents\PhD\School diets Vietnam\Results\Paper\Submission to Food Policy\After reviews\Data to submit\Endline2_Child_questionnaire.dta", clear

//Table 11
*Column (1): Longer term effect on knowledge score (without controls)
	regress know_index_el2_c treat1##treat2, vce(cluster cluster)
//	outreg2 using "$endline2\Output\endline2_nocontrol.rtf", replace label dec(2) pdec(3)

*Column (3): Longer term effect on attitude score (without controls)

	regress att_index_el2_c treat1##treat2, vce(cluster cluster)
//	outreg2 using "$endline2\Output\endline2_nocontrol.rtf", append label dec(2) pdec(3)

*Merge with covariates from baseline:
*Set ID variables:
local ID pro_code dis_code com_code school_code grade_code class_code student_code
*Merge with baseline covariates:
merge 1:1 `ID' using "\\Mac\Home\Documents\PhD\School diets Vietnam\Results\Paper\Submission to Food Policy\After reviews\Data to submit\Baseline_Child.dta", generate(merge_BL_child) force

merge 1:1 `ID' using "\\Mac\Home\Documents\PhD\School diets Vietnam\Results\Paper\Submission to Food Policy\After reviews\Data to submit\Baseline_Parent.dta", generate(merge_BL_parent) force

*Column (2):  Longer term effect on knowledge score (with controls)
	regress know_index_el2_c treat1##treat2 male_child age_child know_index_bls_c, vce(cluster cluster)
//	outreg2 using "$endline2\Output\knowledge.rtf", append label dec(2) pdec(3)
