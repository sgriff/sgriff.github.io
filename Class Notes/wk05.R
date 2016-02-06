#Class Notes 2/5/16

#dplyr

#dplyr::bind_cols() and bind_rows() to join cols/rows
#dplyr::union() to join elements between the compnents that are unique (all elements within set appear once)
#dplyr:;intersect() to join elements that are common between sets
#dplyr::setdiff() to join elements that are not common to both sets 

#dplyr::left_join() to attach left set of info to matches on right set of info. Retains all info in first info, adds only matching info from second set. If first set has no match on right side, "NA".

#dplyr::inner_join() to join rows with matches between two sets, only. Excludes non-matches in row values (ie no NA values).

#dplyr::semi_join() to join show values in set 1 with matches in set 2, excluding additional columns/subsets in set 2.

#dplyr::anti_join() to match rows from set 1 without matches in set 2. Inverse of semi_join()

##############################################################################################

#ggplot!

library(ggplot2)
?theme

#see https://ramnathv.github.io/pycon2014-r/visualize/ggplot2.html for ggplot help and tips

library(grid)

#continue to name levels of the plot and add them

#making boxplots: may need to turn data into categorical (as.factor) for independent vars

#for size() --can input size(rel(Z)) to make point sizes Z times greater on graph

library(stringr)
library(lubridate)
#lubridate to simplify using dates in ggplot

#putting 'color()' inside aes() instead of inside geom_() -- color is used to differentiate dimensions of data in plot
#renaming legend: scale_fill_discrete(name = 'TITLE') or scale_fill_continuous(name = 'TITLE')

#using color as a factor to retain different levels of data: col(as.factor(DATA))

?facet_wrap
#faceting allows to separate data points (e.g. variances within boxplot for each data scenario, or breaks down distributions/densities by time steps)