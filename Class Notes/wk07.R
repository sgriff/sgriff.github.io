#week 7: Notes

#2/19/16

#Advanced Programming

Modularity is key - smaller pieces/functions to be called
Eg - looking at quantifying benefits of forests by different parts: carbon sequestration (carbon prices), biodiversity (biodiversity prices).
  inputs: carbon, tree species, original biomass, climate/season
  means: calculating biodiversity (index); tree growth calculator
  output: forest benefits
  
Documentation for functions - R will generate help page
For return, use list() in R for different pieces of information

Packages in R - precise directory structure (package, type, version, date, description, etc.). Use load_all() to load everything in package into current workspace.
When saving data, use save(name, file = 'data/name.RData')
To add code to package, store as .R file in R subdirectory

factors - considered a class, not actually a number
using as.factor(c(1,2,3,...)) <-- thinks of those as classes, not numbers
Use as.numeric or as.character to return to regular vector from a factor

To generate fake/test data-
  variable = c('A','B','C')
  obs.variable = list(category = sample(variable, replace = othercategory, size = #))

Apply function instead of for loops when possible. Can use apply when all data is manipulated in the same way/formula. Cannot use it when value depends on past/future values.
While() loop used instead of for() loop for unknown numbers of observations, can continue function until condition is met. 
In dplyr- windowing function can be used similarly (create new column with calculations, can generate cumulative calcs).


