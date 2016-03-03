library(shiny)
library(plotly)
shinyUI(fluidPage(
  
  titlePanel('Average Dimensions for Flowers'),

  sidebarLayout(
  
  # sidebar elements
  sidebarPanel( "sidebar panel", 
                radioButtons("Species", label = "Species:",
                             choices = list("setosa" = 'setosa', "versicolor" = 'versicolor' , "virginica" = 'virginica'),
                             selected = 'setosa'
                            ),
                
                radioButtons("Part", label = "Part:",
                             choices = list("petal" = 'petal', "sepal" = 'sepal'), 
                             selected = 'petal'
                             )
  ),
  
  mainPanel("main panel", 
            plotlyOutput('plot')
  )
  )
))