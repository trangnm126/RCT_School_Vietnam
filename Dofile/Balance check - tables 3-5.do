*Paper: Testing Methods to Increase Consumption of Healthy Foods: Evidence from a schoolbased field experiment in Viet Nam

*Date: 30 January 2021

*Prepared by: Trang Nguyen


*Balance check, using the baseline dataset

use "$directory\Baseline_Child.dta" 

**************************
*Table 3, Child - Descriptive statistics
foreach i in know_index_bls_c att_index_bls_c fre_consumption_fruits_bls_c fre_consumption_vegetables_bls_c age_child male_child {
	display "`i'"
	sum `i'
}

*Run OLS to check balance

*Table 4, Chid -  Regressions of Outcome Variables Measured at Baseline on Treatment Indicators

*Control vs treat1
	foreach i in know_index_bls_c att_index_bls_c fre_consumption_fruits_bls_c fre_consumption_vegetables_bls_c age_child male_child {
		display "`i'"
		regress `i' treat1, vce(cluster cluster_grade)
		//outreg2 using "$baseline\Outputs\balance_OLS_child_treat1.rtf", append label dec(2) pdec(3)
		}
	
*Control vs treat2
	foreach i in know_index_bls_c att_index_bls_c fre_consumption_fruits_bls_c fre_consumption_vegetables_bls_c age_child male_child {
		display "`i'"
		regress `i' treat2, vce(cluster school_code)
		//outreg2 using "$baseline\Outputs\balance_OLS_child.treat2_cluster_school.rtf", append label dec(2) pdec(3)
		}
	
*Table 5, Child: Test of joint orthogonality

	logit treat1 know_index_bls_c att_index_bls_c fre_consumption_fruits_bls_c fre_consumption_vegetables_bls_c age_child male_child, vce(cluster cluster_grade)
	//outreg2 using "$baseline\Outputs\balance_joint_child.rtf", addstat(chi-square test, e(chi2), p-val, e(p)) replace label
//	margins, dydx(know_index att_index fre_consumption_fruits fre_consumption_vegetables age_child male_child) post
//	outreg2 using "$baseline\Outputs\balance_joint_child_AME.rtf", replace label


	logit treat2 know_index_bls_c att_index_bls_c fre_consumption_fruits_bls_c fre_consumption_vegetables_bls_c age_child male_child, vce(cluster school_code)
	//outreg2 using "$baseline\Outputs\balance_joint_child.rtf", addstat(chi-square test, e(chi2), p-val, e(p)) append label dec(2) pdec(3)
	margins, dydx(know_index att_index fre_consumption_fruits fre_consumption_vegetables age_child male_child) post
	//outreg2 using "$baseline\Outputs\balance_joint_child_AME.rtf", append label
	
*=============================

use "$directory\Baseline_Parent.dta" 

**************************

*Table 3, Parent - Descriptive statistics

foreach i in know_index_bls_p att_index_bls_p fre_consumption_fruits_bls_p fre_consumption_vegetables_bls_p male_parent hhsize income_quart {
	display "`i'"
	sum `i'
	}

*Run OLS to check balance

*Table 4, Parent -  Regressions of Outcome Variables Measured at Baseline on Treatment Indicators

*Control vs treat1
	foreach i in know_index_bls_p att_index_bls_p fre_consumption_fruits_bls_p fre_consumption_vegetables_bls_p male_parent hhsize income_quart {
		display "`i'"
		sum `i'
		regress `i' treat1, vce(cluster cluster_grade)
		//outreg2 using "$baseline\Outputs\balance_OLS_parent_treat1.rtf", append label dec(2) pdec(3)
		}

*Control vs treat2
	foreach i in know_index_bls_p att_index_bls_p fre_consumption_fruits_bls_p fre_consumption_vegetables_bls_p male_parent hhsize income_quart {
		display "`i'"
		sum `i'
		regress `i' treat2, vce(cluster school_code)
		//outreg2 using "$baseline\Outputs\balance_OLS_parent_treat2.rtf", append label dec(2) pdec(3)
		}
		
*Table 5, Parent: Test of joint orthogonality
	logit treat1 know_index att_index fre_consumption_fruits fre_consumption_vegetables male_parent hhsize i.income_quart, vce(cluster cluster_grade)
	//outreg2 using "$baseline\Outputs\balance_joint_parent.rtf", addstat(chi-square test, e(chi2), p-val, e(p)) append label dec(2) pdec(3)

	logit treat2 know_index att_index fre_consumption_fruits fre_consumption_vegetables male_parent hhsize i.income_quart, vce(cluster school_code)
	//outreg2 using "$baseline\Outputs\balance_joint_parent.rtf", addstat(chi-square test, e(chi2), p-val, e(p)) append label dec(2) pdec(3)
