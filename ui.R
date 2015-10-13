library(shiny)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Confidence Intervals"),
  
  # Sidebar with a slider input for the number of means
  sidebarLayout(
    sidebarPanel(
      sliderInput("p",
                    "Confidence Level:",
                  min = 0,
                  max = 1.00,
                  value = .95),
      sliderInput("Nreps",
                    "Number of Intervals:",
                  min = 1,
                  max = 500,
                  value = 100)
   
    ),
    
 

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
   )
 ))
