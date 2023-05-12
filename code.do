//Standardisation
egen early_usage_counts_std = std( early_usage_counts )
egen early_mendeley_readership_std = std( early_mendeley_readership )

//Regression models (journal papers)
reg citations early_usage_counts_std
reg citations early_usage_counts_std funding international_cooperation open_access jif
reg citations early_mendeley_readership_std
reg citations early_mendeley_readership_std funding international_cooperation open_access jif
reg citations early_usage_counts_std early_mendeley_readership_std
reg citations early_usage_counts_std early_mendeley_readership_std funding international_cooperation open_access jif

//Regression models (conference papers)
reg citations early_usage_counts_std
reg citations early_usage_counts_std funding international_cooperation open_access
reg citations early_mendeley_readership_std
reg citations early_mendeley_readership_std funding international_cooperation open_access
reg citations early_usage_counts_std early_mendeley_readership_std
reg citations early_usage_counts_std early_mendeley_readership_std funding international_cooperation open_access



//Mediation Model (journal papers)
ssc install  medsem
sem (early_mendeley_readership_std <- early_usage_counts_std) (citations <- early_mendeley_readership_std early_usage_counts_std funding international_cooperation open_access jif)
medsem, indep(early_usage_counts_std) med(early_mendeley_readership_std) dep(citations ) mcreps(5000) stand zlc rit rid

//Mediation Model (conference papers)
ssc install  medsem
sem (early_mendeley_readership_std <- early_usage_counts_std) (citations <- early_mendeley_readership_std early_usage_counts_std funding international_cooperation open_access)
medsem, indep(early_usage_counts_std) med(early_mendeley_readership_std) dep(citations ) mcreps(5000) stand zlc rit rid
