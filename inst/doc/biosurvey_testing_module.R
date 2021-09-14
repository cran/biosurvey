## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", echo = FALSE)

## ----preare_base_PAM, eval=FALSE, echo=TRUE-----------------------------------
#  # Data
#  data("species_data", package = "biosurvey")
#  
#  # Create base_pam
#  b_pam <- prepare_base_PAM(data = species_data, master_matrix = m_matrix,
#                            cell_size = 50)
#  #> Preparing spatial grid
#  #> Preprocessing 'data'
#  #> |======================================================================| 100%
#  #> Preparing PAM from information
#  #> Calculating PAM indices
#  
#  summary(b_pam)
#  #>
#  #>                       Summary of a base_PAM object
#  #> ---------------------------------------------------------------------------
#  #>
#  #> Presence-absence matrix:
#  #>   Number of cells:    1020
#  #>   Number of species:  25
#  #>
#  #> Spatial object representing the PAM:
#  #> class       : SpatialPolygonsDataFrame
#  #> features    : 1020
#  #> extent      : -118.4298, -86.51483, 14.28854, 32.77954  (xmin, xmax, ymin, ymax)
#  #> crs         : +proj=longlat +datum=WGS84 +no_defs
#  #> variables   : 28
#  #> names       :   ID,         Longitude,         Latitude, Species_1, Species_2, Species_3, Species_4, Species_5, Species_6, Species_7, Species_8, Species_9, Species_10, Species_11, Species_12, ...
#  #> min values  :  471, -118.184325012541, 14.5140353096983,         0,         0,         0,         0,         0,         0,         0,         0,         0,          0,          0,          0, ...
#  #> max values  : 3602,  -86.760325012541, 32.5540353096983,         1,         1,         1,         1,         1,         1,         1,         1,         1,          1,          1,          1, ...
#  

## ----PAM_indices, eval=FALSE, echo=TRUE---------------------------------------
#  # Calculating indices
#  b_pam <- PAM_indices(PAM = b_pam)
#  
#  # for a brief view of all indices use
#  #print(b_pam)

## ----m_selection, eval=FALSE, echo=TRUE---------------------------------------
#  # Data
#  data("m_selection", package = "biosurvey")

## ----subset_PAM, eval=FALSE, echo=TRUE----------------------------------------
#  # Subset of base PAM according to selections
#  ## using all selections the time
#  sub_pam_all <- subset_PAM(b_pam, m_selection, selection_type = "all")

## ----selected_sites_SAC, eval=FALSE, echo=TRUE--------------------------------
#  # species accumulation curves for all selected sites based on PAM
#  SACs <- selected_sites_SAC(PAM_subset = sub_pam_all, selection_type = "all")

## ----plot_SAC, eval=FALSE, echo=TRUE------------------------------------------
#  ## all sets at the time
#  plot_SAC(SAC_selected_sites = SACs)
#  

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f1.png")

## ----compare_SAC, eval=FALSE, echo=TRUE---------------------------------------
#  # random vs uniform in E
#  compare_SAC(SAC_selected_sites = SACs, element_1 = 1, element_2 = 2)

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f2.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # random vs uniform in G
#  compare_SAC(SAC_selected_sites = SACs, element_1 = 1, element_2 = 3)

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f3.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # uniform in E vs uniform in G
#  compare_SAC(SAC_selected_sites = SACs, element_1 = 2, element_2 = 3)
#  

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f4.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # calculating dissimilarities
#  DI_sel <- selected_sites_DI(PAM_subset = sub_pam_all, selection_type = "all", method = "jaccard")
#  

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # plots derived from dissimilarity calculations (matrix-like)
#  plot_DI(DI_sel)
#  

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f5.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # plots derived from dissimilarity calculations (dendrogram)
#  DI_dendrogram(DI_sel)

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f6.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # matrix-like plot derived from dissimilarity calculations for uniform in G selection
#  plot_DI(DI_sel, selection_type = "G")

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f7.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # dendrogram plot derived from dissimilarity calculations for uniform in E selection
#  DI_dendrogram(DI_sel, selection_type = "E")

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f8.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # random selection
#  plot_PAM_geo(b_pam, master_selection = m_selection, selection_type = "random")
#  
#  # adding a legend for better interpretations
#  ## this color palette is the same used by default in plots (purplow)
#  colpal <- purplow(7)
#  labs <- range(b_pam$PAM_indices$Richness)
#  
#  legend_bar("bottomleft", col = colpal, title = "Richness", labels = labs)

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f9.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # G selection
#  plot_PAM_geo(b_pam, master_selection = m_selection, selection_type = "G")
#  
#  # adding the legend
#  legend_bar("bottomleft", col = colpal, title = "Richness", labels = labs)

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f10.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # E selection
#  plot_PAM_geo(b_pam, master_selection = m_selection, selection_type = "E")
#  
#  # adding the legend
#  legend_bar("bottomleft", col = colpal, title = "Richness", labels = labs)

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f11.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # random selection (using another palette)
#  plot_PAM_geo(b_pam, index = "MCC", master_selection = m_selection,
#               selection_type = "random", col_pal = greeple)
#  
#  # adding the appropriate legend
#  colpal1 <- greeple(10)
#  labs1 <- range(b_pam$PAM_indices$Mean_composition_covariance)
#  
#  legend_bar("bottomleft", col = colpal1, title = "Mean comp-covar",
#             labels = labs1, digits = 2)

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f12.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # G selection
#  plot_PAM_geo(b_pam, index = "MCC", master_selection = m_selection,
#               selection_type = "G", col_pal = greeple)
#  
#  # adding the legend
#  legend_bar("bottomleft", col = colpal1, title = "Mean comp-covar",
#             labels = labs1, digits = 2)

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f13.png")

## ---- eval=FALSE, echo=TRUE---------------------------------------------------
#  # E selection
#  plot_PAM_geo(b_pam, index = "MCC", master_selection = m_selection,
#               selection_type = "E", col_pal = greeple)
#  
#  # adding the legend
#  legend_bar("bottomleft", col = colpal1, title = "Mean comp-covar",
#             labels = labs1, digits = 2)

## ---- fig.height=6, fig.width=6-----------------------------------------------
knitr::include_graphics("vignette_img/V4_f14.png")

