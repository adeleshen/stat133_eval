
library(shiny)
library(ggplot2)

# link: https://adeleshen.shinyapps.io/workout02-adele-shen/

future_value = function(amount, rate, years) {
  fv = amount*(1 + rate)^years
  return(fv)
}

annuity = function(contrib, rate, years) {
  fva = contrib*((1 + rate)^years - 1)/rate
  return(fva)
}

growing_annuity = function(contrib = 200, rate = .05, growth = 0.03, years = 1) {
  fvga = contrib*((1 + rate)^years - (1 + growth)^years)/(rate - growth)
  return(fvga)
}

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Savings Simulation"),
  
  # Sidebar with a slider input for number of bins 
  fluidRow(
    column(4,
           sliderInput("amount",
                       "Initial Amount",
                       min = 0, max = 100000,
                       step = 500, value = 1000,
                       sep = ",", pre = "$"
           )),
    column(4,
           sliderInput("rate",
                       "Return Rate",
                       min = 0, max = 20,
                       step = 0.1, value = 5,
                       sep = NULL, post = "%"
           )),
    column(4,
           sliderInput("years",
                       "Years",
                       min = 0, max = 50,
                       step = 1, value = 10,
                       sep = NULL
           ))
  ),
  
  fluidRow(
    column(4,
           sliderInput("contrib",
                       "Annual Contribution",
                       min = 0, max = 50000,
                       step = 500, value = 2000,
                       sep = ",", pre = "$"
           )),
    column(4,
           sliderInput("growth",
                       "Growth Rate",
                       min = 0, max = 20,
                       step = 0.1, value = 2,
                       sep = NULL, post = "%"
           )),
    
    
    column(4,
           selectInput("facet",
                       "Facets?",
                       choices = c("Yes", "No")
           ))
  ),
  mainPanel(
    titlePanel("Timelines"),
    plotOutput("distPlot"),
    titlePanel("Balances"),
    tableOutput("tableOutput"))
)
server <- function(input, output) {
  output$distPlot <- renderPlot(width = 920, {
    
    rate_percent = 0.01 * input$rate
    growth_percent = 0.01 * input$growth
    no_contrib = rep(input$amount,input$years)
    for (i in 1:input$years) {
      no_contrib[i+1] = future_value(amount = no_contrib[i], rate = rate_percent, years = 1) 
    }
    
    fixed_contrib = rep(input$amount,input$years)
    for (i in 1:input$years) {  
      fixed_contrib[i+1] = future_value(amount = input$amount, rate = rate_percent, years = i) + annuity(contrib = input$contrib, rate = rate_percent, years = i)
    }
    
    growing_contrib = rep(input$amount,input$years)
    for (i in 1:input$years) {
      growing_contrib[i+1] = future_value(amount = input$amount, rate = rate_percent, years = i) + growing_annuity(contrib = input$contrib, rate = rate_percent, growth = growth_percent, years = i)
    }
    
    modalities = data.frame(
      year = c(0:input$years),
      value = c(no_contrib = no_contrib,
                fixed_contrib = fixed_contrib,
                growing_contrib = growing_contrib),
      variable = c(rep("no_contrib", input$years+1),
                   rep("fixed_contrib", input$years+1),
                   rep("growing_contrib", input$years+1))
    )
    if (input$facet == "No") {
      ggplot(modalities) +
        geom_line(aes(x = year, y = value, color = variable)) +
        geom_point(aes(x = year, y = value, color = variable)) +
        labs(title = "Investing Modalities")
    } else {
      modalities$newvar = factor(modalities$variable, levels = c("no_contrib", "fixed_contrib", "growing_contrib"))
      ggplot(modalities) +
        geom_line(aes(x = year, y = value, color = variable)) +
        geom_point(aes(x = year, y = value, color = variable)) +
        geom_area(aes(x = year, y = value, fill = variable)) +
        labs(title = "Investing Modalities") +
        facet_wrap(~newvar)
    } 
  })
  
  output$tableOutput <- renderTable( {
    rate_percent = 0.01 * input$rate
    growth_percent = 0.01 * input$growth
    no_contrib = rep(input$amount,input$years)
    for (i in 1:input$years) {
      no_contrib[i+1] = future_value(amount = no_contrib[i], rate = rate_percent, years = 1) 
    }
    
    fixed_contrib = rep(input$amount,input$years)
    for (i in 1:input$years) {  
      fixed_contrib[i+1] = future_value(amount = input$amount, rate = rate_percent, years = i) + annuity(contrib = input$contrib, rate = rate_percent, years = i)
    }
    
    growing_contrib = rep(input$amount,input$years)
    for (i in 1:input$years) {
      growing_contrib[i+1] = future_value(amount = input$amount, rate = rate_percent, years = i) + growing_annuity(contrib = input$contrib, rate = rate_percent, growth = growth_percent, years = i)
    }
    
    modalities = data.frame(
      year = c(0:input$years),
      no_contrib = no_contrib,
      fixed_contrib = fixed_contrib,
      growing_contrib = growing_contrib)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

