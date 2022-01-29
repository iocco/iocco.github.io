library(shiny)
server <- shinyServer(function(input, output) {
  
  ## Labels for x Axis
  
  optionLabels <- c("cyl" = "Number of cylinders","disp" = "Displacement (cu.in.)" , 
                    "hp" = "Gross horsepower","drat" =  "Rear axle ratio",
                    "wt" = "Weight (1000 lbs)", "qsec" = "1/4 mile time",
                    "vs" = "Engine (0 = V-shaped, 1 = straight)",
                    "am" = "Transmission (0 = automatic, 1 = manual)",
                    "gear" = "Number of forward gears","carb" = "Number of carburetors")
  
  # Every time a new predictor is selected we create a new regresion with the 
  # selected predictor
  modelFit <- reactive({
    predictorInput <- input$predictor
    modelFit <- lm(mtcars$mpg ~ mtcars[,predictorInput])
  })
  
  # Updated the plot with the selected predictor and the fit
  output$plot1 <- renderPlot({
  predictorInput <- input$predictor
  plot(mtcars[,predictorInput], mtcars$mpg, ylab = "Miles Per Gallon", 
       xlab = optionLabels[predictorInput], bty = "n", pch = 16)
   abline(modelFit(), col = "red", lwd = 2)
  })

  # Output for R squared value
  output$rSquaredText <- renderText({
    paste("R Squared:", round(summary(modelFit())$r.squared, 3))
  })
  
  # Output for intercept value
  output$interceptText <- renderText({
    paste("Intercept:",  round(modelFit()$coefficients[1],3))
  })
  
  # Output for slope value
  output$slopeText <- renderText({
    paste("Slope:",  round(modelFit()$coefficients[2],3))
  })
})