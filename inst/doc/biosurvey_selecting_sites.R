## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", echo = FALSE)

## ----data, eval=FALSE, echo=TRUE----------------------------------------------
#  # Data
#  data("m_matrix", package = "biosurvey")
#  # Creating blocks
#  m_blocks <- make_blocks(m_matrix, variable_1 = "PC1",
#                         variable_2 = "PC2", n_cols = 20, n_rows = 20,
#                         block_type = "equal_area")

## ----EG_selection, eval=FALSE, echo=TRUE--------------------------------------
#  # Selecting sites uniformly in E and G spaces
#  EG_sel <- EG_selection(master = m_blocks, n_blocks = 10)
#  #> Element 'preselected_sites' in 'master' is NULL, setting
#  #> 'use_preselected_sites' = FALSE
#  #> Preparing data for analysis
#  #> Selecting relevant environmental blocks, please wait...
#  #> Running algorithm for selecting sites, please wait...
#  #>     Process 1 of 10
#  #>     Process 2 of 10
#  #>     Process 3 of 10
#  #>     Process 4 of 10
#  #>     Process 5 of 10
#  #>     Process 6 of 10
#  #>     Process 7 of 10
#  #>     Process 8 of 10
#  #>     Process 9 of 10
#  #>     Process 10 of 10
#  #> Total number of sites selected: 15

## ----plot_sites_EG EG, eval=FALSE, echo=TRUE, fig.height=4, fig.width=6-------
#  # Plotting sites selected considering EG
#  plot_sites_EG(EG_sel, selection_type = "EG")

## ---- fig.height=4, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V2_f1.png")

## ----random_selection, eval=FALSE, echo=TRUE----------------------------------
#  # Selecting sites randomly
#  EG_r_selection <- random_selection(EG_sel, n_sites = 15, n_samplings = 5)
#  #> Element 'preselected_sites' in 'master' is NULL, setting
#  #> 'use_preselected_sites' = FALSE
#  #> Selecting sampling sites randomly
#  #> Total number of sites selected: 15

## ----plot_sites_EG random, eval=FALSE, echo=TRUE, fig.height=4, fig.width=6----
#  # Plotting selected sites
#  plot_sites_EG(EG_r_selection, selection_type = "random", variable_1 = "PC1",
#                variable_2 = "PC2")

## ---- fig.height=4, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V2_f2.png")

## ----uniformG_selection, eval=FALSE, echo=TRUE--------------------------------
#  # Selecting sites uniformly in G space
#  EG_r_G_selection <- uniformG_selection(EG_r_selection, expected_points = 15,
#                                         max_n_samplings = 1, replicates = 5)
#  #> Element 'preselected_sites' in 'master' is NULL, setting
#  #> 'use_preselected_sites' = FALSE
#  #> Running algorithm for selecting sites, please wait...
#  #>     Distance  242.166565850223  resulted in  17  points
#  #>     Distance  266.383222435246  resulted in  13  points
#  #>     Distance  242.166565850223  resulted in  17  points
#  #>     Distance  244.588231508726  resulted in  17  points
#  #>     Distance  247.009897167228  resulted in  16  points
#  #>     Distance  249.43156282573  resulted in  16  points
#  #>     Distance  251.853228484232  resulted in  15  points
#  #> Total number of sites selected: 15

## ----plot_sites_EG G_selection, eval=FALSE, echo=TRUE, fig.height=4, fig.width=6----
#  # Plotting sites selected uniformly in the geographic space
#  plot_sites_EG(EG_r_G_selection, selection_type = "G", variable_1 = "PC1",
#                variable_2 = "PC2")

## ---- fig.height=4, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V2_f3.png")

## ----uniformE_selection_blocks, eval=FALSE, echo=TRUE-------------------------
#  # Selecting sites uniformly in E space
#  EG_r_G_E_selection <- uniformE_selection(EG_r_G_selection, expected_points = 15,
#                                           max_n_samplings = 1, replicates = 5)
#  #> Element 'preselected_sites' in 'master' is NULL, setting
#  #> 'use_preselected_sites' = FALSE
#  #> Running algorithm for selecting sites, please wait...
#  #>     Distance  0.985888853481237  resulted in  25  points
#  #>     Distance  1.08447773882936  resulted in  20  points
#  #>     Distance  1.18306662417748  resulted in  17  points
#  #>     Distance  1.28165550952561  resulted in  14  points
#  #>     Distance  1.18306662417748  resulted in  17  points
#  #>     Distance  1.1929255127123  resulted in  17  points
#  #>     Distance  1.20278440124711  resulted in  16  points
#  #>     Distance  1.21264328978192  resulted in  15  points
#  #> Total number of sites selected: 15

## ----plot_sites_EG E_all, eval=FALSE, echo=TRUE, fig.height=4, fig.width=6----
#  # Plotting sites selected uniformly in the environmental space
#  plot_sites_EG(EG_r_G_E_selection, selection_type = "E")

## ---- fig.height=4, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V2_f4.png")

