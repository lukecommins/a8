library(dplyr)
library(plotly)

shinyServer(function(input, output) {

  output$plot <- renderPlotly({
  
  data <- select(iris, Sepal.Length:Species) %>% filter(Species == input$Species) %>% group_by(Species) %>% 
    summarise("avg_sepal_len" = mean(Sepal.Length) , "avg_sepal_wid" = mean(Sepal.Width) , 
              "avg_petal_len" = mean(Petal.Length) , "avg_petal_wid" = mean(Petal.Width))
  
  plot <- plot_ly(data,
                  x = c("petal length" , "petal width"),
                  y = c(as.vector(avg_petal_len),
                        as.vector(avg_petal_wid)
                  ),
                  name = "Average Data for Petals",
                  type = "bar"
  )
  
  if(input$Part == 'petal') {
    plot <- plot_ly(data,
                    x = c("petal length" , "petal width"),
                    y = c(as.vector(avg_petal_len),
                          as.vector(avg_petal_wid)
                          ),
                    name = "Average Data for Petals",
                    type = "bar"
    )
    
  } else {
    plot <- plot_ly(data,
                    x = c("sepal length", "sepal width"),
                    y = c(as.vector(avg_sepal_len),
                          as.vector(avg_sepal_wid)
                    ),
                    name = "Average Data for Sepal",
                    type = "bar"
    )
  }
  
  plot
 })
})