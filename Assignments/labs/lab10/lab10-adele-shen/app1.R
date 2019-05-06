library(shiny)
library(ggplot2)

box1 <- c('blue', 'blue', 'red')
box2 <- c(rep('blue', 2), rep('red', 3), 'white')

set.seed(111)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Drawing Balls Experiment"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("reps",
                     "Number of repetitions:",
                     min = 1,
                     max = 5000,
                     value = 100) 
   ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     drawn_balls = matrix(nrow = input$reps, ncol = 4)
     
     for (i in 1:input$reps) {
       if (runif(1) > 0.5) {
         drawn_balls[i, ] = sample(box1, 4, rep = TRUE)
       } else {
         drawn_balls[i, ] = sample(box2, 4, rep = FALSE)
       }
     }
     
     blues = apply(drawn_balls, 1, function(x) sum(x == 'blue'))
     
     blues_rel = vector(mode = "list", length = 5)
     for (i in 0:4) {
       blues_rel[[i+1]] = cumsum(blues == i) / (1:input$reps)
     }
     
     data <- data.frame(
       reps = rep(1:input$reps, 5),
       freq = unlist(blues_rel),
       numblue = rep(0:4, each = input$reps)
     )
     
     ggplot(data = data, aes(x = reps, y = freq, group = numblue)) +
       geom_line(aes(color = numblue)) +
       ggtitle("Relative frequencies of number of blue balls")
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

