#Notes 2/12/16

#Data Visualization
###############################################
#From week 5- use code on class page to get data formatted (when country names differ between dataset columns).

#principles of exploratory data analysis on Wiki and moz.com/blog/data-visualization-principles-lessons-from-tufte

#datavizcatalogue.com for more types of graphs

#in R: manipulate() can add slider or check box (can't extend to knitted HTML)


library(dplyr)
library(ggplot2)
faithful %>%
  ggplot(aes(eruptions)) + 
  geom_histogram(aes(y = ..density..),  bins = 20) +
  geom_density(color='blue', size=2, adjust = 1) +
  xlab('duration (minutes)') +
  ylab('frequency density') +
  ggtitle('geyser eruption duration')

#same plot, with manipulate()
library(manipulate)
manipulate({
  
  faithful %>%
    ggplot(aes(eruptions)) + 
    geom_histogram(aes(y = ..density..),  bins = 20) +
    geom_density(color='blue', size=2, adjust=a) +
    xlab('duration (minutes)') +
    ylab('frequency density') +
    ggtitle('geyser eruption duration')
  
}, a = slider(min = 0, max = 2, initial = 1, label = 'bandwidth adjustment', step = 0.2))
#manipulate not a plotting library -- can adjust other plots (eg leaflet). Will redo expression any time parameter changes within {}.
#can also use a checkbox or picker for specific parameters within expression.


#interactive with Shiny (no HTML)
library(ggvis)
faithful %>%
  ggvis(~eruptions) %>%
  layer_histograms(
    width = input_slider(0.1, 2, step = 0.2, label = 'bin width', animate = TRUE),
    fill = 'blue') %>%
  add_axis('x', title = 'duration (minutes)') %>%
  add_axis('y', title = 'count')

library(dplyr)

```{r ggvis add_tooltip, eval=FALSE}
cars = mtcars %>%
  add_rownames('model') %>%        # dplyr drops rownames
  mutate(id = row_number()) # add an id column to use ask the key

all_values <- function(x) {
  if(is.null(x)) return(NULL)
  row <- cars[cars$id == x$id, ]
  paste0(names(row), ": ", format(row), collapse = "<br/>")
}

cars %>% 
  ggvis(x = ~wt, y = ~mpg, key := ~id) %>%
  layer_points() %>%
  add_tooltip(all_values, 'hover')
```

#Data table interactives

```{r head}
dim(iris) # ?datasets::iris
head(iris)
```
```{r kable}
library(dplyr)
library(knitr) # install.packages('kable')

head(iris) %>% kable()
```
```{r datatable}
library(DT) # install.packages('DT')

# default datatable
datatable(iris)

# remove document elements
datatable(iris, options = list(dom = 'tp'))
```
#can share data table itself, allows others to search for what they want


library(metricsgraphics)
#has hover capabilities. Can be used on different types of plots (line, scatter, bar)

```{r mjs_point}
library(metricsgraphics) # devtools::install_github("hrbrmstr/metricsgraphics")

mtcars %>%
  mjs_plot(x=wt, y=mpg, width=600, height=500) %>%
  mjs_point(color_accessor=carb, size_accessor=carb) %>%
  mjs_labs(x="Weight of Car", y="Miles per Gallon")
```

?mjs_plot
#LIMITATION: can only pipe to one geom() plot at a time, unlike ggplot2.
#googleVis library can combine different types of plots
?ggvis # <-- can also use with Rmd and Shiny
#GeoChart also shows spatial data by polygon or point markers


# for project- googleVis::gvisGeoMap --> aggregate data by country (group_by ISO code) 
# any way to add extra data sets to make temporal map?