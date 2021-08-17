*Paper: Testing Methods to Increase Consumption of Healthy Foods: Evidence from a schoolbased field experiment in Viet Nam

*Date: 30 January 2021

*Prepared by: Trang Nguyen

*Short term effects on daily fruits and vegetables consumption (FAV)

use "\\Mac\Home\Documents\PhD\School diets Vietnam\Results\Paper\Submission to Food Policy\After reviews\Data to submit\Endline1_Child_diet", clear


*Without control variables

*Column 1, table 8:	
	regress FAV_weekday treat1##treat2, vce(cluster cluster)
//	outreg2 using "$endline1\Output\FAV_diary.rtf", replace label

*Column 3, table 8:
	regress fruit_weekday treat1##treat2, vce(cluster cluster)
//	outreg2 using "$endline1\Output\FAV_diary.rtf", append label


*With control variables

*Column 2, table 8: with controls (child and household)
	regress FAV_weekday treat1##treat2 male_child age_child i.income_quart hhsize male_parent, vce(cluster)
//	outreg2 using "$endline1\Output\FAV_diary.rtf", append label

*Column 4, table 8: with controls (child)
	
	regress fruit_weekday treat1##treat2 male_child age_child, vce(cluste)
//	outreg2 using "$endline1\Output\FAV_diary.rtf", append label

*Column 5, table 8: with controls (child and household)
	regress fruit_weekday treat1##treat2 male_child age_child i.income_quart hhsize male_parent, vce(cluster)	
//	outreg2 using "$endline1\Output\FAV_diary.rtf", append label


*Control group average:
	sum FAV_weekday if treat1 == 0 & treat2 == 0
	sum fruit_weekday if treat1 == 0 & treat2 == 0 
	
*Table 9:
*Separate regressions for at school and at home:
	regress fruit_weekday_school treat1##treat2, vce(cluster cluster)
//	outreg2 using "$endline1\Output\FAV_diary.rtf", append label

	regress fruit_weekday_home treat1##treat2, vce(cluster cluster)
//	outreg2 using "$endline1\Output\FAV_diary.rtf", append label
